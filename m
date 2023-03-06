Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D216AD221
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:58:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJlr-0002wz-Ry; Mon, 06 Mar 2023 17:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZJlp-0002wT-2f
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:57:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZJln-00088E-UT
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:57:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so14758795pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678143446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jNCID4I77lASGY7n1vZuJqoIxxdckzbsjdxe3KLAKK8=;
 b=DvF31TjphPY/8zHZoFFcNLOO4hfbJCdqlw0GNX83AK8q14NpNwg5Osca5EByC7lL12
 p1LLPmMBHh2GwxZWWWk3N92dbEQR7NU9cY8MLkO8Ohuj6fimCRzLHkX+8rbwQid1E0NA
 wBiQWzcekJSooQ5iEO+kf9Ejq6bQtFemJGf/QoN8ucaYzvrTWZdIKTBCHX6x2dh8PVAb
 Zn09aJ5ADEQSrsu3SaER1S/ZnBRt7bHpTUNqCFhKX/NwSAQZSz4i5RB0odPHAOdxT8zA
 ExMRp1Ja7TlKqx67tn19L01MTd5BikRzNdmByU6ilfy/VYqnYmFx0ZbpUwjJ80QcjwxY
 Xn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678143446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jNCID4I77lASGY7n1vZuJqoIxxdckzbsjdxe3KLAKK8=;
 b=QgNfo7WzfcnEqBobYLtTzxGyElREvtK3RTKJwgh8Pb1z9rYjuIiHeSPOH/8ibmVoyJ
 A63FJuPsBXY20G4TpUz8Q4wjltvutUxUohSm/VzoOLkCEsn60nYGWMynbPymvu4PUmL3
 b2o2a4zH6EJTM47+Ip5xfkBliTE2kyb+iKXYrIpIUT89rYDIO1ScxOWYhuJKg0bMRUPw
 f5ADbQaPwiVtZ0ToLFM2anqo/cFdT1h56ZJWK56SMz8bsQ+68BTLq8WZZOhMQ+0+QJPU
 Bzh2orJs0/cbu6CJc1Lp4AhGL9SoqsDrnlm8T4WvV1HGzggRdd/WYyPnjc8i2an0FRAT
 cRQg==
X-Gm-Message-State: AO0yUKVvRKLDDSs0W1CEcDXZR8TXZfqUovIn2CY5pWKk/IByeEp+5p2U
 hipwBw8RViilD3CAOJ+NPX5KZAALNE+3AF79nB0=
X-Google-Smtp-Source: AK7set/Ye05cft5BeGhKa15E8ekecwx28oq7hYGhDa52qelfxrp3KZVe2hiXPXLUuWPajM2EuArujQ==
X-Received: by 2002:a05:6a20:c701:b0:cc:d7ec:b7c with SMTP id
 hi1-20020a056a20c70100b000ccd7ec0b7cmr12765320pzb.4.1678143446152; 
 Mon, 06 Mar 2023 14:57:26 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 x8-20020aa793a8000000b0058bc60dd98dsm6767229pff.23.2023.03.06.14.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:57:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH] target/hexagon/idef-parser: Elide mov in gen_pred_assign
Date: Mon,  6 Mar 2023 14:57:24 -0800
Message-Id: <20230306225724.2105263-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Merge mov with andi.

Suggested-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index e1a55412c8..7b494c2f9e 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1722,9 +1722,7 @@ void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,
         *left_pred = gen_tmp(c, locp, 32, UNSIGNED);
     }
     /* Extract first 8 bits, and store new predicate value */
-    OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");
-    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", left_pred,
-        ", 0xff);\n");
+    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", &r, ", 0xff);\n");
     if (is_direct) {
         OUT(c, locp, "gen_log_pred_write(ctx, ", pred_id, ", ", left_pred,
             ");\n");
-- 
2.34.1


