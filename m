Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F02D3210
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:25:10 +0100 (CET)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhfg-0003Xr-W5
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ6-0007ro-Iu
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:48 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ5-0006Oi-1q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:48 -0500
Received: by mail-ot1-x341.google.com with SMTP id w3so15989890otp.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udYZfRYde9RuoZ6aJDkOn2J2xIM6qQOMYu44RcbdTs4=;
 b=vXPEzaB5ym5Vrz2Ljv6+4zS5HJgg7g7mlZoHVwliMlXyMVzz0/rc6VZDvgI5644/rM
 u9gMNg3JwFeje26eHyS+ascdRHZs8+p31tpW1d5ACOa/lK1vW2SNUM/f5n5wbrSw+KN+
 AHEC92T0D3GgzYVmaFZXYDD3CZkZwuMCftnPnFDHOTQOehZESSxr8NfPVkoJQFHx3Nxm
 zT8c5Q1noLp7WFTDtf3BYr9g3SwcyQTPYFntqLNysHrglfBBZeiDrqGS86lQOQIclU32
 fhuWs67U5jP4kokXX90fbDZLG6q8qrCHz4xu2AbE1J8MIArPq8CSTwac6MDdqXUn9o3V
 OrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udYZfRYde9RuoZ6aJDkOn2J2xIM6qQOMYu44RcbdTs4=;
 b=Gns1W45Cw2Y4qfnEz/H9IJ25+nbT7Oat4D5fgSEiHxgxV5r/OIwLzUDqso1PKkpez5
 QOSq2NF4loMPAdhEiRDlJPYq0AjffFmRYkeyn6Nd+DQi4L2RNXT3n6T213nGIpl/L8Ix
 8z5gf72LSUqL1vbbA/mH62r9Xx9bxc2Gz19bgf7nwm3rRBN5wu/sgXF6Nm1TBTMczXEO
 6axW++S496/PKZH5wEpf5LS+HEmTR/AWCpzirzgTWVhkEXuLG32d28WeUGiGGvhhDK3u
 9bcD4AYSCPbR+xQ00/ehfchav85CFzETzfzktF0ZY7Gw+TMrQVadoxkbUkGrI/Ikiwap
 CfdQ==
X-Gm-Message-State: AOAM5307ZSJ/eUtSLcf+I8E8LuQWBF/SvBnJZCkWGL/58tWJUY2cZEJd
 YqomGP6WtzqOxZo3OKIhan504KJhcUQmVgas
X-Google-Smtp-Source: ABdhPJypZPc85vsZ/TYYgBwrl3XTxVd02Lemnp11FVum3F2YewtqhooZyqhoTeoW4z6kQU/sQkZ+kg==
X-Received: by 2002:a9d:3664:: with SMTP id w91mr17715504otb.227.1607450505257; 
 Tue, 08 Dec 2020 10:01:45 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/24] target/arm: Enforce alignment for VLD1 (all lanes)
Date: Tue,  8 Dec 2020 12:01:08 -0600
Message-Id: <20201208180118.157911-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 18d9042130..7cb89b18e0 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int size = a->size;
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -556,12 +557,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
      */
     stride = a->t ? 2 : 1;
     vec_size = nregs == 1 ? stride * 8 : 8;
-
+    mop = size | (a->a ? MO_ALIGN : 0);
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
-- 
2.25.1


