Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905186B2E5A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMax-0006c5-7s; Thu, 09 Mar 2023 15:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaQ-0005aW-A9
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:05 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaO-0001VQ-Ns
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:02 -0500
Received: by mail-pl1-x636.google.com with SMTP id ky4so3238470plb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxgDTYXHfeCSjrJ315R2/sC0Bf/gryvtVm2qasIqXas=;
 b=mDlwwd4Yr76a4DIvb0kqPix9AQAuIgvqdFNp6Ja5Js7orYiKRObgjiX0cp1R07SPQb
 vGmyQjYhbznSWhaITXWkAwLbmxjc57GyQ6mAP3WvkR8H42iusJw5ftOZQm1HkK+CtUKD
 uDyC5O/3fqlF58nMN2ld3pR5HXvD3cFDzWYXj4p/ihqZXe0PnSll4YSvsUfbjTEX8+kg
 pNvt7w8U1Bw34CSJ4ETs+ekmrwASX43hWfO1fy7rFgczSdRqfCnP3VZCh7b2k9i28f+W
 LOg7GKY8Y8ziavRzyZxwWQahl3OqzUPkwOr8wa4oGbJsk/+kiOWymM0HrZGkwDaQd60C
 ++ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxgDTYXHfeCSjrJ315R2/sC0Bf/gryvtVm2qasIqXas=;
 b=n5vU/IDfZTR+QiM0NSTFRp38CPa7K5bZOmbvmYoslzGh5Iyso7hv4NXvgxUNI26CGp
 oexQNwxCIdnFRbfljak81g50BE/g6Up2jeXGkAaBHsxOSAlD1w/+g995jVT9goNKVAZd
 vsGDyMorI12rQ9VSwge/sYXNeXc6xdT+gF3jKmpIi7KtwdI8NQT4wRpvtSoZv0Xwcdww
 44jovJkdeJQuK9P4ctDijehy9R4WVX3BescM/TcmsifT+Q8b2W0HA9h0Yj4aoc7sFp3g
 pKl8Lk1u4CQ+nfBdSdJ/AdHhBv+rOcHofWFnC0sMnGRIZNWZRw4b7n0sX/9YuzxRYgqg
 AusQ==
X-Gm-Message-State: AO0yUKX3tFhyKn0xQhmAKAXIzcC6zU/5pRd0wNSAOXgxGyG8UL15rlxh
 5aREyYNUwvE8k9F24LitzRXxGz86K0lA4GemK1s=
X-Google-Smtp-Source: AK7set8+RCmI6qU6ZqjSHbKihhR0cDLAfPzoXExOC5PVzAGeu1Psa+cO3lZ64Ah41A8lAPUP3Ivk7A==
X-Received: by 2002:a17:903:1d2:b0:19d:19fb:55fd with SMTP id
 e18-20020a17090301d200b0019d19fb55fdmr2298375plh.20.1678392599720; 
 Thu, 09 Mar 2023 12:09:59 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 77/91] target/arm: Avoid tcg_const_ptr in
 handle_vec_simd_sqshrn
Date: Thu,  9 Mar 2023 12:05:36 -0800
Message-Id: <20230309200550.3878088-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

It is easy enough to use mov instead of or-with-zero
and relying on the optimizer to fold away the or.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2ad7c48901..082a8b82dd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8459,7 +8459,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_rn = tcg_temp_new_i64();
     tcg_rd = tcg_temp_new_i64();
     tcg_rd_narrowed = tcg_temp_new_i32();
-    tcg_final = tcg_const_i64(0);
+    tcg_final = tcg_temp_new_i64();
 
     if (round) {
         tcg_round = tcg_constant_i64(1ULL << (shift - 1));
@@ -8473,7 +8473,11 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
                                 false, is_u_shift, size+1, shift);
         narrowfn(tcg_rd_narrowed, cpu_env, tcg_rd);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd_narrowed);
-        tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        if (i == 0) {
+            tcg_gen_mov_i64(tcg_final, tcg_rd);
+        } else {
+            tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        }
     }
 
     if (!is_q) {
-- 
2.34.1


