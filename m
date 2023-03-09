Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916ED6B2E81
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:21:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMac-0005gZ-Gv; Thu, 09 Mar 2023 15:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaR-0005ab-57
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:07 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaP-0001XT-Gi
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so6592880pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldBuLbcQb0n6Aye54OPPs45YCet33rD06BKJ9Zw2Tyk=;
 b=Dvktk8Cz2fjv8jpYW2ezbRYJNy5xh7WWLbYYeB7bB1moAiJAVUNgE0uJ6KT3H7+lQZ
 cLCDOyTBo61v9Ym7LGr2Mo83GvY16g/KiMPw6udx3U7OcYuiA9YXuCOZ8deqTNlUdpRr
 bhe3b08u4CeAO2gMF+KXTKzK63lt67dbNcqGaG6AFiDjV6mOYzjdmxV6n7ywhktHgsUN
 bLlZEhPB1Pxhwf5ft4mU/DdKFSoMYzEgROO6tkK4QIOB08lEGE3VQO/q/tZGth0a9q+z
 ugUbB3v6Yio586WJJ1WB8TgSle9846v9reV1aMsDzJkdQDwGnBdVUn6myUYZTIawOsj8
 wbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldBuLbcQb0n6Aye54OPPs45YCet33rD06BKJ9Zw2Tyk=;
 b=VoajzN5yUywtHh7Qv4jdCeXC8+rD9FHp+fy11+u12TlxvnXtji+fHfYQQ0eBEi0wOg
 o8d3x5foTXTIA3vof3AySPWpPjzygOdPj9IbePtoWVAOO0Awhe5j1/I6wftPC+Q0NWwH
 7CKdYfI68uZsmP6g+4ljf1zrHr+Q9h3HafTgALwPLP/3e6/pkYLcxyWVGNlgQmMqSNzs
 bGoRBeTdkm3Er9/F4lsVjJTbtuDezNEWSTwZvFeeNvpuU2x85ID0exuCkLkPpQ+NMu48
 Jp7ac6f0S+SuIaxffrF4UHduUwUB3v2h714zMyReGe3uJwvyq0fLSu4j5aJ+4a7h07ou
 xmpw==
X-Gm-Message-State: AO0yUKXurNBm5Wgiq4gP19IutURm9Lt9PxVamX+3JtF+igYPgIOH75C0
 07wMTxW/9XZjE9srvfi60QanT2jNZf9eSvL9CnI=
X-Google-Smtp-Source: AK7set/sZ7Lhok+c5T4m6f3/VOl+HrvG0B5dhVC1rCPWsFSeHC/7ErpDGylbvsHFH/zkQ9m/x8YSFQ==
X-Received: by 2002:a17:902:d4c5:b0:19c:d4c0:ce78 with SMTP id
 o5-20020a170902d4c500b0019cd4c0ce78mr27505888plg.29.1678392600538; 
 Thu, 09 Mar 2023 12:10:00 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:10:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 78/91] target/arm: Avoid tcg_const_ptr in handle_rev
Date: Thu,  9 Mar 2023 12:05:37 -0800
Message-Id: <20230309200550.3878088-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 082a8b82dd..dff391bfe2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
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


