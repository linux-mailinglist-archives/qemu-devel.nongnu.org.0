Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23694282CE
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:52:53 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZd0H-0003XX-1e
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcsA-0000ag-8z
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:30 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcs4-0006Na-1x
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:29 -0400
Received: by mail-pj1-x1029.google.com with SMTP id np13so11435421pjb.4
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igFIr5w2dB50Bl4A1K1Rsq9n6Q+Zz9Bk0DkYG9Us5K0=;
 b=I/s6malkYD455gnUFy6pdeBm41Dnn6a10SzidnrjlqAMu4TfM5+GYJHEomHHocL21T
 GYej1LMJ4vv2qOEt3lO+Tf53YnydW9R843Ugu9IT2+ncNtCqBucggAOWIz10W+6SJ+0s
 /H0CPfhFiO8z/EiCr+1P9yhXrGanr0SoRImo/4cEkaPD8HrtwbDSfX3NvsVPIBEAK1pq
 GOMLYt450b729radFmXFmind5q9jRpFLBM9Le0oWEwRL1/EfOkrechMiigdaqFWWfSbr
 3pVyNNrunmXQWrvZLW5cfIe+qsX2VWsgmGN9KKCr5fqjmEwlX16mOsYYycw4w7ekeV/A
 ZzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igFIr5w2dB50Bl4A1K1Rsq9n6Q+Zz9Bk0DkYG9Us5K0=;
 b=eQjwKpnM1cyn1TXLlKbacketODUAdwDNm4i8LLeGf8/qXHZZJR2b74TcE4F6Gf77Qf
 D6EypY4aW4FY/D0QATYOWwwaUfMD86KmMF8UXWBKCA29FkV7BqJnCRGlK50KBYAVx3or
 818j1MVCWel1u9qDs9tyZ6uvsRi1r/OEhYXAIRb92zWtXb/KC7VoXAnBffDreR5iXx6c
 0V5oA5tPzEhtlYU6SEGIcfA6J7HqAIf66FZWC6qGPJMQ4uL+zaAKDCFkpT3T02BRHO+/
 0sh6FWuxljUVqSjTNqpJm5I6+BCNzgPByCrIKuV2zIhdWeY+6b0n6PtSlhI3DlA5vMqF
 wNVg==
X-Gm-Message-State: AOAM532AUg3mO9Cdz9CbLvKFEwk2fjgovBLIwNuPtDymcCMFcIEJkcew
 U3vsIxt+OPm9hZ2TZqTx0JZY79KvIOkqaNmP
X-Google-Smtp-Source: ABdhPJy90eqhQoQHPVhJJTFAmBgeYFENdVxp5iNfEvGHQsLjGzXaPmab9UKX+Q3rbVZT5GpCIDcS1g==
X-Received: by 2002:a17:902:9a83:b0:13e:5b1e:aa40 with SMTP id
 w3-20020a1709029a8300b0013e5b1eaa40mr20352400plp.41.1633887861781; 
 Sun, 10 Oct 2021 10:44:21 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/riscv: Support TCG_TARGET_SIGNED_ADDR32
Date: Sun, 10 Oct 2021 10:44:01 -0700
Message-Id: <20211010174401.141339-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All RV64 32-bit operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-sa32.h | 6 +++++-
 tcg/riscv/tcg-target.c.inc  | 8 ++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
index cb185b1526..703467b37a 100644
--- a/tcg/riscv/tcg-target-sa32.h
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -1 +1,5 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for RV32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#define TCG_TARGET_SIGNED_ADDR32  (__riscv_xlen == 64)
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9b13a46fb4..9426ef8926 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -952,10 +952,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
-        addrl = TCG_REG_TMP0;
-    }
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
 }
 
@@ -1126,7 +1122,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1192,7 +1188,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


