Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BFC6E89B6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9P-0006tD-5i; Thu, 20 Apr 2023 01:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9J-0006sY-RV
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:06 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9H-00015i-GG
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-52019617020so543485a12.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969682; x=1684561682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VY0RJ2zeL4ADYhynCOJEmTANyW901p2WIKUi3FWJhB8=;
 b=nXWRV1+e/gmt0rbWJPg705bkgC+v/OSoLV43Me5JNn+rFigGNrzbNdsFEZghSD9Y87
 4S5TvPfeN0B8XIPQYyzDx4ud2C0GmtppvplP7sbIXQKyoMGfSR63gWpi1GtglYqC0l0x
 H7dfHVuRP2NYlB6jVBsYdCfj+wWEhsB+G631WGRTxgmACj9nD1goVJ1MwL0lQLwRxBUd
 iYWdPex05EnK9bf8j2bNdcx9HP5NQ6nMflcHIcyOmC6B63AP63gr7KCqblSxjdYyQFCH
 gPhnhD95X3n4hhWEN/LKxm9OlWrB4XG4J0HkDLx/Tcp8hzuFyu3vEkKnB9bxUHTrwnAu
 CzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969682; x=1684561682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VY0RJ2zeL4ADYhynCOJEmTANyW901p2WIKUi3FWJhB8=;
 b=E/ZLid8QDzJpI6KfFLoExouQm7Qx7qaoawyhHTrAXXUEETc86NAwK/qn2XPKNxOk55
 3W6A820I1pejjxMR/MuDGX0685NacuiRs4rx8ItVAZH0VIngZCjcHUl3eX5drgNrs16V
 fFjVXKK1ehbnRX6gqhL09SM8pVB3JLZ87+dQlQOTPD1JZ8CdWPpA755b7mWGZrGGpL/5
 s3RcXP1z/jFMqwPAVaKeogLQPQ0N+4BzrOYTVZyRcu6IigfuFH/OMwFlqWYgaVPBRs67
 2S7SLoolycTB6XK6mN4ZkkJt/bIPB3Tfqmasp4IRzXF9i4uUd13bkMr60q0TUHZhV0VJ
 5Kxw==
X-Gm-Message-State: AAQBX9fOxKdoPlzfmFtOZ27RGVdR+smdZTdVRwH79orH73EvJTo2CdqX
 QDXSNfKs4ueyzsGTCkur5n7sqQ==
X-Google-Smtp-Source: AKy350YQjFQXElNlZcTNrabqkCXrCMjTV93rE99cvIXgq5WGo2bBkrHxTaFaTAUoU8dZ/tAhgaWCYg==
X-Received: by 2002:a17:90a:2cc1:b0:247:48a1:3fb2 with SMTP id
 n59-20020a17090a2cc100b0024748a13fb2mr589884pjd.19.1681969682196; 
 Wed, 19 Apr 2023 22:48:02 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:01 -0700 (PDT)
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
Subject: [PATCH v2 07/41] e1000e: Always copy ethernet header
Date: Thu, 20 Apr 2023 14:46:23 +0900
Message-Id: <20230420054657.50367-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
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


