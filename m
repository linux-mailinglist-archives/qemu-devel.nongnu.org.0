Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676764467DE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:26:54 +0100 (CET)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2zN-0000Dm-Fp
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2ug-0002Vv-Bh; Fri, 05 Nov 2021 13:22:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2uZ-0007DH-FH; Fri, 05 Nov 2021 13:22:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u1so14780426wru.13;
 Fri, 05 Nov 2021 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d3pfBfUWEkr1HXpj/BC7XFNX+5ez4tvt7AfZVzlC78A=;
 b=KxSOfKAtNVnLsGosZ5y8Vw1xxDNdMoLRzrJB5mLO3F6iAb8SSNUV0ZbpexiCav7Mkn
 jQoPwJP0KzHa4AN8GfQhNRiskX0ncuVUx8M6xWzs4Yf2FOatyu4H7YlKVJtsHMwdbV0K
 dK1U/hVJrPDt7XuPE9fk14ewmNrxD+amLQEuYHafH2una/oA0ns4HBrxdAWr7UDQIJol
 juXpMU1V2U2aY0aaewV7zmE0s7eIrg+rNY5ETGvGswejxpapiI1Zw3Xq8Eup1ucJGUMs
 9J4OWPoW+bbbA0WBx7HHOWRsJhXBKFsZrbn2WbvpqKho029yRfDC7bDc2AfoGA3G/FJc
 Piqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d3pfBfUWEkr1HXpj/BC7XFNX+5ez4tvt7AfZVzlC78A=;
 b=M4tUVFyTwsBpPus8Ws6Q3DkODj8qmKKgDnVTjeUyrEdf3NF5KriJ4/WCJMFC+lsoDd
 ehXIv0ABSAy8PvCnc1YFAe1T/pO5uOR7dAIaBeR+HowqLLwav/S12wGLJ5kmGRuieYWJ
 CAs1waDI4gmUKKJUTzB4jWYIhOdmTIt24IHcs2w7wQ/Tj3JcQcs+uJXXhXIAx51Rs6+Z
 99mM1KuJLb/FdIu5UiKF8cLWBOPqavfAlAUAxLwFeJNRDCP5nopczt3luZbATTZWHW0A
 LFrhc/sKWI6LrOuOVO5PqHHbZa0je5XwwLQ4+ITTEHySOMTHm18JImFDQJwsvWf0xeCY
 Vmjg==
X-Gm-Message-State: AOAM532DmVVQ6kxolzcSI2TWbgoIZ6mQYsOutCHRtYWZNHSShDpfJWqW
 TwbX72CjtIB0Czfk2ZSSk5nHzSNGu9A=
X-Google-Smtp-Source: ABdhPJxSRofpgzzyLJ/LHocsl6qYthoyntcVE4dyjS02VB4BG3qNEhRDqBzJon9IMtgQzBDT7wMiqw==
X-Received: by 2002:adf:f990:: with SMTP id f16mr68147221wrr.128.1636132894197; 
 Fri, 05 Nov 2021 10:21:34 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m125sm11628641wmm.39.2021.11.05.10.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:21:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/qdev: Correct qdev_connect_gpio_out_named()
 documentation
Date: Fri,  5 Nov 2021 18:21:25 +0100
Message-Id: <20211105172127.224462-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105172127.224462-1-f4bug@amsat.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_connect_gpio_out_named() is described as qdev_connect_gpio_out(),
and referring to itself in an endless loop, which is confusing. Fix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 72622bd3370..5b88c8b9dd3 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -497,7 +497,8 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  */
 void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
 /**
- * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
+ * qdev_connect_gpio_out_named: Connect one of a device's named output
+ *                              GPIO lines
  * @dev: Device whose GPIO to connect
  * @name: Name of the output GPIO array
  * @n: Number of the anonymous output GPIO line (which must be in range)
@@ -518,8 +519,6 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  * It is not valid to try to connect one outbound GPIO to multiple
  * qemu_irqs at once, or to connect multiple outbound GPIOs to the
  * same qemu_irq; see qdev_connect_gpio_out() for details.
- *
- * For named output GPIO lines, use qdev_connect_gpio_out_named().
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
                                  qemu_irq pin);
-- 
2.31.1


