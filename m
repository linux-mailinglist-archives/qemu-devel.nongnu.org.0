Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19616E2291
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlW-00009y-CZ; Fri, 14 Apr 2023 07:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlK-0008V4-NU
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlI-0001LZ-5D
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:41 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b2-20020a17090a6e0200b002470b249e59so7285471pjk.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472319; x=1684064319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VY0RJ2zeL4ADYhynCOJEmTANyW901p2WIKUi3FWJhB8=;
 b=OSld6cLM00KgeWvi+jW/7AIQLv9cdpxekmMauGLXQli+y1QePP638x7fVJR3Zk4g+o
 oxSLAX2/qrm3blEj3kD0r2vs+oW5+d4uuaYVLLTatp04DElA+Udg3Vfar6BPh0hysYfr
 1QHOtaycK3xwFMtNMoZ7Wnv1HZea0wzTZpM9euKqmevn8BB9iaBigaJyvyNL3EkpCYSl
 AaH8zo6StyK0s1nojFk5SR7UwvHaeLA0RjuZvRckZNcZ8wI/A9MbW7hW0pXM3fUlhJAM
 bj/mpG9fig446iBAm4BVeo2j0qV50LtPiFjmzD7X8Fff6ma55xttBHB1vXAmU8AW8RwP
 FmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472319; x=1684064319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VY0RJ2zeL4ADYhynCOJEmTANyW901p2WIKUi3FWJhB8=;
 b=FKgegXKL9w1aQeRtg+WrqSs/Z3hvvooUzfw0op3UQZJ41V0v4JXr4GFKd07PawctdU
 Qqf4XXOs2/cJ7LWNEx4tPrpEEpLYIXRbaw5A5+4/yk+MW7OHFTBsMIRcmNzb26Yk+CTQ
 ekFhYGhoYDuLWrLZRXuR/7Ly0oClioaROc4PQJzte37ySjkKw6tYZGIzOp3etjMhz2er
 5AZJLdGvG11uI+qm6HKimxhKSOI9M8MUm+tJoYrIUFs4xce30GRmfnIIOpE0bX0nNLFC
 RzdE20ws7VuCouR4gsVvRMEeBWexbrxOwSKNW2RhVQM+fo0+pK4M1ei7q1VWMfFUb47n
 6amQ==
X-Gm-Message-State: AAQBX9flBVl0nd08TBAWF7DN4owc7R0JcWglDkiQebDXTAVTTNf5OMlL
 mBmULGesCoxZVzY2TTANYBCHGW2HzR8RwGCcuJI=
X-Google-Smtp-Source: AKy350ZzrvoPeF+iYX3Tb3gfjRFiGFTRSbVWpySAAzKl9ePgQmI9MqHjZnbtSyAcLZ8TPUMD8O0jtg==
X-Received: by 2002:a17:903:124c:b0:1a5:1bb4:adb1 with SMTP id
 u12-20020a170903124c00b001a51bb4adb1mr3165169plh.37.1681472318941; 
 Fri, 14 Apr 2023 04:38:38 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 07/40] e1000e: Always copy ethernet header
Date: Fri, 14 Apr 2023 20:37:04 +0900
Message-Id: <20230414113737.62803-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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


