Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68355B823
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:19:50 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j2D-0006bz-PZ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izM-0003eV-9n; Mon, 27 Jun 2022 03:16:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izG-0003sn-5Y; Mon, 27 Jun 2022 03:16:48 -0400
Received: by mail-ej1-x62f.google.com with SMTP id pk21so17190696ejb.2;
 Mon, 27 Jun 2022 00:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TR7o8npeCsSKFGJvppVbOeFp+PwNckjxSIksu1sdxqw=;
 b=WrmRulFkL2RwWM/7zfLELAmBqEM0H5rnPq2lnZZ8irfZQmpV8s3jjg5dvw5+BGBQqZ
 jBVrbEf2yuR2QoB0ATmdFm+hHtJPttmo8+Rt+zWmIVxvounZuaiAAR1XPLuM648CLo+m
 nnrntiEAe49zRvF3VLeXzGMKWa2Fx+enRSECicHcu7iKdf9H7C9ANhGvIPco/P77mN0D
 SPZp8y8keoc7CYNmiqteg06DOyg6bGLj/DHkiLmacspKOTxAAZ7/82I2EhUANbXUmc6V
 x98KSQ7bEim/kRMNzPdMiVj5JrGevy90yx+/y9/PdhN/PHtwbNCEpcAD5FrT6t00b3Y3
 2oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TR7o8npeCsSKFGJvppVbOeFp+PwNckjxSIksu1sdxqw=;
 b=UysTiY6PltXg+MGRmH7KJimFSgPwQoCB6I/SEV7Yobn7TAq0z4HlA5EKOYMzyzgO7R
 XTY6OrdSEH2kbsFKXqOkeM4gXE4XM+IKZcCO/o3dHRO2Z86JRuN5njlnXIGguA6GU+7k
 e5wjgghDXA9gLdOUzXipdOiTlcWCXrilzjYYAYEVj1pWzFxLIPMqohZnOrdoalgoND0a
 Fnw6I7n43M3mudazBrIXG9TaAXTKrFGJWb58js/8VAFy2/dRgvEwQ8Rc/qGmgvTSzGKr
 Oz+g1Kqu3HF3zyTVOakJjP80QvZ84oV34dbMj0FFowPkoyvB8RnhjKZAK1LGSlAXpB2D
 UQ+g==
X-Gm-Message-State: AJIora/EQv/PYzpv/0WgZy1M5N1GMlEvF2yad2/P3QqzLae5St9B4z+j
 ++ExRY7jEnYG/jvcDp3WipDjcdi/fW4eVg==
X-Google-Smtp-Source: AGRyM1uxYoDvK44MM8BNT49qTILHCpv7CQW6rNOlnMmM8lrns6INoxIdV50l9mvlaftIEOuHvGO+vA==
X-Received: by 2002:a17:906:2a86:b0:711:d8a5:cb0c with SMTP id
 l6-20020a1709062a8600b00711d8a5cb0cmr11566299eje.426.1656314204116; 
 Mon, 27 Jun 2022 00:16:44 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 01/10] hw/ide/piix: Check for presence of ISABus before
 using it
Date: Mon, 27 Jun 2022 09:16:02 +0200
Message-Id: <20220627071611.8793-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an alternative solution to commit
9405d87be25db6dff4d7b5ab48a81bbf6d083e47 'hw/ide: Fix crash when plugging a
piix3-ide device into the x-remote machine' which allows for cleaning up the
ISA API while keeping PIIX IDE functions user-createable for an arbitrarily
long deprecation period.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 9a9b28078e..e8f3abc4b5 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -136,6 +136,17 @@ static int pci_piix_init_ports(PCIIDEState *d)
     };
     int i, ret;
 
+    {
+        ISABus *isa_bus;
+        bool ambiguous;
+
+        isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS,
+                                                   &ambiguous));
+        if (!isa_bus || ambiguous) {
+            return -ENODEV;
+        }
+    }
+
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
         ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-- 
2.36.1


