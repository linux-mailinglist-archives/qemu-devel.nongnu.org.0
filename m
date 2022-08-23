Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998C59EEEB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:19:57 +0200 (CEST)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcFY-00076I-CG
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc2F-0000Wa-CG
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:11 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc2D-0001So-PF
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:11 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bf22so15225575pjb.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ar6YL5FF/K2Div4uruzg03ZvW0xj9yBOSm1jZPy9tok=;
 b=J3RygTQgC6sedEke5a+nBGAcK40qqwkdljYtjXC7z2BY1BWY5gH8GycwHk5tMNI+Cs
 WZnmIgRAIvo3jKAtpx9p+VylntBej8D8LX4Gyj2xMe/BmrFENyKzuUfY2tl17EcaHOeY
 sz1YtKYCp7Wv5JmHK4Rm1P5RUD+L0pSUKbSV+7GgcatIpKGNIztSDRt9jPLYG7KBzEwC
 eWEUMAX90h5CfV2fN02cfYJQB1poveGXKqb6kDrvKl0NLkRXTUUa0MsJ9BHq+T6JIgPA
 to5EE97/ZL0eoCpvLAODHbMHKcYkGWrQjFZbgbTLMr/ETqcD2b19OsIeHkwVdZIkQfCy
 yd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ar6YL5FF/K2Div4uruzg03ZvW0xj9yBOSm1jZPy9tok=;
 b=0PnokCIQ8gEdFGVs0nbLPgcqrnAxQ96439A8RQpNXEOlMRw9bNCsXXEpDdDZCUHza+
 3xZCC4184Vae7UUuq+URhchTDrrFAZCkgc57zWB+rcSVMXKX0ynHffw7KOURXD6LCw+W
 fK9Kjceewrvok3ZGAygJnZWwyEqSASQebINiSCwEljeQsR7UYQUQr3CK+88PmLWpAv8u
 3g8K2D6F7cQ6MIQqm6BlTD0e3SiqSHdXv9fNClCNwJEc/Wa5gFRwWfX8zn8gWSZx8t7Q
 nitr+fIG3JsD/DSyek52SaYpCVNuDFFORSzfU2jMyItwKbY1/gNjHVlLEASFNArcLGXQ
 BhVg==
X-Gm-Message-State: ACgBeo01tTm0Ml4cxYXbLduNPKcYzItr+Uh3o4el8pmGK2G0bsjfyYxd
 cIajMcWdYwSG4C/IxW0oP1cfaeI5+DGlFQ==
X-Google-Smtp-Source: AA6agR4tphudbfgsP8WjAb71k6c+1VP2o3uErwZ7cfjy3YV6OfBGqjIz6e/LYIZGKfefofAx1vAi7w==
X-Received: by 2002:a17:902:7d83:b0:170:9353:f299 with SMTP id
 a3-20020a1709027d8300b001709353f299mr25683017plm.41.1661292368369; 
 Tue, 23 Aug 2022 15:06:08 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 19/20] target/riscv: Add MAX_INSN_LEN and insn_len
Date: Tue, 23 Aug 2022 15:05:41 -0700
Message-Id: <20220823220542.1993395-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

These will be useful in properly ending the TB.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 38666ddc91..a719aa6e63 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1022,6 +1022,14 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
+/* The specification allows for longer insns, but not supported by qemu. */
+#define MAX_INSN_LEN  4
+
+static inline int insn_len(uint16_t first_word)
+{
+    return (first_word & 3) == 3 ? 4 : 2;
+}
+
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /*
@@ -1037,7 +1045,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     };
 
     /* Check for compressed insn */
-    if (extract16(opcode, 0, 2) != 3) {
+    if (insn_len(opcode) == 2) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
-- 
2.34.1


