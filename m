Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD966315F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:23:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybt-0005DQ-S4; Mon, 09 Jan 2023 15:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybr-00057m-LU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:07 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybp-00052q-Ir
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:07 -0500
Received: by mail-pf1-x430.google.com with SMTP id 20so1660722pfu.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTZIs1C/js8Say6SBQT3RKsZE9PwWeX+MiQ9FxoXnQk=;
 b=QoAvLcUU0KM0M9KB6AUycHl6EDECQje+gHbahYD2rjoCGhHYhDAK/YGldxmUH73ZCF
 gnU02XvmvorXl8kRX0jvI/nvoLxlmTVGDEK8eAzOY6yp0eH7Ut44S1HDHKxI2HWkoz8T
 KlKz8cyAgFR0GyT5WxeIcStFM19rxGMhuKWDt6EiKziYTmFGddEgfTNQ5rN4rk5WWmaK
 FWysQuNVAZ+jv+goc1snhfwLx2CF7DwZVkZAAwIH2JH3R6RY4E9DDw1IXrbCB6nOGXoM
 fkouwCZh0IBaW7n/TCMysJPCN8j8ak+OQFqAIvs4lYkZhPuWrNZ/dgywfKf6IILFrytz
 ieug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTZIs1C/js8Say6SBQT3RKsZE9PwWeX+MiQ9FxoXnQk=;
 b=Pf7qoGvGPIlRvnZDdRMMfv6GvflP+AR7xfD20LLKIvyTW2qrnK/E/G7RbQcAHSqm63
 Jvb5cXRlnlJ6ieV4ToyjJQTOsNJpael80fi56cy115+sKtbd4hQU8/NSSXYO3rHHgCpE
 rP+RsDg3PnPj2BK0QBNWfl4o/waipprp+z/7JQ8sjsWWTfWLp/4pTcjbtwRqUMTxFUBL
 8cqwvmCitBuoOdTX/XToGAKJbUITBIQ5LQomuLqnAk/ypvliSbxWF8clETOQ7p6tgJjc
 U3txPksvWEklN0Bs7WO9sm58Pe07oM2jJ+o/w50qITiLJjgCW5GPlU5YISfm2ApwSDAY
 WW1w==
X-Gm-Message-State: AFqh2kovVpw9zLffSQODCPpy55PLUJTAMmRxV7XdScElUwlcP3pqTDCu
 i9S+XTvNpqlNyo1kuCoZHE/wNjdI5vnGhvE9
X-Google-Smtp-Source: AMrXdXuGDyza1FWQp68s7KXmw20P2nLw64IGgSlG3bi9PGbwu/Ll5RmrzltCW6RUEt40xsgmTS6UfQ==
X-Received: by 2002:a05:6a00:1346:b0:581:c216:1390 with SMTP id
 k6-20020a056a00134600b00581c2161390mr53365972pfu.34.1673295544825; 
 Mon, 09 Jan 2023 12:19:04 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:19:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 7/7] target/s390x: Hoist some computation in access_memmove
Date: Mon,  9 Jan 2023 12:18:56 -0800
Message-Id: <20230109201856.3916639-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Ensure that the total length is in a local variable
across the byte loop.  Compute size1 difference once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 92eb6564c3..5f0dd67985 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -299,16 +299,17 @@ static void access_set_byte(CPUS390XState *env, S390Access *access,
 static void access_memmove(CPUS390XState *env, S390Access *desta,
                            S390Access *srca, uintptr_t ra)
 {
+    int len = desta->size1 + desta->size2;
     int diff;
 
-    g_assert(desta->size1 + desta->size2 == srca->size1 + srca->size2);
+    assert(len == srca->size1 + srca->size2);
 
     /* Fallback to slow access in case we don't have access to all host pages */
     if (unlikely(!desta->haddr1 || (desta->size2 && !desta->haddr2) ||
                  !srca->haddr1 || (srca->size2 && !srca->haddr2))) {
         int i;
 
-        for (i = 0; i < desta->size1 + desta->size2; i++) {
+        for (i = 0; i < len; i++) {
             uint8_t byte = access_get_byte(env, srca, i, ra);
 
             access_set_byte(env, desta, i, byte, ra);
@@ -316,20 +317,20 @@ static void access_memmove(CPUS390XState *env, S390Access *desta,
         return;
     }
 
-    if (srca->size1 == desta->size1) {
+    diff = desta->size1 - srca->size1;
+    if (likely(diff == 0)) {
         memmove(desta->haddr1, srca->haddr1, srca->size1);
         if (unlikely(srca->size2)) {
             memmove(desta->haddr2, srca->haddr2, srca->size2);
         }
-    } else if (srca->size1 < desta->size1) {
-        diff = desta->size1 - srca->size1;
+    } else if (diff > 0) {
         memmove(desta->haddr1, srca->haddr1, srca->size1);
         memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
         if (likely(desta->size2)) {
             memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
         }
     } else {
-        diff = srca->size1 - desta->size1;
+        diff = -diff;
         memmove(desta->haddr1, srca->haddr1, desta->size1);
         memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
         if (likely(srca->size2)) {
-- 
2.34.1


