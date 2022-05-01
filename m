Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B420C516224
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:11:37 +0200 (CEST)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2nw-0007xO-Pz
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tp-0006tH-Sj
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0001Hg-OS
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:49 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1790622pjv.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRPI4KJ0o1Fv91uZt/otSHqIpd9AAG960yShsiZDMcA=;
 b=VXBv9P939g9C4OEJMGRrmFAvYvASQ0wUfXQmljDA8+v9MR2+Osk5nvI9/Bsq1EM5el
 HuzYM/zgFgGga4j7uzIPwP+6IexjMAp6AnK/HI0lzcf97lzjbItZ3DrQ0dKvWdS8N1n8
 epEwp6m+zJdGNk9BwcYtweVGp5IY8F0UtL/ydiAbh6oCI/I7DoQBxPSw4ebkJRy1n4jB
 b3XVoXoXfh1rmj7zoSMlL2W7e/aUqdNWmQgPQK8PDFwlw0qRmMxmlJN3oIU7bvTMeBCX
 cFuqojq2jBC9OzYD0U5qcOTouhWfcxSMn1c+lXiSL2IyjfuaVJLxKjmGZ/115ykDQSpA
 hKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRPI4KJ0o1Fv91uZt/otSHqIpd9AAG960yShsiZDMcA=;
 b=tk9hBbxzEM+MU4byXfm95uAd6BDVQePS+zdVuTZC+kI5HtG0CAWFzwUKWL1EB/cz7/
 DGOOzajX6y8JPauIfh92VXXZclaf+xaKWLQHSnzuy4nNz5La1nsuon9cTsnuQa60qexA
 ttqkWNYTUiQFutMXmI5/Euz27DumqqeqYWpJ4ddP1ep7kA6iHNVdTOMbU4jGLvp/UIqW
 KdT8EcUtFvJSO6K4aYwbWgS1GeV4jbOPY2NXpfXtCPl3amQ3tPg9h131dsTu50WQT8+p
 Y4GyLU+UNPYh+EQGddmvkCx37rhlmBcst1hPaJM3vLODE1gnDNRm/jds2Dh10ZTWEEBa
 3HhA==
X-Gm-Message-State: AOAM5306tvbwl65GGAnzS7T9QdVyYGyfb61VN7gno/FpCLIUiS+Zc/5P
 o5r6bYmKaxvU7Y/NUJCRxvdccPOyW9QTiA==
X-Google-Smtp-Source: ABdhPJwTHwnWh2y7cR5nMRIuaAS8l2tOvtVaJruJg5bgOtNW9tm8vS+ROsRCZOErjG7RWctfqkXwjw==
X-Received: by 2002:a17:90a:94c2:b0:1d9:3fbd:bbe1 with SMTP id
 j2-20020a17090a94c200b001d93fbdbbe1mr7066350pjw.59.1651384244416; 
 Sat, 30 Apr 2022 22:50:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/45] target/arm: Use bool for is64 and ns in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:57 -0700
Message-Id: <20220501055028.646596-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bool is a more appropriate type for these variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b2887d63b6..c6d407f93b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8507,8 +8507,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      */
     uint32_t key;
     ARMCPRegInfo *r2;
-    int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
-    int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    bool is64 = r->type & ARM_CP_64BIT;
+    bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
     size_t name_len;
 
-- 
2.34.1


