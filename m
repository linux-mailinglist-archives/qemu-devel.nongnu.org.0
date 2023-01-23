Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F5677CC7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzx-000688-PI; Mon, 23 Jan 2023 08:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzU-0005vh-KH
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzR-0002M5-IT
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:02 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso8559411wmq.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YmXnlmeCDWnUzpUGh2Egb8JcHFR1ZUCOATZdrEkd6xo=;
 b=N1Odq7GvT6ITPZ5ISHD1B+ZLP0UjFLQJ9ckuY5CEygpozbRCHF14/1QMmqkguci/7W
 nAN8Xq3C6QK3057noCXrzk5XXOyXy2GRrP93zFTGVpAvxCVaE5c0X8DGGO0nERLEr6h4
 2gieaUydYSaUKUWn+jdXuQ8XYIsFnlTXTWIJuGyERTNDkpxJHAbOyKCesyCl0+HtmhZ4
 1rBSodRJ+TTNQiHlOb1IKTX0ZwC72Lwd5+C598i6Gl7znF0dLAjeh+sIlT0f9MyYC+7r
 s8vxWmiKK9+g31HRLl7XjmDc/7SLui2Ed4D3eXJaY9PM0s8qW66YcgF2qLQq7hiLCmGu
 eEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmXnlmeCDWnUzpUGh2Egb8JcHFR1ZUCOATZdrEkd6xo=;
 b=NbDWgxp+9UV6EyXEtBh+pu5HSeor+j9XzRtoQJBGjjQ4VYIIdkc4uzwgereReDc9To
 8AB7+2jiIWfQrX585tvaDuPq8FQg47aFfUZcq5jxynclqp/iJU2SwXKljf8W9sW3CUJJ
 +lidhR0HtBAgJnvIPpyqlo3B8SmLGQyWAifU7hhI3FIMGmAj1Ha/OGiYivd4QOz1H1Zc
 +v6jvVSymjtM13rnklJAFN3+tJ1jo3jTVtS9eK4bXuXfYpy7EuP6XtnQiGa6ZJf+9cDP
 291UYyAs35lSztLIIy2iu6/JFYMBZqzgaosSgeNW7eDztumv4g0PUi6vDPb71ErB+Ax+
 gObQ==
X-Gm-Message-State: AFqh2ko78Ikg02jDbUaMEmkRuvvi+dIyGi2c6vSGU49A2yVbsFI0rEJ7
 ePkoOq/+kUrY7gwY3NpWTL0gCQM/ye5pukYu
X-Google-Smtp-Source: AMrXdXtopnyimQGkch7dKzViWAUvsj9qsdlkCClzNYXJhAsHAG+2rWrRugptymuYcE11wkCvEUhdvQ==
X-Received: by 2002:a05:600c:4f56:b0:3db:1f68:28f with SMTP id
 m22-20020a05600c4f5600b003db1f68028fmr16064621wmq.24.1674480959820; 
 Mon, 23 Jan 2023 05:35:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.35.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:35:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Mon, 23 Jan 2023 13:35:31 +0000
Message-Id: <20230123133553.2171158-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-id: 20230111085016.44551-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index ac84bf02624..e41cb63daa7 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -165,9 +165,10 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
+    /*< private >*/
     SysBusDevice parent_obj;
+    /*< public >*/
 
-    MemoryRegion dummy_iomem;
     bitbang_i2c_interface bitbang;
     int last_level;
     qemu_irq out;
@@ -188,12 +189,8 @@ static void gpio_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
     GPIOI2CState *s = GPIO_I2C(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-    memory_region_init(&s->dummy_iomem, obj, "gpio_i2c", 0);
-    sysbus_init_mmio(sbd, &s->dummy_iomem);
-
     bus = i2c_init_bus(dev, "i2c");
     bitbang_i2c_init(&s->bitbang, bus);
 
-- 
2.34.1


