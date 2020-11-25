Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA32C37E9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:11:23 +0100 (CET)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khm9K-000290-As
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm51-0004t9-RV
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:55 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm50-00063s-6S
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:55 -0500
Received: by mail-pf1-x443.google.com with SMTP id t8so1084502pfg.8
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wu5Kt3iN7e6z3sUpws6R3XP7/Dj8XZZymOVS+ThDJek=;
 b=G/ezqJF/80UzEjCfBVtjm4leY8YH0zUhtNhTnGWR4tGn6HtDRVkFqRtP1njB2uclMl
 9F+uyGlUSao3mvwrsvIPQ/PVMW+iqZ/km7c2vSAV28ipiZgDfR/GI3dm97OKEc46xg8Y
 wFDEyVuRjnq17GRz/BGkai+EGR61jLkDIaObLnnsG/0jclZnl6Eiv5NteasbB5dtxdt8
 TctK79qGJ6kuLfG/ell5UE3u6ub0cyPI48H1aVVniL+N5/4tGLm2tcYDyDNj3T+jLw8L
 BQKCYpUWNuhXAgwDeiNc2ymElUocG9ym+9+8t7QfaaOoAKg1+kPHjanQobWYtkN9nCG2
 QazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wu5Kt3iN7e6z3sUpws6R3XP7/Dj8XZZymOVS+ThDJek=;
 b=c99FMGsYPRfr4iZY1xbHw6ep+UXsLbBUYWadkrM7aEKjFmVc2g5hKKB0UOhI6fLqKN
 fTl2FW9h64bps9zzn8mCXcRrfvO3o+WnxfidLTBzp3z4uFmBQhCEZz65MpgQFIUe+IPs
 J5iDEhrYUy6Pooezh3Mx+6WuCER6XEG8AnGbTVNYMjRl/gSC5Po3KEdxrm45ZUjeMerB
 IYcBbxlqXykm41truT565j4KBSzERtefAAVQpIu0qmTcN3VrV9FCf4oSyRw0NQYFrHjI
 JKgDy08wt74/rsUkgb7H9QIxgK1+0k8bjgtGXJXT46N1NXJEVBeUkjgXAlyQl8t58o+u
 oOeQ==
X-Gm-Message-State: AOAM531K6vJ9bSXLNz7VpKuxM/cWxtGBoJQ3FiiFhqJYGvSS1VhND1UG
 2z9R3a0Q/3Cbaj0Ekj8/ThoYUJar/qpKTw==
X-Google-Smtp-Source: ABdhPJzUwwClqFCsItdZUaEp73h1FTR5N4M4Pou27YaGGp/y/nyM7WbXYUzX44KdhZYrjw2QyrsQJQ==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr1821185pjy.195.1606277212724; 
 Tue, 24 Nov 2020 20:06:52 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/arm: Enforce alignment for VLDM/VSTM
Date: Tue, 24 Nov 2020 20:06:37 -0800
Message-Id: <20201125040642.2339476-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 96948f5a2d..58b31ecc3f 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1065,12 +1065,14 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                            MO_UL | MO_ALIGN | s->be_data);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                            MO_UL | MO_ALIGN | s->be_data);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1148,12 +1150,14 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s),
+                            MO_Q | MO_ALIGN_4 | s->be_data);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s),
+                            MO_Q | MO_ALIGN_4 | s->be_data);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.25.1


