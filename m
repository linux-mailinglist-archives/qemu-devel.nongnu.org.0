Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A90608458
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 06:45:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6LE-0005jP-FA; Sat, 22 Oct 2022 00:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6LA-0005ir-FV
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6L6-0003wW-LK
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:31 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso6189624pjq.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrwchNWJXG/IFKyLYSvhlUx2Gvwku9OSgyo4kfBl800=;
 b=IkrM3hZgkq1Fuy3DpdzeUUk2nPTMnXizn1m8A2ecwRQQMk1XF9XRGW5hZhPNniEg3X
 yUXn8tJHwB21vdAJMoDcbYNCvusDgdAH1/gdUeBA3v8lP0Ox+P+qBfC8at9AOPY7oIAP
 U3yRdKB1giEBYx+GMH1obbdkmVYZIhb937ZG7xo8UnX6Xtfjjko3Y8KV6wQymz80SuhI
 VrbJxWB+HqzbZBlGgMiZ44PcmqKqwkbHrW3fqzCXS623Gc9kpRHB/sSQtYqD3J9rAv1H
 tdpD1hohoMtZ6RFY52HpNXrMGKYIYaCwLEhv5Q1G8I7P2W+M3LhtREp17hDhd91IKkUT
 z6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrwchNWJXG/IFKyLYSvhlUx2Gvwku9OSgyo4kfBl800=;
 b=yuwp7SzZDBxzgjqFGpY1y4wOVDSPxvruX8XFDh/0Iug1IqpyAm5QIE922F3LVIMSNx
 UYwtMJY/71VpkjhXr5x2vzYZLk/ixPmIPYKdVzIqyY9B3Si8TNF6XMNbkPhWSTFerVHx
 R0zNXbNXYMJ9jspgsGH4Kn6mNUhCbsEgw/XcHQazOuytOpCstMXG4jfK0JkELwKOWOTy
 uBYY/1bK3QE5g9cAbTWsLWhDG4amH4fjUx9kofKogh+DNrRlSDn8LtAHhvFWBPs0w82d
 Ll18KzRSDCb4uFCPjGIpQM0FhN9+9bs+6PCDjlWNoxOzfGukab5vaMAFyqkdISS7qRjx
 K/wA==
X-Gm-Message-State: ACrzQf2otQEPxNJjh/PjjO+SMkerQ4PjXd3j3XGVy0XyX8l0XfKf1bL6
 sLhRlTjraE7sCdQjpJerayEw/jil16y7fI0P
X-Google-Smtp-Source: AMsMyM72Jh/7pFtKCMxv9g7dhGEKI4X+d7g1HOKXv9bLf6Tm895hclcd2LPpfotNZlsbkkg9ctGh1Q==
X-Received: by 2002:a17:90b:3e81:b0:20d:bbe5:f332 with SMTP id
 rj1-20020a17090b3e8100b0020dbbe5f332mr50207015pjb.112.1666413747453; 
 Fri, 21 Oct 2022 21:42:27 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:26 -0700 (PDT)
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
Subject: [PATCH v2 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:51 +0900
Message-Id: <20221022044053.81650-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
 hw/vfio/pci.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..2b653d01e3 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1826,7 +1826,7 @@ static void vfio_add_emulated_long(VFIOPCIDevice *vdev, int pos,
     vfio_set_long_bits(vdev->emulated_config_bits + pos, mask, mask);
 }
 
-static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
+static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, uint8_t pos, uint8_t size,
                                Error **errp)
 {
     uint16_t flags;
@@ -1943,11 +1943,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
                                1, PCI_EXP_FLAGS_VERS);
     }
 
-    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
-                             errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
 
     vdev->pdev.exp.exp_cap = pos;
 
@@ -2045,14 +2041,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
     case PCI_CAP_ID_PM:
         vfio_check_pm_reset(vdev, pos);
         vdev->pm_cap = pos;
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     case PCI_CAP_ID_AF:
         vfio_check_af_flr(vdev, pos);
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     default:
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     }
 
-- 
2.37.3


