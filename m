Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5D60846B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 06:57:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6KC-0005O4-Dx; Sat, 22 Oct 2022 00:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6K8-0005MO-Se
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:28 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6K6-0003hP-6V
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id h14so4038101pjv.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SeCwLTdTT2Bw5AILxPJaOeyCAlvYtbi/crdSeALVqg=;
 b=VYPDJftxt8oHr4Laz6QF1SvaYZGVZtHuUubiyv4wY2WQ0VECexmShMOgLwQNVz4VwZ
 I0gE/nMeD9T1lomdrA88mxe0KRbMQ6gbSUdrQzEPQJmR4fg7jNYM7UaaNVyuQkRIVyWF
 ORXDToIb2zV86e+Vuas0UUyYCOLMBygW6CqxsI0yXeS4ACZh+m8GLnp4Gu8r7m27/rSV
 HOvQlxZrujAowcbf9H5UCGwBcCVowPp98hojYEGsm2wuDRMSzjdOWnsl/uqMHEL7WYdH
 9qmUoZyJVA9/2oU6XNebUd31sIi6dGEoLO6/gLJ0FkTzIEoeP0OT+tQ+oArnhlb3pjhD
 zV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SeCwLTdTT2Bw5AILxPJaOeyCAlvYtbi/crdSeALVqg=;
 b=76MW9gxnc2Ncg59gQHVff+6reQCboykVdLC75zlhs6eM+9OXehkqNTyuhgyQbFImi5
 Pmu79l1P1nwVYPaiOyRcjB/89Tp3P8rBaV+/voaWv4OwY26JWxP2OFrVBlcbtrWfP46R
 nWLNZg//I6V80dbwkxXf6IljXwH1T2du+83c1B/iLdAuRMgPNFtnf9dGNhU+3gLIWFMK
 eMXwcea/uwOpqZRP3+pSJiQH+qanTLTwrpxLM7UttqAd6qcbfhFvWMqC6+L9xTmAGLj7
 l4AiKCYHiDTXbQJkSyR4Qhet86Gk4LshqRsoKXGO1fykucF9c83+JANg1G3tALdt8Hd+
 WYHw==
X-Gm-Message-State: ACrzQf3v5T/qRIDPRJkTzeqOMA6xufGc/muIcD/IS0k/ktmZlcgU/4yH
 z6BV40L3jTPJ0/Nknmh3eDQ4xZDg8dBiJf+e
X-Google-Smtp-Source: AMsMyM5ED1L8EckP/kMJoNg3hVxMh1Jd89PVNmz94BBZgHlMjakFTS/Xkb2wqNto8+L5C48u71qDmA==
X-Received: by 2002:a17:903:2691:b0:17a:8f3:bef0 with SMTP id
 jf17-20020a170903269100b0017a08f3bef0mr22650775plb.17.1666413684838; 
 Fri, 21 Oct 2022 21:41:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:24 -0700 (PDT)
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
Subject: [PATCH v2 03/17] ahci: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:39 +0900
Message-Id: <20221022044053.81650-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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
2.37.3


