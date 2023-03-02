Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DDC6A8C15
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrdG-0000In-F9; Thu, 02 Mar 2023 17:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdB-0000AR-GY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:33 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrd9-0000C4-Sw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:33 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l1so571996wry.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Q+kjUrDqzW8TbJSLEkGuQbfUY5rqxaKrpCoB8EhM+g=;
 b=CFRn4QrCQP0ephMH8ZlvYYKoKbL14Qc29VFGAImPEw132JYZxrCwN7w1a3fmjIEY7E
 /UDQZTCWy3hkOZgi1p/2n0LGTCNyCEuiev8sDfsfVVMO9Cr/dDvviXWMkWL7bFot6heJ
 /veZ1pza6Ze2Zn+xQk8/xqeLk2X1X479RQZuKNXggfsONg1LVDwwIUXMaLqodO2t5LhJ
 pWNvW3EV9lCVb1YTAYDN+G4omdniDQin+20LuHIcl5mD+me7TanIHfljWmO87n7zaxiK
 DLXDERXF/9qhSnSSj0AgZszw/T6UQe7cvMrf3Hy/kZ0SB2NnUsCe6QfBA1lzgswABxKz
 NTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Q+kjUrDqzW8TbJSLEkGuQbfUY5rqxaKrpCoB8EhM+g=;
 b=4Ypr5yDSs8pUULrIOj9PEx+Sky9tWW8MniF1BbNKaoGH2ANeASbQP6IU0JJH1gZZW6
 yUbBkEd/KeyjY6GcfAcgM6XQZzbp/6SzoeZnMhq6Tr2kvfDaQsrPrBSLxNCeTM0QIAdc
 p3r4PpBHXYtJnf4slnIrkAsp2G4biJobFR3ohOPtR3wWhbfQf9znL63mdqlHlsCIYTBI
 4eIUMpCtE/RGiYX2Dhoj/1y57hguk7MSWLB3vLnFKnnON7VBOYG5vGGfkdm968P67q8b
 zP0Gwdi+QW22RB/k0Wk2In4z95+C4WaHu2GzKuqG3lehceDJZgEOpQ3Jsdzy/+Y4HR1K
 cSKQ==
X-Gm-Message-State: AO0yUKUmNoOLlrDgQTiDDK6BLM2M7a8RoJ46ANeRuSkc05h3I+8HqYiN
 GPaw3wq1y4io+Lxq9dF8lso3sYFFT4QZP+ZB
X-Google-Smtp-Source: AK7set+ff+wqRGtCwcgrZobmTeyHPBJruQ3rkkuesD2kSX6/ISuPlKNd749tRXKOFmc6vFwcyQx9oA==
X-Received: by 2002:adf:e5c1:0:b0:2c5:5d15:4e25 with SMTP id
 a1-20020adfe5c1000000b002c55d154e25mr8535246wrn.16.1677796950390; 
 Thu, 02 Mar 2023 14:42:30 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm477084wrj.115.2023.03.02.14.42.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/18] hw/isa: Reduce 'isabus' singleton scope to
 isa_bus_new()
Date: Thu,  2 Mar 2023 23:40:52 +0100
Message-Id: <20230302224058.43315-13-philmd@linaro.org>
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

Previous commit ensured when entering isa_register_portio_list(),
'dev' is not NULL. Being a TYPE_ISA_DEVICE, the device must sit
on a ISA bus. This means isa_bus_new() as already been called
and 'isabus' can not be NULL.

Simplify by removing the 'isabus' NULL check in
isa_register_portio_list(). 'isabus' is now only used in
isa_bus_new(). Reduce its scope by only declaring it the
function using it (this will allows us to create multiple
ISA buses later).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 3036341d3b..8e3ca3785e 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -25,8 +25,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
 
-static ISABus *isabus;
-
 static char *isabus_get_fw_dev_path(DeviceState *dev);
 
 static void isa_bus_class_init(ObjectClass *klass, void *data)
@@ -52,6 +50,8 @@ static const TypeInfo isa_bus_info = {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
 {
+    static ISABus *isabus;
+
     if (isabus) {
         error_setg(errp, "Can't create a second ISA bus");
         return NULL;
@@ -132,10 +132,6 @@ int isa_register_portio_list(ISADevice *dev,
     assert(dev);
     assert(piolist && !piolist->owner);
 
-    if (!isabus) {
-        return -ENODEV;
-    }
-
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
-- 
2.38.1


