Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9C38F82D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:26:38 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMmC-0006XD-UN
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb6-0006GE-T8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:04 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLax-0005so-F7
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:04 -0400
Received: by mail-pf1-x435.google.com with SMTP id g18so20619250pfr.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRl4v4OmAU1TJRXrTZ44ui9rB0aroiaTDZFn8mfRvy0=;
 b=a2VwodcBkHIglPE/87e3TmUOggKbbbcuVGbyP9Lc1Jpxry2YbJB1napeJugQx1R8q8
 9s2xmzuESPoeXoDhCnhZEg3SztWBNZGpg5gtvy0jmTtKZtxZfiDchG5mIUnC+BoQZQBX
 8t8gJTJ7M/xR1l8MkFgy52WmVwS0swCBskrhbZPOLFHPOF0T4v4+VYgU/6GyhHVbtxQB
 MvVEvJMuTIUTTIpY53YwA9QfFeGpYmtkktoLhBMM+MJ4fgI5S6wNGUBK0qoTptdcI8Rv
 +pq3CqES3CYl6yGBhG7HSEHu5JqtocgYrHquQKehj9h3R6TFwKCUZb89uy7GbJmTY+Pc
 ZFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRl4v4OmAU1TJRXrTZ44ui9rB0aroiaTDZFn8mfRvy0=;
 b=JpUzwi0E8YWtez5JO6yYPpIhrCiKLuAG67vRj4pBX+sfsunb/y9XLFqRmxEMGPwPha
 +Tnnb8IZqwAsEsbb3FbFSBd5GpnbOBIu+RZY18dKQz8IBTHhA58f5bf0k27s+Ehn//j2
 KGwOKr8NSFfAfACmaU042nHzqTsq8R53aSBzyPwo3EQYoZNeOKH+Za/Hl38Vmi2cABoz
 wY7rdINUcrAhNsaYvT8ZzUiapTjWXWAHrdtQiF9YxSupEHcERyf0wGya6d1e8I1e8PnM
 VmDQQQP4oPsm3j6Yy1aWtYqNWRaNmwh2RjDiFRU/mL/7T8C0Ur1B+CJmARwu7jBhg2+l
 SoQw==
X-Gm-Message-State: AOAM533yxtAw1RQCp1kCBBPECe5qmIeY4nc0F9NzPKB26tWolFBboqq2
 hDaHL/Gwjyvh6xRgir/5XUovr23uiAw32w==
X-Google-Smtp-Source: ABdhPJzX7JDhcwcyP3Ai69cT10KeDuLI34LFf7yDVpPVfVs1sBFuWo6P9OU1aGyzQZOyH2lTDAyPsQ==
X-Received: by 2002:a63:fc20:: with SMTP id j32mr16427172pgi.8.1621905052502; 
 Mon, 24 May 2021 18:10:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 85/92] target/arm: Remove unused fpst from VDOT_scalar
Date: Mon, 24 May 2021 18:03:51 -0700
Message-Id: <20210525010358.152808-86-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cut and paste error from another pattern.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 1a8fc7fb39..14a9d0d4d3 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -325,7 +325,6 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
     gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
-    TCGv_ptr fpst;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -347,13 +346,11 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.25.1


