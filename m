Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9273F0C01
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:43:16 +0200 (CEST)
Received: from localhost ([::1]:52440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRT1-000864-Cb
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6a-0000tp-P6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:04 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6W-0000IV-G2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id 17so3299260pgp.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
 b=Q+FK48JK/6YD/I2bhMtcX+5hmUNWMcqlnIu9BelaWfMa6qNIZv7Xp34aOiFVuhB5tP
 g78tvx5vcBdQUuTSvMUdkslgjEoRm/GUXqsB9d31ynKCDsvHMMe0Ng1n6GTMCgi++UNc
 JbdYQ4H3sUo+nXbCAYuLOtycHoFg588EBAg09B+magBz4us+e0zEqEJ7voPlLKSV94IG
 PjInz7toePIVb8CWDkGBbnpYvsB2zkGigP/UrEVbEIEey3BFMBCRDhW0Jdq6cIUUMmiN
 WKN12lPMSxlVPvmVe+iazeakE4LSJQDhxezsHF2SYsl9ZjQmPlyjyvfLujOqlI/N9mRn
 gqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
 b=Ru0sxRrJcbnITl9BV2zpi0HnUhnp85obAG9Wi0x8vle7aXNh1KJ1P2cGN2B86brscr
 z6lg/MtXPNyxTKuRhf0NJXvdJdZL3IOcaGwssirOQ7XfLkwKKjbLT7ZWAg9dwTuvtGF3
 rJP9op+AHCx0ulp85WL9vi+C95pibdDG6i4wd+oWThw6aftdYDVH38b0FVLoU0SfJ2w4
 ZhtVU0EDBhg+8BT1ngyUklbJYG/rm2dN15OeAPlGDU5LdeGUGHJyfLxIG49qMECPCWy/
 mYZeSzSqCnMhrHl6eZatFig0sCSc5xwJHF/9rjufrr/gGuVO3JFXQrsFR4ZVYpfl833K
 Qo1Q==
X-Gm-Message-State: AOAM531MrOTkOTR6f4DP+qF+L8z0x9g3d05ibX3O/3OazCw6zfXZyxi/
 rdPoKuOcKjbYGwZLTABL8kLoWAyzAUcYew==
X-Google-Smtp-Source: ABdhPJxT9TkSDAzB8ZTD+COkkykBmf7Sdwh7W5xF6IRJXhYB8UanAZUZmbY44kFCfKfZCHV2MvH4gQ==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr10983327pfh.74.1629314399259; 
 Wed, 18 Aug 2021 12:19:59 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/66] target/arm: Use MO_128 for 16 byte atomics
Date: Wed, 18 Aug 2021 09:18:44 -1000
Message-Id: <20210818191920.390759-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 13d1e3f808..f06399f351 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -560,7 +560,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
     newv = int128_make128(new_lo, new_hi);
@@ -630,7 +630,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
 
     /*
      * High and low need to be switched here because this is not actually a
@@ -656,7 +656,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
     newv = int128_make128(new_lo, new_hi);
@@ -677,7 +677,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
     newv = int128_make128(new_lo, new_hi);
-- 
2.25.1


