Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA2564613
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:03:39 +0200 (CEST)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vVy-0005eh-JF
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzX-0001Wk-ST
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzW-0006ea-Az
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id o15so2059371pjh.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDKyQFWitNBJWXzXzZdHuAgrjnn69YMfQIBCMUU20+g=;
 b=Jji1TAl/pzfkC7wrazVrDNV1D9Sdk+5xgdZf1CUTJwQ5bFsuGEt7jU3t78mGInLICx
 H5rCEW54lMgvgMC4qTR0TkCb/QSPTKw8tqE3FzRBTJ5DOKpffEmEpyp6MRowMHqNjWIm
 KOGfw6lB9JzeVG8lrmkt2MOyrut0Ximzd/jvCpIFLKAPClP5s1dhAik61jaCx0W3jtYi
 usMzac+NVw15uT7dpsGy13sRftQZiez5y4uQXWLTJJ5x1BOPpalWegpV6aeWhkCo2FS4
 OrBkEiyz/vWzfnCEXD7/e3SZGLkhVEazM91b3zqPvVWaQfcLW99vT6+JmbVs2eij3BEC
 BdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDKyQFWitNBJWXzXzZdHuAgrjnn69YMfQIBCMUU20+g=;
 b=fHTHO7A8VLt/Tu7NU92muaagboITum/4BdnyEWJ27ff5dDm8dtF0TNvxl4KyMnXOZv
 9Rp6a+LmO/MkdjqucNcQTLQDSZb2n4l0hc3AsjyTDcY2PSvghXuFwXv3NNAUasxGr84f
 VV5Bd2kaMnwwxqQpC2lHxBlXNyPXvh53achRewejyHom0uJmC98C+NxpfBBOfuVqA0YB
 FkLK7zfpcPvMp1fn7PHK6rGz50B3ZeBNWVBLe0CjBFE52WKJy7sw/TtOWh2PbU6ACMXw
 wk7sq1ny0ewwkZoujjdAgRecGCDaziJBOnveL508XgPb+dfEHU2eyEp8RNAEirSJfwBO
 RsAQ==
X-Gm-Message-State: AJIora90aFskApfjbqXKejOss+Z+5RwSJC85LOKQb4ebDmsNYExycFCa
 MBuJZt1Csmncoyq4AnxKOYqjijjp1NUiaWW7
X-Google-Smtp-Source: AGRyM1uheJ3rGbClKXgJ+oD6dKIqO3viuXNaG9cGGYRQ+e8C16gw4iP+Lmo5C/VOYTud9kxgTciiSQ==
X-Received: by 2002:a17:90b:4c05:b0:1ef:203e:6da0 with SMTP id
 na5-20020a17090b4c0500b001ef203e6da0mr25661909pjb.227.1656837005542; 
 Sun, 03 Jul 2022 01:30:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 52/62] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Sun,  3 Jul 2022 13:54:09 +0530
Message-Id: <20220703082419.770989-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5e3084ec9..6484abcf1f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4034,6 +4034,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1


