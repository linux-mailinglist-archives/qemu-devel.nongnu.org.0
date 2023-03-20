Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5C6C13D0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:43:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFma-0006iO-Cp; Mon, 20 Mar 2023 09:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmY-0006e2-AV
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmW-0001q3-Rl
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id o32so1147244wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8uaccxHJ+UC9X9MhGYwy+hp8RackIzB3cnPRGAUhR4=;
 b=pXD5f/oM8PT4H6J+wA6bIu79r1cXBg7ytZ7/rzPzBpHmmIx1n8JKTSe1Fk56v1iHFe
 9QtagE9qouxeqweTLJNe1Naz/tanzozWTA4JqbvXqJxYcLARzcd5aRn/Oc99TWEd/hc3
 rSJl3KZ7SH/+fA5A5zlH9LbRoL+B4F+02RFRHM8fCvF9jk69FqDIV/ptBilY+1FkajVE
 RFnV3GMN7UvQtOLGR3yhg+9z1LvKssTuFxt5kjPGW33A260DZCPSPJJ5VpfDuoKEptCc
 3Q9i/Y3QMAmBkJ3j1yKn09zlA0Lk2O5dsnUnqocRhTaasIQ2xAxX74q8/b1cA955yu18
 uoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8uaccxHJ+UC9X9MhGYwy+hp8RackIzB3cnPRGAUhR4=;
 b=auqJ/APyCoeLA9uRxAH2v0S1Q3s0uzjRx5TJK5GJE+gUU0yQiqKcHLd6mClNvvmx/G
 G2v2LoELgvo/hXaWM7uWXcErWeKlrhT7eZF6Y3ickHjRSWXvabcUWwk9avrI8Ut6nvgI
 8ouQhPUfBK21qMepr0dYTxSGKDPIkLV/nLtY4GeG6XtPmfMlNEBdL+7ao/p1BqTNSgHJ
 ajMFdQ97wWg090US3LQbbMJ/zACO4os1f3PK1ul86IHGfD8QjwJkQKH12JaBxzXdh7Gx
 LYdT1s+3m6Sn/vfk83S64ZP8XsXgl/Js5Z3oe0rlbnowD7lXRZZnapipWLuWyI8e/8zX
 KIdw==
X-Gm-Message-State: AO0yUKX0fRx9hPNom/YfBoSLfhTA2fmvaDByqDZjW3FK4URK7la2Mwu1
 hfFQGELtEViRYoVe3Z4uA8qEvN4IcDEa4ybMh/a7CQ==
X-Google-Smtp-Source: AK7set9x4sPYSTQh2LE0A56ZstTjWuYBUJc193t6379VJktlKixDQbG6WX25cAfjsvz9f6I9l1sQoA==
X-Received: by 2002:a05:600c:3549:b0:3eb:39e7:35fe with SMTP id
 i9-20020a05600c354900b003eb39e735femr32589880wmq.30.1679319755826; 
 Mon, 20 Mar 2023 06:42:35 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002d748d46565sm2178996wrn.74.2023.03.20.06.42.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.1 3/5] qemu/uri: Use QueryParams type definition
Date: Mon, 20 Mar 2023 14:42:17 +0100
Message-Id: <20230320134219.22489-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320134219.22489-1-philmd@linaro.org>
References: <20230320134219.22489-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Follow QEMU CODING_STYLE, use the type definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/uri.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index 3ad211d676..10dff8aedd 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -96,7 +96,7 @@ typedef struct QueryParams {
   QueryParam *p;		/* array of parameters */
 } QueryParams;
 
-struct QueryParams *query_params_new (int init_alloc);
+QueryParams *query_params_new (int init_alloc);
 extern QueryParams *query_params_parse (const char *query);
 extern void query_params_free (QueryParams *ps);
 
-- 
2.38.1


