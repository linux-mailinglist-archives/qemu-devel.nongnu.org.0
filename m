Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBFA678F76
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKBDB-0005zJ-I0; Mon, 23 Jan 2023 23:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBD9-0005yV-Dd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:47:07 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBD7-0004xk-Tq
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:47:07 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 mm11-20020a17090b358b00b0022bf61de7beso6864pjb.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31UNhnQD3wPnVE0Wq0E+3g5/UlpM2T3rdfjZKAYdn6A=;
 b=fvNHmNMiCIYsx+xIXBZ+7xPtIPCnDMi6eGaRD21OpDf1qwphp+0HLxBoL0vG4evboA
 DAJjieQSrTF49oju5KLdsfvSpfdHb5Mu986lQTYJnr/FR1abxQUdIrgYoTQct3oZS8WT
 41nE7agj01+Y6/ZF5pog0Z8AGLN2re28MDS0YPabSu50NxFwhOy/4yOsGLjf5lHJAnaJ
 nt5WneysxdJudtIQqohNlzfUHSz3QnnDaepS2PcYPCSP7K6NtRyXcQ/NYzQ3LpxWra1e
 kX1ijlgM+IV4i6fufZ+YoUPlb+JE5ZASL4x8Tih1saVh1BkLs0nxOBo4Bg3d+nM2zgRC
 jduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31UNhnQD3wPnVE0Wq0E+3g5/UlpM2T3rdfjZKAYdn6A=;
 b=IU2LFob67+RxSkGX0ZUwuV/qaBa0OOnleRvNkvUWfmU54KJkCAT9s9gUhTJ1TsN/JY
 0Z5PmV63Q/39mP/Rsuu8msffRQbwtAJDYef4Y/wExtiuTR7AJt7P6HeIsqbJYrLpJHuL
 g+VpCQH2+agQV0keecEhzqJrTSK5yhUjG0FRLXlrKZI0B4EU6QDR17eox8sMCIERl+Pt
 lv16tyUQ0Bco33d04bQPjOlE5Xa3dQ9ElFTdXZx1rfEnByHYICAAQz8UzLOoTZhbv+nE
 bgCi+Jx3C/5cb0q3MC7Q3SkuRBAk6CN4ZsZSkkCNolBrmbOoQJTa9mpXfkbhBL1YHg7J
 e5ZA==
X-Gm-Message-State: AFqh2kphXFQnLjabAGHjS5DypYs/tbJpGbZ8gFa8etuodVHa6TJgtiTr
 MugrCf4UCizdybkGa8jauOBW+A==
X-Google-Smtp-Source: AMrXdXt7wISBYrnkYmQq1fUnraBNC+/rXHer1G14Lmgfp36SfUDTqRUKW1X6Yfu9Th1dt4v7EqLLZg==
X-Received: by 2002:a17:90a:199:b0:22b:b794:bb43 with SMTP id
 25-20020a17090a019900b0022bb794bb43mr14031931pjc.38.1674535624536; 
 Mon, 23 Jan 2023 20:47:04 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a4d4600b00226f9c7474esm7324855pjh.54.2023.01.23.20.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:47:04 -0800 (PST)
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
Subject: [PATCH v3 01/13] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Tue, 24 Jan 2023 13:46:38 +0900
Message-Id: <20230124044650.14144-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124044650.14144-1-akihiko.odaki@daynix.com>
References: <20230124044650.14144-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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


