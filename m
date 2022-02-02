Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B206B4A70D0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 13:32:41 +0100 (CET)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFEoS-0004nE-7v
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 07:32:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFEgD-0002rp-IN
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 07:24:10 -0500
Received: from [2a00:1450:4864:20::435] (port=38673
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFEgB-0004BZ-Pf
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 07:24:09 -0500
Received: by mail-wr1-x435.google.com with SMTP id h7so6247764wrc.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1jDgGGFL61TNvgJOMQxLBBqM4ZBwKGs/UpbUKMA6sY=;
 b=npV9gCfeZqN8CZmjmMO9V1v90PwB6KeVOzGDCuU3yzozKf6lrL7oNvBohiuCx3I4s8
 oRg/2GWfjFP65WypMU4pUeIxddirOh5159VwPef4BCDepmWOjj754zUNfdygquW957z7
 6EqoLhxp3AWr0Iluvj86Z06+epg6FXusjzlTmJM3G8e2KpYKEmfU+wuFnEK/jhmetHFf
 hpGIhiFQ4iC0eLPJK8seUnFBbbWe+psSZwNAxKlIVR+et/PVPGgPWlX9Nv6btL+tWExZ
 Hy+GO4pN5ZVFHpdq4QM17hBOVPYJJ27HcjNKNuO86tb4W4k+kVyUZhJNtZds2FHQCtdJ
 lk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1jDgGGFL61TNvgJOMQxLBBqM4ZBwKGs/UpbUKMA6sY=;
 b=Vpg9GJHogMaowJfblDIZu6BaESTMKHJo9iyG0ymY0ncsSypLlBwS8bQaQ2AZcGIfG6
 4/TKgZXcSi8uf2ePMktb9X1nbHpoNSQPOYxlWFqkVELgEInWAAi8p/S1opbcPhWUBClo
 JnJj1OCI1t9Wu/4IddmMtzc0quboVvD4ifmHPXnpLOtu2DJsLoiYCbjUPqAD2U4dLRJY
 kRhJH3DGtQ7kYnwq0XvUBh9cVGGNa2sfk8zZr4rNtj1k/ChAKAuabE2cFWPLogTmKwLR
 jUzalbZhHvcodZHTDl1A1wW4qpam2ZPSLKDGRhiPwGxLYnfYGpHIBl/NQdJcKD2m9Aox
 1bNg==
X-Gm-Message-State: AOAM531DStO2PxskQzlP4W9FdLsnxQAkZKLUu3or/B1Aiq5Ey31aoiq4
 6ke+vuTvhulVKTGUCIAx9704Ig==
X-Google-Smtp-Source: ABdhPJwTSnUnfEvxWJnMWZiP9gkQOeCuPfnsT+3P/x/CzGqN4TVGibuHJ4KvY/6p4rcX1dnfgZMPmg==
X-Received: by 2002:a5d:5052:: with SMTP id h18mr26686408wrt.350.1643804644915; 
 Wed, 02 Feb 2022 04:24:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x6sm20225761wrn.18.2022.02.02.04.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 04:24:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19EE41FFB7;
 Wed,  2 Feb 2022 12:24:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] arm: force flag recalculation when messing with DAIF
Date: Wed,  2 Feb 2022 12:23:53 +0000
Message-Id: <20220202122353.457084-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recently introduced debug tests in kvm-unit-tests exposed an error
in our handling of singlestep cause by stale hflags. This is caught by
--enable-debug-tcg when running the tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>
---
 target/arm/helper-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index d6a6fd73d9..7cf953b1e6 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1e, imm, GETPC());
     env->daif |= (imm << 6) & PSTATE_DAIF;
+    arm_rebuild_hflags(env);
 }
 
 void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1f, imm, GETPC());
     env->daif &= ~((imm << 6) & PSTATE_DAIF);
+    arm_rebuild_hflags(env);
 }
 
 /* Convert a softfloat float_relation_ (as returned by
-- 
2.30.2


