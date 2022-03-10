Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E504D50DA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:47:48 +0100 (CET)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMt9-0007j3-LU
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSMs5-0006nr-2x
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:46:41 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:37171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSMs2-0007tP-UK
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:46:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A301F22977;
 Thu, 10 Mar 2022 17:46:35 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 18:46:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038de26c54-6358-477e-b15a-1d28d8167694,
 50FE52C2FF4DE979A383A870B6AFEB2A520DEB89) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <228ae3cd-5cc3-7799-fd8d-74525f012850@kaod.org>
Date: Thu, 10 Mar 2022 18:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/4] target/ppc: Fix masked PVR matching
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220307065527.156132-1-npiggin@gmail.com>
 <20220307065527.156132-2-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220307065527.156132-2-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a8bda9b1-2436-4709-9c82-ba062fc8bdf5
X-Ovh-Tracer-Id: 4141904285475506982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hello Nick,

On 3/7/22 07:55, Nicholas Piggin wrote:
> The pvr_match for a CPU class is not supposed to just match for any
> CPU in the family, but rather whether this particular CPU class is the
> best match in the family.
> 
> Prior to this fix, e.g., a POWER9 DD2.3 KVM host matches to the
> power9_v1.0 class (because that's first in the list). After the patch,
> it matches the power9_v2.0 class.
> 
> Fixes: 03ae4133ab8 ("target-ppc: Add pvr_match() callback")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>> ---
>   target/ppc/cpu_init.c | 51 ++++++++++++++++++++++++++++---------------
>   1 file changed, 34 insertions(+), 17 deletions(-)
make check-qtest-ppc64 fails with :

―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-ppc64: invalid CPU model 'power8nvl_v1.0-powerpc64-cpu' for powernv8 machine
Broken pipe


TAP parsing error: Too few tests run (expected 6, got 1)
(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# QTEST_QEMU_BINARY=build/ppc64-softmmu/qemu-system-ppc64 QTEST_QEMU_IMG=qemu-img build/tests/qtest/pnv-xscom-test
1..6
# Start of ppc64 tests
# Start of pnv-xscom tests
# Start of cfam_id tests
# starting QEMU: exec build/ppc64-softmmu/qemu-system-ppc64 -qtest unix:/tmp/qtest-2994797.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-2994797.qmp,id=char0 -mon chardev=char0,mode=control -display none -M powernv8 -accel tcg -cpu POWER8 -accel qtest
ok 1 /ppc64/pnv-xscom/cfam_id/POWER8
# starting QEMU: exec build/ppc64-softmmu/qemu-system-ppc64 -qtest unix:/tmp/qtest-2994797.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-2994797.qmp,id=char0 -mon chardev=char0,mode=control -display none -M powernv8 -accel tcg -cpu POWER8NVL -accel qtest
qemu-system-ppc64: invalid CPU model 'power8nvl_v1.0-powerpc64-cpu' for powernv8 machine
Broken pipe
Aborted (core dumped)


Thanks,

C.

