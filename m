Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26A64F149
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fps-0000Ow-Ey; Fri, 16 Dec 2022 13:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpo-0000L6-EN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:28 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpm-0003F8-O7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:28 -0500
Received: by mail-pl1-x62f.google.com with SMTP id g10so3161039plo.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lQgJmIQMrjWysce1e2je5afVIp4tHra/146j/kBBfUs=;
 b=KmSbtYPs29vEu4rEQht+2XElKLAXCFx1xt/7aS/o8dhkD16U7qH7umV/fBf4cEJUiA
 yZ5v6FYPINzoubNemfsWTg4VZhbCcP3pPnFEBeMWet46YVy5NTlY9YjY35/nCEvrVWqZ
 /RR/bIofM6TS2zgU0XkK2+IBc0zcxLngknEJAyM6cSTmv59EyerIANzKa7IfHZW8krji
 lqVJw4QCEqAMmsLOGEYkwI0SP+jjcx7jeWfsk8DmHd2jk1CFd+RR4vPXn3rFZh+LtjTv
 QyZQEX1nVyygffG5R/HPMS+jRtmMuQnfL6wmCP7XG21gHLRcOI8AwLDXvnI11MDhLSg3
 KYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQgJmIQMrjWysce1e2je5afVIp4tHra/146j/kBBfUs=;
 b=DDKzi22qE1IX93SheWWxlU+yefpToyDeWku8b49XNJLmuiTCWfXO/pbIYIRFib0NZD
 2zndw9wUUxGSAvowfK0CDNNOdZOkP6XSkNaHHpWXi2sNVGdx8+pgmtVSRpm34m1o1Nsb
 un3qc37o2A8rkvxRQZ9x+BGYkQO86ZkJsyzGhH5jMGaB8UzrpoIQW3HE+dTSzaT1UZ6U
 duDwfuk8XQe3+0IwBQEmjKukGbbtdRXpJNLGhb2EquultoFvSG4wCAY2TC23kIHTL6/b
 ighhz4BzR9VmosaIT9ClDE35Y03lvX9luLEXe+cCq0a1liPmGp3UxufMa7CznUENs+mC
 cESw==
X-Gm-Message-State: AFqh2komyC1VKUVr0mc2F34pFgAunko2dwbP8WEkZKx6m98FqVQahuBL
 SOq+5VDwMLQMjK/JjsVTmFbOkNm26RDByhG+
X-Google-Smtp-Source: AMrXdXvy5AWeRLisVwK/WYbAF1kqB90ZjBr5KjQkLFv6OBp0NH4ptf9MvmawKpe1cHbCiDRPfLsGFQ==
X-Received: by 2002:a05:6a20:b723:b0:af:8e92:3eeb with SMTP id
 fg35-20020a056a20b72300b000af8e923eebmr8434577pzb.9.1671216800584; 
 Fri, 16 Dec 2022 10:53:20 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/13] accel/tcg: Rename page_flush_tb
Date: Fri, 16 Dec 2022 10:52:54 -0800
Message-Id: <20221216185305.3429913-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Rename to tb_remove_all, to remove the PageDesc "page" from the name,
and to avoid suggesting a "flush" in the icache sense.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0cdb35548c..b5b90347ae 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -51,7 +51,7 @@ void tb_htable_init(void)
 }
 
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
-static void page_flush_tb_1(int level, void **lp)
+static void tb_remove_all_1(int level, void **lp)
 {
     int i;
 
@@ -70,17 +70,17 @@ static void page_flush_tb_1(int level, void **lp)
         void **pp = *lp;
 
         for (i = 0; i < V_L2_SIZE; ++i) {
-            page_flush_tb_1(level - 1, pp + i);
+            tb_remove_all_1(level - 1, pp + i);
         }
     }
 }
 
-static void page_flush_tb(void)
+static void tb_remove_all(void)
 {
     int i, l1_sz = v_l1_size;
 
     for (i = 0; i < l1_sz; i++) {
-        page_flush_tb_1(v_l2_levels, l1_map + i);
+        tb_remove_all_1(v_l2_levels, l1_map + i);
     }
 }
 
@@ -101,7 +101,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     }
 
     qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
-    page_flush_tb();
+    tb_remove_all();
 
     tcg_region_reset_all();
     /* XXX: flush processor icache at this point if cache flush is expensive */
-- 
2.34.1


