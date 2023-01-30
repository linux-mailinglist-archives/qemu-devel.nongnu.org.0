Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE3681116
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:10:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUqL-0002AA-WC; Mon, 30 Jan 2023 09:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqE-00027e-3d
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:04 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqC-0007lb-6f
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:01 -0500
Received: by mail-pl1-x634.google.com with SMTP id jh15so2679786plb.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhtkOTUgmnCFlCx/KUeop3PpLzbdZh6TLaRwuZegK2w=;
 b=LRhI5QAmrb6mNt2kqONlL6hLocf6f2Jf+vzDWY2rOVssQ+QvJOPbIr0G9/3hqoexCq
 hK6YBcvsx1WFjf3QhMSqY4E8H2ZmwBP5q2Xsb/VMllCbykkT84JMV0vCiHG6Vo5RPveV
 Ybdo03x3j+omfLHmu3kgEeKYPEIOeuW7UB8mUiY84BMJ0cir9ypKlecL6GejBn/Ro5SY
 3R+AbObBlWEKpWTY5u1geJu0/uYhJ6ZEjmyqSdgHs7QrQukeCz5qHygChykAJ5oRdPZU
 mpse27W2W09mmJzP04u60IepTwR7ShVlbmjBpXWSC2x9jjSZ1n+aT0yHhiFYcsgrgXiv
 79UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhtkOTUgmnCFlCx/KUeop3PpLzbdZh6TLaRwuZegK2w=;
 b=aPvqX0IZ4Y6gXHbyHK+GhuyZByZP0DAEr4ar1ZsrtIz9x9TdmpLfNy+KJ0mmFj5tyr
 6t1Z/w3JIiYx2EIAA1HjZibNqE0Wk1DND1y7fjVyruCMGFydE4Bj18W/Hm51zd8sdmu6
 5Qgzc33iD2TM6m0N0KkTrr8wgo1LrikPgDkQq9kh+DuWVuq2u086p1J8WB52Ju6KTahb
 XXt52urgfKvreC6UCUb9JDSV21L/mTe5oi4Ry4520tmiKIvOsq4YNkIV3UlK9fSI8oRx
 7jQQ0HsXfhw65fcRgLlixq3bNw8Df6LerAs2NFCT7o76qR2fCIZ20i+eEpqF+SCjPbM5
 myXA==
X-Gm-Message-State: AO0yUKWs7b82fc2PDADfObq9iKQ2y6rp6/bbX8vn8q3le+Zcfe8aWfQx
 /PmxlO6dmH7ZE8dhpZTX9U2IAw==
X-Google-Smtp-Source: AK7set/tF/u4RJsUpax7qeBkLYFLz8HSl0CCfL24FM1nwY2cE4d1NYD1tn3HGYOH5Tu+8Gkqm5DV2g==
X-Received: by 2002:a05:6a20:1603:b0:be:982b:ed96 with SMTP id
 l3-20020a056a20160300b000be982bed96mr2387937pzj.14.1675087738885; 
 Mon, 30 Jan 2023 06:08:58 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u70-20020a638549000000b004468cb97c01sm6962977pgd.56.2023.01.30.06.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:08:58 -0800 (PST)
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
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 1/9] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Mon, 30 Jan 2023 23:08:01 +0900
Message-Id: <20230130140809.78262-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130140809.78262-1-akihiko.odaki@daynix.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
index 986a3adfe9..be5b65f0e9 100644
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
2.39.1


