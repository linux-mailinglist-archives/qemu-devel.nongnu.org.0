Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CA766252F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqz5-0000d6-6C; Mon, 09 Jan 2023 07:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyp-0000UZ-0y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyn-000774-De
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso6827933wmb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvqyemKU409q4RdvR4LnbGo0yAdbFPnALE0Z2BjpZPA=;
 b=smiB4Wp1FoEGvqd0hHv5B9HuqOAAwVOeF4O6Dvc/Abdx4nMltVpz0tYFN3pzwuo5jQ
 W0FFABt5Utn+bq+47ItTS3x3Z0UVYic7iPZ/fJE5P4BfLTxxaW0M/iIJovoHneHxfK6Y
 ZmEXbcA8XYONJiXy//DyEsriafDz2omiuiGUu/1nCtQzHys53uE9wQTccaWVz9e2f7Hi
 etAtrztaoY5naqlnWLvULO1tmnKVzjq4nok3AvtB5FfLdxuIM+xoVAOqAMhasO6Wooa/
 dJ3/9jeSCggWvitHXc3Hk+VaNHx9N0JzhWJ8HNfX06baqSlShvjf8Bdpb7z3DE+GaNJ5
 Mkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvqyemKU409q4RdvR4LnbGo0yAdbFPnALE0Z2BjpZPA=;
 b=RJA40aCa5jZWc2cPguiBgzJoGl/FSVe4Kmx/rqHerjd5oZJxrAXbWCKTFVkkXeXrSY
 Mb+cmlBy7QAfG5F6zE49KRxgLKmvzHmZJjb5mXV4gk+uIoA2UV8G2As19U57n1uHuJiP
 Mou5Ky1piv4r5/aAk567/Q/kBmWk0TFvpaul3MXYF3z8PoSmMVQmbRRbkeyYs5NCQldc
 9BAiajzVxLhcRwKuEg2Fg3++s4RU0U60Svr9Sth9HfG20pCXetcwBC3dCGd/9O7lOej2
 rjXxAGYn+TxB4Yk8mxvHd6k8gOcND4fT3sYreTwHsHWDNQON4W5T3Bw5TS4bZBNWsbsd
 FI7A==
X-Gm-Message-State: AFqh2koCNxBSTisjhe8R9kW5M2aaJYcE7yhtR9QF5J1ZEIcCN7W28pEh
 TAO/ZKjI9Azkl+0Rd+8bJNeI1VL6/6NLXAMn
X-Google-Smtp-Source: AMrXdXtLm4F0e8UUoWguiDWwkgz92aKux/8RVpSUiK7YCIBlASNDAejLDkUc7oiHY5bAe1zusl7cUw==
X-Received: by 2002:a05:600c:5405:b0:3d9:ef75:ea6e with SMTP id
 he5-20020a05600c540500b003d9ef75ea6emr2507566wmb.38.1673266215960; 
 Mon, 09 Jan 2023 04:10:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003d9876aa04asm13352736wmq.41.2023.01.09.04.10.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:10:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 21/21] hw/block: Make PFlashCFI01 QOM declaration internal
Date: Mon,  9 Jan 2023 13:08:33 +0100
Message-Id: <20230109120833.3330-22-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Convert the QOM PFlashCFI01 to a forward/opaque pointer declaration.
Only pflash_cfi01.c is able to poke at the internal fields.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 2 ++
 include/hw/block/flash.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 4e74c9e0d9..56f81d3f2c 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -59,6 +59,8 @@
 #define PFLASH_BE          0
 #define PFLASH_SECURE      1
 
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
+
 struct PFlashCFI01 {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 20e5424525..3b7c40afb0 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -8,8 +8,6 @@
 
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
-OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
-
 
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
-- 
2.38.1


