Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354683339F7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:28:49 +0100 (CET)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw5A-0001j6-91
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpJ-0000vv-7E
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:25 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpH-0006so-ME
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:24 -0500
Received: by mail-ed1-x536.google.com with SMTP id dm26so27097036edb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=8uMScMInLLrhbLvH0rTF7XrH2CwqIBpkKtpIern7QYI=;
 b=OVY0S84goTKr1zxytdNcf41mCz477BvDKyJ6S8tCtE1XdO/MJa9Vw+CfORqixh7xYS
 pn7GjeEwOJJgUguHfQyxRWwAQ8hXZ2QEwx9nwPLul5nXobKex4dAc7nV5sW21A47jRGw
 m2X8ifnKSGI0DFbmtrh8DNhoS+P5X2DbpazV1nqlwoC7hmS5gn4cIMyWJGhOXLtThk1w
 VVC4+xRl+uA9DpZs3uaUqF0s34Ep4ghCSJfQo1lPpx+Tl2KVpIyCY+ifR7zExEp7X5Hf
 IRGvpBOiba9/oLmAuRY6/XJjgCMHSOmbnATrv4bLgfOZ54SrVivJ26eZHc5le1cZOzCO
 E0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=8uMScMInLLrhbLvH0rTF7XrH2CwqIBpkKtpIern7QYI=;
 b=DRE1anvnrdEyu7trGdYAjQWHC45JJ0jFSJCGEU0s0FOfouH37SsZze3QFluRTs6uDP
 kTDiMxCFlr+JvF5UuUkNASanHuXiRdLt9fQG5fPu7+SiYI1JXd4b4JaLGlD/5gl9A1x/
 xtf1dTnLrnpT3c0jkcwhaZ6zSTAvmf5C1G8ALDe/31mO2ckOCm3GBenlcL4/VU1DecWX
 C0xmTFCj8GUFDoRJxuv4xMwPGYOZ/kT9FaXo/0aDFPyLcWgMB4u4klb1xgLDXk2vj/4Q
 TCnLhYh+sdRst5objPoovYxAkB7H4WarSM3Ll9aYUmbXGvEo3dHZgi29cYsFMFWxJ8Ht
 3j0g==
X-Gm-Message-State: AOAM530+VYBREr7tKyLu7dlBKf5ZEpZ7PZ1uBf+WZLNvIz98tA7owOgN
 NVFOZfBMyzmLvgYlwhbzTmA=
X-Google-Smtp-Source: ABdhPJzRiWmi71P3S6vzs81ecqxahjy7EwPkCcsTObktXWhEJi/EpthC8R+HU0GKigWOUfUWKbRgXw==
X-Received: by 2002:aa7:da46:: with SMTP id w6mr2429489eds.40.1615371142440;
 Wed, 10 Mar 2021 02:12:22 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 04/10] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Wed, 10 Mar 2021 18:11:51 +0800
Message-Id: <20210310101157.15136-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/vmxnet3.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f629..d993cce097 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -39,7 +39,6 @@
 
 #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
 #define VMXNET3_MSIX_BAR_SIZE 0x2000
-#define MIN_BUF_SIZE 60
 
 /* Compatibility flags for migration */
 #define VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS_BIT 0
@@ -1951,7 +1950,6 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     VMXNET3State *s = qemu_get_nic_opaque(nc);
     size_t bytes_indicated;
-    uint8_t min_buf[MIN_BUF_SIZE];
 
     if (!vmxnet3_can_receive(nc)) {
         VMW_PKPRN("Cannot receive now");
@@ -1964,14 +1962,6 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         size -= sizeof(struct virtio_net_hdr);
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        memcpy(min_buf, buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        buf = min_buf;
-        size = sizeof(min_buf);
-    }
-
     net_rx_pkt_set_packet_type(s->rx_pkt,
         get_eth_packet_type(PKT_GET_ETH_HDR(buf)));
 
-- 
2.17.1


