Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D4666FE0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:40:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuNT-0004SB-ET; Thu, 12 Jan 2023 05:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNM-0004LP-EC
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:00 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNK-0004cV-7J
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:00 -0500
Received: by mail-pl1-x635.google.com with SMTP id c6so19736399pls.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=End80jphpPEHYbo3IJcZySahcb9RRjEXi6uHeYGLneE=;
 b=6xVwoLPMRnmXwgqMZyo0OV7UL5YCK9mHBtwwyNqZINbDaIqrNGI7aXpJC4SO2lBHsT
 vTAEKppogWw8vDXwBmdQNXJnckH7SS5XthEHP3YXD3961UqxmIZw5ThnInOReLExkCFU
 ahUbSpnXNpvZ4zFwMMI38JhMiwmJ3VUPCZZZWS0es/Fx0QNrWj97U2AAklkCqAkvWPJ9
 wDlzI/OKHeY/ePxtvgXGA1vDTLuvX3Nl+bKL9LBAQoZoYAFLMtvHhLAC112mNR8lGHTf
 ls6sMsGl7opMP5z/9PsypbOfMBR7FaoPADG2HpvTPlifn5I5x8iQAEIZmLAr1qgNt9gk
 EqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=End80jphpPEHYbo3IJcZySahcb9RRjEXi6uHeYGLneE=;
 b=IisqptAHiM2pLKodu3uGozmpfscxHjqmcv/aS8jt3kj1EA3q2+3rkCqHjb0+ulElG/
 27M3M7vFQ0Fr1TuZa9pTHrS95rr20qsHoh4aqBdrhQ7MvZy+K0hZuiIB8Vsq89ECkxAo
 MKqYpfaoPq/odPf3AVTJIZYZX3NbpQnupS6XamdLoKxNa/knXJYUSzRkR3BchrOfW/SA
 Cuqyteas+vyqSg4EemIJXQAJ571YfwVFajduxb7U9BlDWHhOjZ5/nXELhUA0kOAVSnpp
 XkFHoA8gOP7RXbv1jKzDEkXqNJlSRAahvvdS/1PUJjnQwSB6mzyg3xDyi3ZqZgPDPOtl
 AnVg==
X-Gm-Message-State: AFqh2kopXs0O9KxKfMWy48e4vhJQ8gycvZNrj4IlJSqIm5WJORzZCP42
 nDFAEgi+665K3aCbeB4qz6I+lg==
X-Google-Smtp-Source: AMrXdXs9eTV7SaXbEse8Mtwsy9X2+Oj1fPuqvbwjNczeGftxZfaez3bVZJhCPBNDNQIzdV0UwHTjCQ==
X-Received: by 2002:a17:90a:c385:b0:227:273a:be68 with SMTP id
 h5-20020a17090ac38500b00227273abe68mr11352610pjt.34.1673517597138; 
 Thu, 12 Jan 2023 01:59:57 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:56 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH 24/31] igb: Build igb
Date: Thu, 12 Jan 2023 18:57:36 +0900
Message-Id: <20230112095743.20123-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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


