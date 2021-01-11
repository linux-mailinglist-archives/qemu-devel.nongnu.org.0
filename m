Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074662F1CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:41:37 +0100 (CET)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1CB-00073Z-WF
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rv-0003NM-Nl
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:46 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0ri-0000Mv-3A
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:39 -0500
Received: by mail-pf1-x431.google.com with SMTP id t22so326436pfl.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0x8eNDWEM7nOVHNLi9Be+OYkh0XXgSMfT6fpLIKIzjI=;
 b=yJMU8lfWlViiRhe5NypYOBGHv/+mgCemNJ0FtQfUwBJVCsSBJpmLs1P61VQU9uYZjY
 mMaYKcQBDShgRBQ0x+eWtg+b/vhWTOAdEcm5PgGeHEWLz5yfTPXa11Pc1AvJ9lapbv4X
 LQjmlQ3L70In0injN3XPfL3Bhs3YUY9eJPRs9In8JHJTcwBCnTo764ATF0T+rVqrfJZD
 Eem1YAri7KubilJ7RCQ2wLhK4V1ZZOpoQ19vJVQps/A3KOPwEqORkqdt1/hsdN/VdEQX
 OvJgByzWR3s1pfcK/gqVpViWDAxcR4SFM/9/5nBMwDqlIo0WnwDr6hRMLCejBGOF0KJr
 nM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0x8eNDWEM7nOVHNLi9Be+OYkh0XXgSMfT6fpLIKIzjI=;
 b=c+U43aGzXyceXRa5IvwrH970+8flzHQIFCYf5Ks9PLsiiZct+X/SyBbx9FWFBk4QFX
 iPayyqKr36ONtNY5UkwVwsoPpBC8BAuWC7MV+fhpsD+SgqMVBrdoPzReZkc1MO6Kzpdk
 /A1QQTZhL1nO2enx7/y+SFEV0YZEMSGPNzaI5iEbF+HGsgMpO5PpEekUUQPNw4aYkPMp
 +GN1Wi5KjCVBTvBcZz9e9rQ++VBIzdMknz6v3SBjc1PUUzGDtE7O8OaINg6JzbKN/60H
 9JqOvlq6gRsOTnOn5s2ksAhEN4D5KCU1Rnlph3LM3JKPmfSuSPuudGC2BUDNCsmLl2rr
 ZHtA==
X-Gm-Message-State: AOAM530Iqp7ei/BzcRxD/HxxB1pXdZiRBozaWu1hcvkykfAwWbStKh+F
 1gdxfn+po1qlevhSr+BQykFtKvXzf4mquQ==
X-Google-Smtp-Source: ABdhPJzW9nEb4k/g3jq3ASZTRQXjH0MK0/RaiTFy+q2J+YOOHfuLXIwLwqsd5iI8QXVttYfuuPMjXg==
X-Received: by 2002:aa7:8517:0:b029:19d:d70f:86ec with SMTP id
 v23-20020aa785170000b029019dd70f86ecmr377698pfn.19.1610385624609; 
 Mon, 11 Jan 2021 09:20:24 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/23] tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
Date: Mon, 11 Jan 2021 07:19:44 -1000
Message-Id: <20210111171946.219469-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
index ed8de045e2..2cd1faf9c4 100644
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


