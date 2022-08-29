Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F945A4104
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:16:56 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUKd-0005Cm-96
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUED-0003Xg-NC
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:18 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEC-0001bC-2b
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:17 -0400
Received: by mail-pl1-x629.google.com with SMTP id f24so3857570plr.1
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pwvz/hjWr74KHf0VVDf44MC9Wv0aWLdga0oygTPDgYs=;
 b=u96HWsRvQD0EEbdIEdckDlhCx9a0fFv3Px+vrau15S2moR0OOc4LbFidUM10CQ17r3
 UDQuIdXgFVAlRz7VnBL9SIoDGAoc/EzeiKuxNzutyzhN/CCJetGZ5MPkicYhC2H2eYYa
 YbDphix/SMoOfUs0o1CrJv6Wa1QoIjzabomfZyUEQrwN4XM0cpJppiJkfDyDFpgdrk+l
 MQuSJXITKWMRlQExGRm7qWrvh9iJUriT37HZcUP/+7O1eColOjMXk3pxlfejc8LieAU+
 II2YvMY5GwpHXBEbeNiIDPsBUT3Jqzswr17D6G8WeBczVKk6d6f49FG9nnw7axmSRNRR
 5oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pwvz/hjWr74KHf0VVDf44MC9Wv0aWLdga0oygTPDgYs=;
 b=JrXlClEoSV/JjFZWJlM3RCJ06vdKRKfxEjzmWoOYXTVuviHBJYIOCsXF3CO43Wgtyu
 u8rGRusHC8d0NLi2shbBJOzQYhRRCpbzKWbC8TY7z44r7MYCrkZ2y7K56H5pIrGBIJXk
 nJey7Q5vqeo5RG58dZki3OPQCiybSlRsyshpe/Pnv/l90UaNVKDr5WjRdLzznbtIxDeo
 0qrBQxRqgJ2TkY2HZgD5cRc5BNpnK6Nnd1H1ejIgJuYaBuB8m6Vs5617nRFLoFnJfi/b
 y81VdWK1EXS6AnwvO9dtR9n4fQA1NLjDaWTPxLKrTkb1zwc3+3CGtCYn3/Tcv2UybI7x
 XQfQ==
X-Gm-Message-State: ACgBeo1BAbQvO2caJVQLuBMEjU0cTSnJi54jtuvxHnjKGG+2FQEzjwpW
 d24EditGvmVQj5whDNsEeVCHMCsLoQhu7w==
X-Google-Smtp-Source: AA6agR4JslWUBxLdpxYBmAKTOSuDy2UbTZlj9NuWexuZe8zP0Pz6TBgoGhEj3RHq0cWeWXyrUqKFig==
X-Received: by 2002:a17:903:2c9:b0:172:57d5:d6f0 with SMTP id
 s9-20020a17090302c900b0017257d5d6f0mr14959181plk.61.1661739015205; 
 Sun, 28 Aug 2022 19:10:15 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 6/8] linux-user: Update print_futex_op
Date: Sun, 28 Aug 2022 19:10:04 -0700
Message-Id: <20220829021006.67305-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Use a table for the names; print unknown values in hex,
since the value contains flags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 65 ++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..8eadbed39e 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3576,44 +3576,37 @@ print_munmap(CPUArchState *cpu_env, const struct syscallname *name,
 #endif
 
 #ifdef TARGET_NR_futex
-static void print_futex_op(abi_long tflag, int last)
+static void print_futex_op(int cmd, int last)
 {
-#define print_op(val) \
-if( cmd == val ) { \
-    qemu_log(#val); \
-    return; \
-}
+    static const char * const futex_names[] = {
+#define NAME(X)  [X] = #X
+        NAME(FUTEX_WAIT),
+        NAME(FUTEX_WAKE),
+        NAME(FUTEX_FD),
+        NAME(FUTEX_REQUEUE),
+        NAME(FUTEX_CMP_REQUEUE),
+        NAME(FUTEX_WAKE_OP),
+        NAME(FUTEX_LOCK_PI),
+        NAME(FUTEX_UNLOCK_PI),
+        NAME(FUTEX_TRYLOCK_PI),
+        NAME(FUTEX_WAIT_BITSET),
+        NAME(FUTEX_WAKE_BITSET),
+        NAME(FUTEX_WAIT_REQUEUE_PI),
+        NAME(FUTEX_CMP_REQUEUE_PI),
+        NAME(FUTEX_LOCK_PI2),
+#undef NAME
+    };
 
-    int cmd = (int)tflag;
-#ifdef FUTEX_PRIVATE_FLAG
-    if (cmd & FUTEX_PRIVATE_FLAG) {
-        qemu_log("FUTEX_PRIVATE_FLAG|");
-        cmd &= ~FUTEX_PRIVATE_FLAG;
+    unsigned base_cmd = cmd & FUTEX_CMD_MASK;
+
+    if (base_cmd < ARRAY_SIZE(futex_names)) {
+        qemu_log("%s%s%s",
+                 (cmd & FUTEX_PRIVATE_FLAG ? "FUTEX_PRIVATE_FLAG|" : ""),
+                 (cmd & FUTEX_CLOCK_REALTIME ? "FUTEX_CLOCK_REALTIME|" : ""),
+                 futex_names[base_cmd]);
+    } else {
+        qemu_log("0x%x", cmd);
     }
-#endif
-#ifdef FUTEX_CLOCK_REALTIME
-    if (cmd & FUTEX_CLOCK_REALTIME) {
-        qemu_log("FUTEX_CLOCK_REALTIME|");
-        cmd &= ~FUTEX_CLOCK_REALTIME;
-    }
-#endif
-    print_op(FUTEX_WAIT)
-    print_op(FUTEX_WAKE)
-    print_op(FUTEX_FD)
-    print_op(FUTEX_REQUEUE)
-    print_op(FUTEX_CMP_REQUEUE)
-    print_op(FUTEX_WAKE_OP)
-    print_op(FUTEX_LOCK_PI)
-    print_op(FUTEX_UNLOCK_PI)
-    print_op(FUTEX_TRYLOCK_PI)
-#ifdef FUTEX_WAIT_BITSET
-    print_op(FUTEX_WAIT_BITSET)
-#endif
-#ifdef FUTEX_WAKE_BITSET
-    print_op(FUTEX_WAKE_BITSET)
-#endif
-    /* unknown values */
-    qemu_log("%d", cmd);
 }
 
 static void
@@ -3625,7 +3618,7 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
     print_pointer(arg0, 0);
     print_futex_op(arg1, 0);
     print_raw_param(",%d", arg2, 0);
-    print_pointer(arg3, 0); /* struct timespec */
+    print_pointer(arg3, 0); /* struct timespec or val2 */
     print_pointer(arg4, 0);
     print_raw_param("%d", arg4, 1);
     print_syscall_epilogue(name);
-- 
2.34.1


