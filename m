Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60E666F16
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:09:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMw-000459-2Z; Thu, 12 Jan 2023 04:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMu-00044b-34
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:32 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMs-0004Wv-KG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:31 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o13so15142137pjg.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q67xQG21Jge0cHU0Wr9945olymI3GsI4vM/Z3+EGFL0=;
 b=n+NlaACNmDtM9ruYk6yDIPdWVNSuox6d4QwnBHoHnqN3vXUT753BamRPGYSAKhoVsl
 L8vAc4STcHECArHpE5oS4HByfgbydmIgjOYn9OlEwQkEucD7HZ4+ml+SXUewJZmrFI3O
 7w8iCV+ik6XFrYSNCMFiWxOAWqPmxfukgzyHj7WlCW/wWB/UNWtwo1RAGt8cPAbY14uL
 FucPCA8cDc5H49aFVypUVkGMfOnn+r+cdvrRbuJ9QZTFQ6M12zKnJU8NCYFX5rdkHNxQ
 AMaVc8I7B2jwRV9mHRG8eNG0gf42ujLwqqnI/lH1TJ2mu1eUs1cLnNQk3X3GcZsAiiUj
 rA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q67xQG21Jge0cHU0Wr9945olymI3GsI4vM/Z3+EGFL0=;
 b=Y2bb5QoMwm//GdhYbFdQYcm8iQYOgr8zx6ApVbPY/BxCdH5GRpU8ULJBfER/IPY0Oh
 M83R8Z8gmSTS89THixv97wQEZ/H5EYi/u3xggiegsT7QKwjUbQ1gjKyspEKMve34yH8n
 nZUjE+i1ec4AKRSkVZHeu8Aow8KJK8K2qF0UBt5ID+Vd5gIC7dmmY8+OUBbPT0LRg1bk
 bRDwzRkXDuBOYxFLjU5PopXX1UPgJ/HWEyrs0n6VHZZL7Yv+U9opNTDR4lRDPOf4hK+0
 XUYnwXHKsgKgvTEMganW0lN4dB2JYYrtA1vKlzeTuyxXRfZbqpC1HGVqKNeGRKmBiTX9
 IqDg==
X-Gm-Message-State: AFqh2kqcOzwtM58rQcXHS4kZU75KY9OpYH/cNDyzOyRo2v1cyVQoiOYh
 J112/1CuKFH1nC+d66x/wOGbGg==
X-Google-Smtp-Source: AMrXdXtl+KGrD6ogEqEaX2y0pBnkY/gICU6xsuhKny3/KLwdiBoPiP2KsgfKb3jEEHg4EUHyDJ/1CQ==
X-Received: by 2002:a17:90b:120e:b0:226:bbb9:1bf1 with SMTP id
 gl14-20020a17090b120e00b00226bbb91bf1mr28251335pjb.14.1673517569490; 
 Thu, 12 Jan 2023 01:59:29 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:29 -0800 (PST)
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
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH 19/31] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Date: Thu, 12 Jan 2023 18:57:31 +0900
Message-Id: <20230112095743.20123-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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
index 1cb1125d9f..4bffa1523d 100644
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


