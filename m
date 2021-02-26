Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F76326116
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:15:57 +0100 (CET)
Received: from localhost ([::1]:46664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFaA8-0006aG-6g
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZyD-0004Xr-Sq
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:38 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZy7-0003CP-IT
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:34 -0500
Received: by mail-ej1-x631.google.com with SMTP id r17so13769132ejy.13
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 02:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEWfqxxnvDDGBt8B/yYfy3YMj1liC4MhvByCE+lTPOc=;
 b=qUbTghhVjFs7FQVDaczumSzkdg8UX9lC9aSZ58WvYE5BTwyTxFoAaU4lWhfBZ+OsOl
 MwG2ESkasuPxNe6PBeBjlF376z+AoFFb/zAXeBXCICqilB2Vb/aI3ueiljPoxlYjE7Vj
 Ybd9Eewi/3M7vfG7xRWnpOHQuMcGOn1WKWdymPBCqCMwsvlOOO44yPKZ1ICMz3rfzQHi
 1rbSL1dQmgssakC1qxKeZ3ir/GIIUC++nyffbThFokOXulxHybIEkVgJg8XNaokiXJCs
 ++iTDLc75+DvVWDIthyErCnc/e4GvdyqC5utnQ/G6IyQ3q6mGHqpPQ1BebJpp/poSq1U
 Xojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEWfqxxnvDDGBt8B/yYfy3YMj1liC4MhvByCE+lTPOc=;
 b=pzhHRAZw3nV1pYIQQFJHqUUSYcSWgNV7UZrFJjneAf1q08HFKKfOJ8Gxen8YWmwwjw
 ZIopC66evq1nDw+EMZOwkDiGWU0bDlb7NMfXUmx8+aHlwnJfIAQfmfJvubSh/D4ORmYj
 2ZqLdKVag4A8VIOsNg8kioGuqAlGJHh9OwtK5BVeumiSmuFozz59eZbHS3K4tyXiQzdO
 8vsLe3XU6QF9EErT0tBtqUZ1ETWUm6oTr/dsfpwrAk6X5R4q9wGBlVn578zNLLaaXrFe
 tPhmgctJiEK7cm9MuU2OBakkGARkW9NtECQ8bEmQhy/T8jhMe2bbVB+xMeZaiOIYBo35
 wc/Q==
X-Gm-Message-State: AOAM532hrRW1IN7MkGeh5Na8DDF9lsX8ifjA5ptNX4dtWhqDoHKH6DfF
 oBUaIqVzmwjwaEFgUUWKY6bTKrWNJn4=
X-Google-Smtp-Source: ABdhPJzxzNYAxAgpQBnbuor/tTFPJ51nvJaJM6aWgmXzYlg7CDUh5EgwDpM4K1R9i3tMFEHqxp0OtA==
X-Received: by 2002:a17:907:1b1f:: with SMTP id
 mp31mr2444096ejc.348.1614333805189; 
 Fri, 26 Feb 2021 02:03:25 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a26sm5667554edm.15.2021.02.26.02.03.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Feb 2021 02:03:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] Revert "vmxnet3: Pad short frames to minimum size (60
 bytes)"
Date: Fri, 26 Feb 2021 18:03:06 +0800
Message-Id: <1614333786-74258-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This reverts commit 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e.

The short frames padding is now handled in the QEMU networking codes.
Revert this workaround in vmxnet3.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/net/vmxnet3.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f..d993cce 100644
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
2.7.4


