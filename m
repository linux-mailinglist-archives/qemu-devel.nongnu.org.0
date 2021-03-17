Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A2D33E9BE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:29:29 +0100 (CET)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPgN-0005DT-W6
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe1-0003YK-C7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:01 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPdz-0008Ui-Kz
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:01 -0400
Received: by mail-ej1-x62e.google.com with SMTP id p7so738719eju.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ofNCt4IqFempV2fS5VLJE6TwBn3PW2075cIcAlj7O8c=;
 b=WFKQFlYPPwSKaqtAJ6Gz/Bnxc0nSJ+TEh+IZSXq7LjPm3RgQ4yCnurKsUPN5rrSNT5
 8PJwdKU58ftiG6KrA5LvADPYMH7a5342XxwgqDt+BKzug/91Eyt81Gkq0Ey2KTozsaaB
 2iIgTnku3EaHzYZrMKJWoNSW4hv9nktjXhyixQ9HzTF2L3CYMlGVm3rIzflYC2Z7ySfv
 NviZ9s0+EqFj0iDeYg8Uoc1z6GR61i7+jtFClstTXXX7Ct5U47CwmlvYpGcBWfmYtSNj
 QR5IBlUGAEB+RlaVZUbnTibPPJMEJ/lCmDLtJeUaUqhDXQbMT8CJrl663A9bomah+Xgv
 Xwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofNCt4IqFempV2fS5VLJE6TwBn3PW2075cIcAlj7O8c=;
 b=dEWf7hZCrcjP6AIM/ZbyR6dALF7U9/lTMdEoxrD2HUffbCzPxEu0yHuq2VLulWOnWm
 pVRdJszvCd0IctuD6CJStD+uvwqsNa3sFdEuqDLIlwv+BvVN8s45WcmB61Bc6Z11uBJe
 ss03NWs2neuLdODpQ1/r+5sDLk+ik2KDX5BZCRiNdUd6eVCaclqVP5ES4/cSSBa7t591
 rJ3ZyYvYEePyQhzav/RFy//dKW4sn9u13Sjgk+hL4sM90wG/zMmQasIo5olQyDpb0kM7
 HlrHdG2stGuFLG5Mr1DQx2DIiFhOSbtHTrS8gXAyIKSsK2lIqB3mMhl499lb85DZOMLm
 nTIQ==
X-Gm-Message-State: AOAM533w8pxQVobLKBc5AnnhcqH/Inru32yEoHomwKS03pk+7pzKli9z
 0eUi6G92UyNZbLXTXKtmTA8=
X-Google-Smtp-Source: ABdhPJwVCRGujPH7Gbn6FkrgIaXpIZvnLQrRh6S8te0RlPXTYt4jwULvyjMps5MAM1KC4JEjgd1KMw==
X-Received: by 2002:a17:906:5949:: with SMTP id
 g9mr1798906ejr.518.1615962415174; 
 Tue, 16 Mar 2021 23:26:55 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:26:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 01/12] net: eth: Add a helper to pad a short Ethernet frame
Date: Wed, 17 Mar 2021 14:26:27 +0800
Message-Id: <20210317062638.72626-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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

Add a helper to pad a short Ethernet frame to the minimum required
length, which can be used by backends' code.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

Changes in v5:
- minor update on commit message
- update the eth_pad_short_frame() comment

Changes in v4:
- change 'ethernet' to 'Ethernet'
- do not inline the helper
- check the padded buffer size to avoid buffer overflow

Changes in v3:
- use 'without' instead of 'sans'
- add a helper to pad short frames

 include/net/eth.h | 17 +++++++++++++++++
 net/eth.c         | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be6916..7767ae880e 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,7 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
@@ -422,4 +423,20 @@ bool
 eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
                    size_t ip6hdr_off, eth_ip6_hdr_info *info);
 
+/**
+ * eth_pad_short_frame - pad a short frame to the minimum Ethernet frame length
+ *
+ * If the Ethernet frame size is shorter than 60 bytes, it will be padded to
+ * 60 bytes at the address @padded_pkt.
+ *
+ * @padded_pkt: buffer address to hold the padded frame
+ * @padded_buflen: pointer holding length of @padded_pkt. If the frame is
+ *                 padded, the length will be updated to the padded one.
+ * @pkt: address to hold the original Ethernet frame
+ * @pkt_size: size of the original Ethernet frame
+ * @return true if the frame is padded, otherwise false
+ */
+bool eth_pad_short_frame(uint8_t *padded_pkt, size_t *padded_buflen,
+                         const void *pkt, size_t pkt_size);
+
 #endif
diff --git a/net/eth.c b/net/eth.c
index 1e0821c5f8..f913e4396f 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -548,3 +548,20 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
     info->l4proto = ext_hdr.ip6r_nxt;
     return true;
 }
+
+bool eth_pad_short_frame(uint8_t *padded_pkt, size_t *padded_buflen,
+                         const void *pkt, size_t pkt_size)
+{
+    assert(padded_buflen && *padded_buflen >= ETH_ZLEN);
+
+    if (pkt_size >= ETH_ZLEN) {
+        return false;
+    }
+
+    /* pad to minimum Ethernet frame length */
+    memcpy(padded_pkt, pkt, pkt_size);
+    memset(&padded_pkt[pkt_size], 0, ETH_ZLEN - pkt_size);
+    *padded_buflen = ETH_ZLEN;
+
+    return true;
+}
-- 
2.17.1


