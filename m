Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C650BEBE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:33:21 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx9k-0003cz-SN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwav-0000EV-7F
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:21 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwas-00082K-Om
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:20 -0400
Received: by mail-il1-x12e.google.com with SMTP id t4so5409313ilo.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECkUiferYymqY4Z15uQTs5z/1lpHpfnUwzpraAW+MmE=;
 b=sy9rN8wM7V48nLg45maUYRInF1jbJgujxhGx3r3y0aGr+ReHBgWcJYrUhyhTOYXH0a
 Oe8pVJZmwoKuyglZYFVvn+jDOAQygFLz9wbeEFs0fpuOPVtm36DGqObHpMTQNPCGzD+Y
 OvJKAMmPtEAO1vwpKVJrbRO5snc1obtv8JcFO1bDad4o/nvQzcafe4zyHrryvEDB0Jfq
 w/qmAmV/sK/g3+Q1v2FG33etL3JiAI2AEQ/dB6TzHNrfDHrXm1DZAdu8BBjHmRrIEygr
 HhvMuqMIgvuVJKV2WRZTNM1TdpV6QDpgyKtgN6n4dp1WS1ZORgahrHLeD3H5ioytOohd
 OrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ECkUiferYymqY4Z15uQTs5z/1lpHpfnUwzpraAW+MmE=;
 b=0CvKiU6DhgABTrwGb5L4TAv2hpAPF4qqSqJVl+a74XB8L/lrCsBviyaqLPCgUuSiz3
 UfhArzBIq5qVG93ZBXxq5azRP4somVZ4PA/fuCrSEDYKST/7ses7KLFXAG+JZs6G6qD+
 nOhL+kbTo1Y24oRTu1bs0mlN8Nng5BW3XYxKLy89B9qExcr3UGMZ/9W1D2E+Z4J6KEl8
 EkDrvsKBKctMfGgTEjjQ6cc/hUWvagH+dY99e8n/ACfYSsmRyTr1dmrYG4ufnH3+bOl9
 JF5BdMXcMT5chUebn8j515h0grBBwBg4vtl0MqbpJEmxB8R6BKaUsOaxwPTPx5U/8PD9
 4MVw==
X-Gm-Message-State: AOAM531sd3CtUHKxaZk/bbS2JBqxrVNxaz/ndZ5MnDNCFZs0jNDsuFEJ
 zGQrPDkPviBV9ITeO1XpVTL1YsNT0VALZZtW
X-Google-Smtp-Source: ABdhPJyYRqJKn5lHGV2s4JVkeFcVAC4gj2xvtz1fBokzYEUWM+R0VMEuDVSjcox5m1HCp5a0ETYWrg==
X-Received: by 2002:a05:6e02:1348:b0:2ca:b398:1144 with SMTP id
 k8-20020a056e02134800b002cab3981144mr2563530ilr.163.1650646636321; 
 Fri, 22 Apr 2022 09:57:16 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 53/68] target/nios2: Hoist set of is_jmp into gen_goto_tb
Date: Fri, 22 Apr 2022 09:52:23 -0700
Message-Id: <20220422165238.1971496-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than force all callers to set this, do it
within the subroutine.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-50-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 8616813365..a55270cefa 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -192,6 +192,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
     }
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
@@ -235,7 +236,6 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -278,7 +278,6 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -290,7 +289,6 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
-- 
2.34.1


