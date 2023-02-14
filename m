Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD8469698D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:32:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD2-0006a6-OG; Tue, 14 Feb 2023 11:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCv-0006Tz-CO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:06 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCt-00028u-Ov
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:05 -0500
Received: by mail-pl1-x632.google.com with SMTP id be8so17584868plb.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHtifVEb490wvqlj18C8e7MT6laK9IGTMe9tkX1/5mQ=;
 b=iLrf6cVvPRaxm9SqmCbpUOmcDb0O/r2uPKIEzYVfG2GVkMWN734F24AChU75ahNPGW
 R4QlwKd6yk4ZmAL59P1N0kslEM3pSP/ql2YEcCLMqqdOlU38/hIrnp5UphDVsGvIVqfM
 VRrWvGTiqIQUCJwijhz8sjjhkIwVHSUC0ZfnDh3wVEyQfM1bKIMqM3TPpCCqIchGJUrI
 o+V2rgeh8pgs1C7l1+UmTZEu+c2TF1KNkrv/j2b0dk631km7knaDuKT/ZF6ZVpvlEMKK
 crvdPRCBulZTybfQOiQH7mdJ3FvwaZrhucX1CboDr+9UbIIhRNShagsqPN6OkddVFJxN
 10Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHtifVEb490wvqlj18C8e7MT6laK9IGTMe9tkX1/5mQ=;
 b=hSfMUDbyhOnRK2HbF90rqdW+jfI3L3q60nRHpjGERDz9Yv5aDXYdVI2nsvbS6bZ0TF
 IKxTyTw3ClqfVRCDuOaguz8DHwE50yCyUr7uPrDFjGDX9jBFjxnovYFxOYJfqOAfIP0e
 JLQ57rXCcZvNQNVssE3Q/e5paaqNMsLm4YvGOMJvvrAJHNpoqIYfT0wvZoSsDqJhOVsp
 h1GJjDmLlskYlMsrgnoNfnr5xKTXgp8mXRld1Gm9iV5Op9rpzmyBFtXZ4Mcnj0+K/VuP
 R5HkEf/S4KB4hiNIS7jEFTzrJnSg1jv3VYB7yh0yhaISKcgcHhj7wD9Mh5hQUdUQ4Nxe
 yqWQ==
X-Gm-Message-State: AO0yUKWdLv4fAm7ilwRmzgq7NawiUT6k8genaAPygg6d5Zcccp78q13L
 yVDlKystCm/fYSnZI5xWwitVDzCMv7tvXv8lw5s=
X-Google-Smtp-Source: AK7set/+swzCfA9s+snhw0VY0qQrBQZgipWBM91LRcaPoFC73qVX7c9aXTkmCnz7bDJvm4RWz0gTYw==
X-Received: by 2002:a05:6a20:394b:b0:c3:cc65:165c with SMTP id
 r11-20020a056a20394b00b000c3cc65165cmr3773521pzg.61.1676392262149; 
 Tue, 14 Feb 2023 08:31:02 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/14] target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
Date: Tue, 14 Feb 2023 06:30:41 -1000
Message-Id: <20230214163048.903964-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Define svep based on the size of the predicates,
not the primary vector registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 02a0256c5c..ec61211949 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1


