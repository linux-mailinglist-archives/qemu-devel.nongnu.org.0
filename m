Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC93333A2F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:39:21 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwFM-0003Zp-42
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpG-0000un-Lb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:23 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpE-0006qp-77
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:22 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p7so26139161eju.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=+ErR6Z+Y2Il/k73obafgKyiBO/JmeOnY663d8gWjCYE=;
 b=AlSSY7HlJeJfVLKshOQ1NY9d92pE882xv2ApzNwSnETFI6z1YzQkLlV4AKLDlZ9cpE
 xQhxQ7OMG+XDQrb06yBiv9UMlszUO1zNNuadh13VtWgO+b+w1JmBkkzp7AUwIvG/GdXP
 sm/tnPTP9jAEE9D/9T0nHiTwr5+5YrE5U9n33NVib25OFupM0OcgMIe+Tzi5i2f29m77
 HMXU/qEFeplFznszwxjySybTcM9D7CwKXI8syAWdkpaMUhg7jI6E8w8mjGTDiD3/pUY4
 7ryEiy+hFMQtp3u6g36awtEuXMBQtLQtgZbJOx0i6FxU9A/AzIKm1wqMt0D5omWRn9BZ
 YESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=+ErR6Z+Y2Il/k73obafgKyiBO/JmeOnY663d8gWjCYE=;
 b=iMQjVQhG2zla5rQtpQV6NlAPk2YrtpFdblFjxJxkC43agWwwF4e2t4I5gD9T+4nwCb
 ZUTxHg3uRmzJ+zsMsUBdadLE7Oeg3KDgrgXmgdwJoINNR2ru641HTU1yJCI6Lmeym6fd
 ZTThv0oUPKDnWAN70LFU6wFyZA+3SApApQc7qJ6OU1O5gcLccVdyNeK6lxPDCnHfk16z
 K1jo4dYij9wQbRm3wgCUIFsnJjkgd1DhB8M1/LegTEBBaymqm0FE9TFx44+LnAH4LDZ8
 t/y1mqsrVfc3nLpCpf3NYtF2EAPpNEK3nt1DLyBUChXMGYevJgqqngsnehHXi+Mwx5SP
 hsWA==
X-Gm-Message-State: AOAM531j2eQzr4jWkwyzquiNDC9mWDkhyiNbRjnd/qLqmessgKIPYQzS
 /2KmaeMJNBGOdafWpwI/rSM=
X-Google-Smtp-Source: ABdhPJz39INgveqXVjVQ6v1teFFb8sZgJo8hPHdkHBuWQon9PPQsVRsxB5uMbge854tT5Ml3SGDisw==
X-Received: by 2002:a17:906:b2cd:: with SMTP id
 cf13mr2825782ejb.181.1615371138865; 
 Wed, 10 Mar 2021 02:12:18 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 03/10] hw/net: e1000: Remove the logic of padding short frames
 in the receive path
Date: Wed, 10 Mar 2021 18:11:50 +0800
Message-Id: <20210310101157.15136-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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

This actually reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/e1000.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6528..a53ba9052b 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -882,7 +882,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -898,15 +897,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return 0;
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, 0, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
-        iovcnt = 1;
-        iov = &min_iov;
-    } else if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
+    if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
         /* This is very unlikely, but may happen. */
         iov_to_buf(iov, iovcnt, 0, min_buf, MAXIMUM_ETHERNET_HDR_LEN);
         filter_buf = min_buf;
-- 
2.17.1


