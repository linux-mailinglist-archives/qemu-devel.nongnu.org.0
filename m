Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7935B7AAF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:19:45 +0200 (CEST)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBRg-0005ig-Oc
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLm-0008Go-8f
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:38 -0400
Received: from mout.gmx.net ([212.227.17.21]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007es-TC
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096405;
 bh=a+VzLr3Jr6Stg5DkRL6y+jodPcSdR3H4tkNT2D1+lps=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BM3XmJMtzvK3oib35mS566x9JaQ81ZehfeV5yc73XT7NSkZSUqP/XOy67xDm+obwI
 q0aC0BVR56P6aAP2otMsI6Hf/IpHpIzGCcTIHJCF6i2/loaB/86d3VTT9dTNexXpbO
 Z8RIpFozaDVcCFr66gG6Yi5BduE3flETe7yJupFo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWici-1onXPZ1iie-00X4qP; Tue, 13
 Sep 2022 21:13:25 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 09/12] linux-user: Add strace for clock_nanosleep()
Date: Tue, 13 Sep 2022 21:13:18 +0200
Message-Id: <20220913191321.96747-10-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iPNylO9zymu/eCpdsQDUpaWSkfd0jlCBzmVkhIlMztxPWr56KxX
 m7oPUb3hweYUi+Dzn/qWiSX9MvpbagQSFUKX6Jcson5c9cN7f/+nqBA5l+HHEEHG7jKunyq
 JIsBb/lQ8QgoD/K8IXXPStxz+OnYOXBkbMMzMi/9QqX4dLhrSJ3rT2RzD/sm0uwtt8r9vom
 9aulI1wORyjkWezbli6pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5P3xOZsCswg=:VFNGtSv1109o5i/DKcVI/a
 f7UNtaAa3kXRqzUQI9a35CL881UNzqGMuNTK3zsVP6JIDMB+1vAhcZ8L12q4w5OA0d3rJOnaK
 481W3MymteZsX36UcAy4QYnn/qi2t0q/DX5CCZwg5zwpBhCaztf3hFBCE2TOsUtKajskO4cue
 +dK04F/B6gKDuF/d9/C5vq1PN7GR/La8U2DIYp2p686tuzau7LauawQICl58hs7UNuBBiDqii
 cOBMNEl6tHlDc6rBQ9nIp+PawtrtWwvTJtsWuzhwQgC7fb9//w9TsPDs9GqgTvTusF+vVAPzK
 l1e1i33HlWnrhJXAZk8UK9SaFrQuAJ6SSdBtkbWsM0T58onhgLxd+N1o6BWl/Qw1yTCfht7Fl
 vTU0HJcYB48RmXYu2VsMfNQcXDXRJJAKOXcEout93g+4+yu6/U+pOm2U/LX6/5uUtH0ViXasv
 qKdgfAUogqFNbU0WPHn44PjdGdlwLksCfdBYWts3ZoOx/LzmvRrrVzAYWpGtZrD2fq0kh4te/
 cB+FIW3TgXTLJC6ExOsbtG5EcX+tfh8VH4cyNeesYFh6GK1Xz+OdMWi8hvkQBGLpIT4xOhqTZ
 RoEaigwqWy5D8fzwR4ONYhqLa6GiE0dJoluleNnZejiLIVXYBNleC+vbYRE279XTlXCqzyxuU
 k58B/WB930sAej7oXqivk3SpwwkChT05T0HoJGJA7EYmuz2KpkmSjaVnX/L9Ru63WB4asAjx4
 kl3SngFhajRXjIuGbI30/m9w7t94kwU5JwWxmeVIlCq4F/84knubGsrbb1nXyh0VsWDcaVD1D
 9+6VugG1gvGEikK7CYH2XIqKNQOlxSM8XTYcTzY1blcOSZZDxy3UxEFtoJW/Av8st58zeak2N
 eKoMTBRfqO2mnzyK5/SQiF43CJWymseRNunf3gdfF4J2adt2OWOv/MezfIgJAlWqYAci2aQZy
 RpB3eRazDRT7FQXDeys56R02JDN0vAnKtgJwHfWo0z2f1hgnXjvlBPfTtNWwWABIH7IF5NB7i
 cQiJjjj327XN03p/DSvYEfuNh7JKRpHHkd3tW8HCGhD/HBaesiwbkxDg4ToNL12cZ5mUsAEz9
 0ezCovo2vXSLEX7yKkCjL6o3TXJ0C63Xjl3o176GKbDdFD/3TyWcXF8HLJX8SFGe9GGAohmLy
 2oZovn5bdtME0nJVfggdSLC3AO
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    | 15 +++++++++++++++
 linux-user/strace.list |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2f539845bb..6f818212d5 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3567,6 +3567,21 @@ print_unshare(CPUArchState *cpu_env, const struct s=
yscallname *name,
 }
 #endif

+#ifdef TARGET_NR_clock_nanosleep
+static void
+print_clock_nanosleep(CPUArchState *cpu_env, const struct syscallname *na=
me,
+                abi_long arg0, abi_long arg1, abi_long arg2,
+                abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_enums(clockids, arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_timespec(arg2, 0);
+    print_timespec(arg3, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 4d8b7f6a5e..215d971b2a 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -91,7 +91,8 @@
                            print_syscall_ret_clock_gettime },
 #endif
 #ifdef TARGET_NR_clock_nanosleep
-{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, NULL, NULL },
+{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, print_clock_nanosl=
eep,
+                            NULL },
 #endif
 #ifdef TARGET_NR_clock_settime
 { TARGET_NR_clock_settime, "clock_settime" , NULL, print_clock_settime, N=
ULL },
=2D-
2.37.2


