Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D15AE731
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:06:52 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXLv-0006md-IQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0003Oj-Ok
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeh-0005G2-Ba
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id e20so14659155wri.13
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7HI+xpPxCIX6BauxWntrNZ0C5lHr5ZXLxWzQGdsbbe4=;
 b=azRxAnabeMh4/WFDnFmtOMAx/q+PZjl2/B8xFdIu8wMPJq3SLjkUOY5gu1cduTZBVe
 nW1QRtk3n4ImyuT4m8RXH8gTGohlv/+fHp6nlwhfANqPRRgDO5VjEJQB3docdVDaGcCB
 mk/UloO963Xer6fI1gMk9N/8CJ06etP677odo6/n2pzm0R/1o/Ogly8i7rMMlPYK96zb
 qrVdI6YP8eZiyAnSac18iKCeWAETZLisEJkHyFwc1kKC2HXvaXFLQH7aTfki/JsRrJMd
 NzMxyDqzdLOeeLq9MZsG0vZQdhGO5s7qX4k66Hm7bgqNMYj5dzn/4SsKExdzQuUJ86xq
 Qx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7HI+xpPxCIX6BauxWntrNZ0C5lHr5ZXLxWzQGdsbbe4=;
 b=d5tfCF5qgwaCmgBARvaN9tHUtiLIW+VH/sfnl5agUStT9DpI0wXtABcPAnsmow7bfl
 40Ux3KZXfv4+O0KEAN9lpiSAJGBkqNPf6gCgNwRQH8Xkw6qyu/pQ3l329aF1UOcxvgc7
 nrjyU6tfuxBtHBMPOCChKuelw5gFb7zN8eU2hd8FQlGd6FKfpUsvLrkcxD+QeyR7CdsX
 D5VgDLfe6A7mIBFGIcEJSLGB0vSaskU3TFxtDQ8+DHeZDNvtZZBMX1sh5PgS6ltYlXje
 lZ+vG4j+n1oFZPljMHBCtbmF9Yf0Vzf6AaWqhMj0c6sg7Xs8TOT36/mCtfy8I4WzbeXF
 wR5Q==
X-Gm-Message-State: ACgBeo3/K7D+8Crrl3XARRy/eHqjBKrEP7lWOLQak55fWFsGTD5TwZ55
 1IUFRK/jtjjKfZfksJOy96DmGlNayuwBAw1S
X-Google-Smtp-Source: AA6agR6hF5ETxpwKrAZkvUHj0tUDujCcE1zYMk977Uf9yVqnn+YfGaMg7zFdjp7cpCd2d6WOJS8BQA==
X-Received: by 2002:a05:6000:144e:b0:225:36c6:50a5 with SMTP id
 v14-20020a056000144e00b0022536c650a5mr25402717wrx.543.1662459485539; 
 Tue, 06 Sep 2022 03:18:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 16/26] target/s390x: Disable conditional branch-to-next for
 PER
Date: Tue,  6 Sep 2022 11:17:37 +0100
Message-Id: <20220906101747.344559-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

For PER, we require a conditional call to helper_per_branch
for the conditional branch.  Fold the remaining optimization
into a call to helper_goto_direct, which will take care of
the remaining gbea adjustment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index cd311b4b2a..fc6b04e23e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1203,13 +1203,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (disp == s->ilen) {
-            /* Branch to next.  */
-            per_branch(s, true);
-            ret = DISAS_NEXT;
-            goto egress;
-        }
-        if (c->cond == TCG_COND_ALWAYS) {
+        /*
+         * Do not optimize a conditional branch if PER enabled, because we
+         * still need a conditional call to helper_per_branch.
+         */
+        if (c->cond == TCG_COND_ALWAYS
+            || (disp == s->ilen && !per_enabled(s))) {
             ret = help_goto_direct(s, disp);
             goto egress;
         }
-- 
2.34.1


