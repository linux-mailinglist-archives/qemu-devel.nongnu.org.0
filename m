Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1F68C98C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:36:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5T-0001uK-PH; Mon, 06 Feb 2023 17:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5R-0001te-NI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5Q-0004QP-42
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11920715wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tq6DPJouguMrWtZeeVmDD2Re+mYoIDnT0PaG7kqN/mg=;
 b=Mek3dnXtIUsl1ep7k31ICMi0nee9DTCTRphEZbvt9Mqke9VUlh3Ka2Jy4qTXD9HOXn
 cEOZ3GH9dv1fw9LUQB0j113HA6zRXOuRfB+j33Vv2Nkwocyfs5Q1XE4wFOG8pUd67V7b
 rOs5Co5ziRFjuqm6PkSaUtgutU7SgPKxYissaaGUMlN2evYs+g9Y/i4mR/8L27vQubRj
 +zbtNdYROkk74UogvuHQ425jQI7Ar+d+oGZhj5MOs7HKsQ9G4OjqEtA3xAyXm4Bb1Onm
 1AGRfwXRp1vwme+eE/Sa73ETLso1jP+KrmITyoiVpt9YevghxkuwHCoQlWi0flM4yH5w
 a/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tq6DPJouguMrWtZeeVmDD2Re+mYoIDnT0PaG7kqN/mg=;
 b=p9XFUEeSkEGI2DRQzp9/g/DjbetGwUcs3V3/zlvy6+GjBJWQEwMKODq85F/paVJ48E
 fO1QytdGuurq1XZoOVlJqvGdI5YRDpfdp49RPvBpaGctrC0FFUPyGvaX4TUBEYsNHLuQ
 wYmdgJQwGciTt66UQizui2+v9Ycj1Njhzdb/efRePr/yCNXF01IghlvFXYt0IPdSTvaY
 TPJUuVl/MuGiBuRQt6XdBFKa4NDwadDqMVgB1evvfut/M2/4pYmNwiGbbZ8YpcAn/GMM
 Vff4i5z4bnl/7Ae/Y3Pc5khMHnYso59FfnQ2mTkyMWSyu4h2F5Rjpq5KhO3w998qJ2jV
 01mw==
X-Gm-Message-State: AO0yUKVOzV80nwDk7BdeQizV3pC++PBdzfixY2kMk9xPgJlFYEh8Zut+
 P37mMFHD03ngbwc/S0QA4VnwkvhvH9L7LHLV
X-Google-Smtp-Source: AK7set8f7FgTrJPAof8WWJwbmhEPwriNUc+y1ezF/wn88HfPClaOKLcpPyPSY6jAVaDDyo74AGE0iA==
X-Received: by 2002:a05:600c:35c6:b0:3df:9858:c034 with SMTP id
 r6-20020a05600c35c600b003df9858c034mr12591508wmq.9.1675722943215; 
 Mon, 06 Feb 2023 14:35:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a05600c2cbb00b003db12112fcfsm13356593wmc.4.2023.02.06.14.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/11] target/arm: Restrict CPUARMState::gicv3state to
 sysemu
Date: Mon,  6 Feb 2023 23:34:58 +0100
Message-Id: <20230206223502.25122-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1c1e0334f0..002082eb5b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -769,9 +769,10 @@ typedef struct CPUArchState {
 
     void *nvic;
     const struct arm_boot_info *boot_info;
+#if !defined(CONFIG_USER_ONLY)
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-#if defined(CONFIG_USER_ONLY)
+#else /* CONFIG_USER_ONLY */
     /* For usermode syscall translation.  */
     bool eabi;
 #endif /* CONFIG_USER_ONLY */
-- 
2.38.1


