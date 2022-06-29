Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33955F3D7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:19:42 +0200 (CEST)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6OEv-00028E-CF
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1o6ODC-0000tw-L5; Tue, 28 Jun 2022 23:17:54 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:35252)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1o6OD5-0001Zj-UM; Tue, 28 Jun 2022 23:17:54 -0400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.93])
 by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee562bbc44f700-033e9;
 Wed, 29 Jun 2022 11:17:35 +0800 (CST)
X-RM-TRANSID: 2ee562bbc44f700-033e9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.101])
 by rmsmtp-syy-appsvrnew07-12032 (RichMail) with SMTP id 2f0062bbc437a24-8ac3b; 
 Wed, 29 Jun 2022 11:17:35 +0800 (CST)
X-RM-TRANSID: 2f0062bbc437a24-8ac3b
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, pbonzini@redhat.com
Cc: qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [PATCH] target/ppc: Add error reporting when opening file fails
Date: Wed, 29 Jun 2022 11:15:52 +0800
Message-Id: <20220629031552.5407-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=221.176.66.80;
 envelope-from=jianchunfu@cmss.chinamobile.com; helo=cmccmta2.chinamobile.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add error reporting before return when opening file fails.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 target/ppc/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..ef9a871411 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1798,6 +1798,7 @@ static int read_cpuinfo(const char *field, char *value, int len)
 
     f = fopen("/proc/cpuinfo", "r");
     if (!f) {
+        fprintf(stderr, "Error opening /proc/cpuinfo: %s\n", strerror(errno));
         return -1;
     }
 
@@ -1906,6 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
     f = fopen(filename, "rb");
     if (!f) {
+        fprintf(stderr, "Error opening %s: %s\n", filename, strerror(errno));
         return -1;
     }
 
-- 
2.18.4




