Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA18680F5C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUXS-0005Xf-Uj; Mon, 30 Jan 2023 08:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWd-0004jj-NQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:48 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWb-0003u4-Iy
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:46 -0500
Received: by mail-pl1-x62e.google.com with SMTP id h9so3057673plf.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5140iHkZNuZn3I2k8biDJLxaiQwsOPdwZlAn0pvvLx0=;
 b=rlQN06NEZOePKyC1bw9jjioqwVuQcOlOo1+rOGSQb5LRJQsEQXc9Zk0+YF7qvzKmZB
 3n5QCfSo8WRFqX3UdiRQozz9SM7re1YNG+qQ4YSoaRiLPPgbTclZ6CVqQCMtcQcU+snz
 m4GU6R22O/YnYnqUX9iv1FSRKeUMLogfY+pDaRByfiTlVqyPFqYkdXv+8q/gj3EuwvdH
 lVHj3kZsJjghaxkx3fibvk8mkVhPC/nZptX/CkRPCcYIlqbj9LmLtHv15CTdCA9x5xeX
 9vuSbVkMZkmI7I4er1iEthSNMd/BBJ/W/UceIBQwKexWCP/jwG+sreA3QpLouVjGwqKv
 cwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5140iHkZNuZn3I2k8biDJLxaiQwsOPdwZlAn0pvvLx0=;
 b=b6IFDD7YVOOUV9Fv7jxNPj27h5mQ6YQQVYjaq95UCiT8M9zVytFh3qn04PeCokRis7
 H8sXckCQvGYhSEHvWbwDQV9uyKMgqmw9ADNf6EdhuTjHK2rbEVfhMCClEJuyifnF4BPW
 azVJ2THJgR7AW/J8z7QLyeG4qTcoCR+AwqRUZT2WfqEzeu7lqq9fcUqX7hcopbgcxVpi
 1+6CVLnevum6OVpUxB6qiA//NcFpCWPeUjXglJ4aJpfU0zWZllO5TS3+rav1YmExVN05
 P44mwJNcqsWpvL8KHziX701tYn3yZQ+PnAZ3jMl+B/isTzyxUxw2qCSM4zPxRJMi+XqT
 lfew==
X-Gm-Message-State: AFqh2kr0y3ooVKgxYhIbQ7C0lJRsO8HufAkf03Dy2+0rX2YhGjBPdd11
 Fa5rkbyHge8rrtNWS3ubyj8DYQ==
X-Google-Smtp-Source: AMrXdXtMN4BHGrHtWDFXXXwLXG0jS8udmcrFNIz6bFUnS4enov2P4od/LwThGs88yR1COlimZJ75Dg==
X-Received: by 2002:a17:902:784d:b0:194:92ab:6e23 with SMTP id
 e13-20020a170902784d00b0019492ab6e23mr40065800pln.27.1675086524046; 
 Mon, 30 Jan 2023 05:48:44 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:43 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 25/28] hw/net/net_tx_pkt: Check the payload length
Date: Mon, 30 Jan 2023 22:47:12 +0900
Message-Id: <20230130134715.76604-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
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

Check the payload length if checksumming to ensure the payload contains
the space for the resulting value.

This bug was found by Alexander Bulekov with the fuzzer:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_6aeaa33e7211ecd603726c53e834df4c6d1e08bc

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 4a35e8429d..986a3adfe9 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -342,11 +342,17 @@ bool net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
     if (csum_enable) {
         switch (pkt->l4proto) {
         case IP_PROTO_TCP:
+            if (pkt->payload_len < sizeof(struct tcp_hdr)) {
+                return false;
+            }
             pkt->virt_hdr.flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
             pkt->virt_hdr.csum_start = pkt->hdr_len;
             pkt->virt_hdr.csum_offset = offsetof(struct tcp_hdr, th_sum);
             break;
         case IP_PROTO_UDP:
+            if (pkt->payload_len < sizeof(struct udp_hdr)) {
+                return false;
+            }
             pkt->virt_hdr.flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
             pkt->virt_hdr.csum_start = pkt->hdr_len;
             pkt->virt_hdr.csum_offset = offsetof(struct udp_hdr, uh_sum);
-- 
2.39.1


