Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D7D6FD6F4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:25:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdFJ-0003gP-Mo; Wed, 10 May 2023 02:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwdFD-0003fq-7X
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:24:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwdFB-00081i-GL
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:24:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f41dceb93bso28197235e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683699847; x=1686291847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CLkXjPSbtemweQdDPb9uT+KkZSB2Kr7sj8H9cvz4kS4=;
 b=xgPmMfSPBD8yvjH3r9/79FWonOTTrLYFZ7YeynBhjdLueYahNiS76txO/mBxYtsldX
 Eh39dSpHghNRNTZELJ7uaFB28Peb+UXda3J08wea4CRMu9ZZqU8Jic4EcYR4wk6ARQrU
 howLMmj0MScDj892V+eVn/Tq2iSw8NWm9UQVooKPrb74ua/hzOxX+pPKGmB+NB/GWMTi
 6GFpPuN1AQndpWdqcEQ6M5Vmzn/q/PcUfi34XcDmM32B63P6Ljd1p50S9/jpF+WVHDjo
 o5aq+WAhl2ee1K13qDvBJ2tOcbT70zqB+UYd4vZcjNa0Y4RV7Xjfzpa8CToiSXZr6XLd
 PPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683699847; x=1686291847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CLkXjPSbtemweQdDPb9uT+KkZSB2Kr7sj8H9cvz4kS4=;
 b=h+TTBFZ19FHa9GF1molk+7FmLqPSHuAvonIPxijRRDBr4akJQqQMZshyPW1z8FSdHI
 /peEAHSTNt9eNePw6JiSa7K9mnN0BzLdwZg6y2GchMehjBNfNordF7+XE4Sa02OEuDhN
 5mCoOWHJN9pE5VAX7ye6kv266Iujk9wXIIgT+M7xrfb+H9y2epYB/MR7d8ZzBhjLpXl0
 swMGV65rkbyY4dDnNye0bw/Z2he2a/aabqMLJMjSBJAtZpGByE5g0k1x8QkBukWtaTcY
 Q8Zz3gsRzjEn/rjECoJFQjEaxGvafWq+8GhVFPfe0qU+BXb7Tftr8dNgeIpDdfu9eOjW
 unIA==
X-Gm-Message-State: AC+VfDyvQlqnt4R/nskRrDybz7wpd/at/nB/BcbFoyc2O1PThMp04kOI
 +BQj04tUpUmN8J5FqSAXP3aZGoSj3TtOdlqm/a/kWw==
X-Google-Smtp-Source: ACHHUZ49NSUhQlvA3Oj01isKy/zt7gzIhM1D2nq4bvWFjcg/Qw4f/EEx4KWUXboGko1KRrcCooWyPQ==
X-Received: by 2002:a05:600c:2049:b0:3f4:1a97:ab09 with SMTP id
 p9-20020a05600c204900b003f41a97ab09mr8146046wmg.25.1683699847049; 
 Tue, 09 May 2023 23:24:07 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 b15-20020a5d4b8f000000b003064600cff9sm16248050wrt.38.2023.05.09.23.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 23:24:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: gaosong@loongson.cn,
	yangxiaojuan@loongson.cn
Subject: [PATCH HOTFIX] target/loongarch: Terminate vmstate subsections list
Date: Wed, 10 May 2023 07:24:05 +0100
Message-Id: <20230510062405.127260-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

This list requires a NULL terminator.

Fixes: 16f5396cec23 ("target/loongarch: Add LSX data type VReg")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This failure can be seen 

https://gitlab.com/qemu-project/qemu/-/jobs/4253259728#L5579

  5/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/qom-test                 ERROR           1.38s   killed by signal 6 SIGABRT
 44/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/test-hmp                 ERROR           0.95s   killed by signal 6 SIGABRT
356/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/machine-none-test        ERROR           0.51s   killed by signal 6 SIGABRT

It does not always fail, depending on the layout of the executable,
which is why it was not caught right away.  I plan on applying this
directly to master before processing more pull requests.


r~

---
 target/loongarch/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
index 7adc1bdff9..d8ac99c9a4 100644
--- a/target/loongarch/machine.c
+++ b/target/loongarch/machine.c
@@ -163,5 +163,6 @@ const VMStateDescription vmstate_loongarch_cpu = {
     .subsections = (const VMStateDescription*[]) {
         &vmstate_fpu,
         &vmstate_lsx,
+        NULL
     }
 };
-- 
2.34.1


