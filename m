Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD06BBBD8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVfx-0000q8-8t; Wed, 15 Mar 2023 14:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pcVfv-0000pD-CW
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:16:35 -0400
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pcVft-0007AJ-1U
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678904191; i=deller@gmx.de;
 bh=+gphV25HtCp8gQscGoPeO2z/JINbM3bHJPxght4/Bkw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EirezoOe6cdJa2qdD1MeA1j+6iw4SS4E/hXhMQM/tg8rYkpuEX8RWnSaKweZJwK47
 VtoNjJ9J5oXQ5LB1Tl8RhcDiegOE6luHLrO7F1yYIQNC3S9t7+ufT6NO6R31wy3Rx8
 Ez57idB40h5EC0hiD1jn4yWCxr92/N+DWF86SI6wbul4WcywKBbltoAYof9zkrnJC9
 ICftHnZPTRv76pp5rJqAiyRkqd6QZhWkyEfAqSJ2jZus0I1sYhJQt+KujagR5885YL
 ivQQoY8WRf0N31rxksdCj46X9dyabJqEfoiXotKVc9L65qDcZ9Yq7cAWJ+UfkJhN71
 N9fpafQy1eW8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.153.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpex-1qNhFQ0xW3-00mKcK; Wed, 15
 Mar 2023 19:16:31 +0100
From: Helge Deller <deller@gmx.de>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH 2/2] linux-user: Improve strace output of pread64() and
 pwrite64()
Date: Wed, 15 Mar 2023 19:16:12 +0100
Message-Id: <20230315181612.1388056-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315181612.1388056-1-deller@gmx.de>
References: <20230315181612.1388056-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SeB9Hopt7MpiTeqOmALZlGWp+vC0cDwbT1iSBr+hxkfjMXEDEuL
 G13pi1QqlJLP8scQTath3bPfSYu7qFLjWVxmk5fp4ecWqCmGBg6Dln46NMFa3MB3E15okt9
 amWWbLRzueXVlOvdNoa600HUVHXpIEp1zTC5l1ewvFYYJwRzfEyHhQdrczlnHJEf3KOGVfr
 0MnQP537gmXobOrTsY1kQ==
UI-OutboundReport: notjunk:1;M01:P0:QNxX1FORwUc=;iHmiYAu4buQAOBkwKOLbhbW9QkP
 a7Ofgb3v2kRHr1WofrFNEi3Q9LrL30kbt1EI6wglXYoh4kXABkcVM5unyKc/U89yi2B8zCxIh
 LNJxSDvtqxTXGIm9HTQO5TU79qDqsi7fLqpJxyxYVcfBKSsGfz5S7GO4x0tzukXnJYFlyPp7Z
 78TXw6cdtEgL028yZdJWlLh6+05ja4bXTflCilRAyn4ApC8BI9/FZusClJJM9H0zOYe3nZCp9
 5CPfjq3Inzgo4jNVuKkHc4ZVtgRmkFo4+HV8xBHWdi0t5Rz1hW/Ih4QbiOOwxAIQzZb5qMd2o
 P+8fBvgT04fbon/Sa6kuDWTuW2HhkgJPaPue39rdgzdX3AwLW80MbwmM1eVMSc5DkQhaVxmP3
 Xu8ln4TTKudShVlVJht6BA9y3erVMNW2Kx5dTgSvBSLVDBGF6UlArD/gQk1aTF0CLPQM7vWHZ
 K6liOU4q1eGCYQAAZ5FxlTjOpum7O7LN8GIMtnKn+znrTeTdJcm74pBrkdF/KUpbohxjZnd6z
 rU5mNoB9JklKXex64IR0G3Nnxaj+pF0Y6yEEfV9TSQ408AdSX2LW7tq/AdC2v/yu8DPmLVtMj
 xNF1mZWsbQPHkjcVSElt3XdpyuX1CTtBPz7ZYmD4QZBtM17z1SHQwLSeaJPigNM5IeefY95J9
 95jJ+TURvlebPZovvDOSIwmkRZC/iweWfBQziE2XgeNN0642NLVLCrw5RSDreWR3cB0ENr4RS
 iJnByEI8uhuFsp7i/brnPTjGyPx8EJK8boo+8OU96nBxKNKp10txlrBxIV5OP9HjyI6LBYOVm
 FcuJH2RU9Xff6Wl3KXqDgwgPY4FWH2J69bW9ekBZdtyyD+WG2Fp3T/H3v/0hIiGoClmKFdfdP
 J0f0AWFZA+PSrEWxLVQ31T6cW6+9PYzQEbt3hw3ScW9hsHYcwftZmlFTsy021wysVpjLAGdt/
 1VytUd9GBvbcVwsQCa8zbRrPINo=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Make the strace look nicer for those two syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    | 19 +++++++++++++++++++
 linux-user/strace.list |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index aad2b62ca4..669200c4a4 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3999,6 +3999,25 @@ print_tgkill(CPUArchState *cpu_env, const struct sy=
scallname *name,
 }
 #endif

+#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
+static void
+print_pread64(CPUArchState *cpu_env, const struct syscallname *name,
+        abi_long arg0, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    if (regpairs_aligned(cpu_env, TARGET_NR_pread64)) {
+        arg3 =3D arg4;
+        arg4 =3D arg5;
+    }
+    print_syscall_prologue(name);
+    print_raw_param("%d", arg0, 0);
+    print_pointer(arg1, 0);
+    print_raw_param("%d", arg2, 0);
+    print_raw_param("%" PRIu64, target_offset64(arg3, arg4), 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_statx
 static void
 print_statx(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index c7808ea118..6655d4f26d 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1068,7 +1068,7 @@
 { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pread64
-{ TARGET_NR_pread64, "pread64" , NULL, NULL, NULL },
+{ TARGET_NR_pread64, "pread64" , NULL, print_pread64, NULL },
 #endif
 #ifdef TARGET_NR_preadv
 { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
@@ -1099,7 +1099,7 @@
 { TARGET_NR_putpmsg, "putpmsg" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pwrite64
-{ TARGET_NR_pwrite64, "pwrite64" , NULL, NULL, NULL },
+{ TARGET_NR_pwrite64, "pwrite64" , NULL, print_pread64, NULL },
 #endif
 #ifdef TARGET_NR_pwritev
 { TARGET_NR_pwritev, "pwritev" , NULL, NULL, NULL },
=2D-
2.38.1


