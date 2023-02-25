Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074B6A2802
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPo-0000aU-1E; Sat, 25 Feb 2023 04:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPY-0000Qp-To
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:08 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPX-0004wl-A8
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:08 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so1535943pja.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=K0j6e5TOnG7evsQPOupV4PgXho7BoB1CvcBOE2lotc0tEtWH5HvM29FxYZAlJgZZ9Q
 /3uwQGt9Ji1pzuyARKYWcIz7B8zz/q9q6j7ekCMQi/5KJjR5NdkPcbnjWS91H6S2Taxs
 e6h3oUJn7n/xIMmoL1bCp39E7vatgCc2uHEGSor8wUD4yJh3b0xahM8ZWwR1uln4l+Cf
 oNbp+eGwi7jlVVXwV1AYzbsOux/fMGGilFFANd9qmHF1Rn3AwD0YgCZ5RdgXYCrRI3E0
 PZ0zXqDqnmTlVhsyQvWofPICmNKX45MPseo5NraVD49fh96Fd15JgzVSYsFg7KaZeXuz
 to8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=dKmpU+jH7H1pseFKTmh8naWQgcFkttnMPZtgu2FgpowDoVmk4u74ehkcjJCHUjZRoT
 xtXh5cITVJ5p3l4k3HGyu9Ohj3gGTL2IoPNeDZVQ52oPlJsrsmiwT8NhzlGJPNwrMVU3
 nGDNe1Jvj/iY1tzN4VjhLoLqeb8RNVC+5VMmwmeLMvkBy6Tb4i0Qwoa5wWB+2XMplXoJ
 nIC/KAw+EQtOAkijchkZJ1NA0xOxWNrapM1nKQXPOdg2yo4q6yFkS8QgwiNum1RMD3VF
 6ByA8OS+6dG6+XOiCfZtNIKgXPKv5IMxoU0sm5OOOOt451cwqVGSnV3pUDm83tXkl5aL
 XfXw==
X-Gm-Message-State: AO0yUKWJN9SO/7BZN10NoemGshXkit5CnCCiYck3miKaLtWaQo3bMadh
 JkkHa0ZLxLhAWMsQfKMx4VHKx55Q3YsPkFwODXw=
X-Google-Smtp-Source: AK7set/C2y04kACN6zYGRQHYpng4Lv+YhGR93QljbykAtWihyi4BFB2OkOP7pXuJp2yOLV1lRfHBqA==
X-Received: by 2002:a05:6a20:158f:b0:c6:3d79:6360 with SMTP id
 h15-20020a056a20158f00b000c63d796360mr11744026pzj.2.1677315605660; 
 Sat, 25 Feb 2023 01:00:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 11/30] tcg: Add tcg_gen_movi_ptr
Date: Fri, 24 Feb 2023 22:59:26 -1000
Message-Id: <20230225085945.1798188-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 839d91c0c7..66b1461caa 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1285,6 +1285,11 @@ static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
     glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
 }
 
+static inline void tcg_gen_movi_ptr(TCGv_ptr d, intptr_t s)
+{
+    glue(tcg_gen_movi_,PTR)((NAT)d, s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


