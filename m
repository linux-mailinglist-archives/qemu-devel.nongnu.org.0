Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEAD51624C
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:49:42 +0200 (CEST)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3Om-0007p0-Qe
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tw-0006tk-TC
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Ts-0001Kh-Pn
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:54 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so10458964pjf.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89Nxo79E/u1S6zfSk3J+FzT8WNvYQHnxRQfRBu3u2Wc=;
 b=oal+3fOqvUiwxZaObLoAZyPYnfFMUoUk/FOFXzWZwdovXCG4xyYjg1xzTJzGSIWmof
 BLn+iDV0z3LkFdIotC+PRL+q0YWVJ1hTZuWpjfuQfqSmajubWQuaFx5Ud8tppfys2/47
 hJJP2c1rbwIHJ19s+zE3CfolCT6KAqa13qN0MmC/1l5+dICaXev1E93iBNU2q4LoVdoS
 ZA1fsW7Gc8GUZrdXl5o1mWMJhVHTrCshXGhuI4kQs74MTImWNTgxNZWqQMOut3KQrjXW
 WRlOOc4JFFkWuUCd2fDqK/RZSNFm4+oA5Ps9wIaJJqiex7sr1Yc2/laIPpHF8RJqUfHh
 +skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89Nxo79E/u1S6zfSk3J+FzT8WNvYQHnxRQfRBu3u2Wc=;
 b=ob77oRLB6Devbr7BB+Jymy4hFe+wakbYKQyjPVJr7YLjjk8tknIWw7j0+itU4lNKfJ
 okJaq0DY1ATQfMqGSe3GXIwN3YTBddXmpwXCb2SYu2ArLW4fqHYeS/2UxJgKxZWYx/1c
 lYIqZJBghhYYBNFnHwctlGwkiCuh/0TvC5uVY7iEHvrSn/284GDux2PWSlR5j8S5vxf1
 Fk5Eyd285UDrV6bkiaVceqD+73/K9DmZzfo+/pEkF78a0wqfSlcMFRptRHwAuxxf5eVn
 kjl4J4imLpgRWHUHuwtshWz6OKABku/2LTUstJ5mkvqs047Bca0qBJQHMFFgNclHZjRJ
 RoRg==
X-Gm-Message-State: AOAM533Akaf2rVoZoQo4MTerdUB3tw466E735eNLALAcmk3iCyjwceA9
 MN8Xv/SmFJ8hgAfgI9QantxUAUWjk1eJkg==
X-Google-Smtp-Source: ABdhPJy/fq4N5iJbBE7/Rou9zDtz06e41PEPLVBhQAg44Z5JQy8p1GjiqRJZZ8sqkdPHT7ituo2s8Q==
X-Received: by 2002:a17:902:d709:b0:155:d473:2be0 with SMTP id
 w9-20020a170902d70900b00155d4732be0mr6044014ply.151.1651384251552; 
 Sat, 30 Apr 2022 22:50:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/45] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Sat, 30 Apr 2022 22:50:05 -0700
Message-Id: <20220501055028.646596-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d1b558385c..7303103016 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3704,6 +3704,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4010,6 +4015,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4093,6 +4103,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.34.1


