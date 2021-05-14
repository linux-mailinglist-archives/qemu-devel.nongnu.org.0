Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C2380CDC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:26:49 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZiC-000854-SX
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVp-0005pL-Fv
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:01 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVn-00070q-RC
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:01 -0400
Received: by mail-qt1-x833.google.com with SMTP id k10so8880813qtp.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvyRdORvPt1kr5rnE2oBhDe2WAhWIUSyGf83SGXhp7c=;
 b=h8TdhstuY7XgH1FMjA2j4vcwb7FB2cOS53bAh7oU98esCFis/6S2pXUwoA+jJwp7ni
 /XjrCKcdCJ/yr34F+uXX7WufMAR527uBkxYfWA2Rgv3BaXRgW9ExB9VARAvfPcY5JVt6
 5EB90bqzKN5BMtmAwUo81DWxGZHalNF9cM8aQMc+0A8g4eZG3FyapFi1Dcn5VtqDl+pH
 Ges/YkZQWqToNhKg1MTinLdNqhaxDJHUELmicdFjyE5DCGa4huOrLk4bKb2HL1ABiw89
 AvjxDI5RM+2ebP6AfcShaIBrp606DFW4GKJyuDOCeQUjtLsvNLvNDhOGE83ZtHBLj6XT
 ZVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvyRdORvPt1kr5rnE2oBhDe2WAhWIUSyGf83SGXhp7c=;
 b=PxvoFgjF0wZo8Zfqouazal7NhdqVTaMZGEnnqtM3AeAZu1XBHaspUf9XAE1LOGKME4
 HpOilKbXVq4kqAQaanPaWu51fLj3B/C4fVuuXOLndepiw0sa+FrwubRF4c47rmQeW/lC
 yLE2pJEuM+EFPFIPTPc2M3OpFb28ZIHcRRPw9saT9i0VvGcUtqV6F0QyYUiy32s+bSgK
 2wAWHnRKGqr1KjFvYV7+AZPCuq5KlQ/D1SN073y5otAZOgFm/UuV9VMGF2W3h02ZyOLJ
 oFJJg1wWzOFkoM4Ri/b0YFlT6qI0lGoBZ4SGmr1CkY8m+Nf8X1Wn6pz4F4VlfvjJZqLt
 Pvvw==
X-Gm-Message-State: AOAM532wd7BFA7+E7IguSkbaWiZTrm4pS96HztaZQ/38twU7Hy0ffKcT
 tp8Bjk6f1dTatHjLbIIMG4ToduYMXkKhUp25NGQ=
X-Google-Smtp-Source: ABdhPJyxwcpxnnufj4WY6sU/IHeuio72JwCeuZCRL8q6BdiK28+PD+mL6jbSkp5lSH4WKodvkPwe7Q==
X-Received: by 2002:ac8:6a07:: with SMTP id t7mr23337044qtr.304.1621005239015; 
 Fri, 14 May 2021 08:13:59 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/50] target/i386: Tidy REX_B, REX_X definition
Date: Fri, 14 May 2021 10:13:08 -0500
Message-Id: <20210514151342.384376-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
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
index 79a37fb1a7..9bb37215d8 100644
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


