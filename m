Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C026D66568E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWot-0003RP-I4; Wed, 11 Jan 2023 03:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoa-0003FF-GT
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoY-0007cL-1X
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l26so10571224wme.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=Qs+/e/zaOY/tJH6z6W0tOYMKOhvkFd9y6V+YqgPBZonuTIpeatoplaVdgk5DpTYx9R
 p59vu8uTu/MlpaznSOIUN6F7I5ksUMELsLmLRzfyJfM1oyvhVvbwnYGekI/VvFt7wolc
 fyxcMxjHDbV1P+qk1qyfsIGbb0EYr/8b4qQ4C18KNNqpVGqnBo7TEX++7rsVT9btOGNI
 LjFkGF4cpvrG709+IKOvq+QhoktGMdFjkIzGOJRY6apnmi/5NreOgSrPxnuiq6fBvAic
 oPxOTCv3Shv0rlRZJCqQ1kRG6VK9uAL7pt9rqfY4mKw+wdEe6uUGjNC0v1VOeUmZu6ha
 UQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=JIoiIxxbtfZZy2xlUxSJnGQ4sfWgk/zNiqp2dMJ51k1sJBJtWRpLUL5V+iKQrNo7Ab
 AizQ8hcijVThPUuCmLdaxt4Ujb+KW7ztzhNP6kx9aPOJTXEvRgFTL8GyP2MPnRzG90AI
 Q52pTL48gVbFbMylb/Vm+nMoF2yMR/AHtzw8k9Odbnl4SgKHgrKgwPDrFWSenq50RDdN
 5haCqVwQb0YqXIbsSeF2kjW834lLi0LVdUQsXvymPZTkL8PCvEJSne4NV+uS3PO8sWQL
 b4hIYkKgIMsi38eAn+dsBQR17op2DcADvwRhArwc8C+XHkv++Om2p5gcIKvCLPLNB94h
 lsqg==
X-Gm-Message-State: AFqh2krdXoBY0/KpMndGCbYNx2DO8jevJxDYFzpBusKkgTmimJ7lG9B7
 VAH7WKMUUOPHOo3KZEcx1kIbxXVr1pdS3/n7
X-Google-Smtp-Source: AMrXdXuuMuAg00zaVcj1YraGHF9XJZm1E86FSzELXrJU6wGN3B6kr0ZMNjTg4DFjgXhUnqmBgj/Uag==
X-Received: by 2002:a05:600c:1da3:b0:3d3:4dbc:75ef with SMTP id
 p35-20020a05600c1da300b003d34dbc75efmr51264789wms.17.1673427028123; 
 Wed, 11 Jan 2023 00:50:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003d9862ec435sm5963864wms.20.2023.01.11.00.50.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Wed, 11 Jan 2023 09:50:13 +0100
Message-Id: <20230111085016.44551-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index ac84bf0262..e41cb63daa 100644
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
2.38.1


