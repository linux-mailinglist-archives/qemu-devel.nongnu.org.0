Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A746A3B07
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIH-0003eF-0M; Mon, 27 Feb 2023 00:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIC-0003Jo-Ez
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:20 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI6-0004yk-Ib
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:16 -0500
Received: by mail-pl1-x633.google.com with SMTP id ky4so5580795plb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ko5d2/IanWd/pjymt4+iUKkd751sWBMgapBL5xX0YbQ=;
 b=Q1OkCNSXNxA92Cxl2bJxiDCZpgHHttWBi2+te6jFAEBClAAXaIfO53F5DQdCzk05VG
 LVycgjrjLleVGptjoHlY5gyYSYeW3byqnv46H+2cy4SRF0NU+16utvs85JjEPcXiOeXt
 KTH/gTtF1piO7PT8DfMO0Lf92o9i5a3hbsSBo46YKhqHg7joqvVgQip7vA4NSkvJbix9
 OFP0RX7UOt/yY011YJvvCVpStPJCn68vgK8GxXLGrC7xX2Ts+BYdB7RwCTjLae5Bw/Cw
 DfmXiKNljpnJ9TNaGgDCqiK9EBYxt0ZGIdZdMwnUtu4QGARhDWm5LZmtxStjcf0ocjqg
 HdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ko5d2/IanWd/pjymt4+iUKkd751sWBMgapBL5xX0YbQ=;
 b=seGibdmAZAP1EM6Xc7eaLTUZXmiHub6cPwsycgBY20k7/VbVzQAqBz961J+4Lus1l1
 HnVaSgnDJGg8sog/BTV9Au5RaY3e2eR+GIS1a6vzpi1+d7baJN7rWrR3u6OlEm4Fx3V4
 HMK7hCCKqrdKH3uuhreNohyp3iYK04uTIOjZyuCCskAZlOYub3yd4Uy6RIH05ynW13Tr
 ilNe2OTqnwMTqSEUNirVnove7yhkAMkBfoslvPBHKw8QLbMScKdL9eEM6o8nmIidiyaw
 75XeSta67Q9tazoR5dhZoXflRPxOv19R/nkgSDZ3z5mEpo05n6J39p2rPQ4ri6cLMw8t
 y+Iw==
X-Gm-Message-State: AO0yUKX8EjtN/wEz750/UIHAABMpLIBCnuTmKiR4EJVEbkkx9aSDwach
 gfEu6a0JaKXPEab2Grd9bbBnjpUxgNudevrhiIs=
X-Google-Smtp-Source: AK7set9VWV+k0QmB8Exz4rdKb4pWAvM/SbcAgT/dr8Zq7v280rekWM2YFD/Ehk9UkTsdd2HZuOLQ1w==
X-Received: by 2002:a05:6a20:548e:b0:bc:a257:5b2a with SMTP id
 i14-20020a056a20548e00b000bca2575b2amr27799341pzk.31.1677476593203; 
 Sun, 26 Feb 2023 21:43:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 11/70] target/arm: Avoid tcg_const_ptr in handle_rev
Date: Sun, 26 Feb 2023 19:41:34 -1000
Message-Id: <20230227054233.390271-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Here it is not trivial to notice first initialization, so explicitly
zero the temps.  Use an array for the output, rather than separate
tcg_rd/tcg_rd_hi variables.

Fixes a bug by adding a missing clear_vec_high.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 16aa71451c..02a61aa8b7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12003,22 +12003,26 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
         int esize = 8 << size;
         int elements = dsize / esize;
         TCGv_i64 tcg_rn = tcg_temp_new_i64();
-        TCGv_i64 tcg_rd = tcg_const_i64(0);
-        TCGv_i64 tcg_rd_hi = tcg_const_i64(0);
+        TCGv_i64 tcg_rd[2];
+
+        for (i = 0; i < 2; i++) {
+            tcg_rd[i] = tcg_temp_new_i64();
+            tcg_gen_movi_i64(tcg_rd[i], 0);
+        }
 
         for (i = 0; i < elements; i++) {
             int e_rev = (i & 0xf) ^ revmask;
-            int off = e_rev * esize;
+            int w = (e_rev * esize) / 64;
+            int o = (e_rev * esize) % 64;
+
             read_vec_element(s, tcg_rn, rn, i, size);
-            if (off >= 64) {
-                tcg_gen_deposit_i64(tcg_rd_hi, tcg_rd_hi,
-                                    tcg_rn, off - 64, esize);
-            } else {
-                tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, off, esize);
-            }
+            tcg_gen_deposit_i64(tcg_rd[w], tcg_rd[w], tcg_rn, o, esize);
         }
-        write_vec_element(s, tcg_rd, rd, 0, MO_64);
-        write_vec_element(s, tcg_rd_hi, rd, 1, MO_64);
+
+        for (i = 0; i < 2; i++) {
+            write_vec_element(s, tcg_rd[i], rd, i, MO_64);
+        }
+        clear_vec_high(s, true, rd);
     }
 }
 
-- 
2.34.1


