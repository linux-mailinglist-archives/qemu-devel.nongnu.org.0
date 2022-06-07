Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CD53F414
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:49:58 +0200 (CEST)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPI5-0001qH-BM
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFx-0006fl-FI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFu-0000JM-PZ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:45 -0400
Received: by mail-pl1-x631.google.com with SMTP id q18so13632189pln.12
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
 b=gcdJw8PQjwxJphlxitQ5kP9MJPPHKQx6YMh5MEbpxoI/s4h2t3VKHKRRFMzJjLXvHO
 oLIoeQy3DfTO8UnmheIXVRgNJGTGUgBimSmPhtJ94G1AAEleXFcxSnJjj/GX4RkB6Pcl
 j+fXSKyVHBBhedeAUIhrPYM6qUv/yx13kC+8drZ8bWzQ52cqLAFkiQiqhiOq0oQ3Ntps
 bUujdF8brbwFKErZQ6ZOCuQjpcQ9li/FgRnknoqeegQyNvQhYZugidXJe5DbsY0xiMLQ
 yptYMeWdDgXfGv0/y9NE2BTK5xqWt9vCkybarNCkcH1aCqh7PFF/NxdSXj/V5VVu3UOo
 P6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
 b=8SO87+DZZI2yt4/MNvG3Jq/vm8BWkXqZ7NHbLEForWse850/6ZPkzCflJHrESAHGdl
 B/D2WWwz1aIkvUmCT9/22eeZ5IZn9BgGbid1ppr4xjJ76l10yfzEBIs0BZ51PloGn4iS
 3eGtkEc4S2Mh0sDgnVVcQNTHqvvgZntE74aMLknJ7VZXsUXRqZCh/me2zbPSZgZy8Yz1
 Sd9OrQi5B9gZMsfl2rYm5tkV5+avh3M8UEvPMvrwMo/tAgzqNXKmLH0QZsJthJe+DlPO
 WR1IO0oUqqj+Tt6Oam4KCoHvOMOMKJKxyEjwfs5SXCscqZfmi/46WhMu2ixHzLUJOl8H
 pcFg==
X-Gm-Message-State: AOAM530C9iLwNMPt9L9JQMqFBiJjWOLA4KdOpK+GiMT8wTpfCAHz0OLK
 XxOzIA9iLISYUK+EdRp7sBoC1FpUn/toGQ==
X-Google-Smtp-Source: ABdhPJxnzSWg8fzmhAD2L9Sox5ucKURLvm83TcPMdjWNhIdg8045ER0KIjICFu7vcladh59FdmwZmA==
X-Received: by 2002:a17:90b:3850:b0:1e2:a755:162 with SMTP id
 nl16-20020a17090b385000b001e2a7550162mr29518194pjb.241.1654570061468; 
 Mon, 06 Jun 2022 19:47:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/25] target/arm: Use is_a64 in
 arm_generate_debug_exceptions
Date: Mon,  6 Jun 2022 19:47:16 -0700
Message-Id: <20220607024734.541321-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Use the accessor rather than the raw structure member.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 20a0e4261a..a18a09a0c3 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -99,7 +99,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-    if (env->aarch64) {
+    if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env);
     } else {
         return aa32_generate_debug_exceptions(env);
-- 
2.34.1


