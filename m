Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C736AB420
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyL-0004Mo-8Q; Sun, 05 Mar 2023 19:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxn-000301-0h
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0007MN-M2
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: by mail-pg1-x541.google.com with SMTP id 132so4526935pgh.13
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiUF3mqm6DS60wxBfGio8dJ1EJJ98ZEumCYG4irApQg=;
 b=q0ZOPzDSwwVLOO/U2wjY7mJSyZzsDYlDeS8aWIcLiQJiztj5DGBI6l+Cc3p8RsFuza
 V5dH9yPUp+P+7MFdsNfQgneqVkoXZX5oHHsPK83K5uUCb0MTn/U/JYV5HbhAr02yRDxY
 wjDS1QZaRldimNWfO5PXSSaZpKo19GtkuS9ZzLo54C70t1o3pnAoV2wDf02BlR33ZT2E
 pXk83xdp3J1xLcSAGn9/3dlrNRoBaDMtECuv0wrF53lGJ3TjXDMCbCMZzjXEpapQt8rf
 uoT2oHcfEnmPX7IJ5N0igfv46Ji6fVeW5EbwOWAQuqJmQQ9OGwr4HuKExSvGYyGCOJLT
 GW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiUF3mqm6DS60wxBfGio8dJ1EJJ98ZEumCYG4irApQg=;
 b=RfN43dFIFd8YXcmUjkyY0HvpcRcK/7X3u5BypRzsOUol7bl1r7+XqlsIVBW8uFOOdf
 p/YT71cSlXa0slri0JpbMvPgJ4f6Z//XAzDZEGhUys7MTsrkWBrRZcerbJJbwEUzC5F+
 Hqy0Kv2YVVw+Yo5utxyMz0/XrO++QaD9BLFUTSb9swJNxD8CyiUstO6miWoe4xchWnku
 B6uKrPgtZ8+VsrNrk3O4TjBi8UP4x5ppOSqHSi+I/B7ZO5nBts/XcgjanjipupgN+ByA
 yCrdzQ0fI0GyP71DI6K+2AeWqiQ4T1bJWbY4wq+r3i/OgtVTAnbJRve48GUNgx0k/4hh
 mllg==
X-Gm-Message-State: AO0yUKUJBQWSjHxfZ3VbGDf5hSVuBBjVeKlLo52Q6/+TGnU61isGMKE5
 RNFpa9ONRsbVXbaUT3ng+KSu9mH9rWLppX7OUBw7ZSq1
X-Google-Smtp-Source: AK7set+JJRvDyuhzmAn4w99OP4b4mTEI9SbPHhAYTMhD+nvRv602GCmC5ALzzeGBJi4QxAMqAbTeRg==
X-Received: by 2002:a62:3182:0:b0:617:bce6:f033 with SMTP id
 x124-20020a623182000000b00617bce6f033mr4655356pfx.14.1678063460197; 
 Sun, 05 Mar 2023 16:44:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 72/84] target/hexagon/idef-parser: Use gen_tmp for
 gen_rvalue_pred
Date: Sun,  5 Mar 2023 16:39:42 -0800
Message-Id: <20230306003954.1866998-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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

The allocation is immediately followed by either tcg_gen_mov_i32
or gen_read_preg (which contains tcg_gen_mov_i32), so the zero
initialization is immediately discarded.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 760e499149..c0e6f2190c 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1889,7 +1889,7 @@ HexValue gen_rvalue_pred(Context *c, YYLTYPE *locp, HexValue *pred)
         bool is_dotnew = pred->is_dotnew;
         char predicate_id[2] = { pred->pred.id, '\0' };
         char *pred_str = (char *) &predicate_id;
-        *pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        *pred = gen_tmp(c, locp, 32, UNSIGNED);
         if (is_dotnew) {
             OUT(c, locp, "tcg_gen_mov_i32(", pred,
                 ", hex_new_pred_value[");
-- 
2.34.1


