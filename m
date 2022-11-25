Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CA5638918
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGG-0005em-0c; Fri, 25 Nov 2022 06:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGD-0005bF-Ua
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGA-00039G-Rf
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id z4so6419145wrr.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCVlswDC9lwKyFBztWRL0YIC/KZJpgpptO+kyEAjxcg=;
 b=w2PUQOIw3UeznxPGzVRgTGLt8tCJAQE29DyLXuwwuSx2OdcNDYDw6Vh3Je4D7iFtn+
 H4H5QJFq19B61M5lovgMklSEodClfjnV/594HIcMETnxoME3MkuEEiR9k3Imolz7oZBf
 6KfzNt8JkqM1xT7Ni+CPWBWbkHBhjwnWCIs+SbEHIlVjauxMdg3fxuSwXoe0JPz3V7AJ
 D+4rcgm+6L9bQDmvKFE3C8mXjhnSi4JR/Ck+cfhFMaKWtr1s7yBa70SeigmMpex+ameB
 nuijq843OkKpWiEuYAHAHtTT7TIPQ8ZrPZNtyY2VTL1//pAmG0FiwZaiagUltOrFFDvG
 ZP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCVlswDC9lwKyFBztWRL0YIC/KZJpgpptO+kyEAjxcg=;
 b=5Hrpv7NMhKZGDu0GrQywaRQ6jOp1QCaxCisIgOrn1JIFTjCF9jHl8SnqFAUK7T6HWf
 /XfbEIW+EYMGMy7tBicTZSRA4BxZTIkrmIiutgiv/0QjdGYxoUDGdsdPqFsh/1D+toAU
 py0s/8xRyB/ShhvK6t1RLU1UHuDTutz30RB3Hb+MYVe4NYjjQ5ymHBToR6mh7TYvqK1F
 kLf+NM6zZ/+K0Sh2zebWeMmer+OERjGelMRVIv3aZukRXrJTcxYEXeT7vmPSH4pKk/YY
 1X3LYzHiulVb0VSCaAk5aDdC+Fo+zcXK/inHnRJ45CwYT34NU87dMe83Zr+vdrtSMqr3
 swfQ==
X-Gm-Message-State: ANoB5pnkPnlvjMuNAmsDIwMbAZKoOBnHwDGbQVvakUXo3iY0tpwAyI3K
 Z7OpsQfu1FZZUXHrKPmGiQRJ83iA27afgw==
X-Google-Smtp-Source: AA0mqf5s8UEDxvS+9cRt2rJ4F64e1QBrtilORmhIsm1c0eB+jWG+pz7tPLBJ4MT5mGdo+62D3hzR/A==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id
 u14-20020adfc64e000000b0023678cdf3d2mr23799409wrg.719.1669377165410; 
 Fri, 25 Nov 2022 03:52:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 3/7] pci: Convert TYPE_PCIE_ROOT_PORT to 3-phase reset
Date: Fri, 25 Nov 2022 11:52:36 +0000
Message-Id: <20221125115240.3005559-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the TYPE_PCIE_ROOT_PORT device to 3-phase reset; this is a
necessary precursor to converting any of its child classes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pci-bridge/pcie_root_port.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 460e48269d4..36bc0bafa7e 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -43,9 +43,10 @@ static void rp_write_config(PCIDevice *d, uint32_t address,
     pcie_aer_root_write_config(d, address, val, len, root_cmd);
 }
 
-static void rp_reset(DeviceState *qdev)
+static void rp_reset_hold(Object *obj)
 {
-    PCIDevice *d = PCI_DEVICE(qdev);
+    PCIDevice *d = PCI_DEVICE(obj);
+    DeviceState *qdev = DEVICE(obj);
 
     rp_aer_vector_update(d);
     pcie_cap_root_reset(d);
@@ -171,13 +172,14 @@ static void rp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     k->is_bridge = true;
     k->config_write = rp_write_config;
     k->realize = rp_realize;
     k->exit = rp_exit;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->reset = rp_reset;
+    rc->phases.hold = rp_reset_hold;
     device_class_set_props(dc, rp_props);
 }
 
-- 
2.25.1


