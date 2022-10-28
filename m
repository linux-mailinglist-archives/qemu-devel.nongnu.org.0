Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34303611167
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:31:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOT3-0003nB-IK; Fri, 28 Oct 2022 08:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSF-0002tb-MP
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:27 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSB-0003Ko-E4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:18 -0400
Received: by mail-pg1-x530.google.com with SMTP id 78so4670780pgb.13
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=229FhV+0QZxAtJMQNpfAmKK2UoQv87tcNzSVNIW4T3g=;
 b=5PepXQtfw37OHgLTgMUXoz7fSC1aW21F5FO1o+i8MSbq/wGHFFs8lS1gjHkfHM4P/x
 6AVyY0wkw4AR8gudxeGQqVR4X6m7h0whPyRutO3lUfUrx0SUAoL1ObZbaL389uGNIHYx
 SPCn3vTErhJeRA48qC3KzubOIRDI3UVLI6XDGg1BZ1s4yvsUppmUj6/1Wl2JTEGcz47Z
 qm5JC4kz7kfgTH+gZPA3lpGc5q864SJlGDWUIL9ERYSj3/23jf+WvRitwOVaaKC3vK5M
 uP6KtuSTIw6ZUxCRu9Nn5m6nqjlUbSy/Lz59N3OjYIF+ISPWw1S45eB6eUhIZXIF2jcC
 7ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=229FhV+0QZxAtJMQNpfAmKK2UoQv87tcNzSVNIW4T3g=;
 b=k6zkQAB8QLwU5VavScZ0SpUba0VNbpjBYxmw/KS2frI+cwV7hZZ/g8cN6LQ8jLUnGa
 TdQdcuowg9Vu+7iyDzoxXkg4qQkytw/I+9waL+zO1akgfN4RwvY3XVBjzbEktOp8yn81
 CViMfDkmpYf+L+zdqdK4gQYT465ZQAOtWNC+/uda/x2GfZR9H5WhOUT/ba+RiIdHgjIp
 0s1yonexWJ/Pdic7dnaddVIEVfdmhPfLmR0d8noCNVYaD3xLqWh9mpgsMgAyVPhVEaoU
 sHu32Q5DATuWYULjuXIQVSSPStJEOj7Vli2//yUIjs/MySV5Mb6hgaivuh0TQ9rdAoRb
 FquQ==
X-Gm-Message-State: ACrzQf1WexI0Y/wyfzht34M3vq5FWbC9ZEEmFFNXwhL7pRH1SXwkIBMF
 BckAqvjrBcEFUowsMPSw8hL94Q==
X-Google-Smtp-Source: AMsMyM4LDMehs8ZZGXy0IzcEjGfmfk9i0kezGzuWRkKAxdTtAO91xFWukYxLqSZFZKLwvjh1SkHvVQ==
X-Received: by 2002:a05:6a02:192:b0:43c:a0cb:44d3 with SMTP id
 bj18-20020a056a02019200b0043ca0cb44d3mr48209753pgb.139.1666960033149; 
 Fri, 28 Oct 2022 05:27:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:12 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 06/17] eepro100: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:18 +0900
Message-Id: <20221028122629.3269-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/eepro100.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
-- 
2.37.3


