Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C046EBCD0
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCM-0001wD-46; Sun, 23 Apr 2023 00:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCH-0001vf-Ef
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCF-0000oj-Vv
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a6ebc66ca4so27064525ad.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223570; x=1684815570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSCbOSVRPbfEpQgKQ7GTg6ZDQX9iteIjz577vrXcJ4w=;
 b=mmYGX+ajgVt2MpDE4gJOjQIBnA90D14UrJDe0rREMh1xH+RtCsEDUoxH8RxSHiRjYt
 CkDUy5phoPH1+utMVI21uEAAzVQw9pRRXAI+AaqUb3x9jB7A5zq2h15CiDjIpxE83Quf
 /BGm42231FxuPCvV0DLkFU9baUPF8EHPfBfhmpOShtOx81jNcw8i9sIHb+9wbAYZv6Mc
 flFyq5IReWd2SMlk7Xf8ALNs+eoiYEi+Hvzkw5dZ0E5T+2ZQHPeTKlFtZmmqsm++k0rY
 SyLVCRGgPXPngh/AgKA8GOmudc7cpCRmIPBSycA/sGEXdbhaOlnRoHckLNgk2eduIuz9
 d+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223570; x=1684815570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSCbOSVRPbfEpQgKQ7GTg6ZDQX9iteIjz577vrXcJ4w=;
 b=bgCml8rbq/HDxsmkH6fFKK+qTXw+CK/x6AcUpNw1CZ5bESxtDw6iN4bsQtgx35fxd3
 2qXQuhfmTshV7c2Fhw2PXHPVIhcQK0V/xgix4lb7aVSvwZpjoeh02wV2P1DpXmwZ1W9J
 HK+p/37l2YLhYN7hlax3donOvA/vVwcz/Qbhai+fuzlxgJdqTPCkNiettA/RM7ggIisT
 kexJNqrTw576PHSqu+0szAWM8PLfXJzgu8eeKxPWM8J97qYdwvtqk/YgIohqiVZoATIK
 60r+Vz3ygAw+MAWd8d7vK73bJtc425YIdpU68+rikjtTTZkv9PSrbsecIWvwbnHwHvKG
 CxvQ==
X-Gm-Message-State: AAQBX9fQE7NTlsAHleJ0j6cuL6ZbQN7dfrNxn6IkP1aN0KWkvY7YmcFX
 Z21nuKp9OsE+er/y7nNAs2y18w==
X-Google-Smtp-Source: AKy350Y6DXaJXMW0HJjpRajxW1QXHT1HUyCO8SSyJapM7U+dcqU2srxdCGYf2zMFx2VYCRhV6Sc6gw==
X-Received: by 2002:a17:902:d4d1:b0:19a:9880:175f with SMTP id
 o17-20020a170902d4d100b0019a9880175fmr12225648plg.51.1682223570674; 
 Sat, 22 Apr 2023 21:19:30 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:30 -0700 (PDT)
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
Subject: [PATCH v3 14/47] net/eth: Rename eth_setup_vlan_headers_ex
Date: Sun, 23 Apr 2023 13:18:00 +0900
Message-Id: <20230423041833.5302-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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


