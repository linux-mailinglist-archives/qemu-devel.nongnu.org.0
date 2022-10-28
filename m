Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207A611180
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:33:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOSx-0003aO-Ex; Fri, 28 Oct 2022 08:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOS1-0002of-91
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORz-0003GR-Hm
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso9662765pjz.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
 b=MHq76xEofsh9aS//60dmFo4FvDksOi6aCRbTdtag9cYBLz07fHp8EAv9kf2HtqfCdp
 FxyTqGU5fNChKDTiLYpx9adTYgeGTyp2OQX9QWMNkzQwfpa+elbKw+60u02LB+hD/WyB
 xUfw3LgjieTyC4Pa+Ar7L6B0/IP68bVKBtfS7WXwFaM6E+9urlcyNgRIu3bwT1TeDfws
 4CPRWMn6uk5GljVNq9+hnO4FYvg4smotZ7YoYVAbXX9VDtafO0XFfKgCI9K4wQ9laXjF
 T3XrWeAJY+vPt/UADHV9h0sDB6MaSimuEPcH46TZheE9+tCTJQWAv4NOMCPayISnfhMT
 wARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
 b=QnyUGPlV0pn/umFBmjwV/PCLtXNXvIde2XDjGlotYbmNHQRRCS2AX/NMzxDfLtm7VX
 vbC9Sg+0fP8hDvHEMnAS/EouaqzmxiIh7RNZHgO7OlAV7MBbBLYN1sjGNqlpYVKIcGNS
 o19am78sxOQxx7KJxNt8lK5gYazmhOHOW5CBqCYikSlywvtWvTPAtXCVhhouthu8hyEy
 RM5NPQ+yyAXAp27Qy7uEMeAkHCWUZQwBdBXSwtTGcGKlQDoMPST3pGXjBFeGZ/k0bGfR
 KTaqwnq4LIfYjz/HUF67MHLUZYvv+02LWt7RSSpz0cmjNiAbW/KXKOPLl2PTKumUgGL6
 JTMA==
X-Gm-Message-State: ACrzQf33WH1SSnhQIj2/4HcrsY5O8DBmd5KqYP9tVkJf/3uNxCcI/smW
 3baXX/n+ffI7TS4ARz9YrrYcZQ==
X-Google-Smtp-Source: AMsMyM7z+LXyUrncvrqf5KDlDG+H+4V+wlNSluwB1ALZD5BaRTMmWMM+cjZzrNsuE9rTtgZLi7tVhQ==
X-Received: by 2002:a17:90b:4b10:b0:20c:c3a8:38e with SMTP id
 lx16-20020a17090b4b1000b0020cc3a8038emr15736986pjb.195.1666960022865; 
 Fri, 28 Oct 2022 05:27:02 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:02 -0700 (PDT)
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
Subject: [PATCH v5 04/17] ahci: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:16 +0900
Message-Id: <20221028122629.3269-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
2.37.3


