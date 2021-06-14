Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87A3A5E8C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:48:58 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiHB-0004Iu-Mq
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6v-0002Ny-W5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6l-0003Zo-PC
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso9589219pjb.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eanNhhdSmGxxyPIStrUWyJsT/SdYtmDYp1DHF6kEh6o=;
 b=ZpsqCrsUF2QzCbXdnytQKEJRtleqCS2tlNtDW+dd8sLPezkdwBVGLOx/EyZ5iR37dD
 QDoFFoazCT/Q1qE1JmTboOkTASJe8J+2poDmwNWaN53+R/obGqKvPAEq6q4WWI/8B4Co
 e16ppTNepCzeebfqOvWLJTcCkw87I8emQ7Ge7gxO2OkCK6BbfhjQDkj6UuqgaAty6Ilw
 YG+AAsc8JiRMotFS9oXDreT5Tw+24b7jb4HGJwL8uQVf6Up3C2TiS74a7hCjGxsubg4/
 d+zcMxUMkOSV2KCdpgMffdqqAR2xVOcy7n2pI6QQjAURs0llpaH5ADgOc28e87TCvTEQ
 pRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eanNhhdSmGxxyPIStrUWyJsT/SdYtmDYp1DHF6kEh6o=;
 b=i0+s1CV0PvEIdGzOZsiLGjY1Viiu4+xlEP2NsbmGAmMhG7eS4wVGNZmCOb/baY2kVr
 F+ruHSzwMa0NHbxZBq3bJkIIoAyX55wZKKW12rf0C8oqcGFMDqpgPaZ7r4VR/lw9345Q
 5nui/MkS7yOh19XNFfFpZF7mbUNU+BbkWKxM3cgeFqXKrQvtGTGF+tOy9tAfJmnhh+z4
 EQxfeH6CQF8BpFOhSlhnnU3dLKeu0lSHCM5lCOWMz9mzbUejjp6a740UGSqa0EIW1oO9
 372oJXmMn8ywNXjc/TiVCezN8xdTEPHCOJaVNwxjM6/2x/UkXa0Erhi77543nh4fGfjN
 I8Kw==
X-Gm-Message-State: AOAM530Aemr9P/nLoBp3j4BC/KkEHziLpt80OfgS7wAAA6MMpGLsFA+f
 psklC0hgs8eX78D2GCO4RC5zauq7sUE4IA==
X-Google-Smtp-Source: ABdhPJxHDlqB9MOt9DMFSexNr/yZSh780erNBRiLJf0ndYfRzLNxQEYQXBGPEl02uDzEjCISsKW1xQ==
X-Received: by 2002:a17:90a:fb51:: with SMTP id
 iq17mr17752189pjb.26.1623659890549; 
 Mon, 14 Jun 2021 01:38:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/28] tcg/tci: Support bswap flags
Date: Mon, 14 Jun 2021 01:37:47 -0700
Message-Id: <20210614083800.1166166-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing interpreter zero-extends, ignoring high bits.
Simply add a separate sign-extension opcode if required.
Ensure that the interpreter supports ext16s when bswap16 is enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                |  3 ++-
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d68c5a4e55..109522a865 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -733,7 +733,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = (int8_t)regs[r1];
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64 || \
+    TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(ext16s)
             tci_args_rr(&tb_ptr, &r0, &r1);
             regs[r0] = (int16_t)regs[r1];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 823ecd5d35..1e92688dca 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -617,6 +617,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
+    TCGOpcode exts;
+
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -710,12 +712,27 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
-    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
-    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
-    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
+    case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
+    case INDEX_op_bswap64_i64: /* Optional (TCG_TARGET_HAS_bswap64_i64). */
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
+    case INDEX_op_bswap16_i32: /* Optional (TCG_TARGET_HAS_bswap16_i32). */
+        exts = INDEX_op_ext16s_i32;
+        goto do_bswap;
+    case INDEX_op_bswap16_i64: /* Optional (TCG_TARGET_HAS_bswap16_i64). */
+        exts = INDEX_op_ext16s_i64;
+        goto do_bswap;
+    case INDEX_op_bswap32_i64: /* Optional (TCG_TARGET_HAS_bswap32_i64). */
+        exts = INDEX_op_ext32s_i64;
+    do_bswap:
+        /* The base tci bswaps zero-extend, and ignore high bits. */
+        tcg_out_op_rr(s, opc, args[0], args[1]);
+        if (args[2] & TCG_BSWAP_OS) {
+            tcg_out_op_rr(s, exts, args[0], args[0]);
+        }
+        break;
+
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.25.1


