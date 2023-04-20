Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E26E89DF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9y-0007an-7l; Thu, 20 Apr 2023 01:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9e-00077Z-9G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:29 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9c-0001Eh-8f
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-51b6d0b9430so435126a12.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969703; x=1684561703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NH/ll5GymINE+o67jVPDPh88ENZTXN2KmByhXu2lJk=;
 b=gahnLMAWOp43nj6qrQPYbU9B6LR093xJyIqyVu5hr1DfhKFTKRxp/RTMPxAZ3EBN3T
 9r8X34o0da4+tqDQLKJCPkNWkTQXvgH9wT/i5fKTMGeo+1OjCe+1VaLnJxCZ70gLvNbg
 jswl0xI+fAVvVxx694f0wgAj+oL9hHBIB3awYeHn09rYq98isrSm0iyNKZiptLQsTJsD
 peUYl55EJzI5ffPIy245JKkOgQakvuw/vnvrAkJuswODFFAf6fayA6EOZDRWZOOPzJYv
 HNWGFRdwZBAeLzbviH5eJ7PIgXb6l2PI1OpuY9/1TBHjx5qojAEYkZMWwVMh4Vq9bkcS
 5NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969703; x=1684561703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NH/ll5GymINE+o67jVPDPh88ENZTXN2KmByhXu2lJk=;
 b=JDnbLrCBx3XabFDOKMaBR9jhpAxMXWGirgqZdxP3JD8dISigJjFCALaXgekL7vK7x7
 /GHX4cq5a4hRvPdyPUBZMUM3kkVjKePYQgLVaBDXOTGbCyvb9g50SOTwoikY8forsK/j
 ug2VuL/ZsjRQvakd0XmLLaxeQKmXV/fWpWfL/dlI1mDrj0Xyb0mwxwmJFCJ8st8rk7lA
 9CvMWTc3mucUyd3FwSFdMkehpft8OtmMdARJggo5MDkrX7/Z7GGJMwYPbZmoXiw225Jv
 yhx7S2jkGLEvuSJz85NEHRKuwVVepT8a/h0B6L73Hk32zfKhXZKObdUqopBSDPAP+ZbO
 2lbA==
X-Gm-Message-State: AAQBX9ckm0n+m2eajik/HIhjkpSEzWllOKHTHU+SVuNEh99BiG0otD6T
 BVaf6riSoCMyLJg/UfdamK+9dQ==
X-Google-Smtp-Source: AKy350boph9iAet2YIx7+uhgZJlfIJtAzgHy53RoUKqiLfn0uFo5ejeOhisxmnTL9tIYtW+E1aJBWw==
X-Received: by 2002:a17:903:32d1:b0:1a6:dc1f:6230 with SMTP id
 i17-20020a17090332d100b001a6dc1f6230mr415591plr.55.1681969702881; 
 Wed, 19 Apr 2023 22:48:22 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:22 -0700 (PDT)
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
Subject: [PATCH v2 13/41] net/eth: Rename eth_setup_vlan_headers_ex
Date: Thu, 20 Apr 2023 14:46:29 +0900
Message-Id: <20230420054657.50367-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
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

The old eth_setup_vlan_headers has no user so remove it and rename
eth_setup_vlan_headers_ex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/eth.h   | 9 +--------
 hw/net/net_tx_pkt.c | 2 +-
 net/eth.c           | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/include/net/eth.h b/include/net/eth.h
index 9f19c3a695..e8af5742be 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -351,16 +351,9 @@ eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
 uint16_t
 eth_get_l3_proto(const struct iovec *l2hdr_iov, int iovcnt, size_t l2hdr_len);
 
-void eth_setup_vlan_headers_ex(struct eth_header *ehdr, uint16_t vlan_tag,
+void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
     uint16_t vlan_ethtype, bool *is_new);
 
-static inline void
-eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
-    bool *is_new)
-{
-    eth_setup_vlan_headers_ex(ehdr, vlan_tag, ETH_P_VLAN, is_new);
-}
-
 
 uint8_t eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto);
 
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index cc36750c9b..ce6b102391 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -368,7 +368,7 @@ void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt *pkt,
     bool is_new;
     assert(pkt);
 
-    eth_setup_vlan_headers_ex(pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base,
+    eth_setup_vlan_headers(pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base,
         vlan, vlan_ethtype, &is_new);
 
     /* update l2hdrlen */
diff --git a/net/eth.c b/net/eth.c
index d7b30df79f..b6ff89c460 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -21,7 +21,7 @@
 #include "net/checksum.h"
 #include "net/tap.h"
 
-void eth_setup_vlan_headers_ex(struct eth_header *ehdr, uint16_t vlan_tag,
+void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
     uint16_t vlan_ethtype, bool *is_new)
 {
     struct vlan_header *vhdr = PKT_GET_VLAN_HDR(ehdr);
-- 
2.40.0


