Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EBB61117E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:32:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOX0-0003ME-EG; Fri, 28 Oct 2022 08:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSo-0003ES-Dn
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:54 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSk-0003Gw-Ao
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id i3so4645643pfc.11
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=wbgF0dmc393eJto0URkoH20VZkFnL4Ph5S1Ffvst9hklWvMb9PXhw9+Dpy1bvc8lvP
 9PrMZ+gqD/ZE0qrGUWCeolfLgDiaO8fKIYv6LeN0kQeZgz8sDBSCwMXtWEQfQuFmRl4G
 Zce40hioO/0d0x4+p/2lXSDVOfjRgonIaRqYM34INI54qkXzoEou4NvEXlyKwLAindRU
 K4S7kjf1i5Jh0S0K3gcKGAQU4Xtt+Q5gLMLQ/jonYQFxfhmE1BNf6FzylLRppj1Q8qGa
 7n/UCCr93S6x2Z3fewE15wAKV4gUVO9jcgoyFUZITYuKKygeeKIJofky7+oylGj4yIU1
 mrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=KL1NqimVzoq3WJrA37bahDqxwT/hQDCWRFsy24k3rN9CSlXugHYRKxTXv3wjQoj3FV
 SIG8DklKHWydfxqigc5sFoGuvjkpargX7DlPSTqgDHQsjVVCwISXhk5DfdPCotswwNSA
 NN2h7+4Vyjh5VzTc7kXUOTQtKlCNftcwAajDBZhyGPKE76/vWaInLqzR4ETTnea1K23/
 eeSFyPFR7rP8dRfAT06mIReNpktnfR5e6804UC8VSxGOPBMQt8hLBjwuEtBDUvfhpghx
 OM0hF0XcYuZ+MGt9lF3+VcBeDq8B+xOVQqRhwzTKsx5N8L3oyZ1EdhUJ30+sVAHjjrKD
 yUTg==
X-Gm-Message-State: ACrzQf1PDQwgIO46lkVUH3X6rK7XKxV9AZwRuZKd88v3RW9wBj+oJtFi
 eqz+S4IaiKzTowevXH8+yizg+g==
X-Google-Smtp-Source: AMsMyM7zUqS2Zq8p0QkGS+TGPvSjGlx24IvxedvVDuk5L9/jM0pt86izxezDGwczTFHRZVuxsPoatg==
X-Received: by 2002:a05:6a00:1306:b0:555:6d3f:11ed with SMTP id
 j6-20020a056a00130600b005556d3f11edmr54379732pfu.55.1666960069480; 
 Fri, 28 Oct 2022 05:27:49 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:49 -0700 (PDT)
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
Subject: [PATCH v5 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:25 +0900
Message-Id: <20221028122629.3269-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
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


