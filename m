Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31461429E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfcy-0004Lb-3v; Mon, 31 Oct 2022 20:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcr-0004Ky-2i
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfco-0005ep-LI
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so17465451pji.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=NUJ2c86KAf1DvwqIIo7mBXJMgXqo46/vcTBbHVM/KSSj9x10BOxyzfseGFg5/CDftK
 YDd3qlN3wikr1nZYTLwEQkAsr5k5Z7plJGvdprI8+SGf5ei6QdR0krKd0ULUj9n7JpMP
 CMp0F5umsIstA1lXq6eyG/FJghpnspMp3CYkQjRHtnLiy5UeYxrNbzm4g3c5Z8tSeAP2
 wm0cAxIdy3q5Z/hxxUhYOqKvPKZaUurG8zoL5lMp3p0+EJndRQ5YVwOpXnUmJNktKovm
 V5hmuNCRjfKGHNWIhfJlF+cEg0jj4lNFDjtmH0CdsGsvt2+Wlj0n/nK5exYjJ3AZBNFU
 ZhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=kQQiyA4/T6YwSu8bZ+bQU1piyNc76VgBI+pU9OrrmQTGBuJbpDQcuxJk7jGpQk+eWT
 lQx+CX4rVqWfwzTN+c8Mt9Xp9qYynEwo1pHk3z+tNVt5a37UfCDH+5DUcaYu7KTV1tq4
 NjYoqT7JIB5BCdqsBmlOXMtY6TcOR+fS8bdq/G8fBb+1nlT1YX9r811rfqWEAv5JJYvq
 cT4nchzqe2zz2QJLySiHl/3l2Wo6WLMtYv6Ph5qCG81RXowpsg8MQt44InpbLfQvVixQ
 fcpab3a56YxtdrkoPGFDkFG/uh38RO9vEHhncUtSmAuG6lgAyBg5F67XMcZFDHG2+zRx
 p1Bg==
X-Gm-Message-State: ACrzQf0d6DBaWMYYT2KYJ9J7V1iGh+fQXosr2oJ1q7IxM37yfHKqtn97
 xlcA4KPNb/yEJBuSZ0y8wL+Oh8mY+oGP4lgj
X-Google-Smtp-Source: AMsMyM4klcdnZKiOO6UaJt2lNAySUc7qgScxcIglmGkMht4iRRvcT/VACtheGvFne4Tb0i8wRhM7XQ==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id
 h5-20020a17090a604500b00212fe9a5792mr33810394pjm.178.1667264369199; 
 Mon, 31 Oct 2022 17:59:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v7 04/17] ahci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:46 +0900
Message-Id: <20221101005859.4198-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/ide/ich.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 1007a51fcb..3b478b01f8 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -106,7 +106,7 @@ static void pci_ich9_ahci_init(Object *obj)
 static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
 {
     struct AHCIPCIState *d;
-    int sata_cap_offset;
+    uint8_t sata_cap_offset;
     uint8_t *sata_cap;
     d = ICH9_AHCI(dev);
     int ret;
@@ -130,11 +130,7 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
                      &d->ahci.mem);
 
     sata_cap_offset = pci_add_capability(dev, PCI_CAP_ID_SATA,
-                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE,
-                                          errp);
-    if (sata_cap_offset < 0) {
-        return;
-    }
+                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE);
 
     sata_cap = dev->config + sata_cap_offset;
     pci_set_word(sata_cap + SATA_CAP_REV, 0x10);
-- 
2.38.1


