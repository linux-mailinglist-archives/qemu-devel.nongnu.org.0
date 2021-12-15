Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B7475793
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:15:00 +0100 (CET)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSFP-0006sZ-Fr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0006jK-Sr
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: from [2a00:1450:4864:20::436] (port=38842
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiR-0008Ps-M9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id e5so3955038wrc.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=im9w3HrkyiMx/80cKplH47XGgi3jaF34akWwEvzEQuQ=;
 b=A0Y8CE+rRJmX2WMr+N7Oa6ImS61afUVdcFNu0VkzCu7BUZn+/dhx0YjNJwado00z2E
 ll7wgfi4XxfVZ4DMyt0QWO5uDVtsNm0KgHFwPvWPnMBxkPmHI7BrRj4niIEwVWfYHN8L
 ua004q/h4uBQjzpwLQ2UwFvF9pzdsIaehgin8TD7f8PL7c/1Y2gR2Nzlam8LUeAAya9r
 7n+wdLIdJr/Hq37yWkDeYGMwUh5UceO7TdP1XPuiLKYgbCyBjqmTMZiuPKaShvC1Bnjd
 k9BKxCTMH8QYJNA97aG+TNCh5ZsRr4dxGVN5461n+Yd0i1Wa0BA4n1+7JPoU3801CRXM
 /45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=im9w3HrkyiMx/80cKplH47XGgi3jaF34akWwEvzEQuQ=;
 b=N2JOQfIpo/yOtNKVJNiZotW8q1zb6EtZGKN6expd4JA7SHPRmeGVf3S7sLZ7a7Q3dn
 9/uS+5HV034bw2I4tuu3gLwRbSRbjAzSCd+W5C2U/orHSQIQeBqcjoXZasFmXWSaROHP
 CK3yx3AVELVUbScZBKiGVDorBZpd+DdhqUcPG8VzMNVN6WjUK4bG+f2g8sHigleEW0V2
 ijT5Ney0hFM+YsBKsJ9dadur48sQ2C7Z5jIIFH/o1EEY6aSwJ7EWolnfZHuqJhrakcpd
 x5U1M85CsvAen7BY+9MQ1cFbfczVcIXg5CHgnGrycxA54f1//SCUl87I9lg03jZ1cwHI
 sbiw==
X-Gm-Message-State: AOAM5305y2ElZ+gkfquyzv65SrQorA8SQTzbm6WNf+O/635EGk3fBzXU
 Gyqp/96Eweu/wQsYIx3C9tOX/tBMuAYV9Q==
X-Google-Smtp-Source: ABdhPJz8MOtHXVXgPBGh24PXIK8W1BxkG6BNeUKRcfkJHiyduRVGireAyBEDdnRASaHt9WlO9SBUyA==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr3830358wru.239.1639564854398; 
 Wed, 15 Dec 2021 02:40:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] Fix STM32F2XX USART data register readout
Date: Wed, 15 Dec 2021 10:40:22 +0000
Message-Id: <20211215104049.2030475-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Olivier Hériveaux <olivier.heriveaux@ledger.fr>

Fix issue where the data register may be overwritten by next character
reception before being read and returned.

Signed-off-by: Olivier Hériveaux <olivier.heriveaux@ledger.fr>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211128120723.4053-1-olivier.heriveaux@ledger.fr
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/stm32f2xx_usart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 8df0832424c..fde67f4f03f 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
         return retvalue;
     case USART_DR:
         DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->usart_dr);
+        retvalue = s->usart_dr & 0x3FF;
         s->usart_sr &= ~USART_SR_RXNE;
         qemu_chr_fe_accept_input(&s->chr);
         qemu_set_irq(s->irq, 0);
-        return s->usart_dr & 0x3FF;
+        return retvalue;
     case USART_BRR:
         return s->usart_brr;
     case USART_CR1:
-- 
2.25.1


