Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E824433CF91
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:18:53 +0100 (CET)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4ui-0002Ny-Up
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pY-0002T5-SN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:33 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pX-0007sd-68
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:32 -0400
Received: by mail-ed1-x535.google.com with SMTP id e7so20378290edu.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=fYxXpZBSx/3UmjTv+pgNgyANPy1MdJ+W91DIofp+gdA=;
 b=O+x53o3xA61i5ErI0QZrdKPGWVyv/bKT+57fHZheOETDZ09T3dY5facDsNJsOr5jo6
 fpcm08Q3oCAmpAavvJUKMhF8coPI9+LnYF2EPF+J6QJ+nvwYGnUVvAVqx36Rie8vmwjR
 EHkN/3zhLN85X9C7QQzWieMMxDYptj8kP3UvbkCt3LU3gmW8qPuynl3mXErJQb2CnYmB
 4Ldwk2Pe944vDt/t5DELVpEDtqlPcY0IpqYz1P1A2lP679N3LfWDQiSLspMa+xHB9QG7
 hzFFf61hhX0wnS4LlhiogNITfY9VGhHjNUbmd3A/Qv8DZfsSo3hqKFtlGQygWtUOgIfC
 //lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=fYxXpZBSx/3UmjTv+pgNgyANPy1MdJ+W91DIofp+gdA=;
 b=GewLtFePoZfiFdVkfJcbwxnFFN4E0T3xPXuj2K3H+S8zzqXr8L1kvUkYD5eNXRWd84
 0RXeGQblmS5aXDLKXztx15xMR5G3EKIsnAEIy7RgcEWA2LKk+NQHOjfDQImBbqf2yDYa
 9fJ9H/gderZvrjuS45IqPHbe+TqV4PY76gx+oebuxQijvNwHUdnyjiJButFZ3CI6CU3k
 cyzU8S/99htP2aS3tpx/VNyuHMiYWNoisTP6GcPyVJHEY8+AUuoLL5K/7I+80hzGMimD
 c9ZOPJX7Qg5XwWLIAikzk7tuuM9GOq7z/AXWfeOP7ZKNvVdwpHGDHcYO09QUCFWKIZBv
 3J8g==
X-Gm-Message-State: AOAM530mxK2T8dV0p8U5XFmdV+NtvjAROCp1SlPo5JvE2QNhDSUdFGPR
 DtK2SrUXQICk4hyX2kfj6i0=
X-Google-Smtp-Source: ABdhPJyvzTs1zfM8gG6cYx0Yy2ByW/xVTPUg69+LlZGZUkk3VWkk1AW1OGxMq0P1Van5oAsSQFxhjQ==
X-Received: by 2002:aa7:c9c8:: with SMTP id i8mr34087745edt.193.1615882409968; 
 Tue, 16 Mar 2021 01:13:29 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:48 +0800
Message-Id: <20210316081254.72684-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x535.google.com
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

(no changes since v1)

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


