Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA9F6F4295
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:21:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3f-0000dy-Sk; Tue, 02 May 2023 07:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3d-0000cW-33
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3b-0003ET-1W
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so36138235e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026427; x=1685618427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4s47C7gmYdUlM0SIov8ZnFiPUvDgmGeRG+O+etXAiw=;
 b=Rik5Jyi8agbWTbZ2L6uXb3+C0C6XXC4PYQhOyqMNj8Kjhb0F38/xI3EgUZkJ7dUSqO
 YB2PEvYu/Qrayo59r01wwB70FZuVl64DBr23KZj2ASAIiErhuIbKYQgFqsMs7HnQLGOT
 D4jEWcnKquVVqlmzrICs/qL8ouXx/w63aq+9+mgu+gmWBvg3k67WWEVRzsvl6WJ3K7CK
 VklLLM+TTOboSEAvRjTPmqGdWj0Eh7XHVNgcZKQkrgpXMNLoFOX3KmMRM3FfO/zQNPo6
 su7y6zJLZsY1kYh5ea/VgDOM+gO1on4Vu1DQUucmOZabAzvmgVmpk6HUhr6a982Ty7Lg
 ck9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026427; x=1685618427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4s47C7gmYdUlM0SIov8ZnFiPUvDgmGeRG+O+etXAiw=;
 b=HNq01OMXoApIl80Q5/JKFIsaRJyBqyShOD4/l5Uth/1w0Ev9JN783RLdosIICCOz19
 nghKnVXQcfwfZo7dk8TXUsaoZJ/1y1CRr7up4oaZypf5ZEeg0CJ2rH3HG0STGI0G9fLv
 VxtV+LNdPUxmk41AVSOW22fXAKiq8Q5p6qI9YdQdHT2UHnVEwsJBn8w41lICLLBUQNfG
 8/ZLnrUGlXhdjwSNQqNr+ouCLTh3QvLlUIZoKS1n3MC9BbemZvoc6h4ffLKrqION7aiw
 qbQ5xVe2Ftq7/OEMcVqwQ+VB4vg0oEUcE493Jxl6aeQwGzpa9RZ95MVq29o+9ua/pVZm
 2DiQ==
X-Gm-Message-State: AC+VfDxVVRcaKIl8XzbDW+LK5zOf33WEu69MH9QOw4qqHan2AoG8kxYy
 oeQaxjt+AHpmF53YwvVHtiQftt2tntzATn8/48b8UA==
X-Google-Smtp-Source: ACHHUZ6Wstb7PoykikEJGQooCfoKaNvi2AqNe6MPaEf5CiMYXuo6J1XuwhL6zUqXtBsP1TChFs337w==
X-Received: by 2002:a1c:7317:0:b0:3f0:46ca:f201 with SMTP id
 d23-20020a1c7317000000b003f046caf201mr11940086wmb.1.1683026427098; 
 Tue, 02 May 2023 04:20:27 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PULL 04/12] qemu/host-utils.h: Add clz and ctz functions for
 lower-bit integers
Date: Tue,  2 May 2023 12:20:15 +0100
Message-Id: <20230502112023.776823-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

This is for use in the RISC-V vclz and vctz instructions (implemented in
proceeding commit).

Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230428144757.57530-11-lawrence.hunter@codethink.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 3ce62bf4a5..d3b4dce6a9 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -107,6 +107,36 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 }
 #endif
 
+/**
+ * clz8 - count leading zeros in a 8-bit value.
+ * @val: The value to search
+ *
+ * Returns 8 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ *
+ * Note that the GCC builtin will upcast its argument to an `unsigned int`
+ * so this function subtracts off the number of prepended zeroes.
+ */
+static inline int clz8(uint8_t val)
+{
+    return val ? __builtin_clz(val) - 24 : 8;
+}
+
+/**
+ * clz16 - count leading zeros in a 16-bit value.
+ * @val: The value to search
+ *
+ * Returns 16 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ *
+ * Note that the GCC builtin will upcast its argument to an `unsigned int`
+ * so this function subtracts off the number of prepended zeroes.
+ */
+static inline int clz16(uint16_t val)
+{
+    return val ? __builtin_clz(val) - 16 : 16;
+}
+
 /**
  * clz32 - count leading zeros in a 32-bit value.
  * @val: The value to search
@@ -153,6 +183,30 @@ static inline int clo64(uint64_t val)
     return clz64(~val);
 }
 
+/**
+ * ctz8 - count trailing zeros in a 8-bit value.
+ * @val: The value to search
+ *
+ * Returns 8 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ */
+static inline int ctz8(uint8_t val)
+{
+    return val ? __builtin_ctz(val) : 8;
+}
+
+/**
+ * ctz16 - count trailing zeros in a 16-bit value.
+ * @val: The value to search
+ *
+ * Returns 16 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ */
+static inline int ctz16(uint16_t val)
+{
+    return val ? __builtin_ctz(val) : 16;
+}
+
 /**
  * ctz32 - count trailing zeros in a 32-bit value.
  * @val: The value to search
-- 
2.34.1


