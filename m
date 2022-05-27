Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEB2536771
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:26:16 +0200 (CEST)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufbD-00026H-PN
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b4-8d
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004MB-Nk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id m1so4819073plx.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oMK9DEwl8yTIMeq1RJH7uu/GlqsT6gL1OJSIBqUYtoU=;
 b=b//7Ve8ijwp2kUhk2vexkH1q5LKENTR6vEYF/p7f/tpsZBWzHHJGDI04WajAa16iJl
 o4Hd2WfCUQKfw+xeRAaklvrExXykqkIFLkSBfPVku4hOJe7tabMteAtjr/d2M1rsIqnu
 hdWEJA84q+DMU3AyBwelkHtcauNT38Kwd5uQEvxmnD733Gd1GRtUPDjhqJIps9PAuceC
 SVetdYEPhAojhVVe+PNRX3zzuG1UxbRHUKWap57eEEKXMvc7ly0Ra1LcuDPcW1+dnksy
 x9WGNyy8ezuIfy8BX3hkLVHswOB3u/6F4yJiIUgz/gJk9kOpeVBJCkZnl3QElyh19kQ1
 QMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oMK9DEwl8yTIMeq1RJH7uu/GlqsT6gL1OJSIBqUYtoU=;
 b=poBUdvvQj2FZoJ8MZzyRSnKcH20NkeLgXatOGfSR6uyKE1QINrLo2o2egPljwiZkvK
 NtfBnKat7tIoOBVOmLTGrnbUQ2SGwqQzdbTBYDPbrRa/w1bioKAPgtLmZU4rwjvhg5ha
 KBMvQqS5jJE928O6PyvyoWhHT6h5B5AveYwV+3ysmnbTmXe9XEDlC45QHqI+Rkwg9nY5
 TjpQy9FSvu/GOOO1heB6y3XmoX86ZTo089W923dR/rHfYyubR1F1ZbiFJi0a5K9eXRhO
 vxBJxa9I3bpZ6KQ3tzLcTBhT1BWPyppGVWNeWu9595kj41Kse+NqwRLd/yJ6gtCYZiav
 11SQ==
X-Gm-Message-State: AOAM531RdzG0w5RnNgh3FAGK8hEM/7qb7FkJOWe5ksWuQfPZaxR0RV5m
 dRU+ncaWDiIUhujyo64cs7munltxJw7/5Q==
X-Google-Smtp-Source: ABdhPJzrpRvWFviJReqDIbChRQKV34cSBN9pwnudLCuaoKzNX5rRTT8u2/wNS0k4/rZUg1MxFOOL3Q==
X-Received: by 2002:a17:902:ea12:b0:163:8f16:def4 with SMTP id
 s18-20020a170902ea1200b001638f16def4mr5947482plg.10.1653675777063; 
 Fri, 27 May 2022 11:22:57 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 052/114] target/arm: Use TRANS_FEAT for RDFFR, WRFFR
Date: Fri, 27 May 2022 11:18:05 -0700
Message-Id: <20220527181907.189259-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ce6e000f6f..6fd9a42ef9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1636,15 +1636,8 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
     return trans_AND_pppp(s, &alt_a);
 }
 
-static bool trans_RDFFR(DisasContext *s, arg_RDFFR *a)
-{
-    return do_mov_p(s, a->rd, FFR_PRED_NUM);
-}
-
-static bool trans_WRFFR(DisasContext *s, arg_WRFFR *a)
-{
-    return do_mov_p(s, FFR_PRED_NUM, a->rn);
-}
+TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.34.1


