Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA000615080
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:22:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprme-0005ne-Ip; Tue, 01 Nov 2022 09:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprma-0005mq-9u
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmY-0003th-0U
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:24 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so3293319pjl.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=bRB5XjY4lQBHDkiv+auw3OjDrKlMXgjIUsRmMi5+wF0hFOR9oMG93qQ+xH6qoTOmic
 DB3TDR9377mw3OIbmdgbDBrhGI4zsjQKCEEgk2HJUKLrN4TE95e3RFYOa/MxIeRjnpEk
 UJ+kueecXWjcQO+09daV4EOqnXXLgluwHloDc1kpUTf9gvJuVtff66TJXcpB3Jfht8ZI
 tQ4d/FIJ3F16wMpMR6JHL62kH74FOESLmiTkZiuDAuQeOAhRCb/mJaQC5NkBuvxR0xbv
 ol/zx+8/Z6PqPLeyoZ5S5c7XcVZuzB4UFdppWu4Ejj6O+9FffTi4twnb14IJxKcvh5NL
 kyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=qLXbBsFcoWCKVs3jIeY7trZoI8VaOhwZLo8Y7V4mtO6ZnODAuvwI8zf3kGjZMUAKUu
 olbyrBlJzzekDuht8h1s3q+BkxorWG9WBM7e417hyVSl6c7CPvKPyeyqZpa/dRWAcvmA
 m4yfRGIQdxZ/SHF0tumsineY17rQIDH2vdzKednGaTImU7HUWafUyedEwOe5GK4qu47j
 KsRkE9VWvqb7P8E+4dC2vtY4AYoypZFNXfdGNLpmqZyljD5gcgUkU2QA5BUFofiEpuki
 LE/aWoxR0oCTTlBFDmPI3hQNJCiTexEn8WV1GshgIYM3Mf/RiDLXjkSmBxJdbndpR8pR
 xpCg==
X-Gm-Message-State: ACrzQf3phN9HfgaLgT7ubFq1b+aQddbqFnLsUVAM8Qw4LDSx8VvoNbsY
 q/EZaZN9DdlXemIO+eNnBepTwurfjPzOCp1/
X-Google-Smtp-Source: AMsMyM61Jcanu2bgctKANpQIAPP1f3v6IQZst1KjFW0FDt8uColB0JfZ1Vg0UIt7Qhs7L95fxO0yww==
X-Received: by 2002:a17:902:8e88:b0:185:3cea:6335 with SMTP id
 bg8-20020a1709028e8800b001853cea6335mr19734673plb.96.1667311100429; 
 Tue, 01 Nov 2022 06:58:20 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:19 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 04/17] ahci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:36 +0900
Message-Id: <20221101135749.4477-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
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


