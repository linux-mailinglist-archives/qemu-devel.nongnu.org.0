Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E767C9C2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0J1-0002CQ-Bb; Thu, 26 Jan 2023 06:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0It-00024b-Ia
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:27 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0Ir-0001Vh-TQ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:27 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d3so1520489plr.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=End80jphpPEHYbo3IJcZySahcb9RRjEXi6uHeYGLneE=;
 b=FDrb7OIFD57L6st9L2YmsPO4Dl/WNIvCFLOyEVrabp7llv0XyS8kbzeSzMy/FmrUIF
 +uYTpZguKilaTLvM+aR9OV79Nx0CITWxOn1eK3ay3ExWuxnn0Ty9ETiOdTscEbM2WMKt
 4VjYFv3fbAvTIGwczzoU4AWQceW+sclruteBKzGc58qEtlShU6Cx+Ts+1mvHUUTb22XJ
 BAzq6aaNLKkN+9+zcOWo96fAFhlRx2JOX8JUs39z5kVNLf6USWrFj8Wml54MlzxbDzrH
 W8O6kJWNAXgQGyvPtDzdiRMVfQg5i9vdba1y6vvwkh5rh4Hb1CMPtlQFX0rsR2KOx+lr
 rokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=End80jphpPEHYbo3IJcZySahcb9RRjEXi6uHeYGLneE=;
 b=fXirz1ns5FTpYgHpEzD3IohFbEUztjzmZOGzkaP9U36Q++w58/hZo/7IoJfqPdPtYZ
 HezzVMgtBoj6c9re/B6g+OmV8fmU9SC6jNXvnJ+Ue4o1H2ExJdHhpymUNu7hj5uSbx+5
 /KpfeR79/+OAm7MXcUAVc7LzsZ+3O5YBAF1rgUWryP0p7bD77QXYW0ppTfrL6GIqEVzz
 Z7Akkjkiw9AuGfly3wcSrqVT/qyPwayYX7bFnyqdQXZCkX/BQHZ+000jGY2c8jzT6Bit
 pq/1A8qSeMjWMGQtQtngXVArH9TeGw6C4v2GFWyetXpDw+qcDEBex02zv9Pu01SZByS3
 p2Ng==
X-Gm-Message-State: AO0yUKWyKYPC8dfexAQmyaJY//0Kri1FboOoSx1MrZu5qtadjjBop8Nx
 D1TpeTpZyJXsJ/nBrW1VgYQ2ww==
X-Google-Smtp-Source: AK7set8/7TWtz12/YbvgC6k+uQ0P/rv/Fh2UNDioViJSUOUImIVxkkeaebPWuIeHL9TFwi0/SbXYrw==
X-Received: by 2002:a17:90b:1a89:b0:22c:421:dbfc with SMTP id
 ng9-20020a17090b1a8900b0022c0421dbfcmr6553960pjb.13.1674732025032; 
 Thu, 26 Jan 2023 03:20:25 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a468e00b00229d7f2abd4sm849520pjf.54.2023.01.26.03.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:20:24 -0800 (PST)
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
Subject: [PATCH v4 06/13] igb: Build igb
Date: Thu, 26 Jan 2023 20:19:36 +0900
Message-Id: <20230126111943.38695-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126111943.38695-1-akihiko.odaki@daynix.com>
References: <20230126111943.38695-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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


