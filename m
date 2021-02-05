Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BA13106B4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:32:32 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wXX-0003hG-3K
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l7wVd-0002M1-CS
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:30:33 -0500
Received: from mga02.intel.com ([134.134.136.20]:9771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l7wVa-0001sH-L2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:30:33 -0500
IronPort-SDR: h4yC0l/poDEd+imZZ2R5BWhzj/qFMgZ2MDq6yAGBF+EWU/qv6ejHIcIHJb2mEtpbAXOdsRkb1s
 Gfhw7oSdt8lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168518439"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="168518439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 00:30:18 -0800
IronPort-SDR: WPHieD9n2ryjL1hBJ6/EQjJkEpwf/ydMZWs1RjlR9FCfNCD69+D0Vnf2JwQL4Kbe8r0PUKyXBE
 nxeHLYde3Aew==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="393760279"
Received: from chenyi-pc.sh.intel.com ([10.239.159.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 00:30:15 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH 0/2] Remaining work for PKS Implementation
Date: Fri,  5 Feb 2021 16:33:23 +0800
Message-Id: <20210205083325.13880-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Protection Keys for Supervisor Pages (PKS) is a feature that extends the
Protection Keys architecture to support thread-specific permission
restrictions on superviosr pages, which works similar to an existing
feature named PKU (protecting user-mode pages).

Thanks Paolo to send out the PKS QEMU implemention at:
https://lore.kernel.org/qemu-devel/20210127093540.472624-1-pbonzini@redhat.com/

This patch series is just to add the remaining part, i.e. the support
for save/load PKRS and expose the vmx entry/exit load controls to guest.

Chenyi Qiang (2):
  target/i386: Add support for save/load IA32_PKRS MSR
  target/i386: Expose VMX entry/exit load pkrs control bits

 target/i386/cpu.c     |  4 ++--
 target/i386/cpu.h     |  2 ++
 target/i386/kvm/kvm.c | 13 +++++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.17.1


