Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5316EF252
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXI-0008Oi-2I; Wed, 26 Apr 2023 06:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcX7-00081Y-9b
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:58 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcX5-0002vu-Ll
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:56 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b50a02bffso5717756b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505473; x=1685097473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNBRwTKoPfNm6mzC2ZqFXQ6r5NBvVjojYda1M3prEL8=;
 b=xbp7JSXw9OygpZBL6B/c1fxfo9gN4SrniVh441BTLn5CpfyxA5Peh9w3xTvdoTm5wn
 P1xYUEG2Ymutk8R8qDudag9KUpl+0sCpFTk7u0yB9dLuXmdEoBzUCgL5Q2T2ioEZoD/8
 992fKe7D2ncfnOcBpYUPw+eO4fQzVIONH7PydqolflGl6W1jAhGTZ7xR4gfS6h33o29y
 s8PWQwhcQRzahUf5OyW+mkFQDIzOy2YO71KafX3e0KhBQJaERa4Rf8G5jX7KLfDR1gAW
 PDcZl4KODURv2raCPhVR4auGX+OBOa+y/Qhx+d2UcQrdrw0PmiHQdNalqZZ5ySlVxvtO
 uDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505473; x=1685097473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNBRwTKoPfNm6mzC2ZqFXQ6r5NBvVjojYda1M3prEL8=;
 b=DnNkXtqLQrTiy8Vyyo+5GBf8y0nx6+g2EEjKiWajgfAVICM5EYR+C7UzolGWNd84al
 Wenj3mNPpGqeHWheIzCxV06rk8a/zIwYVn4/J9AGVPpOyVIqt6X/8uRWmlVuXOMexgsC
 ljxxn3UoAvrQFro/0vir4Z9ZXt0vN9PAYj9rmEi7HDV5aPWHDOnvqXaIwfRlXv4P2fAb
 MwP//hL5XfVjN409O6CwfK7sxx3kJk2EWAnP4Y63823C1aCju5AvkPbCf82J0j9htGaR
 HicPXLSnp9MdCnqec5JndZqIuYOyNV+JI1UtgtJbl2K1UgsvZIDQmfwlbBuFQN3rT0H/
 w4mA==
X-Gm-Message-State: AAQBX9fjAFSg2jQHR8PFTgAHa4AWIEP8eIT59e5AcT/WlOaiKZVEwnac
 5CFm/tyjojKFC+5rGtB3AUCB1A==
X-Google-Smtp-Source: AKy350a7cphy69wXGmqwOnc01HtTYtJPprqWQZ4OxJezPtOECYIz3XMFasDz36KjC5B5NtKP+cb4MA==
X-Received: by 2002:a05:6a20:4323:b0:ef:bf77:f76f with SMTP id
 h35-20020a056a20432300b000efbf77f76fmr26933146pzk.4.1682505473467; 
 Wed, 26 Apr 2023 03:37:53 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:37:53 -0700 (PDT)
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
Subject: [PATCH v4 08/48] e1000e: Always copy ethernet header
Date: Wed, 26 Apr 2023 19:36:36 +0900
Message-Id: <20230426103716.26279-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
 hw/net/e1000e_core.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index c2d864a504..14b94db59c 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1686,12 +1686,9 @@ static ssize_t
 e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
                         bool has_vnet)
 {
-    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
-
     uint32_t n = 0;
-    uint8_t min_buf[ETH_ZLEN];
+    uint8_t buf[ETH_ZLEN];
     struct iovec min_iov;
-    uint8_t *filter_buf;
     size_t size, orig_size;
     size_t iov_ofs = 0;
     E1000E_RxRing rxr;
@@ -1714,24 +1711,21 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
         net_rx_pkt_unset_vhdr(core->rx_pkt);
     }
 
-    filter_buf = iov->iov_base + iov_ofs;
     orig_size = iov_size(iov, iovcnt);
     size = orig_size - iov_ofs;
 
     /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, iov_ofs, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
+    if (size < sizeof(buf)) {
+        iov_to_buf(iov, iovcnt, iov_ofs, buf, size);
+        memset(&buf[size], 0, sizeof(buf) - size);
         e1000x_inc_reg_if_not_full(core->mac, RUC);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
+        min_iov.iov_base = buf;
+        min_iov.iov_len = size = sizeof(buf);
         iovcnt = 1;
         iov = &min_iov;
         iov_ofs = 0;
-    } else if (iov->iov_len < maximum_ethernet_hdr_len) {
-        /* This is very unlikely, but may happen. */
-        iov_to_buf(iov, iovcnt, iov_ofs, min_buf, maximum_ethernet_hdr_len);
-        filter_buf = min_buf;
+    } else {
+        iov_to_buf(iov, iovcnt, iov_ofs, buf, ETH_HLEN + 4);
     }
 
     /* Discard oversized packets if !LPE and !SBP. */
@@ -1740,9 +1734,9 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
     }
 
     net_rx_pkt_set_packet_type(core->rx_pkt,
-        get_eth_packet_type(PKT_GET_ETH_HDR(filter_buf)));
+        get_eth_packet_type(PKT_GET_ETH_HDR(buf)));
 
-    if (!e1000e_receive_filter(core, filter_buf, size)) {
+    if (!e1000e_receive_filter(core, buf, size)) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
     }
-- 
2.40.0


