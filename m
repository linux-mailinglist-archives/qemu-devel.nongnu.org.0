Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3D6980C1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUf-0001dl-Sx; Wed, 15 Feb 2023 11:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKU1-0000Ad-LD
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:15 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKU0-0008Sj-1n
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so19725347wrd.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5fxrywMmBKVXBb0mf5wiJ7U1A4VldYjXsfGNyFlwAQ0=;
 b=i869EaJR7lzLgkV61QLdpaCpz+WXW0PrZzeZjuZzzfVdfFur7cFg8W3RnbIH7LrWuE
 GWeVtkvMcApqDjL0YZfhRJIbOVq2q3+QG6qYCDI3oYpGNcNW/I1oSO6xNhJToUnXVRFx
 hcaGCUIXPg9kyqt2P3mlmir6w8FBU4kffEHHj6UOjrb+EmL2tojWMS3UjEC9ILB5diOa
 CpjHs9DHQOk227ogdDkba2+GFUuVGbjpi3vwKNZTaSGYs1j6K1lo0OONF74Id92osYAa
 +BrL36HqBW2xcFXt/WP3E/R8L3WE1yBng6mzTUoq0EcNgQrzzSJkDJQAp30AKBfcqH6M
 AoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fxrywMmBKVXBb0mf5wiJ7U1A4VldYjXsfGNyFlwAQ0=;
 b=FldVSxH1slZ9JuMMSYrRctA3yZ8wKxzgrNCejZjy3YfTJO/lTiHaEiKUAv4fzJBH57
 6H+QCdVDyfKwPlZE4YlZGOFBOVamcAJXheZpgkJQIE0+mTgXo4kNscVXXok1+HAkOZ+A
 KM8quYf+zwMUlatKevV8708cOgP1beMrj4KXEZRnwxpIbcxfJ3q76zhrK0aV2EvdLCOo
 PvULMLYWsUKM82D3wnxa5VHL6NGWvZ9wGehQ0sI+27j+MibhbwUvNk5b8hrcgqBhLYBF
 DxAT+BjEBK7iQInFmlIgd1QufO3/Sxenbrs+Z11y396ftA47jZmS9mkVMciU/fIFiAjU
 O5aA==
X-Gm-Message-State: AO0yUKWVp8kzClzBvGFuM7SGd0eMBJRJjZuUtbazZ5IjJT77dA+M6F5t
 0PWv5A6js2tk3JjsEV9ITvtilDTL+RA3DVgw
X-Google-Smtp-Source: AK7set/SoE3i+iVExSlYiUWgM/G/FYVHsWWTLzCXt+02gxBHzfnDDYLDwmQYSUcAQ+Av7LMZOp2OUw==
X-Received: by 2002:a05:6000:1050:b0:2c5:5936:16db with SMTP id
 c16-20020a056000105000b002c5593616dbmr1821468wrx.42.1676477891194; 
 Wed, 15 Feb 2023 08:18:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k16-20020adfe8d0000000b002c54536c662sm14461986wrn.34.2023.02.15.08.18.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:18:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 16/18] hw/isa: Reduce 'isabus' singleton scope to
 isa_bus_new()
Date: Wed, 15 Feb 2023 17:16:39 +0100
Message-Id: <20230215161641.32663-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
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
index 59f98472d1..719f2e96f2 100644
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


