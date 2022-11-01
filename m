Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8D614FB4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 17:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprnV-00067X-Lg; Tue, 01 Nov 2022 09:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnR-00066o-Dn
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:17 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnO-0004e5-T8
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:17 -0400
Received: by mail-pl1-x634.google.com with SMTP id g24so13640617plq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=gqCUXh9WH1PgFdB7Kpa9JkjgpTKGzAslWot+Mpop1Wc7dMc8on563mp2lWtAiWcdzw
 be/Q9/pAdeEijPNx8bzCuwwsb5FVjj9vu5FbUQmkqu9pMKbaZqU4HuUZv/x/AfrV3Gq5
 QofD637ncA+yoxaoGZDsPBomX7yzlE+Sl4u/tfTDqk5uvlhnjKaRIGpG3aerkWWQ9Fzq
 bqAwato8ghCrANghto+VnyXMOEaHwmczI59pJnPon4QluvoeEuEHmsX4sH3hUilh3B0v
 H4zuIjl2GWhxZeC4rEk6u7fzwnZci1zQ7tLGOKh6wSYf2V0gTscYIGFqcHRvpKZe8VEN
 LSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=kXToSyYgLDqQw2nqgCLMthRzfrdY3DZkoLC2sQDcGGhhMGRwUkQkm1jOiazqO40wIc
 706prptRePbHIE8HnPDfCigCpz1KpNVYbotC0O04wK2zzX3OrAMy5gY1EJ4zdmssqtgA
 SilzaLEx9EadhENPevtnDsQ4RqiQ9yeX0Wv8ZXAYJB1/x2+MYzyJ2ueUIfbFz7/dtnhR
 1/VPliIo6qIs/Os4djf9PupNM5LMfXT25tbYvOIhK+U3Q/Y0Gel0kvzmlnhtdZBC9mh9
 dqMOIPyX0CuiPwNijcUPq6PSXVA71QKsZKfT8a1kLGSLbuStPsM5y0GrApZgaYDaBwmX
 KO1Q==
X-Gm-Message-State: ACrzQf3Bs7nH7t8BrspThGkncuqbfdMHE0wwNWm8wEtCf2UI2GMUGTa4
 szBjEv/YbCKga6PdUTQv1gKnAwU2eI0AKBT2
X-Google-Smtp-Source: AMsMyM47NuDUYHjSqpTMdFxOMFrwxZHHe+HlFaq6vOumH5A5oGVqza0dPOl5d9lqZY091UqZCgRVpA==
X-Received: by 2002:a17:902:d512:b0:181:f1f4:fcb4 with SMTP id
 b18-20020a170902d51200b00181f1f4fcb4mr19933757plg.102.1667311153360; 
 Tue, 01 Nov 2022 06:59:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:12 -0700 (PDT)
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
Subject: [PATCH v8 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Tue,  1 Nov 2022 22:57:46 +0900
Message-Id: <20221101135749.4477-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/pcie_pci_bridge.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 99778e3e24..1b839465e7 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -35,7 +35,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 {
     PCIBridge *br = PCI_BRIDGE(d);
     PCIEPCIBridge *pcie_br = PCIE_PCI_BRIDGE_DEV(d);
-    int rc, pos;
+    int rc;
 
     pci_bridge_initfn(d, TYPE_PCI_BUS);
 
@@ -49,12 +49,8 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 
     pcie_cap_init(d, 0, PCI_EXP_TYPE_PCI_BRIDGE, 0);
 
-    pos = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF, errp);
-    if (pos < 0) {
-        goto pm_error;
-    }
-    d->exp.pm_cap = pos;
-    pci_set_word(d->config + pos + PCI_PM_PMC, 0x3);
+    d->exp.pm_cap = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
+    pci_set_word(d->config + d->exp.pm_cap + PCI_PM_PMC, 0x3);
 
     pcie_cap_arifwd_init(d);
     pcie_cap_deverr_init(d);
@@ -85,7 +81,6 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 msi_error:
     pcie_aer_exit(d);
 aer_error:
-pm_error:
     pcie_cap_exit(d);
     shpc_cleanup(d, &pcie_br->shpc_bar);
 error:
-- 
2.38.1


