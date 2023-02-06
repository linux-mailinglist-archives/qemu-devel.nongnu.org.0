Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BF68BCA1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:17:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0R6-0007Tf-Q8; Mon, 06 Feb 2023 07:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R3-0007T6-7U
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:25 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R1-0005ls-MU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id k13so2755833wrh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggNkI2omzYSbcFU8obgJYTQOMlCPZdcoe7nl7q2N0Nk=;
 b=Ex11dsO2tAxKwwh4c0Z8lX40laNBG528soWM3BI0VsHU0RL5OX0PlULKYURkFeOuU+
 jP4jnlpuiog1hthmSjiYtquaFU4sKltJV6b+n28G/oLAtPokUBuOKN2Uaw7inm5t9TPL
 ApvPAav+tlT6ROA9xTYZoR/hY8GpgLgxvrRVoy4DQI1dh6Duon2lJolgiwvvyRdHQIJZ
 5/0iFgRuq4clAjOa5S4xTK2z6BItYL1S6/mcPU8PSCv88pZRcSXwj1pxmqr1FhiSYEki
 ojRJeQzxQiZ2C0cL1o4HLaJPQ1eyAVjNxPzOCX4q6xP104Zna5nEs7n7iD6oAbCgeE6Q
 zVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggNkI2omzYSbcFU8obgJYTQOMlCPZdcoe7nl7q2N0Nk=;
 b=zZ1DUMskjRUjiOHtZocjI7z4B3zIU9PnjZ15/npuNtm7KE1nxZIhhBe2aD121p8n8D
 E5WEOHvzjL8l19fuZShQnCFnyRDD6DW/FGaapdHqIfjZJm0mZVepArOPXR+mp71dpGTK
 S/T2yvcHRyaarsKr8r8cuntQwL4diarfLK4llTEv+BR7dBPhQ0S1e8YuqIhy14cUwX+g
 adpUi54N/02iUfpvoZnr+ZHsmdEBLG00Ai+XxoEq1eck2FyiJd5BgMl/5rIp3Vh6rdFS
 67b5JH296WgPw3SR6MKlXo5KWzxg9ng9Kl9/jLfLQBJulK+po8ZFDl7YI3xftm4eTxMU
 Tz0g==
X-Gm-Message-State: AO0yUKX64jkxd1i4cog+Bqve5sRbrCyy/1U0dGr9IoZ67R2Z5M9qdroS
 g2mZPdPE2xmUugElh2gu50Pjw9vZtNM4akUV
X-Google-Smtp-Source: AK7set+GRkSsrVE8+9ncbB9BwRpPPkODx1DR9a3SD20lw2L9oe8II0a82ZfIV5NUcoZS0DL465Cmdw==
X-Received: by 2002:adf:c753:0:b0:2bf:ae51:807c with SMTP id
 b19-20020adfc753000000b002bfae51807cmr18681837wrh.22.1675685842110; 
 Mon, 06 Feb 2023 04:17:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm8827462wro.57.2023.02.06.04.17.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] target/arm: Restrict v7-M MMU helpers to sysemu TCG
Date: Mon,  6 Feb 2023 13:17:06 +0100
Message-Id: <20230206121714.85084-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c   | 2 +-
 target/arm/m_helper.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..5dbeade787 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11774,7 +11774,7 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
-#ifndef CONFIG_TCG
+#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
     g_assert_not_reached();
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea18..1e7e4e33bd 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2854,8 +2854,6 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return tt_resp;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
@@ -2892,3 +2890,5 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
     return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1


