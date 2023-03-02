Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A006A8C20
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrd6-0008Jd-Pz; Thu, 02 Mar 2023 17:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrd4-0008GB-QK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrd3-0000AQ-2O
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g3so603618wri.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TfkteHyoZIi6Uoo7SJxMZBpIZcoshRx7ee998udL3k=;
 b=tsalF1xjU8yaQUVbgPYKOG+z4qPNySKgIHG0bmWLVnTDLSHPvzBOJtnBwdZe3A9/am
 OPstSrie/iQOcv7Z6p+kcNIdpAi0muFIwkbRI0FZPTgTaqFYVsoFyhheHOBJ2aqr9K5y
 nG+VYRHOL5LHTOgvoVtiWrQzRCf04vMM/FgufJ6FOgpve2/XdVCdRJHnIkUT8j/xNEAN
 6QO1A+4DOqPYNB8YKtfObO4B8uVa36Xbfqe7gyuoWqRdDweBEdzqYBmqrOcF//r8omzp
 l4XqJK3tJ631oRqIQK+gr3JXD3s7Z17BQSYthpYCrioyKY+ELrFP4NIYPbVzR/JJgwRt
 so3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8TfkteHyoZIi6Uoo7SJxMZBpIZcoshRx7ee998udL3k=;
 b=1tg/mdwIjMe/aoRNUdUYc4hK2T/MQB+rmmNIvIBmxTavtNujqnqrWuhwW7RLcQ9D4E
 kYXMfiHITyni5HPTBDO8a6QwR+NHMdvEUEJi2wZxtZ4Bt+qjF7S3kbJ3f0z6R9Afv24o
 bt2Xb2RiEYEfji5sTN7dqfHSZEYA0jdAjfDFPoDGiUSEwtZznwTT6Ow/2TPeWM1DLnQO
 xYyxvCSTYEqoYswyZuLgoZNDRVwMgO6oNt6vyKt2FoHtRJ8Yu7itgBJgm5XwetdkcKvz
 joAoeORaXVVuyTlO9OYVpclDXufsvEj7VWGhZoSYhhRjTLddU2krAkzglFsUjoMpXdUA
 cnEg==
X-Gm-Message-State: AO0yUKUJAz8t6lWAq/uKuO/OFIbQMSchFHryN/ZfW4IyfTp40GPpi4Xh
 81TWB2zlxqNGB0c7fWtN0mGcTAM+w6ADvOYl
X-Google-Smtp-Source: AK7set+XWCn3rgfEs4Rkx7tGvgHmBbCcyQDQAqYlpOdz30OqxNB9rP4MdRwLCjS9pd9G/bzw3UY5/g==
X-Received: by 2002:adf:db49:0:b0:2c5:54a7:3630 with SMTP id
 f9-20020adfdb49000000b002c554a73630mr9366567wrj.46.1677796943323; 
 Thu, 02 Mar 2023 14:42:23 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 k4-20020adfd844000000b002c57384dfe0sm463992wrl.113.2023.03.02.14.42.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 11/18] hw/isa: Simplify isa_address_space[_io]()
Date: Thu,  2 Mar 2023 23:40:51 +0100
Message-Id: <20230302224058.43315-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

We don't have any caller passing a NULL device argument,
so we can simplify, avoiding to access the global 'isabus'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 9c8224afa5..3036341d3b 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -252,20 +252,14 @@ static char *isabus_get_fw_dev_path(DeviceState *dev)
 
 MemoryRegion *isa_address_space(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space;
-    }
-
-    return isabus->address_space;
+    assert(dev);
+    return isa_bus_from_device(dev)->address_space;
 }
 
 MemoryRegion *isa_address_space_io(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space_io;
-    }
-
-    return isabus->address_space_io;
+    assert(dev);
+    return isa_bus_from_device(dev)->address_space_io;
 }
 
 type_init(isabus_register_types)
-- 
2.38.1


