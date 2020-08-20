Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8924BF4A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 15:47:33 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8kui-0001Il-QV
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 09:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8ktJ-0007gm-7b; Thu, 20 Aug 2020 09:46:05 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:60687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8ktE-0003uK-Gk; Thu, 20 Aug 2020 09:46:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id DCB4958FDFEC;
 Thu, 20 Aug 2020 15:45:49 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 20 Aug
 2020 15:45:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057f7beee7-ef54-4f2b-a73f-e4358c858a42,
 02C359FD435C2C4122574921AFFD4D91C9CEEBEA) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 0/4] spapr/xive: Allocate vCPU IPIs from the vCPU contexts
Date: Thu, 20 Aug 2020 15:45:43 +0200
Message-ID: <20200820134547.2355743-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 10095477-fb59-4cd9-a3ff-e606121558b9
X-Ovh-Tracer-Id: 9118944823510141801
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddutddggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 09:45:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gustavo Romero <gromero@linux.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,


When QEMU switches to the XIVE interrupt mode, it creates all the
guest interrupts at the level of the KVM device. These interrupts are
backed by real HW interrupts from the IPI interrupt pool of the XIVE
controller.

Currently, this is done from the QEMU main thread, which results in
allocating all interrupts from the chip on which QEMU is running. IPIs
are not distributed across the system and the load is not well
balanced across the interrupt controllers.

Change the vCPU IPI allocation to run from the vCPU context. The
associated XIVE IPI interrupt will be allocated on the chip on which
the vCPU is running and improve distribution of the IPIs in the system.
When the vCPUs are pinned, this will make the IPI local to the chip of
the vCPU. It will reduce rerouting between interrupt controllers and
gives better performance.


I did some basic migration testing with the 'dual' and 'xive' modes,
also tried CPU hoplug. I haven't tried migration with older pseries
machine. 

Thanks,

C.

Cédric Le Goater (4):
  spapr/xive: Modify kvm_cpu_is_enabled() interface
  spapr/xive: Use kvmppc_xive_source_reset() in post_load
  spapr/xive: Allocate IPIs independently from the other sources
  spapr/xive: Allocate vCPU IPIs from the vCPU contexts

 hw/intc/spapr_xive_kvm.c | 102 ++++++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 18 deletions(-)

-- 
2.25.4


