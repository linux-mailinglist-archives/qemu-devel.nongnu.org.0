Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C333AD03
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:04:46 +0100 (CET)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiDV-000853-Al
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6m-00088X-Q2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6j-0004K3-NN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so14295161pjv.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rD8kvXiw+ffXZREcGsUmA2AFhuGn9ko43nXEZ/qd8GM=;
 b=IDtxp6iZbsQX1SlRezpMIAe52cJ3J5ZLhm5LkMQf21LLvIRUSXqIQ1Tu+cEWj+UoMW
 yELvpvlDj6yWkgP7Ldh2aZ7bTgxwpMZ5Q1XmdBr/03LoeO4jKhYww8zDBZs6JkuJdGPZ
 8A+gayT82wECYhw5HpB80B/tPekBN6hKHo715SHWrjt5yQZ0NnoDYWPptUqNZGUhsAlw
 09+UeYlW6LsAEPWQ1vQW51szYeOGi26LDC6xlA3Bk0xgaxMXFmpKz4WArs6/d4m4wO5u
 DrgnVo3xM+fVcMkNBrIGEguJixz73MsvttUFVy7Q9LP343G0yZMWEkPcpQXG+5w+OpQV
 N3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rD8kvXiw+ffXZREcGsUmA2AFhuGn9ko43nXEZ/qd8GM=;
 b=CelAz/BohAICNzD9UNVgpkmx6toY0cKsTNYQc+++uct+bwTmz5rbbv/X0UeiMRjZMr
 u5Vbh4L7NS9ePOQN9qrYWAQcm91zDxJiFFQdyL07OsB7Sp9B4w5yHL+zicdfYmsLbqAA
 EyTWzEBx2iQOieHzh4xODnP+A0Pu0uIlTHCHghWsblOqUryJhWvbRIPF8Z2uGGL7E6Fk
 E5onKYjLLq65f5xzgsfDeFIi4hh9URHGY9LF3VlnvnhU+A8jVcpPiXODo3SwIpPcr6GA
 bmxfZ/8oLtJwYX3FyUsKBKwf5WEFrjQuqXzAzgFiAiNKyBln3MG7ZGzn2ax8KabAQbhE
 V/kw==
X-Gm-Message-State: AOAM533xQVIldtFHtCuzN4NCLrp8K3cHgFFWKJ2lrWRHGyfVw+jrTxKK
 H33sT5FZsMbopGFtq6e7Fr0bvCEztZE=
X-Google-Smtp-Source: ABdhPJwn9PpdjS5ZmDP4VyCV77i8NFzHgGCI1uhF94j/S1BRJC3C7dJz2SqSfnoLVXpbdRgakdZdxQ==
X-Received: by 2002:a17:90a:bf15:: with SMTP id
 c21mr11476325pjs.160.1615795063430; 
 Mon, 15 Mar 2021 00:57:43 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:11 +0800
Message-Id: <20210315075718.5402-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
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
2.25.1


