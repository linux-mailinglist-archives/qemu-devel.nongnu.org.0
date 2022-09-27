Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5E5EC37B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:02:36 +0200 (CEST)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAEN-0006kV-JI
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od8hd-0005Ly-5m
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:24:47 -0400
Received: from mout.gmx.net ([212.227.15.19]:50071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od8ha-00014T-K2
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664277876;
 bh=o77wLiAl8rcyGvv305VZCD/qEl9Bp6TA36qD0AMC4h8=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=Vf/4QncZQuBonbkF1azf3aktrukyKr6sZQcH6KkEZpYNPMZ6xIfEUSCZkXHwtMuo6
 Q3gJ8Dv6nckJSJle2ZrdaxAiUqbzRM8VWKFgJzdFEC+DcHOYA1GQSxjxEpA6ooyA+D
 dVgsl62GaXAdJ18iVZRxnIXNEUCLMZejx8Kw5D40=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.138.255]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1oPxPI0Xi4-00DDGZ; Tue, 27
 Sep 2022 13:24:36 +0200
Date: Tue, 27 Sep 2022 13:24:34 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Add faccessat2() syscall
Message-ID: <YzLdcnL6x646T61W@p100>
References: <YzLctFYiBG/JkNuH@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzLctFYiBG/JkNuH@p100>
X-Provags-ID: V03:K1:IgxcX9ZtHntSFfOBoc9UAgWatrvTsir5jVS0rCGOmJfmGxEhkmG
 uYyco9L/B6SBv80FkAcYwO0p+lCOEDKI38ARu+2yPdMU6rMuG6j78+/tjQjwCvHRnBuVORE
 vbJmAIRHhY2ONLVG9AjyDSSWpaiZwN8pq6rYJ3flskAcqUqrHTTGxGDzN6nc/GuT3lRtNy9
 CxTcnY8I9g1dJOt116IJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s8ItTnVDdwo=:INetV3qaH0YkpghJZAQg8e
 cutvdPpccI7GAEIBfaRwIRj8cZik8dcpKldWYEajD6O4p2X7mtlwLwWsBDYIu3veys9cxOJgA
 MSF7fD5lGPGMTpRJlhu4hbtnxq2JC+JJNnhvQpNGKi74ehu/g19U55VjGVqnomqLPokYxdWRW
 /fcXwUGqArSV5HtlKCIs1DZLxjBcFwrwwlOcKKAjsx27hJb9soW8B25dAnoCJtsNWo8Pl+uLw
 dAMIUN70DJb0F3PzBpg7zAUHt0ncKKsjdt3lMGv9Axs0Z8uPyLfMzqRgpK2qry9YQzJFrR97U
 921dxL6hSfU5a61fEKz+Y3jiqVq2GJSLqaR08YuWWW61DtiQR65nQ2voffQoS/sgKbrJ2W7Vc
 AGhvrgsqrWYuqfzE2xmtWY+mwP6605mgWKuX1aOWFq6IPsi6CH5khExJyKSry8awolrfwaGFT
 fZdZpxdrZl9bsrNLdCHw1xXLpQdERPPqANDe0F94mjXSRwxJJ7u4z04aAX9MWV5seQN6sqf9w
 BjkWLHvI+PjDuK7a5xtykiBIu84JLHFJ6u4DdT1bXFvJTTNXSQpgQYa01ACbiEFUrXtv3EEXq
 wqEUBOFYwSoMQDLB5q5IOjN4PKoo0tz81t3P97kVVi8xhstJrCLlFi4U4euCw4E5/scbaiKvu
 bDvLwOr1NHRlfzv8eD5VfT8WGCmKC0Wl9Cg2QfEVATef1U/NdPGo43R4D0NkvrJ6MvFZq2Vnu
 pIFF3tYDSkTu/CqsxGk7sCcI8L/UzuTRHOOyqkpM86pootUiiyUCniULrPcnDihlNniUTh/ue
 X3rRblg/wr5AHyhDqN672lPRAGUJ5AND+lBCDoDmvnNBl3xMo9h79rfYfQ987EZCRZq4puRjV
 I6I6p8pU/3CKtpry5ltkr6GhzqboCh8/rjk+V88NNstgFR+llwNf/hDKll+hcUqTAVaGEcJSG
 wQliUG2bQ2rdXWs0bVnFS5k+5cKcUMzM1gvUY/0idrVJ+CkSNN9aHZcHbummhtpadC3sGoKDC
 3NoNXSgXLINjb7bkQfrId7GuV5O8mK8b8pAaB55eAIKnL3R1+VKAZflHB8OtgiyYl2044201A
 OzC12E32lu2t67CfFLfPUHuY1Ia5IsMNv2OCRa4yGLRH5JOZmfuSnz44DZKDWK96MWVj7K1Km
 rYsNo858HY98VSsMDJ8V920qup
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_ZBI=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add faccessat2() with strace output.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
v2: Resending with minor commit message changes.

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..307d19f5d0 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1931,7 +1931,7 @@ print_execv(CPUArchState *cpu_env, const struct sysc=
allname *name,
 }
 #endif

-#ifdef TARGET_NR_faccessat
+#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 72e17b1acf..ef120ddd11 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -177,6 +177,9 @@
 #ifdef TARGET_NR_faccessat
 { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
 #endif
+#ifdef TARGET_NR_faccessat2
+{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
+#endif
 #ifdef TARGET_NR_fadvise64
 { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f409121202..f51c4fbabd 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -399,6 +399,9 @@ _syscall3(int, ioprio_set, int, which, int, who, int, =
ioprio)
 #if defined(TARGET_NR_getrandom) && defined(__NR_getrandom)
 _syscall3(int, getrandom, void *, buf, size_t, buflen, unsigned int, flag=
s)
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
+_syscall4(int, faccessat2, int, dirfd, char *, pathname, int, mode, int, =
flags)
+#endif

 #if defined(TARGET_NR_kcmp) && defined(__NR_kcmp)
 _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
@@ -9098,6 +9101,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
+    case TARGET_NR_faccessat2:
+        if (!(p =3D lock_user_string(arg2))) {
+            return -TARGET_EFAULT;
+        }
+        ret =3D get_errno(faccessat2(arg1, p, arg3, arg4));
+        unlock_user(p, arg2, 0);
+        return ret;
+#endif
 #ifdef TARGET_NR_nice /* not on alpha */
     case TARGET_NR_nice:
         return get_errno(nice(arg1));

