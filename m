Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9902934E926
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:31:04 +0200 (CEST)
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRESV-0003OX-LQ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENg-0006on-4o
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENd-0003cs-TY
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so10311905wml.2
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j2HV5Z8jdtLpsP16bz3qFqgSmKj+sdmtLcdjZjBDvgY=;
 b=qEdKpTBYNpKOyajBDYkPCR+mpDBRCubGKpooQiFbT5urIigKfyKiAbesbgawFpm5nk
 ZGnPGXSwL/V45BhracK2Ciod2mTIjzZmYGz9h3QEubncsLacI1+dMLB40tTQ/0G+YYOP
 oy+FMF80wuhJv1o6kQ6kwPR+WtANrpPggronWU5teG0AFiNHvrYFDg8MlnHx4z7oi5Y0
 DLnIr/7G+OQAjiUAA19dElPI/PERP77p3LwNc4w+wTeclok+Nqy+qlskIk+5Veu4odnz
 /CnkT2ygYQVEB/XogDYbSMGriNOzCeH41QSyIdNHX17kYCprOIV4EMg/XIDa8eK7qWxm
 TJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2HV5Z8jdtLpsP16bz3qFqgSmKj+sdmtLcdjZjBDvgY=;
 b=VLZDPS5g6oe+If58MrSRdvHu8tVk0vAy2VKMKJ2LOJLTEtc7VNOg9O9iswEzz46u70
 B1yd3KICVaT0uC0mkla3t+vIzkyPs2p5T7ju/MzKm3KHQNWQWVjG0xpo7Vpr5VT08gZ3
 kAA08D9SryYcuwDhvLQKaW9ENe1W11Uo0Cd1ULBnpMqPyngE8ug3lVvjDcAvSJnXYMMg
 2Hrm7ohFw+z8IcKrnBZK842arTYYEIGJvI0sZ85e9QJcxqGXkmvYgIeIHqgmeKgVHtR/
 a85Ib6Z3QBsdmLCI9qsQSrUzm7hJ8DdAM5jpeQ2SOpw/eeTya78CFDLCiAaqKWnWIcdE
 gSyg==
X-Gm-Message-State: AOAM530L5Otno3NhzJQRgdHnqeC+aGSDMT4boX+skCMkMx4zB4Utxq6o
 0a2FCgUrx43Tc/tWNJfJU0X75IhpiRTUi/pT
X-Google-Smtp-Source: ABdhPJwgrd1Qvke35+Iow18pNfMJf3aJnsvqGC7b7hW0218JSrtoyRnno5mPbE9fF1h/q9PyyKItxg==
X-Received: by 2002:a1c:2308:: with SMTP id j8mr4237349wmj.45.1617110760476;
 Tue, 30 Mar 2021 06:26:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm33140892wrs.68.2021.03.30.06.25.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:26:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] hw/timer/renesas_tmr: Add default-case asserts in
 read_tcnt()
Date: Tue, 30 Mar 2021 14:25:55 +0100
Message-Id: <20210330132555.8144-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330132555.8144-1-peter.maydell@linaro.org>
References: <20210330132555.8144-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

In commit 81b3ddaf8772ec we fixed a use of uninitialized data
in read_tcnt(). However this change wasn't enough to placate
Coverity, which is not smart enough to see that if we read a
2 bit field and then handle cases 0, 1, 2 and 3 then there cannot
be a flow of execution through the switch default. Add explicit
default cases which assert that they can't be reached, which
should help silence Coverity.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210319162458.13760-1-peter.maydell@linaro.org
---
 hw/timer/renesas_tmr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index eed39917fec..d96002e1ee6 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -146,6 +146,8 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
         case CSS_CASCADING:
             tcnt[1] = tmr->tcnt[1];
             break;
+        default:
+            g_assert_not_reached();
         }
         switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
         case CSS_INTERNAL:
@@ -159,6 +161,8 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
         case CSS_EXTERNAL: /* QEMU doesn't implement this */
             tcnt[0] = tmr->tcnt[0];
             break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         tcnt[0] = tmr->tcnt[0];
-- 
2.20.1


