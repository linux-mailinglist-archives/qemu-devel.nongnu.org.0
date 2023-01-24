Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3396678F7D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:49:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKBDz-0006ky-A8; Mon, 23 Jan 2023 23:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBDb-0006Nh-I0
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:47:36 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBDY-0004yW-DK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:47:35 -0500
Received: by mail-pl1-x634.google.com with SMTP id p24so13582243plw.11
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=End80jphpPEHYbo3IJcZySahcb9RRjEXi6uHeYGLneE=;
 b=zzUI9kL5CwZHSvq4K/qEQ1gmKJztCSURBexw9096/yPrynDRV9EogZQvJ6+0+f9pcY
 57GOURb+x5xGwLJFo7oy8jD2RmOiNvvrQOZ0SsY63nnq+P9Bw7XDV4uZ+cc78LM9to8A
 NvK6xNau0vsXSlklUJIbBaEhlyPk6rccgM2Cz6nUnYQcVmdSTwgEZZeZ/RsSvUu4bD4n
 TYY96BdDTwjWEqa6rADFau/1/MDpYHt+b91M9mKk6Po6jPMVF0R5FX8MzqUCTL+RRq2T
 z4k34ui2gmvDDwAK1/s6rC/JLmq3VJ3WvKwiAJfQZSIus0jvDn2CkoU2bzBm4qYYN4bX
 8c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=End80jphpPEHYbo3IJcZySahcb9RRjEXi6uHeYGLneE=;
 b=c7+NR9PXDtEb80+XDiAyqJnG3JtMbW16qaoi6X3VWP0kKX9dhWHboDMm8crBZgn09P
 XCwNRCfNwplHBmpBcx1IGwtl/3sTjB5lgxnUjJeTO3zswJPpkvozbOzfgU/UqGtiU046
 fyvS4DWzoY4Ubf4DQ/aIJaQCSvJLjn68Jl4msN7kQZSrnvpUb2c3HlU0n32Fx93sjnFN
 B1iXOUT45coGGFFx9Nl6D19coEZ5581w5XmxvFPHsdMO1ZqjU1vr1OVtMFp5HYubrkwG
 Gd86OJPFPMGSuwcki0LGWMJ01Rxz72V2joTYMJ9umqYh19lvsTROjUOLIwHcqS3Wp6sn
 9QsQ==
X-Gm-Message-State: AFqh2kptL7GNvwGbyEvHPk7soSBk/0g7LfvVbazc7ZwvmW4O6Vcv0j2v
 ouO5NDCcYfJ05pibMy740asu2tp+YRg6Ei3d
X-Google-Smtp-Source: AMrXdXvCi8n2N9SqAxHjigDtX2CPTGprOkc278ONnOqOcot/J1vJX2iIkhlkT36Nr9oeVQ3JWOcEWA==
X-Received: by 2002:a17:90a:7e8d:b0:228:f893:bc4d with SMTP id
 j13-20020a17090a7e8d00b00228f893bc4dmr28182606pjl.23.1674535651723; 
 Mon, 23 Jan 2023 20:47:31 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a4d4600b00226f9c7474esm7324855pjh.54.2023.01.23.20.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:47:31 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH v3 06/13] igb: Build igb
Date: Tue, 24 Jan 2023 13:46:43 +0900
Message-Id: <20230124044650.14144-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124044650.14144-1-akihiko.odaki@daynix.com>
References: <20230124044650.14144-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently igb functions identically with e1000e.

Signed-off-by: Gal Hammer <gal.hammer@sap.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/Kconfig     | 5 +++++
 hw/net/meson.build | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 1cc1c5775e..18c7851efe 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -44,6 +44,11 @@ config E1000E_PCI_EXPRESS
     default y if PCI_DEVICES
     depends on PCI_EXPRESS && MSI_NONBROKEN
 
+config IGB_PCI_EXPRESS
+    bool
+    default y if PCI_DEVICES
+    depends on PCI_EXPRESS && MSI_NONBROKEN
+
 config RTL8139_PCI
     bool
     default y if PCI_DEVICES
diff --git a/hw/net/meson.build b/hw/net/meson.build
index ebac261542..4974ad6bd2 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -10,6 +10,8 @@ softmmu_ss.add(when: 'CONFIG_PCNET_COMMON', if_true: files('pcnet.c'))
 softmmu_ss.add(when: 'CONFIG_E1000_PCI', if_true: files('e1000.c', 'e1000x_common.c'))
 softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
 softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('e1000e.c', 'e1000e_core.c', 'e1000x_common.c'))
+softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('igb.c', 'igb_core.c'))
 softmmu_ss.add(when: 'CONFIG_RTL8139_PCI', if_true: files('rtl8139.c'))
 softmmu_ss.add(when: 'CONFIG_TULIP', if_true: files('tulip.c'))
 softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
-- 
2.39.0


