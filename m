Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36675EDB6D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:12:39 +0200 (CEST)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUzW-0005zc-RO
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSED-0008EN-8x
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:33237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008CT-GY
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:37 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mo7if-1p2fpQ0ZD9-00pbgn; Wed, 28
 Sep 2022 10:15:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 24/38] linux-user/hppa: Fix setup_sigcontext()
Date: Wed, 28 Sep 2022 10:15:03 +0200
Message-Id: <20220928081517.734954-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nyvb0xlTfKgSrLZh0sNx/EtoZdcMLg70Ejf8AFpKn0fcZoepwzG
 Cf5V0S1BLW1tL4q6fWy8Xfys0RjpDaxWetPa4RgwdbqYsE5R0fU2qvFG0xhi/JhrpVXucrL
 LA9ombmSQDFT1QGmUjYyT9s3aE7PnpzVgYNl8eee9Hp5olcLGSJxcPSzJDAb11SR96Xkt+y
 BP5sd+bOpNqvD1LKifeOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wyqlZvSCPu4=:nnmB46SSLUAfGsYL7XVoH5
 M9vIwEDRo12jYvcgnWBOMsQs6hLJriYysAoIQUWZgXMdCyQWhF/VmE4UdI9uSlhMjpb56F7k/
 h9MlmJsyFtjsbAGdFifBHYFSnJlYZFihA8BXwSozDWW45GPvJGfVpjbINvdSj4GIwZK0kPi17
 6mbcgYeHZIFAtxjmoH3jTfTbGddlrRWy4zfS0wezswSyWowmg5PhEATkcP6kfajH9bgpSKicD
 u1hA1bOx3vIzCnxo1k8ta6rHESCohTa/yTfFhPstXVA/Lx9vSRlQrs85SJR6HABuEgXmvwjhR
 CE9bnssq6U65bWYQ9RkG0x1rVO/KV+9c+HPFBd2guRBEgUKDlhbUt+y+L++DvJRgwjkunN6LY
 bUrQMxd5qjre2p1GW7XqNLeXxnSrmY0lXyh5ADiKSidOBazZ4UXumvaYXi5n1xPfSosNmVXDa
 zAa5pOQvRkIdq6CHlQwCXyUaX9m4pwlnzZBNgB+6ecE58si6WAkgsrKPPIjmM+94iyvNVuqcF
 PR0N+v5+R4QcIBkYHnHN/yqLfTvUf4RH4HsRrhl0TIn94xVwzEoSIVpnY86K+tbPJCB4iWUxQ
 5U7rbNimbA4ARzKhX3WLa7qTXJbA9h5+vD+wk5a8vQR0cA4F3MfNS1taCgEDXDitvvl9iZtSP
 2WJNIq8RFYSxYSgWgb1789gJIMltoUYJAEODxlTsVOspvQ7EZkrAx3lTc/A8kLJ5fK5INJFfC
 iTYmzLGqi1w2a6vmuZ7biXmTEW8DNdXKEmr26EduvLx0bvBTf9QckE719UBjQWCiCiwflKSRY
 8lCeI/7
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

We don't emulate a preemptive kernel on this level, and the hppa architecture
doesn't allow context switches on the gateway page. So we always have to return
to sc_iaoq[] and not to gr[31].
This fixes the remaining random segfaults which still occured.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-8-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/signal.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 396e310dc92d..f253a1586461 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -49,23 +49,13 @@ struct target_rt_sigframe {
 
 static void setup_sigcontext(struct target_sigcontext *sc, CPUArchState *env)
 {
-    int flags = 0;
     int i;
 
-    /* ??? if on_sig_stack, flags |= 1 (PARISC_SC_FLAG_ONSTACK).  */
-
-    if (env->iaoq_f < TARGET_PAGE_SIZE) {
-        /* In the gateway page, executing a syscall.  */
-        flags |= 2; /* PARISC_SC_FLAG_IN_SYSCALL */
-        __put_user(env->gr[31], &sc->sc_iaoq[0]);
-        __put_user(env->gr[31] + 4, &sc->sc_iaoq[1]);
-    } else {
-        __put_user(env->iaoq_f, &sc->sc_iaoq[0]);
-        __put_user(env->iaoq_b, &sc->sc_iaoq[1]);
-    }
+    __put_user(env->iaoq_f, &sc->sc_iaoq[0]);
+    __put_user(env->iaoq_b, &sc->sc_iaoq[1]);
     __put_user(0, &sc->sc_iasq[0]);
     __put_user(0, &sc->sc_iasq[1]);
-    __put_user(flags, &sc->sc_flags);
+    __put_user(0, &sc->sc_flags);
 
     __put_user(cpu_hppa_get_psw(env), &sc->sc_gr[0]);
     for (i = 1; i < 32; ++i) {
-- 
2.37.3


