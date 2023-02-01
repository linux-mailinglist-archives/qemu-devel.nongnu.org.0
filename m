Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C1685E3C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4VA-0000b2-9H; Tue, 31 Jan 2023 23:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4V8-0000aS-8K
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:13:38 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4V6-00015O-R3
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:13:38 -0500
Received: by mail-pl1-x631.google.com with SMTP id d3so17200723plr.10
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhtkOTUgmnCFlCx/KUeop3PpLzbdZh6TLaRwuZegK2w=;
 b=nKTt2NdMg8z8T+sQSGe+asXcL+qC3IQx5jSCa1wr3xfrg61iEqkN3Far19XRcX+6d3
 D8h68+nF94RUMMQE7KcGbqaNI7iDW8iJvPY44Uhbxzv7CQIgSn41TlPnsHVSVmq8CUDI
 EBOB6Hxeo2vnFamc4BVHbMFJvmmsTnvB7R3M1GhnvyPIUHVG0BEPn2ZaYudUvtjMoTGm
 OcJt/nBhKUm5+1hzZmcZH3aVH94cO3vpYU3zW2b1LUqH7edBG3ikKYYbhOgSq97QQ7aR
 ncuEYKpQNOZguDk9/SUK+n/TalX7X+IeRIrEh5ACxctxtV/u0kwyc+MCfZVU9PkRpge6
 QgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhtkOTUgmnCFlCx/KUeop3PpLzbdZh6TLaRwuZegK2w=;
 b=4ng2YkjXsZR0pLAazLJg2hVkr38Nmg36id2R788IWI6Q+ev/xn86FJ2pugLbrPuu3C
 sF4aPgQeDDbz1wmthaEuuj26IaQ0br9IYn7ePYO6QePT+Wa8zMOQ+rM7A/Y8QIcfSAja
 lGrbiSSyVItQma0lsoe+wvFcMW+fOwFXLqjWbFA+BTp2hdYhQcLLkSZODITYlHiDMoZx
 3b85TzNyemuUmzn85x/qoC/h2CtKjd+F4hBAj/BG89MC836YlcgLQUW7Q1hcLfGLDIg5
 TSrrVqCbZmyNHZpCb9g3nlBE5d9PghWHMQIXSJYQ8SDm9/i2B7dTeRri/iuGsjSh58/g
 VCug==
X-Gm-Message-State: AO0yUKUA1WMhcpl4zryJ6AUWwGCQsPYxAIJnhrVXi+LVJtKG948ze+TS
 zAy8Ti5Y0xcTWVt8GHhEqmoZEg==
X-Google-Smtp-Source: AK7set/WS15T+JGsLiPdv/m+9/V/XYEohEhB6xzROixrrsoA77XC+tiVjr3jXAWyB7Z/spfB0e7lyQ==
X-Received: by 2002:a17:90b:380b:b0:22c:ad11:af32 with SMTP id
 mq11-20020a17090b380b00b0022cad11af32mr9633430pjb.17.1675224816197; 
 Tue, 31 Jan 2023 20:13:36 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a17090a7a8800b0022c01052e92sm231350pjf.56.2023.01.31.20.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 20:13:35 -0800 (PST)
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
Subject: [PATCH v6 1/9] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Wed,  1 Feb 2023 13:13:12 +0900
Message-Id: <20230201041320.32096-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201041320.32096-1-akihiko.odaki@daynix.com>
References: <20230201041320.32096-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


