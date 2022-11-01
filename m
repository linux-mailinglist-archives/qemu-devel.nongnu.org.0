Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA161427E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:01:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfdM-0004ea-NK; Mon, 31 Oct 2022 21:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdB-0004Rh-1D
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:53 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfd9-0005vz-5a
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id u6so12203634plq.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=rm5RE54Lxn/X8so0EIO9yyC4X95HGZDR5ymnT9GhpGrZFNfKH5FkvWmUxYuBgh56rG
 0fC5Ku8Z6YhnITKQ6RM6oCrAg0at3LtFczJE+QXy7dHQUnaDiqvSrSz1Ap9+9AOqPs54
 yOF0eF53qyty4dqhO9YBchRbQ+U9UJ/MJUCLu0jaihkJtE0I/ks+W6CzaoqmeTd7EWwY
 8LTQyrK5Vq7lCOPSYn2O2xZarODSxBIXWrlJW6SbDYhhViz5VsgjZuN7hQoi9kboU3uH
 Vf16ifvdCOizSdBG1yWDitGdvha3udKYWLq35b6lEkBrsv2u20TKGJURn74ci2Oyq4G4
 8cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=tWeOq3KIfdPtfpprOM8Xpz/TvJJBdW1QnB5g0Ge/1ve1DFCmhcqBW0MFN5U3RhdbBz
 MfsMO1KwFaxJHKQkIqvCjpt7XopLTE18kohFRxzPuTAeZJJZHHjH6P0zsEZB3cjjL+pi
 QlhiMhE2IZpwZyaYPnBrnap9TWO5teKi/A+FNm55Yee6ktroADYmTvwBViwB0vDfnByH
 GTEi6+bt3Hpmh4F2Puvf2vZEqIaDb3/9vCa0lBVCIE4JWSx39g2dXEJ3Ul1jbiO9QS22
 Xm/Za+Lby3rJ5wYfHi775IvDTr7f7J5z2lYrM5zzvVWQnpuqf198Yt6pTmBQ9qp2pg1c
 pzCw==
X-Gm-Message-State: ACrzQf1xiMp7lozPn3tIqLTyimgFKhFcDryJ9OZOcum6/6F1B99eTcPo
 R9cdjUmYNnMvVksvGd7iK6MwytO5rGNcvNHW
X-Google-Smtp-Source: AMsMyM5BWA38td/qQExjhZ/IhGcc2o6jqr+SAhjKWQ0OzRGSQcXxb/H9U5izwhNGIeqtyif9C7njqA==
X-Received: by 2002:a17:90a:110f:b0:213:931b:ebe9 with SMTP id
 d15-20020a17090a110f00b00213931bebe9mr21848338pja.50.1667264389221; 
 Mon, 31 Oct 2022 17:59:49 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:48 -0700 (PDT)
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
Subject: [PATCH v7 08/17] msi: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:50 +0900
Message-Id: <20221101005859.4198-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
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


