Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2DE625545
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:28:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfo-0006RE-Oi; Fri, 11 Nov 2022 02:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfV-00069R-El
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:46 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfT-0007wx-Vo
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:41 -0500
Received: by mail-pl1-x630.google.com with SMTP id c2so3606398plz.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=WTAw1BOObhQ9hsFLEWkqihao4XdaLcqlsB3b+ozNJY35kvVu1lmuNum+6+nUgxGkwa
 VdWWH/c7u/dixm4Lb+M48AG/b/J2xWNFaLcaD87thhLLihQoY3rPH4cHJOQ1gpzhX9ag
 gBs890U0yXkkGnohFsTezpJY5I7+uJpCbKMvrD+FidZ1ucnSy8L85eKnwNmpfI9cu7Dk
 zfsFxJOJOZ83nm7AK62CMHyRPTw7UnTP0ChJKwZ9qdWC4S6yLjDYM0t0IeosD3b0mK+H
 rXQrPHVDaOG0lmPwqFBOOWCyAiUZqcsfoFGStmVyrA4WVVupKHtuPjng72HMc5Jm25cm
 UfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=57JsUlaWfttYlLPGsYbgeB89F762mnguxSmnvpEkH1iqw9h1+QlVGS9IT3OPUJxIOg
 A0YUaIUB7JXC1EMgc3dW2fnbskG3HlEARD3qV7Pl8TLe9AlI2tkf67o+JIHL++xuR3Dt
 Qy4aR0s2co8n+1lJx/44L8aBfiGOWhmWL6epKTnoJrfTnBgrZ2eEdjP0/T1fuZ06RORE
 RBzDrH/3B+Wlc4LGEraTaMS94+b9NVIZosDEh5vIrhobWClAVWjq+b2JX9OGZSe1mLFt
 0Sz7M5MGYY8145P5Td+vGqJn0icWPd/OMs1JTlYAONJaTlVqOdggWDJ/zdRrHI+wkpzT
 mKcQ==
X-Gm-Message-State: ANoB5pmzr3pAyexCXMYY3WVUYA/uFJqylvRFtkvUncjinmzg2svxOnwv
 oWJUp8tQSFj1V6uu6VBXYQq0VqrfSwUpg5jF
X-Google-Smtp-Source: AA0mqf4S4lekbYXaTYPCID9uZKoz5YZ3naqBSQ6rtwbXZavJWAbPJZfW1eWSu9hRJlSRzmzSxdVabA==
X-Received: by 2002:a17:902:9346:b0:178:71f9:b8fc with SMTP id
 g6-20020a170902934600b0017871f9b8fcmr1483166plp.44.1668152498501; 
 Thu, 10 Nov 2022 23:41:38 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 13/45] tcg: Move TCG_TYPE_COUNT outside enum
Date: Fri, 11 Nov 2022 17:40:29 +1000
Message-Id: <20221111074101.2069454-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


