Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DC1508C8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 15:51:27 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyd4Q-0003ow-Su
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 09:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iyd0b-0006rp-KU
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iyd0a-0003Fv-Kw
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:29 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iyd0a-0003F6-Ct
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:28 -0500
Received: by mail-wm1-x344.google.com with SMTP id t14so17462977wmi.5
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 06:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DU+uDtDiqQV/fll1Aq36wX3lYUGSGI8gTP30+WnYS14=;
 b=wsH4G3OwCSDUN6ebKJC1Y7Gzoajq5jSYMXo0ghtb7Vbdhc7m3NEPg9VRtK2zYHy/tU
 1c4c2i2an2vVPJYrGMVt4JUOk4D42AHlOVQasr5iw36GIF7KXEEFbhxaY/SIGissJMwR
 eEqbUtAsoQW+7SIHzYcIt+C5NpD1c0uyhF7pIBSG/eVJ+/thzJDLwUbzNxGk8jpaRix6
 pTZeShOiUqvu9FK+F84E5UF3slNLPBAMFnaJ38K8pCaXLAo36WWP9Gs2Qvth5jP1iD3L
 huV88kpnwa78zTeslx6dwNMGv0e+OSbQtJPQcGw+6lIp/TIhhAK6wieUqdX1CeLFryjk
 FE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DU+uDtDiqQV/fll1Aq36wX3lYUGSGI8gTP30+WnYS14=;
 b=huwkQ8i7pR44RbacgtA9P67m1chve9IralqlsErKCs+2DxMf5HB2SEvJZ1TOgru16u
 xkDJYEQyyuc6CWUYqJxSD44k24VjSE+gNUtKinF0J4KAo8KEwuZITkyn5j+Bxt+4zolv
 MjzUQD3ooB86+TsMncGeDDM0Uz4kxwWlY5F2F1ge2IjsqaYxnAsQBssQ2xxeZJnOrrgi
 ARGLA6cID00L1zZreKaoViC6/pD01GDeisoWrtHcmeHBgXIdJL6qqZHS1fazEP/Her6N
 +tg8y/iF7SoWzwT4uHWb2yNCJI6n6VG3AOjaGlnRASH+Io5IRgCIEQKOFPzKvlMsE31Q
 s5NA==
X-Gm-Message-State: APjAAAWbtkwfc5/alEerBkjMdP4nQ9LxVOhTOGZJL2nFc+YdvgNeuQwh
 nUb4NldhAjr10dOS/x20R2FAsvEI2FkHgw==
X-Google-Smtp-Source: APXvYqzj0xyxHgsdwt63q2BB6qqxU7PMI12kPN+56ysafeMqRh4fKi+u7AXXO0/sQxtha/Fb2OQ3kw==
X-Received: by 2002:a05:600c:2c13:: with SMTP id
 q19mr30318265wmg.144.1580741247250; 
 Mon, 03 Feb 2020 06:47:27 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id h2sm26429739wrt.45.2020.02.03.06.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 06:47:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/20] target/arm: Introduce aarch64_pstate_valid_mask
Date: Mon,  3 Feb 2020 14:47:06 +0000
Message-Id: <20200203144716.32204-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203144716.32204-1-richard.henderson@linaro.org>
References: <20200203144716.32204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use this along the exception return path, where we previously
accepted any values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 12 ++++++++++++
 target/arm/helper-a64.c |  1 +
 2 files changed, 13 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0569c96fd9..034d98ad53 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1085,6 +1085,18 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     return valid;
 }
 
+static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
+{
+    uint32_t valid;
+
+    valid = PSTATE_M | PSTATE_DAIF | PSTATE_IL | PSTATE_SS | PSTATE_NZCV;
+    if (isar_feature_aa64_bti(id)) {
+        valid |= PSTATE_BTYPE;
+    }
+
+    return valid;
+}
+
 /*
  * Parameters of a given virtual address, as extracted from the
  * translation control register (TCR) for a given regime.
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 0c9feba392..509ae93069 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1032,6 +1032,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
                       cur_el, new_el, env->regs[15]);
     } else {
         env->aarch64 = 1;
+        spsr &= aarch64_pstate_valid_mask(&env_archcpu(env)->isar);
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
             env->pstate &= ~PSTATE_SS;
-- 
2.20.1


