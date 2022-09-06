Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF75AE3E4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:12:32 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUdD-0007w9-34
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6W-0002y5-4u
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6U-0005bS-8c
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id az27so14306880wrb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ar6YL5FF/K2Div4uruzg03ZvW0xj9yBOSm1jZPy9tok=;
 b=wr+8fA7woVjc8qRZQe0R9g0J//X91kP+CdFAt1ZDwvon9u3M7J8QktEwNNIqFkDdkt
 GDFsZ9/FWCRGasf5FbhFD1NO46Cbbo2O99sIwBgm8KsSSKq9EzVniLiCCSf4RGcuS1Dt
 C+/JGg3sH71uMDcHgsPVTaE0/B04Kc0zFr713BzK4bVDsBEjOKg5vTR8sxTsbR48egYt
 HU9XQDjzDWlGHW1QSg3qx+npajtMBVYUbcLII5rDeP6bhk3JQTRvOafzT1sXa7TMIqct
 09Nx34Ud+7uEG/8hPt9IYUZ084iDuCq6n+jbtjdlErq5uGlahqlCcb9sDzrXe9/I6O6y
 SX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ar6YL5FF/K2Div4uruzg03ZvW0xj9yBOSm1jZPy9tok=;
 b=HFwuCMr7ry0FCSFHGzbLVv1labNbPC6tWPgN3vxuIYUPbRgR6AdrWteHRKcMIVhyiT
 aKYeW+fPywqIQ9xZ1W1mv+QylBmay5aHIhGeJ9PHKgC9aIedVYsCWM6yCseSYrCgiRTR
 Xtp5WaJai5a5Ku9SselR6oOxb4U7k3DRRmFWne/zkGKFpj5DAIsNJN67+mduBB+dkUe8
 N9TukMEAqBLdgbEq0ZgrFr4Z062wYKsPAv9JRxl/QGoxF18bRF31vBtVsspJOXOfviaT
 gNmhY75Ub3N3zHLttYUyDfRQoaVhue+ou0dIYvYVcHfRJov3okmuZ0zsUVZpFCCpdDhO
 GHcA==
X-Gm-Message-State: ACgBeo0kvqm/aNgERygsy2knUvDRIDh4uGVfdBReYx6FAgUYtUQN0S/Z
 zU5UAvWuTc2Trulyly43Y/4iYc854lx3Ee84
X-Google-Smtp-Source: AA6agR7FJ4utPx0r00YBXO/0QOuz6dUCEI5d13yx0iZ2uwB2bruUmK0i32443PubhkrxogDHsNWfrA==
X-Received: by 2002:a05:6000:168d:b0:226:da6a:6d78 with SMTP id
 y13-20020a056000168d00b00226da6a6d78mr22379665wrd.180.1662453520644; 
 Tue, 06 Sep 2022 01:38:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 19/20] target/riscv: Add MAX_INSN_LEN and insn_len
Date: Tue,  6 Sep 2022 09:38:14 +0100
Message-Id: <20220906083815.252478-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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


