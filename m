Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6189860EA30
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:23:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqU-0003Oq-Cu; Wed, 26 Oct 2022 16:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpT-0001uH-Nz
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:50 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpQ-0003Ed-3S
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id f193so16093330pgc.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=kTRNw7UYBoR1X5DoH1oHShtzL5A5LVlJCpPUO7t2skXJg0PjGq2QE+qMKsUgESxQxN
 Gp+W77iqWJn3qoeQ18jsqBH/AeHOAlFSrLFmh67AZux1YbJJb82Fg/k0ZVUrfjugmPuZ
 XUjp4fxHMa3o87mvAv0+hr5bDNf3aoy1XWdVcdRdWWwoPI/pxtOkl+3Orloto+Rj1Lp3
 1zhK/WbADZIkP3KzO9KGO1IVEqNzpe4gwoGNTsYuqQT4g8Y7YUet4kII/6J7l+sUlC8q
 NgeGNmOqyLU9Gdo1jKhOq3rM1E+/bTjHvAUQsrMD9ytK9UQw2bVSGdB5i3mJ86blarn+
 LyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=PLWzjYgxG6pVulZM8r7rmB8bk6pk0kW/puKS7DzM3hvuBwOD/HUzJemoalBS8R2ZSw
 Cafbeuh/CnncbDBGYxP7UPqBODOWv2qJOduHYsMMnpc1AqUXK688PAVb7FDeIHLkzEaf
 O1Z7p9fgELL0FTrxqVFf93WbLpHDyw4maLX5ERlQ4h1HAQeIJ1eRcLQLQHqmAz63ZoQw
 HMxy4ByEHW/Bd1H4CoQ1dGjsvNG9Atx8MpMMFZ2scnhPxytU7XMRoEgB+j8nWKFHIiIu
 eVf/xmc54Jh13ceyjAy4YgHSAnQOZKJuNecEJTKNPLrw/7JXUxb1ssE6dlTANzx7Zu4q
 OPbA==
X-Gm-Message-State: ACrzQf2HBXgJC+AFExyLftiJ0CdGWYFF+MP03/VIuB77I9C6VgKG5d9g
 IU+Y2ghlCHXqPnx9tumU0T7pHw==
X-Google-Smtp-Source: AMsMyM4ZGUSoWTXZdQmq7yqhQHwdl0qCRuF7raqMG1MDteN/ztetnIAgjwvKimTEy423voirEZ2jdw==
X-Received: by 2002:a63:101:0:b0:460:6d90:3f81 with SMTP id
 1-20020a630101000000b004606d903f81mr37457659pgb.545.1666815402394; 
 Wed, 26 Oct 2022 13:16:42 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:41 -0700 (PDT)
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
Subject: [PATCH v3 12/16] pci/slotid: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:23 +0900
Message-Id: <20221026201527.24063-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x534.google.com
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
2.37.3


