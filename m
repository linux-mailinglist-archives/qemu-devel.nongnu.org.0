Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B501839B7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 20:43:59 +0100 (CET)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCTkL-00078Z-O0
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 15:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCTir-0004Y0-JW
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:42:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCTiq-0001em-G2
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:42:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52933)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCTiq-0001eD-7D
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:42:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id f15so2968038pjq.2
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X41LntIfpFnOp1tmXD1Hx9tL8xRzEZP+j1F/1N0KBdg=;
 b=YvaIySu4S+qagbhGEolpvRxDVWQr7YGrPXgAmtn6YLYp4OCeTISuJ8hj5xcPenA8ws
 dvBl0XE4lvnDy4KSkLJjlyOts0c3PJjB5L7qD940RHPbw53Eajd0QSXVc9bPA+fCevsf
 OBF+N+QR+nNHGevuFZ82mp/dHo536EH4zvaz7TK1ccW+Zm8khkhUfyX2ghRz/TiiuT+f
 3U9CxZAs0hwBTxImWD7EZnPI2U8SqmKCI2Hz6jAq5YqlLhzuzlq8UqJtLPtJQD8SJcmv
 cXpf79bgY6hYZrI5AA/efqUNILKkRpXSNx4BORcsgyWCvSzVP87d+4JIx13+jYGOQ6PZ
 +bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X41LntIfpFnOp1tmXD1Hx9tL8xRzEZP+j1F/1N0KBdg=;
 b=O+L38YnJrJ1OQEE2cCrKYDU2EBsm2CbZHR4SlVOllaQzDy/vTNhBlpLxUkyx00DRcc
 y5za1UF9itfvu9gHEg3154zKzCAMxHiLDwS5OKOaLLf8iipXCKO/yUtTT7ylD77i9Gd5
 W2p9qthBwtH2aqP7CyXO187H55md8zTLFCfEqBjZn1ZtbF9gwQLIKotjO4n6Kfn0aW6o
 zcOpmznB7uYNt/mtNM23eTihmFCGtWE07KipAmooMafheg3O8cv+e5HCc5CI0KMvodCe
 gDDAGt/OavnwpZMeCPVV/0DhHnrcoqhSRtI2xKDJU0vOoeDrVwdc0tMjB7la9BwM44kk
 G6Xw==
X-Gm-Message-State: ANhLgQ2APuVk2gnS8UsfRZ4MXyPVjJ+mBTgNYAW8JoIML2i+Ims8ru5O
 6t06tX4MsDIP0iCPPhoxr+jf2m9eZwE=
X-Google-Smtp-Source: ADFU+vt7599WRlJaM9rFkrZFruM/D1gP+C2OU+67Us4sS+uMgWznnD0y4Kti9ifHUyNDobqLidXeTg==
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr5827956pju.4.1584042142715; 
 Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/42] target/arm: Add isar tests for mte
Date: Thu, 12 Mar 2020 12:41:38 -0700
Message-Id: <20200312194219.24406-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102c
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4ffd991b6f..a77b0d97ac 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3777,6 +3777,16 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+static inline bool isar_feature_aa64_mte_insn_reg(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) != 0;
+}
+
+static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.20.1


