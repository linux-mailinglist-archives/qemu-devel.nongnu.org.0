Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E061505A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprn0-0005x7-B3; Tue, 01 Nov 2022 09:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmu-0005t0-LH
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprms-00043z-9Z
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so18870271pjc.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=1csrNmftuAhP6a4ao8QzzfzRjYFRaED4KfhdSDsYDKprl0Mj3yLGODrx+hDmsHPBi2
 M4P7bhNhTazXMlKqnHamZlDuR3ilmDes5KqPre+OvteuNGYbOFRx6qczVZxfROQTX+q+
 pX9APGUycgtKupl5wIBkB4zeggDdEWEPWX4CyEAezC3/ivfiMpoAxu6FXur2+eL9h+x9
 dDezxLnRA9DdLPRgH47kaFWfcZr6sQyKgMCpW9yaj6BROKh6soiO3NK2q4xXnaMfBtDA
 EzG/agvJjBV2J0gzf36ZDeq/bf/UueYcmV6SjaLePOZOPjynGxZxFm7tDpRoGaE8ENbE
 0F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=cRDyOI/z+F/UEjWso2wYbdlGxa/lmyOPQDTjyRNVr9y9q2XXjvIhiP4aXVE6r82w5N
 OvSLbYEhme/KXCdWu1gBvIk0IwyvubMmd8khCWfuCFXm28D/z/9/oss+tiSMe3o2EvW3
 yu6TKLWq1ZTzdzdjgoVdEvE8jyGf207XF+P+hy2Nxfr0mSKaxe8fnlJI53rZ1aGKPwDA
 PmWiFjHYO/3CGfSKUxihgoe2mq4b+VH0PQ4tadw0jOZY+VYYpQ5xa713F6N5xyghgeNv
 /sTag8zVE5bLzfJiX9N6IJ9oF7SYpIupVNLSaN0gdZmUDvaHjAAOmGgCMSY3UZfS8zBV
 M8vg==
X-Gm-Message-State: ACrzQf1TFpa8XGoB18cclGIy+f32u042bt2zIdBTPLJiCdq4mfse+tiX
 bZNyKQ9Ffwu3js6fnqzuQSlG04fJHOas28O6
X-Google-Smtp-Source: AMsMyM5OYRak3AFgUC3EwvZ4HF8gAhlStyPZonY/F52TRFxKXW0cxMfHNcM3n0j8j9qyBuPBbXgDfg==
X-Received: by 2002:a17:902:d48e:b0:187:2f4d:db72 with SMTP id
 c14-20020a170902d48e00b001872f4ddb72mr6284476plg.69.1667311121316; 
 Tue, 01 Nov 2022 06:58:41 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:40 -0700 (PDT)
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
Subject: [PATCH v8 08/17] msi: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:40 +0900
Message-Id: <20221101135749.4477-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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
capabilities overlap. A caller of msi_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 058d1d1ef1..5283a08b5a 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -194,7 +194,6 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     unsigned int vectors_order;
     uint16_t flags;
     uint8_t cap_size;
-    int config_offset;
 
     if (!msi_nonbroken) {
         error_setg(errp, "MSI is not supported by interrupt controller");
@@ -221,13 +220,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     }
 
     cap_size = msi_cap_sizeof(flags);
-    config_offset = pci_add_capability(dev, PCI_CAP_ID_MSI, offset,
-                                        cap_size, errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
-
-    dev->msi_cap = config_offset;
+    dev->msi_cap = pci_add_capability(dev, PCI_CAP_ID_MSI, offset, cap_size);
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
     pci_set_word(dev->config + msi_flags_off(dev), flags);
-- 
2.38.1


