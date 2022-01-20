Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3B49522B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:16:03 +0100 (CET)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAa6U-0004en-N5
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luofei@unicloud.com>)
 id 1nAT6e-0002I1-Uf
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:47:57 -0500
Received: from mx.uniclinxens.com ([220.194.70.58]:10030
 helo=spam.unicloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luofei@unicloud.com>)
 id 1nAT6W-0003jS-1D
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:47:39 -0500
Received: from eage.unicloud.com ([220.194.70.35])
 by spam.unicloud.com with ESMTP id 20K8l7Jo061588;
 Thu, 20 Jan 2022 16:47:07 +0800 (GMT-8)
 (envelope-from luofei@unicloud.com)
Received: from localhost.localdomain (10.10.1.7) by zgys-ex-mb09.Unicloud.com
 (10.10.0.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2375.17; Thu, 20
 Jan 2022 16:47:06 +0800
From: luofei <luofei@unicloud.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] i386: Set MCG_STATUS_RIPV bit for mce SRAR error
Date: Thu, 20 Jan 2022 03:46:34 -0500
Message-ID: <20220120084634.131450-1-luofei@unicloud.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.1.7]
X-ClientProxiedBy: zgys-ex-mb06.Unicloud.com (10.10.0.52) To
 zgys-ex-mb09.Unicloud.com (10.10.0.24)
X-DNSRBL: 
X-MAIL: spam.unicloud.com 20K8l7Jo061588
Received-SPF: pass client-ip=220.194.70.58; envelope-from=luofei@unicloud.com;
 helo=spam.unicloud.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Jan 2022 10:11:41 -0500
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, luofei <luofei@unicloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the physical machine environment, when a SRAR error occurs,
the IA32_MCG_STATUS RIPV bit is set, but qemu does not set this
bit. When qemu injects an SRAR error into virtual machine, the
virtual machine kernel just call do_machine_check() to kill the
current task, but not call memory_failure() to isolate the faulty
page, which will cause the faulty page to be allocated and used
repeatedly. If used by the virtual machine kernel, it will cause
the virtual machine to crash

Signed-off-by: luofei <luofei@unicloud.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..14655577f0 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -537,7 +537,7 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr paddr, int code)
 
     if (code == BUS_MCEERR_AR) {
         status |= MCI_STATUS_AR | 0x134;
-        mcg_status |= MCG_STATUS_EIPV;
+        mcg_status |= MCG_STATUS_RIPV | MCG_STATUS_EIPV;
     } else {
         status |= 0xc0;
         mcg_status |= MCG_STATUS_RIPV;
-- 
2.27.0


