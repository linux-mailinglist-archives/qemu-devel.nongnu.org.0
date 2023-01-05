Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E25965EA1A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOeR-0008ST-MK; Thu, 05 Jan 2023 06:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDOeQ-0008S8-H0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:43:14 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDOeP-0008Rb-2E
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:43:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id ay40so27841450wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cVDgWVfU9UuFFIzuYyi6pmmim2xRdLyJJ3WToGnxjwc=;
 b=ZP2Q/f4BxHCtpwliiESAYJ8/lHM6repaDWLlPGqP5t7c6/GxZHpzN8yGQd/F97wfRr
 1sdZI3T+KOmSHtmubVYM/Vmpkzc75hykZWeO6p4k3PS5UBJr7t6Pp/op3i2fw6Tc13E7
 wIe1GUrMcNrbTqnyGjfGSC4yp8a7qenbQQumRLNWYq+44TmaB1pipnTcXHNuQNE5whu7
 V0y0XIcAkJm4b68aqG8jkhCnzbgA4KajqkDVt1BTbTqIAuhgc2xTfSyOIlAejUQjaZ7v
 ojZxo0aHgjLqHOCajofm3AY2w4THJQw8Tze/MktHUgaKtSiIZfxppt3WCMgWdFM8QG1x
 un6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cVDgWVfU9UuFFIzuYyi6pmmim2xRdLyJJ3WToGnxjwc=;
 b=O/4vjUjPnny1AkETcQwbyCl4DuhHIfUMSI0j/PG8Qc1E/VDoxx9ovXKPEfdlVczvLz
 OsGnK2GSoPfQPBhACZKcbP/vwn52RIDmDoCZ5JXuEUxgFfyFPdjAka3c+f7KTom0h+ki
 qTJGgOhlPcC/eJRpHpDsMGOpn8wtpch9eKzAjhjEYJkHhVIa4SOK1ksamyx1JfCHznDa
 UO+hylklprnr4D8vhgGQg63G70ML9juPhJQnxitOAKk5EV7Ko+ex2qUUQnUc8OEzn1r4
 heWJPb9L0nCiYUaGY7s2pfASaMtfyJWqKRI9/UralmwVrvRFDZ9tbiieyy2/ViAx5KZG
 CXoQ==
X-Gm-Message-State: AFqh2krSuKv2+YBmWH2fGZ3yO7UmWJxMz7gDZOY0ffyrTckR0T1jMvNF
 6qq6FDJHEIGfZehWlwPqDMsWxw==
X-Google-Smtp-Source: AMrXdXsWV3NHiSbq6amQyRdOICciOMezktgnNzHeiIARrfR7l1yKQ4Nb9Q4RXnhzSpDsKyABXP15uA==
X-Received: by 2002:a05:600c:4e48:b0:3cf:5d41:b748 with SMTP id
 e8-20020a05600c4e4800b003cf5d41b748mr40139035wmq.36.1672918991481; 
 Thu, 05 Jan 2023 03:43:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm2796181wmq.18.2023.01.05.03.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:43:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 758C51FFB7;
 Thu,  5 Jan 2023 11:43:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] target/arm: fix handling of HLT semihosting in system mode
Date: Thu,  5 Jan 2023 11:43:04 +0000
Message-Id: <20230105114304.2017493-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

The check semihosting_enabled() wants to know if the guest is
currently in user mode. Unlike the other cases the test was inverted
causing us to block semihosting calls in non-EL0 modes.

Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=on)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 74a903072f..1dcaefb8e7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1184,7 +1184,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
-    if (semihosting_enabled(s->current_el != 0) &&
+    if (semihosting_enabled(s->current_el == 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
-- 
2.34.1


