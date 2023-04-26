Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581EC6EF282
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:45:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXT-0000wx-SQ; Wed, 26 Apr 2023 06:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXR-0000jS-NT
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:17 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXP-00033K-Uo
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:17 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1a920d484bdso55726155ad.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505494; x=1685097494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSCbOSVRPbfEpQgKQ7GTg6ZDQX9iteIjz577vrXcJ4w=;
 b=EdlJtBaKHYj+0jcLI/5p5vSQYXESw3zu7wBT7tts1g7+yQEdwJS1Pbm6b57T4DQxDS
 XnagHYF1fTj/S9iHfiltV8q7eOx3XPzFpc7MXXZnysk5nB8L7XSGrW1M/Y6rfniJJsZ1
 bxcNjudQBE4dh1i+7ru5t0NYqTyQkML+E0U/juQ1gSjpOMCKf33qpV910XUOPm1K2kHL
 Zs+RzTVXs+v0eSKIyCkW8FGkoFoUWVBAZVuNF5IXK6SUgj5aMeUWdJ2B0eMxUmX+E/d8
 lYuACEHikiRfJIbvf12y0rP4TaNDICaoDcQ9G4QIMLs06PrVfBK/9y4IVlXVox31/Wpv
 OndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505494; x=1685097494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSCbOSVRPbfEpQgKQ7GTg6ZDQX9iteIjz577vrXcJ4w=;
 b=IiBcprpbQ9Dt8N9RlBXAF2DoyEpw23OqRwTfs9OiArgc9aMf/dQURa1HEyBajpakwC
 pIbCX1fVOgyzbb7VdxmHpAejdFuw0bPuwEeEeSWokYP4BM0CkohXhL4UlmEtH34PPawL
 BYzo1qNlyVOFMBy32SEFxlYEGwPVCuTJIzAs7UUGHnfUyAFSeBHzoU4xgMftlEBx8Vp9
 zvTQff2h68CkOlc1tk+ku5+Fao2iK7fWxg5uaCJaCxM1V9TBBf4/++DpNUeXb/SdlxJa
 JW2PTfJCN1vRd4cwgFYHHUgusHS0HxaTDoLx1r3vqs5UEsgxNAw4aGJnBJO/exI/8+1c
 jYSA==
X-Gm-Message-State: AAQBX9cDquNfNQUzdkixhZoFWVgtLFAyYE+0yYjO6dOJWQsGx9nGR3AH
 cZCkdpcNxBsB/Ns/SfWsPHUR0A==
X-Google-Smtp-Source: AKy350aDrtBDy9jT2a7Zoh1s4Nm7l5fAOdY95iI5lgFwXxS3diAj8mQ0bIyWXUP7YQgpAyGt8sMQxg==
X-Received: by 2002:a17:90b:297:b0:234:f77:d6d2 with SMTP id
 az23-20020a17090b029700b002340f77d6d2mr19432901pjb.45.1682505494491; 
 Wed, 26 Apr 2023 03:38:14 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:14 -0700 (PDT)
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
Subject: [PATCH v4 14/48] net/eth: Rename eth_setup_vlan_headers_ex
Date: Wed, 26 Apr 2023 19:36:42 +0900
Message-Id: <20230426103716.26279-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


