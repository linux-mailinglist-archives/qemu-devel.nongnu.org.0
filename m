Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171703DF043
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:26:56 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvNf-0002BE-0L
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvM6-0007j9-N8
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvM5-0001DK-5T
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugd0zwEwz2Nbp9/hIOj5FCBI/JITLW9dOIXoDgUY2/Y=;
 b=isH5KzVWr98fkxeFeAk3WI9CsRrLbV5wke2pEUj0ctQuXs2uW/fjjT1De62ns2syw6bNbw
 /nveuqsi7l0rmIF1Oeqz8+dn0oBxPIWNnZXU2Pj+lIb5sdq/Nag5RFvdSrMslaFSrRnK8j
 Opwhqj3XQlc/PysdIeOw6W+gBZkZlAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-RKtdI89yP_WhaYSHtud9JA-1; Tue, 03 Aug 2021 10:25:11 -0400
X-MC-Unique: RKtdI89yP_WhaYSHtud9JA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 575F31853028;
 Tue,  3 Aug 2021 14:25:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0E8C19C44;
 Tue,  3 Aug 2021 14:25:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/3] linux-user/s390x: signal with SIGFPE on compare-and-trap
Date: Tue,  3 Aug 2021 16:24:54 +0200
Message-Id: <20210803142455.89123-3-thuth@redhat.com>
In-Reply-To: <20210803142455.89123-1-thuth@redhat.com>
References: <20210803142455.89123-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>

Currently when a compare-and-trap instruction is executed, qemu will
always raise a SIGILL signal. On real hardware, a SIGFPE is raised.

Change the PGM_DATA case in cpu_loop to follow the behavior in
linux kernel /arch/s390/kernel/traps.c.
 * Only raise SIGILL if DXC == 0
 * If DXC matches a non-simulated IEEE exception, raise SIGFPE with
   correct si_code
 * Raise SIGFPE with si_code == 0 for everything else

When applied on 20210705210434.45824-2-iii@linux.ibm.com, this fixes
crashes in the java jdk such as the linked bug.

Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/319
Message-Id: <20210709160459.4962-2-jonathan.albrecht@linux.vnet.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/s390x/cpu_loop.c | 54 +++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 22f2e89c62..6a69a6dd26 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -25,6 +25,35 @@
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
 
+static int get_pgm_data_si_code(int dxc_code)
+{
+    switch (dxc_code) {
+    /* Non-simulated IEEE exceptions */
+    case 0x80:
+        return TARGET_FPE_FLTINV;
+    case 0x40:
+        return TARGET_FPE_FLTDIV;
+    case 0x20:
+    case 0x28:
+    case 0x2c:
+        return TARGET_FPE_FLTOVF;
+    case 0x10:
+    case 0x18:
+    case 0x1c:
+        return TARGET_FPE_FLTUND;
+    case 0x08:
+    case 0x0c:
+        return TARGET_FPE_FLTRES;
+    }
+    /*
+     * Non-IEEE and simulated IEEE:
+     * Includes compare-and-trap, quantum exception, etc.
+     * Simulated IEEE are included here to match current
+     * s390x linux kernel.
+     */
+    return 0;
+}
+
 void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -106,29 +135,14 @@ void cpu_loop(CPUS390XState *env)
 
             case PGM_DATA:
                 n = (env->fpc >> 8) & 0xff;
-                if (n == 0xff) {
-                    /* compare-and-trap */
+                if (n == 0) {
                     goto do_sigill_opn;
-                } else {
-                    /* An IEEE exception, simulated or otherwise.  */
-                    if (n & 0x80) {
-                        n = TARGET_FPE_FLTINV;
-                    } else if (n & 0x40) {
-                        n = TARGET_FPE_FLTDIV;
-                    } else if (n & 0x20) {
-                        n = TARGET_FPE_FLTOVF;
-                    } else if (n & 0x10) {
-                        n = TARGET_FPE_FLTUND;
-                    } else if (n & 0x08) {
-                        n = TARGET_FPE_FLTRES;
-                    } else {
-                        /* ??? Quantum exception; BFP, DFP error.  */
-                        goto do_sigill_opn;
-                    }
-                    sig = TARGET_SIGFPE;
-                    goto do_signal_pc;
                 }
 
+                sig = TARGET_SIGFPE;
+                n = get_pgm_data_si_code(n);
+                goto do_signal_pc;
+
             default:
                 fprintf(stderr, "Unhandled program exception: %#x\n", n);
                 cpu_dump_state(cs, stderr, 0);
-- 
2.27.0


