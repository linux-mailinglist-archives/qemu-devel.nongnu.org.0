Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B0A2F1E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:04:59 +0100 (CET)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2Ur-0008A0-Fy
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RO-0005ft-Et
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:22 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RM-0006Mg-5s
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:22 -0500
Received: by mail-pg1-x52e.google.com with SMTP id g15so256581pgu.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=cN938TE5rE+EPWVe+3ynvGY0NH2UDEeH9IIQGdwXBJ6IWOSFjRT1qQdhx758J0QVAg
 lX9CHNXanximN3zGvU7oCdaeZSgrd+6xOrvByA9PWSH85NzmY52XhIBBshAvin+3M+W1
 B1jr7CUGnZkK7A8Qyfk0wPumg+Ah9iLetOZIvV4QJTU7Wo/6anyhJ+E3xCWu5WrLb18e
 qpQqLfhljYzVX7S7OF9E8zQVvc5WgOMDAO03PPAf3IitkAnBc+BDV1ARjXTYl0gRW5eI
 Ta+IAB0rii3/I3GKQtKE9B1Ni5kDyWzAQ7Qnbv/ox0lOtPJkmqQmPiYyEuU5GaPMDapH
 IaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=KZm61zj4vz7ETAXsD89jhQzUlKS4sQPz4z3m4aVLV8R7AY5CUzuyXUoZ8VCatlXYvF
 g8Hj/WNUv0Vuu9r7OAXRG2Ydj4EMlomCNzWlEZHnRmJNwWr3oTMQLItGGgSksORCamgM
 waI4Hjbw08+kf2yhrcnrGG5lu/aB9UApXNkuIxLzXiWsn9gysAjE0AvGJJ5Dh3AVZS2j
 opjiaVo0rkMCJ3In4r5Lu/eqUuENfn9mwKNysHIZw5G0ALEIZMSQucnqbmf4JG3dSnBr
 X9BfpoTerA4rhyBWesK6f7yB7+fBdVUPTqR+YcZz7dpBmGtR9FMr78XhjUib4ugR0rXO
 3ZNQ==
X-Gm-Message-State: AOAM533LaywG252+AE6/Osy0W0LvDwKSRDnR7jmfK5LB7hxzwTn07smD
 LUil1hH6h9Qtt+ztbnBckD18scaAvgkyeg==
X-Google-Smtp-Source: ABdhPJy2SsTdEWEhpq6hGb/bnU6XX5ezhtXrC5MgDhJITpgXInM5F8ixNh5LgQB9Raw2rmv5PHgd8g==
X-Received: by 2002:a63:5642:: with SMTP id g2mr930203pgm.434.1610391678178;
 Mon, 11 Jan 2021 11:01:18 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/30] target/arm: Fix decode of align in VLDST_single
Date: Mon, 11 Jan 2021 09:00:44 -1000
Message-Id: <20210111190113.303726-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e3..0a2a0e15db 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..0e5828744b 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -606,7 +606,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -621,7 +621,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.25.1


