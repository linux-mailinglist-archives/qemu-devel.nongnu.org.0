Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25464685E11
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3w1-0000hC-2B; Tue, 31 Jan 2023 22:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vp-0008CX-OA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:10 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vo-0000cS-0V
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:09 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so720828pjn.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5140iHkZNuZn3I2k8biDJLxaiQwsOPdwZlAn0pvvLx0=;
 b=JRryQ5dAfQ6FnJmKIJg1YrIOiE6WIf1GTs6L4ILTl7af5+BE9b3fKh2r0qARGGpmBb
 dQJyuhLVX/pYoJk3SzJkddEj/l92+k01qS1Thb8TxIKZCIvFz+XtdVRW3Khnmk1jntpQ
 +hOkeVSohklQjuH6m8FlbIM96RQBKqTisGDTg4RZvY1Aprwg9TgDVMtbGWDH/40+Aipi
 o5qGQzZIQtivheJNdLymGCKF8ZS/pWenq4uSA8i92CB5EQnAOAdVbMHZi4Q4V8yjBf4r
 yxSMvYptaHLP8bV7MnBgIvfsl4lNHkvBrZpedaGmjhcQE8MRnWtvPcNnPCJ1xRh4NIea
 +m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5140iHkZNuZn3I2k8biDJLxaiQwsOPdwZlAn0pvvLx0=;
 b=xhQcfn/O0vwv+Os5wH81Sy6dHsiPqNzSmjwuXOFyDev+pwvA6V6VCAAkua3HNUY4mY
 +oCOZyTvHlXocDGAKxV9lOYARq1Wl6wtUHCnurBQ1TmXdwexqHFhk3l0aXTBjTl1OLBT
 FMYZxAO82MRvFiC9cW13h8EgZCX82Wd4nAkdBihx8X3g2dtTz8Ymcmt6/tVjG8zG36Yj
 pRPJTXR5pcyaDY+ktgGTRZDVtOHFHu+e/+N4AEWctGc4l2wfKfAlUxqc1OY5xz1o5UIe
 ZrGUAj7Lb0bugQxEaVUTdii32Yxw9h8Dt5c1GCV2ziGD9+YEHHWC7dOO6vOlx4sZJ74W
 IIdg==
X-Gm-Message-State: AO0yUKXWYbLZ2CukX4ZAxid7A1taIG8udyVU4O023udbQmO7CRE+h4Zx
 kQb5FIpKn8Z2esCs97rqNWuybw==
X-Google-Smtp-Source: AK7set9nnmuS2niuuw0UV6kLNYIf91TnlL+tEwLXbGqjMvz3VNcmQ0pq63V0Cty4PG9sLVLTE9RKpA==
X-Received: by 2002:a17:903:2309:b0:196:7a90:5f5a with SMTP id
 d9-20020a170903230900b001967a905f5amr1996160plh.26.1675222626358; 
 Tue, 31 Jan 2023 19:37:06 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:37:06 -0800 (PST)
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
Subject: [PATCH v5 25/29] hw/net/net_tx_pkt: Check the payload length
Date: Wed,  1 Feb 2023 12:35:35 +0900
Message-Id: <20230201033539.30049-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
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


