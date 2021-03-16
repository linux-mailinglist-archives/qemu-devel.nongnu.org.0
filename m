Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A368733D384
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:06:52 +0100 (CET)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8TL-00049J-Kl
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8R8-0002NA-V3
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:34 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8R7-0003iO-5c
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:34 -0400
Received: by mail-pg1-x535.google.com with SMTP id n9so21490420pgi.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lZ8TOS5Tq+UzkmQqVTu7P3gHHIXPHi7LoHFpHXM9B6U=;
 b=aJmJvQvq3bO/DIYAZDw/0h7SB7Remz5sZfhjmO2t0oaHrHo14coOBF3mJCm05mn7UL
 BACY7osa2SkLUz7B2LYPl66XxnOIJvZnAcp/wLId2fZ1JvtdERIPZ+Z8Yc2VmO20krLA
 Mg3JkkgZ7CYwHQ3l6hCjzPa1BCRMgYGQr611b06TVhSfEpmzXGdBSCTcKlZsIyStImfY
 MuJc2mifm63rGMVCshcn6qrG9auDl1uWYauemAMNbRqX4H8EqrVdjympPcbqnHaaPrcR
 kwHQuEBFEVHBJ30WuC9gGAkwwSPbxqn0TGA9oSLtwSnlZsJXXvvftXm9+5M3nTdtb4Jl
 qiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lZ8TOS5Tq+UzkmQqVTu7P3gHHIXPHi7LoHFpHXM9B6U=;
 b=QYbIf9M6Fp5GKpckbIUg2NHP2X//bu0StcE3rlm1yAMY9Rz8kfCHW8t7gj7/Nknfm3
 uX9VT7AwOYjwRM98dyN5M9m+HFZotxMukLLgPS/51sn6aEBuHEUp2PoEc+0gHVfTi0sF
 BTBd5dCuhFeBojQ9cG+KrT5hx+VxkagXDACFNH8E6pUgk3Tp98OygT0fnhmAbGDU+3wt
 fTiTyMrlaQ9VfzauctXVmQAx+yBFn+RBik5okhBpox7h+rZkuiuqEAAqs4RmNj92dzjI
 G+lzhtDzIq/x9UHtXJvTtKvqdg8FMvXZsVicNluXUzqkHrTdNCJ13G1XUNwDj2gSbi7X
 vNjQ==
X-Gm-Message-State: AOAM531tihzHpsOYoZWIzQPns6oqJVxSO6pW5cYG6DAwGW9ujBVQGeqU
 aEcth6JhNoil5dnYRADj6c8=
X-Google-Smtp-Source: ABdhPJznph3JEihJVDPqBHZ1sj7PnQvNYi6IBfpCUuDYDyVDsuYGMyWxzqggNCQqcD/Xm0SgbSBA4A==
X-Received: by 2002:a63:d211:: with SMTP id a17mr3628848pgg.225.1615896271803; 
 Tue, 16 Mar 2021 05:04:31 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 01/12] net: eth: Add a helper to pad a short Ethernet frame
Date: Tue, 16 Mar 2021 20:04:09 +0800
Message-Id: <20210316120420.19658-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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

Add a helper to pad a short Ethernet frame to the minimum required
length, which can be used by backend codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

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
index 0671be6916..6aabbdd0d3 100644
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
+ * @padded_buflen: buffer length of @padded_pkt. If the frame is padded, it is
+ *                 written to ETH_ZLEN, otherwise it remains unchanged.
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
2.25.1


