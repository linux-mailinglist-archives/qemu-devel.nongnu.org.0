Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8514FA6E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 20:52:18 +0100 (CET)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixyoT-00020r-BM
	for lists+qemu-devel@lfdr.de; Sat, 01 Feb 2020 14:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ixyT1-000865-Lb
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ixyT0-0007It-Lm
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:30:07 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ixyT0-0007Gr-Ft
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:30:06 -0500
Received: by mail-pl1-x643.google.com with SMTP id g6so4182152plt.2
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 11:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l3ss3qHmQ8iAPtkBg17Hc7UVaIr08fmUa1mIsHxPys4=;
 b=snbapzR93c+nOgp07cmfvM7TpZEP9qBWCi5Jr2t+dJSZCXORXgg9qqJobkaLHv1EcJ
 JA42+ro/jXeE+CsEJlTdTrAoY0tO7RdFvC0XsTUkiDinVgIqhDkNH5tPsF5xjaGE28nX
 PCImzSvAtJgPMI5itTg+k1xvpPFzkz0xh6AQUgkwdf5J64ITJmUkX/wWTeU82cT4IjWo
 ffW2ULNVRldeRQUAcLAbnyEVo/6FgmyGnCcDtPTjRtnzc9BWwj9rhDT9NrIxjcuG9WjD
 m9wG0JP0/oGm3e+fOenQAKBYP6TBAUHfOFmV4IKpgMfdDM++ZFif3WRx28g1U5KJpuG/
 WlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l3ss3qHmQ8iAPtkBg17Hc7UVaIr08fmUa1mIsHxPys4=;
 b=CFF8cPUzNeFc8TgxsB0ACuzq2DHZ+F6CnUty1/sO0KN99yKHJW+hqk6tPTQBRQ/q5d
 43sFYydPqgO1x0BIuDZ0nFjmURXrXPUZzhMXWxXiNBoMTKuOYKiHCnxDxy+ytGROV9PI
 mtS8KtoWNuBCKp13zaEJnDsL+DGH5d4pbxBj7d98rGCZT2LNfMNdHWrYO+pwDYEOb5ei
 6Mr91lEHaQpJ6wngPDl1IFkR/NfbWtNp9LHUABD+krh4hwPNk8dOavJ7F7XcAhbO+P/w
 MamNleZ45aiu2V0Tj3MM92qcTT/cMPjg8aveEgUVLEaUl0X+yhD5OMiTlDdZ8gDzoG7i
 fuFA==
X-Gm-Message-State: APjAAAVu2B0RkdA17gj9ZZXr9DB3+gstXctB1pjuZpvPbdkF0bbn1XM2
 Iy6UoRK4dDzSYkaQf2DEI/iPI+mfwiE=
X-Google-Smtp-Source: APXvYqzRiFozttOmApw3zawjkw+d51C3mWszY6crQaNCyyMZI4mtytccXSi8lud45WoD4IWY1nHF/A==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr15953152plt.221.1580585405281; 
 Sat, 01 Feb 2020 11:30:05 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id l7sm3668509pga.27.2020.02.01.11.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 11:30:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 40/41] target/arm: Use bool for unmasked in
 arm_excp_unmasked
Date: Sat,  1 Feb 2020 11:29:15 -0800
Message-Id: <20200201192916.31796-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200201192916.31796-1-richard.henderson@linaro.org>
References: <20200201192916.31796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value computed is fully boolean; using int8_t is odd.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fcee0a2dd4..4ffc09909d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -417,7 +417,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 {
     CPUARMState *env = cs->env_ptr;
     bool pstate_unmasked;
-    int8_t unmasked = 0;
+    bool unmasked = false;
 
     /*
      * Don't take exceptions if they target a lower EL.
@@ -468,7 +468,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
              * don't affect the masking logic, only the interrupt routing.
              */
             if (target_el == 3 || !secure) {
-                unmasked = 1;
+                unmasked = true;
             }
         } else {
             /*
@@ -514,7 +514,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
             }
 
             if ((scr || hcr) && !secure) {
-                unmasked = 1;
+                unmasked = true;
             }
         }
     }
-- 
2.20.1


