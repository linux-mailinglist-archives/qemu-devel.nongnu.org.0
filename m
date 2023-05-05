Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DB6F8B11
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:30:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vR-0000ik-9w; Fri, 05 May 2023 17:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vG-0000fU-Gj
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:02 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vA-0004PE-Jp
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:01 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so23070825e9.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321895; x=1685913895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yNUcAaiIsith4A3MmMU6YaHlVSgymDmwyA221woU1dE=;
 b=Cyb9TpQ/l0BUxNmuXvWt6Aj15lIAMnoJq0RLiab7h9mVHunwInJZdxPq8NNmgXAhEX
 i7DmspPioHFYW6v5vxcS2HA886pD7PuJNFYRAaBkwSef6vgrXsUOnYYlSxHOVWzF4DcB
 Qe6QdfcReVAOcTeoNQZsKX8UlBZtaIaHqH/0lurmXumC3RgK/Fmdw3amtxK4BvCERV6j
 OaXxMFafqEHzVEmryinUbUIcONS82v5G1JHL0rReqn+/TYdSrBLIWgwQZuYJIcIuMv8w
 VSIBJhqiG8JUSOtTedN4Y8Is5XOmYd1y/otDvsNIlgPwQH16EbbrI9zXmAgFVUjAgSoa
 NyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321895; x=1685913895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNUcAaiIsith4A3MmMU6YaHlVSgymDmwyA221woU1dE=;
 b=UtqTG3sXJqiVFmu3CaKoM2ovWrBsWNtAQe4i7r0OakOADsGSoa04bzyywosnsOoBRm
 9zozB94zAOrXCzmTsvmLPUgzJoqaK6RQ52wpktgcOZFF055XnFi1XT+mjk2484OEq+ym
 cnJZmosOldVQCgID8wtf01ZGWxMNHrDXVncNavdPHxtyE7hE8GdFrVRuPteSQR9gYT2P
 GqFSYfqQTOWbYhFMTwQ2aAC7BDc3qHd0yg2AcgSVee2XAh+HQ8QKbk0lFREb9FR9QX6D
 HEe/yQS4soPK5mIujIHNj4qFCDUbySPMcCBVxqfDIL8a1YHAwJwKiPn5U7aazQH7WfAT
 YSxg==
X-Gm-Message-State: AC+VfDyBeOTSOKiWqLC1GUytgvwtHOIZOUthxinqkHwjZa8d+zTXyMPZ
 09/t1fJ6pO+ZhHxhPUX+/DmiMrJrolw2EhywRvfytg==
X-Google-Smtp-Source: ACHHUZ5Ay3vi/uyJ7kMXOuEV4ddenNYH3aaBI22sat5TR9RofUqmL13AaSN4YdXbWqgd1oaTUGYKEw==
X-Received: by 2002:a1c:4b0a:0:b0:3ee:96f0:ea31 with SMTP id
 y10-20020a1c4b0a000000b003ee96f0ea31mr1974091wma.18.1683321895215; 
 Fri, 05 May 2023 14:24:55 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/42] target/alpha: Use MO_ALIGN for system UNALIGN()
Date: Fri,  5 May 2023 22:24:16 +0100
Message-Id: <20230505212447.374546-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 9d25e21164..ffbac1c114 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -72,7 +72,7 @@ struct DisasContext {
 #ifdef CONFIG_USER_ONLY
 #define UNALIGN(C)  (C)->unalign
 #else
-#define UNALIGN(C)  0
+#define UNALIGN(C)  MO_ALIGN
 #endif
 
 /* Target-specific return values from translate_one, indicating the
-- 
2.34.1


