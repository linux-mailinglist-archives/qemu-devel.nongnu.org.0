Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB4C33D394
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:15:16 +0100 (CET)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8bT-0002zY-BT
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RL-0002mb-S5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RJ-0003pJ-G2
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so1318915pjv.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDY5/g/gC6eo84W4qmxfF87Ec8RE7ffVUvzKqUw02Ic=;
 b=TLD4FyGJIdh2bByTMMpkDrKZ172HjyBixggGwtjgBVj6QtWtyNx7tPX44+gvumkveZ
 NuBxy5r/UPZ0bL8mJal1bGrZE8y8ZIcrhCwBtx1pPqd9oFhLwFxrys8/KBU3f4ZtrmnH
 X075SO4UeoQH2RggNZdf9dsNg0/AqLydqgRIa9GQTMDBxzHly6zQyxkELknrl1gAODfl
 HxJDdqVzuxKT/3LAj1vtc1MTtZGp07F/1wDaT0ph6JcFhEgMQBKSPMVP0SgqBD8BZZPV
 4oWe0PQkNT9LoXaAsfW3sTU6TaOimR6NzmxG+ujrqBAFHpwzN4C2RKJaXm6t8VVMk4SW
 2yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDY5/g/gC6eo84W4qmxfF87Ec8RE7ffVUvzKqUw02Ic=;
 b=a+GJgiOuO5yGNGpDEoCe0FQzKn4bYOiIVs8THXUA21woFlKlvBEUzwWevjcKgNcnjW
 v4GS/b4cTt9IMFR6kF5myLtvnfNn6OIAhZDnShi0Tpc42hR5QP8btS5McqDFx/h3vrG7
 +JUkNWgT5waXRMtv44Yc+KDRzx1NLrUOY0ORWMykd10o5QqE9AX1NEW4/uaPUWouxUVX
 YlYEY/JrLblWTHJbI034XSoOyt6DwNwI+4ooW91aOekEPX/ECsbcXMeXwtMlQ+pOb04f
 Q9aXMm5Kn9JkWsJdGoGU70OBBHFVzVyX1mZwxLLkBVtUDds+T9Ek7N/WBQG45zRvSBty
 RZhg==
X-Gm-Message-State: AOAM530fc78beXlMtVTQ47TYpMdVhRLjwtZsuuff+Qx/J3is5FnY1ZMM
 KQmeLID+GGQWaRnYaLRKMAI=
X-Google-Smtp-Source: ABdhPJzXmg1iGsqaPcb31KYM6j8ltb4o6SuIkOt1ikLMQiNs4/sOpgUf5x1YYKCxOyPPsZhwYO66NA==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr4565744pjb.95.1615896284094; 
 Tue, 16 Mar 2021 05:04:44 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:14 +0800
Message-Id: <20210316120420.19658-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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
2.25.1


