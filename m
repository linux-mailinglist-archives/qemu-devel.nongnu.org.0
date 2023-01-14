Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC5B66A938
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:28:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXsR-00069Z-5O; Fri, 13 Jan 2023 23:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXsM-00061v-Nm
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:10:38 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXsE-0007K1-PJ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:10:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id g23so9744328plq.12
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgaeaFFKAMC7o2OzT7jaBnZPajGJfuRLsHl79s3C2bo=;
 b=OSnLZej6GKsf/4YdaJGRj3z5S0jmeoNIgalbXGIYEiHnpr6YgseVBh+BUj30KEt4yz
 F2dhfjk/yKIMcWem4i9aef1D2neLzfMSaYYB85Bshd12kgj/4DqB11gCqCkop4dQD7zN
 Y+OMtYMiu3HBx5mpKXZNp+klSQxYiN7uu6minL9LtHbpVFoqcNGVwljoWZW7Y4hroz3g
 bmhCSixBpqsHHDQrnXj+iiZbRFWWecJj1iSodJav0F4U1TiYSC+cYfy807w9GaUBXK2g
 N5Pzy0krBXalPmXrPaz+ZiTAR+t1SDzkLsI/pp1L+ifyRlL9EljcTpiUg7ctESBujA+q
 bkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgaeaFFKAMC7o2OzT7jaBnZPajGJfuRLsHl79s3C2bo=;
 b=lvjHSGkxKrURyXj9nIcjH5MNLTl2WHwaxQMore1k12iJa9d5KKSNiEkWIfdVHhcH7r
 CqTF9b6NiPmrRyUFHvXxKpgJM3zQlU+hkDpoAVwhSnKQD5rY22m0CaVlnmy35WbTnic+
 BE+KEk1jYzJ3uDlTBMSDcZhiKKQiEqH5MCvSXY7aETavH7w+/33eXoRRUq8lch+IRnCS
 Ejezdg2cc28yCF3aqRk8PAV7TRgXzW7076YZm6i5/uNzYDOHjMP9FpS+RkBHc7phjZ/N
 U+MR38LIVmXenPJLH7IOP0GbpfckL79W6twgdE2YeqPbsq28k4eIw6cdyI1VR8SBPvua
 kMUA==
X-Gm-Message-State: AFqh2kpVNaUrai+w8uLowMmwttYgm736pcMjOyGeyB57f+ryArBrwMPx
 12hhzEocjztqYFmzai9gA5CVow==
X-Google-Smtp-Source: AMrXdXsMnxfQ7dkpi0A2AAVcXUZR7bcSb5EXOc6u5zI1V8XKI/oUf9N8QxLO0tvODXwHTO5gOvPCbg==
X-Received: by 2002:a05:6a20:9b87:b0:9d:efd3:66ec with SMTP id
 mr7-20020a056a209b8700b0009defd366ecmr95028644pzb.51.1673669427860; 
 Fri, 13 Jan 2023 20:10:27 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a63ef55000000b00478bd458bdfsm12244535pgk.88.2023.01.13.20.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:10:27 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH v2 01/13] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Sat, 14 Jan 2023 13:09:52 +0900
Message-Id: <20230114041004.36459-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114041004.36459-1-akihiko.odaki@daynix.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
index 2533ea2700..2c57c8d642 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -278,6 +278,12 @@ bool net_tx_pkt_parse(struct NetTxPkt *pkt)
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
index 4ec8bbe9bd..4e70453c12 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -44,6 +44,14 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
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


