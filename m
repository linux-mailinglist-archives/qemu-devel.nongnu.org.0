Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C6667C9B2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:21:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0IW-0001uR-4w; Thu, 26 Jan 2023 06:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0IS-0001sb-UE
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:00 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0IQ-0001Vh-Ot
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:19:59 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d3so1519614plr.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31UNhnQD3wPnVE0Wq0E+3g5/UlpM2T3rdfjZKAYdn6A=;
 b=376tr8hZJLBLf3LnRtuQD+1xxyrx7iUm7zm4cLIYAiwVKnSRtW5K8phmf/UZj94fQE
 G2fVo1QdrtBd54nk71jPvZLwBm/tTvkMmIFTx/4VVPNZkjoDCCWQIi2SbJIxxh/HRZNy
 b22hcXqwbO6wGU9gA/R9oT7Wer2ag3kwqn+gMhI55W1AmJxQ6O+Yh7WHL19zu9Naa4gR
 kvffq38w8Py5eMHYtaG+sAZXZ/dUJzxuEEVlq1dKWjNMUlnjQKGUoMVe+pBLrq6LFjyF
 GBbyPNjovY+/i6KGAava16piqg3nr1E0+n7/zhgntinUz2GhbWjdMR41r8Lxa/V841x/
 uQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31UNhnQD3wPnVE0Wq0E+3g5/UlpM2T3rdfjZKAYdn6A=;
 b=B/PPR1ijLXzubjbyK5aUXHWtk9BZsrlSuL20j91ftu8sODtF7ip2QbKmKikR2NlaqO
 Q7Fa66YWVJc1AwXIOqmCeGF4f6Oxm6XvPF3qfnOgHnKdKs7eKG2cLD39TTGbiV3cl5X1
 +Ae4Hok2yAtjPaGWAEZZcwHdzw8rGpTvaC1vXq1uMW1xVvm3+wtZ7tHeQH7l4ZeX1lKJ
 Z2GfsdgPFO0HzmVW9fNR8cZuFNekagwPYS8eZC21Jvv6ImQVCf/y3L/oRBwqBogyyqaQ
 VXoyunNxII+Wuf2oWR1MsIeSGorXGF6RiX2Y9dsuP9smUAWhGsnm3yK+g5pECfTOBb9S
 zttQ==
X-Gm-Message-State: AFqh2krHAgLTHRJsKFL0sTf5dIzgdcpEu3PfRky9kyuqAngQBncCFlJD
 P0tPSkswkoJIK4WMdwY7TH/oiQ==
X-Google-Smtp-Source: AMrXdXtZ50gJiKuNBMNM97QR45vJ44nuQxu4TONaYnikTVob8mYHkZQSG0fK/BNf8kMdbu8/NQLcdQ==
X-Received: by 2002:a17:90b:1d03:b0:22a:3d:4c22 with SMTP id
 on3-20020a17090b1d0300b0022a003d4c22mr25513489pjb.13.1674731997621; 
 Thu, 26 Jan 2023 03:19:57 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a468e00b00229d7f2abd4sm849520pjf.54.2023.01.26.03.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:19:57 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH v4 01/13] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Thu, 26 Jan 2023 20:19:31 +0900
Message-Id: <20230126111943.38695-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126111943.38695-1-akihiko.odaki@daynix.com>
References: <20230126111943.38695-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Expose the ethernet header so that igb can utilize it to perform the
internal routing among its SR-IOV functions.

Signed-off-by: Gal Hammer <gal.hammer@sap.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.c | 6 ++++++
 hw/net/net_tx_pkt.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index e5c3e1e10b..cab10eecd5 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -273,6 +273,12 @@ bool net_tx_pkt_parse(struct NetTxPkt *pkt)
     }
 }
 
+struct eth_header *net_tx_pkt_get_eth_hdr(struct NetTxPkt *pkt)
+{
+    assert(pkt);
+    return (struct eth_header *)&pkt->l2_hdr;
+}
+
 struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt)
 {
     assert(pkt);
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index f57b4e034b..2e51b73b6c 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -45,6 +45,14 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
  */
 void net_tx_pkt_uninit(struct NetTxPkt *pkt);
 
+/**
+ * get ethernet header
+ *
+ * @pkt:            packet
+ * @ret:            ethernet header
+ */
+struct eth_header *net_tx_pkt_get_eth_hdr(struct NetTxPkt *pkt);
+
 /**
  * get virtio header
  *
-- 
2.39.0


