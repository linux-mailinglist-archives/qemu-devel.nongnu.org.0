Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEAA63FFDD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymc-0002eT-0K; Fri, 02 Dec 2022 00:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymZ-0002di-SE
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:19 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymY-0003Mo-DG
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:19 -0500
Received: by mail-pg1-x529.google.com with SMTP id s196so3558410pgs.3
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=ZtYD1ALJ+JBJADTkQ9mQnA5PghZ0munX4x1OfRTVYsK5f65TFs3Psetglm6Bz1mUcY
 igmN2fXkt0h90tSHxwQe6gCPHgLIAKnwaGzawFPfwbSEqHfCEf2UCxxqvIetrwrddZXG
 T+MW3BZhXUMlL/vCJpSY0RAH7QXnRaxodIEyPhRJEpSAwsyFuHmDXPPqKRMTuMhUehMF
 A6IvE2JtYfFajU1nDj2Ft93uogeZQH5AyD6Ad76Hx+t32TTjwi5LcHBmQCs8ifUEd1js
 fagt5wb26PA6EmbVmUSZRYUWTTn8kQ4XNZPkc94DxETYPNJ2A8q5uN6YyucbwLEGl056
 s2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=iSvRw1WSjrg3SWUts2fLYm5HSlkFU1nY/MBXJ6KhmrlgiaSZRYT9IopVan18CVYG9e
 Dk2i9LH8vnr327vsuqGsbgUIawTq33b4rCiirMKNxlKrD/dR+2ayz9oSCX3dEwF+car9
 iLbS1M8556ARxYEBXj8SEjAYcNuXAhyb2jlK6w6HXyDtX5uGMkYacpn+Xm5zXtSPxuik
 JYvAOs0kFDyIdY7FcDhKHzcVK4wbkNe/sFDTMkID43ZFnxFT7RtgOfCSdSaSH9XSYzfo
 D7pKqNL1EsDHlUyXmilob2+SRPVjOsT6MZypQ45yNguTxw6VGSwV/dYcaZ4EnVnL0T3Q
 X83Q==
X-Gm-Message-State: ANoB5plCX9YA4GbAc1XKmFUA4joiZYeYQnyXBbE7hu1hKWRB5L/JOLOW
 9ooAJlxMaPW5dWxGtIFvIku5SqELVbrh9QAk
X-Google-Smtp-Source: AA0mqf4VeRkAqM2s0A50Dq0/NrnyhGfPYYK/627/po36GU3a4NFjycyInnYSvhFeaaIYTgVKis9Vcw==
X-Received: by 2002:a05:6a00:1a14:b0:557:ef5e:6db3 with SMTP id
 g20-20020a056a001a1400b00557ef5e6db3mr54050703pfv.13.1669959617112; 
 Thu, 01 Dec 2022 21:40:17 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 17/34] tcg: Move TCG_TYPE_COUNT outside enum
Date: Thu,  1 Dec 2022 21:39:41 -0800
Message-Id: <20221202053958.223890-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

The count is not itself an enumerator.  Move it outside to
prevent the compiler from considering it with -Wswitch-enum.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index afa18986b1..f2da340bb9 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -294,7 +294,8 @@ typedef enum TCGType {
     TCG_TYPE_V128,
     TCG_TYPE_V256,
 
-    TCG_TYPE_COUNT, /* number of different types */
+    /* Number of different types (integer not enum) */
+#define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)
 
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
-- 
2.34.1


