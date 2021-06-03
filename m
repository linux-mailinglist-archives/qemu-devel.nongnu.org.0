Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7539A54F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:07:30 +0200 (CEST)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopsX-00071F-8H
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkf-0008Pp-Ok
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkd-0006v3-Bz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c5so6356602wrq.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/gg8JIdwvW0DYrrjVDsWjQEmdjygTIDM1ioXoiWVJ3A=;
 b=cLAxiIvbc2YBk81gNKQb3tXBjIZ8X7Ktv7lDlUYIIRm/lPnjoC7QITyOQPtQFASA49
 EhK0+wkE1ojiTw+2Mg/UywTl/t/PUvb5noyTMqGtO0P9Rq00kCcNlN1jHzNV2BZWrbwo
 3MPDIar+EkjHbTri96hyCWXLHiUdjCGDQ6VoJQQRtRMwIE9bNQOiWAvhW37hAU4a79HZ
 C9HLP3Ti4SXTKvJLugy9DbrDl07hETPhDI2RdjrID99GTvnxVT+hL95NyVSIlaLUThTJ
 IzN68WJBrQ70ulA3jTHOdLZDgzj3aJkI2QG32du+GL1mpAbihQMEn81pRfE4M/PG88TF
 HR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gg8JIdwvW0DYrrjVDsWjQEmdjygTIDM1ioXoiWVJ3A=;
 b=eb8VUx0RRcihVmfEOr8lstUdi/0ZwjvTPpA/8YpDbwjh1qFhVF64HQ5G6hR9r9wfgJ
 6ysHsC60WYDavbaknLHZZ4xI7aNv6Zwc0GnvF7TOp+CGt4EdAekZh9LMgEksWy97ogY4
 5CX6eCM75GDygS0u9Od3zvKhUtMj0l7xzvcAysZ+uDXkSQHwnBB6UN/d+mXRP8hX9r8u
 z+gbjZ8ITpELAGyetViqB3Fq4C3Vfmd3ecfYqIcUVvfw7TxchYUL7rizv4+9kuZpBtaT
 eFyp0YJQtIw6kUiEzXxDn+6Qd9r7vDqbgn4VqXQpEkYztnb7aW23TB8El5w+NTuTIiWh
 Ae4g==
X-Gm-Message-State: AOAM531ZGw5oHPNAP0Gs0sZDnkczlo8J/Z0OeQu8l9jkfzDDaA3ESPu1
 v9f9sgWgY7Cd4MRMH0avv3zstS9sKXsxoAIZ
X-Google-Smtp-Source: ABdhPJzPFQkT/XzKiF95U4LYPNhN40p9xJcnsJ1O1/EtSlHu5O8ZlQLLJcM5DC4h8gmlZzsNF8haHA==
X-Received: by 2002:adf:f346:: with SMTP id e6mr622841wrp.179.1622735958013;
 Thu, 03 Jun 2021 08:59:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/45] target/arm: Add isar_feature_{aa32, aa64, aa64_sve}_bf16
Date: Thu,  3 Jun 2021 16:58:35 +0100
Message-Id: <20210603155904.26021-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Note that the SVE BFLOAT16 support does not require SVE2,
it is an independent extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5f234834c0d..be9a4dceae1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3792,6 +3792,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, BF16) != 0;
+}
+
 static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
@@ -4153,6 +4158,11 @@ static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
 }
 
+static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
@@ -4297,6 +4307,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BFLOAT16) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
-- 
2.20.1


