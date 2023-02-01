Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4C685E68
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4hd-0003Zb-0C; Tue, 31 Jan 2023 23:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4hb-0003Z5-My
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:26:31 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4hZ-0003KE-W6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:26:31 -0500
Received: by mail-pf1-x430.google.com with SMTP id u5so11409242pfm.10
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhtkOTUgmnCFlCx/KUeop3PpLzbdZh6TLaRwuZegK2w=;
 b=Z6aghF607TAgrFQF7EgwmQMeZBdkjXfttGQsgEqMnywgI4zRPJx80jE48Aq0LMZdO8
 njMMnR7sn5EfFTJiYXu39axfNurd4iUBH1uFfmrCAtNG9uYmL+fKpse6irIoRhFygx8I
 CMhoJUwymE76NtMdDrJMBVnucAPXD7Xyww+2j/aDHLK5gsoWQq8AUcw8Lc93swDVyLBV
 OZqK3i0IglC/35demuXDKsyNcuE3oy9KaQbOphiWdqROw7wJdgcmZen+uw38zno2k8VU
 CIetYbUFSWYKaW9eB4q5Dy2sscI2m7LeURp/YDc4AYMFMqBNwsURi3p6EonvUV45orhh
 2XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhtkOTUgmnCFlCx/KUeop3PpLzbdZh6TLaRwuZegK2w=;
 b=kt6qspPNx3srJ1LgmcgW4bKw+vsuo18CjrWMAkyYqMNsVp0W4DDOfIMiGcc5cfQRBk
 KR3WQLiobn/9q2LPTOzGLzxSPLKKSS99d+rsEbHhaeoy4iLfOfIvDEC25wGaO+cQQzWc
 9bhUYKWh0WcnavccHYzFEphk5ZHHk/0OowE8zYfaXGB+FqH4NY+m3J9/TIncdlKOhS/u
 qhV+sT/GI+fFAtS922O15wbowGYLTryXfDoN+F1fPM9KWtAKtd996tIpjp/SxM/BAhvW
 5LQYvIVirNrjdY7DKllfahijKStxKDi/8/2iB+QpaOfiAZkFp+b7+NT2vOp492miaIm0
 TDBA==
X-Gm-Message-State: AO0yUKU+1UOho8fy0bnnyiXxoeo/5zSAZ32QfPVI+VPduCF1HETqGYsr
 AevSumJ7PgFzOk+F7cmPVasoNw==
X-Google-Smtp-Source: AK7set+K053mTewOxK6yVD2Lbv9V5olPUu6m9JUhefg1uY3v8tbeq5oCjik1xcyQ8tNKLjJTf2B89Q==
X-Received: by 2002:a62:dbc2:0:b0:57d:56f1:6ae7 with SMTP id
 f185-20020a62dbc2000000b0057d56f16ae7mr1103323pfg.33.1675225588260; 
 Tue, 31 Jan 2023 20:26:28 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c62-20020a624e41000000b0058bb0fb6295sm9235316pfb.26.2023.01.31.20.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 20:26:28 -0800 (PST)
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
Subject: [PATCH v7 1/9] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Wed,  1 Feb 2023 13:26:07 +0900
Message-Id: <20230201042615.34706-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201042615.34706-1-akihiko.odaki@daynix.com>
References: <20230201042615.34706-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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


