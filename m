Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C52DD3AA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:51 +0100 (CET)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuqk-0007ta-TE
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpueC-0003nX-DK
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:52 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue2-0004zm-Ik
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:51 -0500
Received: by mail-oi1-x234.google.com with SMTP id l200so32406099oig.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+RAengYno9BTXIpaDVeX7bv8hOtDAoI5mtNi1wVDY20=;
 b=qzTYs5FV9miQwv7VdVRFFjmoONFy5cM9L7FgkfyTAyCqF0bC9YtWT88j1NqxcxyHQc
 uproWvsqPCNNRnIrt0jhdrVkrYostRRiBnbN8qx5iE8SmVzV8PwWOhSQegbmxGaZMT0C
 OhBslZpwtgSBTqs53Qf7Y6Fk6o24iNgrl+dy4lOEUHK5U3+MZzZuoy1C3rSvJVF5hCpy
 1gp51qAPvfny2cvevYiLoWQU24hobU1fVrXCiaDJzZQr/xomwTNUMlMPcpgRIPyHtFdx
 iQG7T0fD7PNltEgyTX/kv4Dh4NHz+Np8cJ3KwonnXbZVqXafWSasMrfBQwYqMB3TeoEM
 1gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+RAengYno9BTXIpaDVeX7bv8hOtDAoI5mtNi1wVDY20=;
 b=YxgVm4JW9UBKpCDQEWNYq0zhLPSVmzoE9oJgs4eo5Z5XJUT7K3Dcm71AwCmoLkOT3o
 am2oFiMYFTicIgK27YJI1xGReEJBreOjskEzKDs0Au6EZGEL00qnR1iV8beHPLdFuMwZ
 OxEWr8eAU7RnoBOOI+YRdzkcpEfxF9QQWmOQ+lbFZMLkrD4Vt/PwBb4+U51Nr+K6juLC
 jR0N6FpR7/9IVeL2Kcya8cV24lKcfAODdIYHbgO2NgX6Zoswr6O6fEmBGIr0TVeGpOYn
 48SdRJL/AtHO/L8F4VT+30PxhJBEESMk8nVDEbJ8BqQzzWGJTfa9VcKvwFewHXp0vAL7
 IS7A==
X-Gm-Message-State: AOAM5339SZLh+hPz0lT7gN447Fm7fOfvAPadcz87T/2LEbKfrUyHiR0V
 Jr8iIwnQZC81h+gHEwBteqDe7oS0k/xDyOl+
X-Google-Smtp-Source: ABdhPJwwSfHoRH0A0r8v0iih0EfOWM/piVhdhQdWWTXQUYNCUIBKerJtH7IfyMWxqCQHHLAq3K+8bQ==
X-Received: by 2002:aca:c592:: with SMTP id v140mr4977506oif.10.1608216761206; 
 Thu, 17 Dec 2020 06:52:41 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/23] tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
Date: Thu, 17 Dec 2020 08:52:13 -0600
Message-Id: <20201217145215.534637-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These interfaces have been replaced by tcg_gen_dupi_vec
and tcg_constant_vec.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ----
 tcg/tcg-op-vec.c     | 20 --------------------
 2 files changed, 24 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index b4fba35e87..d0319692ec 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -959,10 +959,6 @@ void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
 void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec, TCGv_i64);
 void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec, TCGv_ptr, tcg_target_long);
-void tcg_gen_dup8i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup16i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup32i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup64i_vec(TCGv_vec, uint64_t);
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec, uint64_t);
 void tcg_gen_add_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
 void tcg_gen_sub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index ce0d2f6e0e..d19aa7373e 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -241,26 +241,6 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
     return tcg_const_ones_vec(t->base_type);
 }
 
-void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)
-{
-    tcg_gen_dupi_vec(MO_64, r, a);
-}
-
-void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)
-{
-    tcg_gen_dupi_vec(MO_32, r, a);
-}
-
-void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
-{
-    tcg_gen_dupi_vec(MO_16, r, a);
-}
-
-void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
-{
-    tcg_gen_dupi_vec(MO_8, r, a);
-}
-
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
-- 
2.25.1


