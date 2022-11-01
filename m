Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C47615022
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:11:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprnS-00066w-07; Tue, 01 Nov 2022 09:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnL-00063C-UH
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:11 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnJ-0004cJ-Ui
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:11 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f9so13500502pgj.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=cgAorXro9dhWTYqQeYjrWLbA3UtVao1eHKhr+DaVPEtxI+nX1UQvLgNuKytoJGAc5B
 drrHlaspQWTOTl/isN0hsnOWJmorvWqg4lGnjtxIx/67gKMRL3a17Dj+MfJhzTtciTla
 c4PPISDT3+HnjJJ4c0AfeBiQO2ey8DSi2z9or3dqytwCytwFOeCRFZl6+jkD4NxI3Vbi
 qCJxfbnMwcSL5/HsXQjPdi3F3guoapMJAf9/gi0L9C/n3PBAZclLIqrizB1JjN8bupki
 kjiOs8qiID21swKLlCUtBIYJfatdIfvoqyLaLww7mZPdGzjTR2Vm6KU1/a4ILfcIhpwb
 LfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=pED9tjPQdmmULfcCjnznt1gH8YV2yInAiRufTSvJXDa59aCLtf4cqtFZE25/h8VC2M
 d3YRZi5wxKCKfkzbioGu7r9ad/zzroE0cexWIOAnfOGvruVvvzld7f1E7sRmWF9KZOfd
 7Je4vpC1cn8klDmLQfH9CI3/INiD4balxUPsHIIK3wIZZVoFR3qLFs9S1FPfCafUD59H
 vKCDxweT7vZqJbrDQ310yCKfXZ+QObkGkAIQGEwzI1cnPVnrc47N5VgI9DG4xB3Okrg2
 6+wbeCJNOnvsdAhNn4cdFZnadfvr5H8t8nix7vuhcSoYMCTEc2GoJeGtuF99Fsu9gv0X
 2H9Q==
X-Gm-Message-State: ACrzQf2O4cI0dTPOQDduLbpK9gICn5hSdT8iSvycVekNldna8zpsvAwu
 +qOT9acXpvDwCLhk0yL9AGt0GYYcntbvgdGz
X-Google-Smtp-Source: AMsMyM4h/Jf3q2seI0qUDNIpyqq2Nkrta3aeFxGfHyydZh0ck8or5UgtUg40sDG9JYN+PqR6vXeLVw==
X-Received: by 2002:a05:6a00:168e:b0:53b:3f2c:3213 with SMTP id
 k14-20020a056a00168e00b0053b3f2c3213mr19794739pfc.56.1667311148048; 
 Tue, 01 Nov 2022 06:59:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:07 -0700 (PDT)
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
Subject: [PATCH v8 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:45 +0900
Message-Id: <20221101135749.4477-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52d.google.com
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
capabilities overlap. A caller of slotid_cap_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/slotid_cap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/slotid_cap.c b/hw/pci/slotid_cap.c
index 36d021b4a6..5da8c82133 100644
--- a/hw/pci/slotid_cap.c
+++ b/hw/pci/slotid_cap.c
@@ -12,7 +12,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
                     unsigned offset,
                     Error **errp)
 {
-    int cap;
+    uint8_t cap;
 
     if (!chassis) {
         error_setg(errp, "Bridge chassis not specified. Each bridge is required"
@@ -24,11 +24,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset,
-                             SLOTID_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset, SLOTID_CAP_LENGTH);
     /* We make each chassis unique, this way each bridge is First in Chassis */
     d->config[cap + PCI_SID_ESR] = PCI_SID_ESR_FIC |
         (nslots << SLOTID_NSLOTS_SHIFT);
-- 
2.38.1


