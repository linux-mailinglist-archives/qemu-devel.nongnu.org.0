Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C14C8924
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:20:47 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzcY-0002Gy-Oq
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6Z-0003U4-NP
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:42 -0500
Received: from [2a00:1450:4864:20::330] (port=43651
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6X-0007Ao-U0
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:39 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 e6-20020a05600c4e4600b0038173851f5eso1011453wmq.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=supxaQdVzvkCnQhT8N01s60fOyhanjrIRWW6b3Q5o24=;
 b=rgO6Qzwse4kTCx3Oyizc9ylE6VtfGt68lUDHk7dTF49RfC4wDju0U2FhVOWGD5bfq8
 GTZM/IaIfVPl7o6ol6S+7ZTalZGu2+F4H1EfOvb2L3tQ5TeMHkl+vxo5qUrUtTMfjJ7e
 uhC/c/prp+xy9TiMzVWfZK9qDjaEeVWVKBp+gJpuESbstyQ2iDSM8L7+lpHy7NGRa9wS
 54ihG4uANH+kEGqFvleVxyfA+jsh/LyHcfcA0TTGllKl16bIKvjOdEFrJn5sb6PEjLWV
 IoaVNddKZUVeTyC6uDS3Rsey8QmyJMrc1NqMIAmpP75y10ldKvGT3fGmWLwTzf0Ls3ux
 47kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=supxaQdVzvkCnQhT8N01s60fOyhanjrIRWW6b3Q5o24=;
 b=lIcgvXwn4yzpvr9ALZY1CJvarKTSePsh9DXjggcEX41Emk0KC665OnDKOfV4zm/1ot
 040S/93/tR77tTMAnaM/zM/HZB3vMXmm1gh/VUl/k0wAXMbwyxMzu3BHMrtuHEMh5CJi
 XSnxWLzwkRC5Q3aH14g/wqlsyjZRFprTdSOLXPexU8oELT7mDoP0HFwKjesyLLwGUGho
 PR1ekrlZb8D1Ccm+WXYxrKITihmI0EmQye1K/dQq2XagG2xkaT3kLxkZghsx4RUr3PEf
 GYDdpeIqGcDgyepwZfx/8i8ZQyc23QsCg3bau3eI9tVRf6dsyQUMDmMaXizm7HruoRPU
 aMag==
X-Gm-Message-State: AOAM532TyOrax3BvaKBMttWdpjVB7paX4XtqoluxUSrWVZ6DnI2J6nRm
 QD6wejWZW7l5B2turNrz3KMjMg==
X-Google-Smtp-Source: ABdhPJwhvXMb/ffw9H9j/sDb39dZHM34uXughrjJemNX4HMKLq+pZAmAg1vd+6wHJAtCGZbhchIZRg==
X-Received: by 2002:a05:600c:3486:b0:381:65ec:f8ed with SMTP id
 a6-20020a05600c348600b0038165ecf8edmr7381782wmq.68.1646128056585; 
 Tue, 01 Mar 2022 01:47:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d4ec3000000b001ea95eba44dsm12945312wrv.109.2022.03.01.01.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C73E21FFC8;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/18] tests/tcg: completely disable threadcount for sh4
Date: Tue,  1 Mar 2022 09:47:13 +0000
Message-Id: <20220301094715.550871-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous disabling of threadcount 3bdc19af00 ("tests/tcg/sh4:
disable another unreliable test") just for plugins was being too
conservative. It's all broken so skip it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-17-alex.bennee@linaro.org>

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 620ccc23c1..35ebe6b4e3 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -20,5 +20,7 @@ run-plugin-linux-test-with-%:
 	$(call skip-test, $<, "BROKEN")
 
 # This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
+run-threadcount:
+	$(call skip-test, $<, "BROKEN")
 run-plugin-threadcount-with-%:
 	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


