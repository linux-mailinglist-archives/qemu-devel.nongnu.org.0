Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E620F5048AB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:53:39 +0200 (CEST)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng95f-0003ET-13
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wu-0000eP-70
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8ws-0003Fj-Lt
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:35 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so15524710pjn.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vxLFgR2+O/yEO8CWTOhGko5rMSYgERGzbB2hOUZT2qw=;
 b=DI2wNBxyNTHyxEmGRPu3vdwxS/laH9SsS+E2H6qdbjNXas4N9p99jvRv0GaJaJMqCJ
 8n9osSuqzQnMuH91TtrbZq2/+hLJlBmd4ipexGdLwxPbLBIBnNBdiauOefPJcMMIAvYO
 0u7+JqGV1Mm982Pmkw7gwVSXHMH1/DqKX953whZfxpSgwKUxSWlsWpMkjEDn7RdlqYaZ
 FBtarDC8e0BMwHf9v6vl4u56sZlHMfWszW1wFhAToFYV+GaEkIyrAEZKLOJJaRKjZ/ZP
 kK4MekSXaa1PNUtNp6wDSWdiGubCJ04KU4Chqe0OgbVO6/NZupWo4Ixzl6FIAbQKtuE7
 P+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vxLFgR2+O/yEO8CWTOhGko5rMSYgERGzbB2hOUZT2qw=;
 b=przrJ8xm+WJ28cmcU1MhwLzmyEg4agtcSsQCHcsDnvP8EqUDdX6tfVeHzBT9rOUsCZ
 iY/GIcOF0+gW3j4oRwdv265wbmuyVL2r1ItbfzxgNSsdjl7IqH0Yj7uzOpF7NDEX9OHd
 he+uaDpfXHNLC+5rhiHWGyvdgYgq9FYh7TxcHk7ncjLJeUil1WuWgqKPR3nsHCnX98PV
 BmbJgsd46M8yESB5GBEYf2IC+gi/7NbSr4eL/JIYcTFkAfUbM50q6Q2jPSYGsT4SWzVG
 ptDZRZQymlL6PDWEZ7EJi8k+C8OwgLfk3MAciz5UM+/keDuDlKIoPW6kEuArfnWiZZZW
 OPDQ==
X-Gm-Message-State: AOAM530XTCo1q9FVDg0q5HYQR5OnakFpAJVCuFpHwJeExQXLC2N6kFX2
 opmm5xbv7ZWKAJLN6OlhS0w8HDNZjMBP4w==
X-Google-Smtp-Source: ABdhPJxvniTuUuh/Utr9BFNaoR+rydMo7iN3wi7zFARoTUekHeWlvKy1bi70PjLsjMsXRDK2zxsJMA==
X-Received: by 2002:a17:90b:1a81:b0:1d2:63f5:e24e with SMTP id
 ng1-20020a17090b1a8100b001d263f5e24emr7088951pjb.124.1650217473013; 
 Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/60] target/arm: Update SCTLR bits to ARMv9.2
Date: Sun, 17 Apr 2022 10:43:30 -0700
Message-Id: <20220417174426.711829-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update SCTLR_ELx fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f843c62c83..9ae9c935a2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1232,6 +1232,20 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_ATA0    (1ULL << 42) /* v8.5-MemTag */
 #define SCTLR_ATA     (1ULL << 43) /* v8.5-MemTag */
 #define SCTLR_DSSBS_64 (1ULL << 44) /* v8.5, AArch64 only */
+#define SCTLR_TWEDEn  (1ULL << 45)  /* FEAT_TWED */
+#define SCTLR_TWEDEL  MAKE_64_MASK(46, 4)  /* FEAT_TWED */
+#define SCTLR_TMT0    (1ULL << 50) /* FEAT_TME */
+#define SCTLR_TMT     (1ULL << 51) /* FEAT_TME */
+#define SCTLR_TME0    (1ULL << 52) /* FEAT_TME */
+#define SCTLR_TME     (1ULL << 53) /* FEAT_TME */
+#define SCTLR_EnASR   (1ULL << 54) /* FEAT_LS64_V */
+#define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
+#define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
+#define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
+#define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
+#define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
+#define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
 
 #define CPTR_TCPAC    (1U << 31)
 #define CPTR_TTA      (1U << 20)
-- 
2.25.1


