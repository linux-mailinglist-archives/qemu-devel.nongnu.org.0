Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8633AD02
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:04:46 +0100 (CET)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiDV-000844-6t
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6o-00089I-3t
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6l-0004KO-1b
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso14283446pjb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0cJfk/MmMGM7/om0AP3Z+sMMMYzHl8dqaYyD6OBCYw=;
 b=Kbac9aeoEJQ3kY7jxRfwxtncdFiwyP02r/nU3Qnq3eU72IJDbVBOEjgAEbLFkQ4Tp6
 cq3FLrSw2bMIBsx3cP2uJnuGFRhjkyEhsYM2g6am/8CcpL9pdppZH964HbsTlC4oNgdp
 V85Y0Zht2/s2JU1dOwhQgtOrnSO+pNFswdavPoNnEZjdLthvYoNXImQWSRr59HBqkXr9
 kUWAWFOr5dnSKc31skwJ6kbs/A+WLo5TmAl27nD+4e8amvGifhdPw53wPCIJKx31TGEz
 lDLDiH0Nrst2f72ytMuY7Y5oF4B1bqqjv7UrRXHRrxLBr7IfZ3N2oiaqUf6yiy0/QnOd
 VwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0cJfk/MmMGM7/om0AP3Z+sMMMYzHl8dqaYyD6OBCYw=;
 b=e7pbQ2wQ31+n3Yyi33w/OQCd8tKr5mUrGcN4ODJL6j2Jxxvjdk8xSCQZabLQyJqUhH
 upTXtKb/LHwpw/+hUWT6jpubc7Rc5DOQH++ZQiQ/jwi9kYwhWO/bK6pr85X3uSQ9lGFd
 zMSpmadwBFOg9lQ5Qy6pMkcyd4meLHQnDY2a0T+Qpxeosg1wdN+emEa4FXgXBOEKIXUy
 f2BptUjc9RW4dyV29PY9jpCxKadC/Tu6c8P3hNYuyXs1wK1zLs+CbfFH3wTl9tCF+Ax3
 EvzfNwJK9sqrbNy3i3VBNmFRTs5kb0m6tOqBU30VOdeWJGdG1SBpz/PATAAaC9bRXfGY
 0UTQ==
X-Gm-Message-State: AOAM532U0OWxR6Xxm3WCxuJiADNtwom3As+IG5Yr3nwtrKILydPdKISe
 WEdCBVrMMpr1tZgqoDznKtE=
X-Google-Smtp-Source: ABdhPJxAOIOQo5jm2Zq78hKZHOp159VBv3xO8ZEDiIrrT5463jKcxhslVJDS2m0R24yzdBh7Cd1QFw==
X-Received: by 2002:a17:902:e54b:b029:e6:b39f:63ab with SMTP id
 n11-20020a170902e54bb02900e6b39f63abmr3767372plf.55.1615795065682; 
 Mon, 15 Mar 2021 00:57:45 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 07/13] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:12 +0800
Message-Id: <20210315075718.5402-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>
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
2.25.1


