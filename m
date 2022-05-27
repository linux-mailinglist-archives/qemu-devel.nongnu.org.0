Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23AB53673A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:56:04 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf7z-0006tk-Fp
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003aj-4B
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec1-0004Oq-U4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:13 -0400
Received: by mail-pl1-x633.google.com with SMTP id n18so4812681plg.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=waechP+ByDINr6HCfzHbKMzQeI1rNhZB2DxUw4HEIdM=;
 b=oYkLWThCOrshZRgDSBU0OwLLFarLf/yZKr7k+Qsdj5i77+6hZjqD4XNEbwPYCcF4EJ
 sH/wLmUXt9JXE3m+4CDzZALvaghFVHhc6oX7o+USyrFIeLsyvkRPq8jHj0uO8/o9uyus
 vKv6LT23XgzG5EwjNTzYXNZSHBEdI2SGZsg8WENAzvUQ2tYpH0zg/Zm75KVeqs/zfABG
 +tLB3CFElIVSz0n9uqt2PDh/xSnr4I2zjHexzu7GEsVRaogh7HMiB6gRPT2YaGvqARMs
 OY+oBxiMaeT8kxfWNLA6XiwEvvdDYXv6+FY6fhpf7Gmn6JNZiXnwJb2KjRvUlvdJvQQe
 EwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=waechP+ByDINr6HCfzHbKMzQeI1rNhZB2DxUw4HEIdM=;
 b=jmrMiRMawKfPA+BVcHYf4p5bVrK8ELHSf1PsdtSK/q+3KqZkjB9OyjZSAE+NOUi1fd
 +M8OCdsmc9kaAD0OiITyEa5R2EdfRXuH4EXd9xzy8n0aEjWaKvrv5zJsNX/0IKj5EfZN
 PbLUhAExCMI7VCPYY77JBeSdbJkKHO2QWGdoFIeWL/7gtNg+g2+4QmfEy3NQdnuQCYX3
 +lXUF/oO8FNSt8UrfmRF9Dj/rXV81SFKrlyrTxfRhF7cInL0A5aFO3iITyQxFrS634RJ
 Gs/Z2XL5SkmZ2gswWJiwL9Y2Gn8wNgUDXqb+5kf9A9/mpgS5skcp39gPj78qNWXl+9GB
 O7Aw==
X-Gm-Message-State: AOAM533qHptbd1V/6IUsZKe5MHWROUDtv2EgjhPl30syR/49CM3axIdM
 bddnMHKLMTwepf9aWefe8IkkTuVpcShqNQ==
X-Google-Smtp-Source: ABdhPJzTsiPClpJNofWL3wQjz/WHm6JIuaLEAdFTQ4V4AJBg/xg7ekQbzWuA5gDwUxEgQ4PLiKs6GQ==
X-Received: by 2002:a17:90b:1b48:b0:1e0:ab0:df00 with SMTP id
 nv8-20020a17090b1b4800b001e00ab0df00mr9613615pjb.52.1653675780550; 
 Fri, 27 May 2022 11:23:00 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 056/114] target/arm: Use TRANS_FEAT for do_perm_pred2
Date: Fri, 27 May 2022 11:18:09 -0700
Message-Id: <20220527181907.189259-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 413e89b19c..1e6bcedb9d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2279,20 +2279,9 @@ TRANS_FEAT(UZP2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_uzp_p)
 TRANS_FEAT(TRN1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_trn_p)
 TRANS_FEAT(TRN2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_trn_p)
 
-static bool trans_REV_p(DisasContext *s, arg_rr_esz *a)
-{
-    return do_perm_pred2(s, a, 0, gen_helper_sve_rev_p);
-}
-
-static bool trans_PUNPKLO(DisasContext *s, arg_PUNPKLO *a)
-{
-    return do_perm_pred2(s, a, 0, gen_helper_sve_punpk_p);
-}
-
-static bool trans_PUNPKHI(DisasContext *s, arg_PUNPKHI *a)
-{
-    return do_perm_pred2(s, a, 1, gen_helper_sve_punpk_p);
-}
+TRANS_FEAT(REV_p, aa64_sve, do_perm_pred2, a, 0, gen_helper_sve_rev_p)
+TRANS_FEAT(PUNPKLO, aa64_sve, do_perm_pred2, a, 0, gen_helper_sve_punpk_p)
+TRANS_FEAT(PUNPKHI, aa64_sve, do_perm_pred2, a, 1, gen_helper_sve_punpk_p)
 
 /*
  *** SVE Permute - Interleaving Group
-- 
2.34.1


