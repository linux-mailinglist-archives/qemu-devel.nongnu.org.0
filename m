Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0859C55A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:50:23 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBZ7-00059O-8B
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004lO-Ki
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:43 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:47077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9On-0001g5-R7
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:39 -0400
Received: by mail-pg1-x52f.google.com with SMTP id d71so9671941pgc.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iTCmXn4zbNmqsU+EjRI1sB7Q7oTW2VW8cDEmCqjn7r0=;
 b=gmhb5D62NZ02NLF9hoI4VJ+2R15BL+HlllsDEsFan9cYG1NgmzjrppTHnBPH88aBxB
 ZqhbRBGQKPM7srEQ8+EOjmyjBek1fl6c2TbX/ACuyce0thUf7sxquvUjU2Y+JqekrVJL
 WjoBVdZE5vZluFDFa4GYZ/bw3dkMVLpxU6PH5FC7gmmGIutFl7sxYZO7SlLx1feD8/kn
 iWblGzxupaDKSERA0g3ZZo2/CWA+Z5qFo1peX+ej9h+skO0mkpmwTbPjFxCT8IRNfW0H
 tZaJxoEN6zIkPwRaxyKvl2Knw0RtvmG3Z7DIyFd4gdVKiHBNFmFoTpv2gvScqDmaJKay
 cAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iTCmXn4zbNmqsU+EjRI1sB7Q7oTW2VW8cDEmCqjn7r0=;
 b=q3rC/7Vx3+5o234WV9fbsol4oUKhu3IoRxON9PsoEVk04ikJzOt4aL7gpUZA5CN22Y
 lS1IQM2ULKN/kqZf9Xm7GeS5zDLOrGPWgYDG+7EUT8KXW/3p7nm3PyiUHb0amaCLZtUi
 T6AmNoB8i+7wqP0A8tazBqrD98Ch14Nl28fSAruNTLPz1HWOTayvYrXEvktZn3D3Kdlj
 8lj6F9RPVfm5mDDYtpgxSH8n2Lyzty1ir36CehBpbZ3Eztm/ABl0W5wBwMGUVqUFdwMO
 ZEqGVsXX15cFJ9uBhf8N8dqyN/Sv7hY2pmz+RnYrE3MqkQs9T+5wtBcezTRJD34IrDyD
 t0Ng==
X-Gm-Message-State: ACgBeo2QMr96Ru0+gBrM9RaIy80RczItsNfnopLTWYglfPv/nD8Y57On
 VyBrVwa14CSFQ5JuL20D7LxIzrTjNc8K0w==
X-Google-Smtp-Source: AA6agR46epjri+93dACeTktDrD0p40SmnIjx1RAvR0ZTxDMvoD3vSmdLJ4WM41H0onakZAn4EbKNQg==
X-Received: by 2002:a05:6a00:1a:b0:536:d522:dbf1 with SMTP id
 h26-20020a056a00001a00b00536d522dbf1mr2283516pfk.42.1661182291838; 
 Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 56/66] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Mon, 22 Aug 2022 08:27:31 -0700
Message-Id: <20220822152741.1617527-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8fb4baf604..4a1a45d424 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4079,6 +4079,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
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


