Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A46A6969
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:04:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM0-0004Dd-I3; Wed, 01 Mar 2023 04:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILo-0004BO-MG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:23 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILn-0002ms-3z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:16 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l1so12667081pjt.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6vp6dv83Vf40I3tbMcnSG4AhIfhnL/EIy8Bk2DCRgU=;
 b=eoomrohaLX13B+Nj4oZsGO3UqZvMuRmP6pWAyWatXmMMKtxkUDfOUM4WWgTSXyUhkR
 Pvzzsm5VBXUHjrIDXr6p/WNzc9Wvrb6fe0BPmzDV8XOiG8YOsBX17zNyDegi9qaTpfQk
 PWvjkpWCyuwyMqszSHElG3QmvukF0aOtU25KEra6RtJDEx80NnDshvaFR+UPlCOjUBY2
 QOgzsmLbySYCC8L6E/Qi3vizdbZ/Zht6G/x//fw/C/UP9lWa2KvmOOrkKJXABBSaro4l
 NuzQrKhmcRufaq6i4IrFljZidnF91ZCUGf8cNfFuqdcUsdGDyijdP80xYmFsh9U2b+3+
 HGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6vp6dv83Vf40I3tbMcnSG4AhIfhnL/EIy8Bk2DCRgU=;
 b=RSShOkptLaqXc4QcjIc9pzNgJiMFFuThqTXYiTITmRJYcndTDOc2E2qEZCzUDYNeQK
 gTls2ceIc9/rjk4V4D+rF3zFxkfCsOexm6znBnqzPfia1lJ7KLy+xZpBY11hivRQ3fSW
 nIBBG3Gk+Pn8zUwzUFKUo8BEB9ycp8xT+pA5kTCLJC/GHUxO1vrY4e3EgaxkBM/QVQh8
 WQtgTCdkP/SvhTxMdf/HiCDtU76+G6p5G5SioDsMUWDoTyYyMkIWOJiKvlCq4vu4Am1t
 Kx2UaAg4Ds4RrN6KS4VS1v19DLDNw/+0Lp2yDbudMHHTTgDb3SibbFeIewMEXfE82bUe
 BpUg==
X-Gm-Message-State: AO0yUKU5feVLk+rEGkvy/XsiJhV/gk+hGbynidsz59P2M1NScW0+D5u5
 F3L70+a7qXDrxbfBXFU7xZ4=
X-Google-Smtp-Source: AK7set9Cd1Z9sQ7WfRZBZmWXpNnfZJvK0FBanxn9yYOVrIRRNILxCBxce+ieIoIiJQzqDkUvABjgWg==
X-Received: by 2002:a17:902:e74b:b0:199:33ff:918a with SMTP id
 p11-20020a170902e74b00b0019933ff918amr6946023plf.21.1677661333471; 
 Wed, 01 Mar 2023 01:02:13 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:13 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bmeng@tinylab.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: [PATCH v6 2/8] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:01:57 +0800
Message-Id: <20230301090203.1601925-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/net/vmxnet3.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 56559cda24..ea01b1f75f 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -40,7 +40,6 @@
 
 #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
 #define VMXNET3_MSIX_BAR_SIZE 0x2000
-#define MIN_BUF_SIZE 60
 
 /* Compatibility flags for migration */
 #define VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS_BIT 0
@@ -1979,7 +1978,6 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     VMXNET3State *s = qemu_get_nic_opaque(nc);
     size_t bytes_indicated;
-    uint8_t min_buf[MIN_BUF_SIZE];
 
     if (!vmxnet3_can_receive(nc)) {
         VMW_PKPRN("Cannot receive now");
@@ -1992,14 +1990,6 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
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
2.34.1


