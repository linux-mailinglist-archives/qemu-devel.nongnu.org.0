Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6615A2A47
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:03:24 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRari-0002x3-I3
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAo-0000dh-Ky
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:03 -0400
Received: from mout.gmx.net ([212.227.15.19]:41079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00055E-HI
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=cQG0bVRLs8shoYAP9NI59cNoDF/tjBt9bk6S7Jij3WY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MRdUFFJZX2iPQRAMgp4j9tjothzmHo+jVZzFgj5ozt6n4e0FsiEQm83PHzfTLaAtX
 KQea58Pa/aMXeglWNbBWmn3dQqFlIabU54gWF7gs+x31bIFRo+lT0y3eiIkrA6gM6e
 psA6xzunIYuf+/tIo9/lZJLd9YoYphd4ZnymdHeA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1pVfKg1ZE9-014Wix; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 10/13] linux-user: Add strace for clock_nanosleep()
Date: Fri, 26 Aug 2022 16:18:50 +0200
Message-Id: <20220826141853.419564-11-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ouzVJNFAu3lmoEfFKhE09/11mCEVLw7eRJABp3LvR6rYqX48YOG
 LS02hJaTTl2PL5bXsg8lKh32i1XMoeB2m3rwUONAs2loOagWhR4/bA83W5B5YByIQyI4LV7
 45M6mRhXzYqbdlCgQU0K7VYG+wxMLhzSyEEj0eAKkdCmqRHUKJkswlKpR5rPiB0Eg1UZExt
 ItbPrOJ4v4qr/FJHQuWpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XEaDVxqVJTg=:qyKlShV2/tl82Rfex3l85Q
 BKjIhkeIgHl0RUH0xYcM8a4RTlTlQTdbnXodj5vwryeqOWCPWzUovW/7vByouNvvPw5VlqEf+
 3tR85kNaWndbNpVkrwAp8MOH/OsNpJldAxGKtbJSsY0kX14w9m3WXNP6es1M/VprsCF8E9wTg
 ZotZeb7P9TYcGYKIGex2OUZTPiUm//4CRGaBSiXscZ6WX/jzpg5HKo6dDD5wnujHJ3OLd2yQj
 L/bFAqiaENWTuEUxdMZpl5hM1kNvr22XYxfFlgNx9pQKcOUzYeP3w+D5+BNdvfTqySypuh4sA
 LQcU1q1MemWLykQcJK64VHtDbpG/u01iviG/9SAARANiYfP142zjJLJt+K4EnQu9HbI+t7HeG
 f7Dx6q2Hp8STJOuYGTK0FQ4vweQV0tAf8LuX0bIfyHB6XbpYLHB4hEGPL3NNVddXsZHMVAPTR
 2izFGLjvNao6T2DQA1Rtg2KugpYNK9aNyrg5W0NhRKAsCVgJ5rXItQH1CRoUgquyfo/xCgPjd
 2420hgMpPhI3xdRzhbtTJq4oYZtrbKA1lroI92D6CnjJqsLY/LX3XxOdC1y5D5fOzZmXTFtlS
 +p4/tVAib/DJBSIW9Omyw6o91LbU3yt/4Tl+bX6j/I9rVHRU6gysBYRa8p8l6pDIDTOGchQmr
 vQ3VcUPR2PBPc3uJAlSsdYwV+tTilfPne4R69xCI4bDTmhBpVoOmGoQVi1ewzAT2SQnzxj7NW
 TJ5L7waJ6PO0pZvVq36U27SlPSOimZSVVrj9ymonv2R7s/LCTK/79NonN963YJ+nkhc5U2LQq
 AerC2L6GdvarBrzBLOp4KQE6uzJ4RBxKGgJkTNtPjND8T99WjG14Ia5IgZkIp3Q0GvbWu/cWv
 7XZ2FM7K+6PbZubGvcPmkOVPSVl2snFTQmvgEXJ924yVIhcXqlgK+pKNK+bk8hPQ88D3qFZfV
 VoophJFwOWDunkIZck2ci56CfCB5UMiASNdcTsSSp0+OYVDzbpYoAejKK5Q8kFwhNPsjUhzUp
 /fVn13P6cxZIOKcQyi3JM0HOIliutHinaTec2x41vV6127+cDinf15FsfpEfk2Qy/HIU2yK/4
 c6fh6unsbNn7rl7dugrhrc806RfRHd3ShSy6qMJ5RSmPGR4ljjQMlyXEg==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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
index d1afa0e12a..bac47748bc 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3566,6 +3566,21 @@ print_unshare(CPUArchState *cpu_env, const struct s=
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
index 7a69152db7..0463415902 100644
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
2.37.1


