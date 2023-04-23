Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75046EBCDF
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:21:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRC0-0001rO-HA; Sun, 23 Apr 2023 00:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBx-0001r6-3x
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:13 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBv-0000lV-HE
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:12 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5208be24dcbso2628830a12.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223550; x=1684815550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VY0RJ2zeL4ADYhynCOJEmTANyW901p2WIKUi3FWJhB8=;
 b=WwfTgwtHW/4kdfL7zuElcSaFlK3/hg07Vh93AixJSw5nwRaMD1aSWw+SH/LiyVAty6
 5MoeCsySVH9D1hJNqz5V6Nt2fXa0UGODNEbBWxsyOnlyWhV9hlTQrryi3FdDh/XeOTeX
 TmEmWX5p6lXcCoUUJIzLrZAmWRGeMARhIuAMEkhdxy+H0CEECcX9YBQSZcHtD1rOHO2a
 S2j0f61coaZ+qLNyhPmAnC0I/Lmy6H2XJi9Myv6ITiBmyb7t6IuKVlU9nj4ze+l3u/xN
 VAof0sK+AASKSM2zeLiSt1d4yOUh6h4CzDA+GI9j1u423m93gNzU0EmBB4PyY+8Og+v0
 BADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223550; x=1684815550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VY0RJ2zeL4ADYhynCOJEmTANyW901p2WIKUi3FWJhB8=;
 b=dbGqaiMI5ArXcZlYU8IhgCtnqKcmmUxpoAhZm1ctd6hDl6iGjmRL4A3HrXkv93+9/m
 4tfCngbuJvY78qhkg38ZhTCVivvL5bGzv1bzWYxzhPxLl22TZFKXDq3DsKlIj4VKnT9v
 aj5BOGemBsco3hkhQDERMk3zZ3MJ6kolVu6W2iNrC3Eocf5KKU+qyv4RjKbc7qc+9jj9
 0QEI4XJkIE2Z+EYiJhVJgeDz4NxG3AOv4lGPq7/ACMlyph/Aw4tPt7320qeVc82Cviyc
 izfulvts8hCWaF7ott+OB1TxoPZU71DlAfpoRL7U3zkX3vGmn4GHlDL0A4EPWfJgv5uy
 OddQ==
X-Gm-Message-State: AAQBX9cwwIXmA0ZLAR08TriW/fNGG07ATLAL3vXDZsH0w586qkLSyStZ
 TKZxOmISRz6zIt9213ptUt0M3A==
X-Google-Smtp-Source: AKy350Ykka3HsFBZxEgYqt6vJ8dScXS07G6BKQD+G+eDL5rA2yRytVdDWKsQMvB63QbL7XeSsnW8mg==
X-Received: by 2002:a17:902:c405:b0:1a6:f5d5:b80a with SMTP id
 k5-20020a170902c40500b001a6f5d5b80amr13837198plk.38.1682223550363; 
 Sat, 22 Apr 2023 21:19:10 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:10 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 08/47] e1000e: Always copy ethernet header
Date: Sun, 23 Apr 2023 13:17:54 +0900
Message-Id: <20230423041833.5302-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

e1000e_receive_internal() used to check the iov length to determine
copy the iovs to a contiguous buffer, but the check is flawed in two
ways:
- It does not ensure that iovcnt > 0.
- It does not take virtio-net header into consideration.

The size of this copy is just 18 octets, which can be even less than
the code size required for checks. This (wrong) optimization is probably
not worth so just remove it.

Fixes: 6f3fbe4ed0 ("net: Introduce e1000e device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index c2d864a504..f3335194d8 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1686,12 +1686,9 @@ static ssize_t
 e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
                         bool has_vnet)
 {
-    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
-
     uint32_t n = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
-    uint8_t *filter_buf;
     size_t size, orig_size;
     size_t iov_ofs = 0;
     E1000E_RxRing rxr;
@@ -1714,7 +1711,6 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
         net_rx_pkt_unset_vhdr(core->rx_pkt);
     }
 
-    filter_buf = iov->iov_base + iov_ofs;
     orig_size = iov_size(iov, iovcnt);
     size = orig_size - iov_ofs;
 
@@ -1723,15 +1719,13 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
         iov_to_buf(iov, iovcnt, iov_ofs, min_buf, size);
         memset(&min_buf[size], 0, sizeof(min_buf) - size);
         e1000x_inc_reg_if_not_full(core->mac, RUC);
-        min_iov.iov_base = filter_buf = min_buf;
+        min_iov.iov_base = min_buf;
         min_iov.iov_len = size = sizeof(min_buf);
         iovcnt = 1;
         iov = &min_iov;
         iov_ofs = 0;
-    } else if (iov->iov_len < maximum_ethernet_hdr_len) {
-        /* This is very unlikely, but may happen. */
-        iov_to_buf(iov, iovcnt, iov_ofs, min_buf, maximum_ethernet_hdr_len);
-        filter_buf = min_buf;
+    } else {
+        iov_to_buf(iov, iovcnt, iov_ofs, min_buf, ETH_HLEN + 4);
     }
 
     /* Discard oversized packets if !LPE and !SBP. */
@@ -1740,9 +1734,9 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
     }
 
     net_rx_pkt_set_packet_type(core->rx_pkt,
-        get_eth_packet_type(PKT_GET_ETH_HDR(filter_buf)));
+        get_eth_packet_type(PKT_GET_ETH_HDR(min_buf)));
 
-    if (!e1000e_receive_filter(core, filter_buf, size)) {
+    if (!e1000e_receive_filter(core, min_buf, size)) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
     }
-- 
2.40.0


