Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6FA327546
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:38:20 +0100 (CET)
Received: from localhost ([::1]:35200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVdj-0004jX-9H
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPk-0005RY-AV
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:54 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPX-0007iX-5g
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:52 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e9so8764857plh.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ukt02Bw5xkIb+TNqr2W20PaNk7VhmCkpJBFsF/4M/x0=;
 b=IJJTq2YLELoCtg9hj/ulgT/M7f32SIO9omWKm0PutT5rqa3CVbj42eJfjCxenAoheZ
 0levChT5pUQ29vCF4NtyN1QZZrs5dMCCoqkGQrNO0hRx4zB87cGU1vhzpA7GcIJIxt6i
 9l9lMb3uFF0HAzz614Vsf3UQMfcH7FZjjy/3F0oh7xk3MnVxJrsFLc16W3P4BEDui3Bm
 ZPM1dIA4wEqNjhN/N1wkisjioyP9gfoB5rvb5FkVQ7uXpYoS7p0QphML+D/VVHp31apW
 7asaPncP4V/wnqKIupaXjo35AZq57D+LY0UoNh0eQacA7C5v2DhETYA1XFLn6YAmRHr2
 YAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ukt02Bw5xkIb+TNqr2W20PaNk7VhmCkpJBFsF/4M/x0=;
 b=sa7IxTCjzRLuhyM7Ee2ymujCg+0sa3TzaVnlIUAKuPsASJAiVu3mpQykb9P4r89rVD
 qwDePfDbmP9Iqv+8A5hV0IYKKBWVF9CT3dGGD7B6AaDvfhgv67M2IyhVijaa0XcJ9WBm
 DGkJyFBO8X26bDd4luJeXC6mdPfffOQdKWbcEz0RxWL9Fkvq0OvAe3dzfT9zvsdKJBjm
 r1r4kX1i6bZ4SWNGMBqypzJ7+qFYY8QMo8SGZqZHrVDL6adETLuko/X/70vNToYm+fyn
 l+wR72qi8+VLgyRGLQlT39mHJyIWeHNHe0RfJpUt2qg3T8U/zwdZLQCc2kXWbGXfA+wk
 RRTA==
X-Gm-Message-State: AOAM530BHDZJezVXBo2jL1lhqAbp5uq3TlCQpzfLwArOzayzFl+ZB1vC
 SiNwmpKZJKeohcibwIeNPP6NMpaAIWRLSQ==
X-Google-Smtp-Source: ABdhPJwFbJoPn98QfUeuiB7Qd2HnVA2V9AxwBwqdUeP0Eh/ioXMOwFANVG786lsv9iL9Hl+jsvkF7w==
X-Received: by 2002:a17:90a:7c0c:: with SMTP id
 v12mr14092642pjf.63.1614554617558; 
 Sun, 28 Feb 2021 15:23:37 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/50] target/i386: Tidy REX_B, REX_X definition
Date: Sun, 28 Feb 2021 15:22:47 -0800
Message-Id: <20210228232321.322053-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the storage from int to uint8_t since the value is in {0,8}.
For x86_64 add 0 in the macros to (1) promote the type back to int,
and (2) make the macro an rvalue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 31b128d4fe..605b80229a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -41,14 +41,6 @@
 #define PREFIX_VEX    0x20
 #define PREFIX_REX    0x40
 
-#ifdef TARGET_X86_64
-#define REX_X(s) ((s)->rex_x)
-#define REX_B(s) ((s)->rex_b)
-#else
-#define REX_X(s) 0
-#define REX_B(s) 0
-#endif
-
 #ifdef TARGET_X86_64
 # define ctztl  ctz64
 # define clztl  clz64
@@ -100,7 +92,8 @@ typedef struct DisasContext {
 #endif
 
 #ifdef TARGET_X86_64
-    int rex_x, rex_b;
+    uint8_t rex_x;
+    uint8_t rex_b;
 #endif
     int vex_l;  /* vex vector length */
     int vex_v;  /* vex vvvv register, without 1's complement.  */
@@ -173,8 +166,12 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
 #define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
+#define REX_X(S)       ((S)->rex_x + 0)
+#define REX_B(S)       ((S)->rex_b + 0)
 #else
 #define REX_PREFIX(S)  false
+#define REX_X(S)       0
+#define REX_B(S)       0
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -4617,7 +4614,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             rex_w = (b >> 3) & 1;
             rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
-            REX_B(s) = (b & 0x1) << 3;
+            s->rex_b = (b & 0x1) << 3;
             goto next_byte;
         }
         break;
-- 
2.25.1


