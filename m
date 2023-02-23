Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969456A05FD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k2-0007dX-IP; Thu, 23 Feb 2023 05:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jt-0007NM-Jz
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:14 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8js-0002lX-26
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:13 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so1126438pjq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5140iHkZNuZn3I2k8biDJLxaiQwsOPdwZlAn0pvvLx0=;
 b=M4VJ6aN/RyPdhKyk/rFA1TpyRpZIKDwB1r20GCc2KRFcOWuKDuBbC6Y/LqGiTu1D+C
 HB0XSacZnuCTyPA18OHkT9LpABeXPS6ldEP6/fsTyTPcFgfU1Y/6k4lp/e8mKzUCujH5
 3Mn8gaS1n6W2C2+fxtTKLguZTVYZZJQdtprpuGeHhc103St/+NeuhQ7PSTjh9k+OVBus
 dF18r7BJ4DTr1P6Tr3TEfX5kyC7XoYkrYfUcMW5rvCmQYxeAY4bm3wIPCFmIa4WIdJRl
 aeYHBt9sLd9E2rlPtgFuwsf8pxeOe7G2AcVQaT/E0P3X7Op7TUc8HLGkxB8TLJvqFs0r
 CQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5140iHkZNuZn3I2k8biDJLxaiQwsOPdwZlAn0pvvLx0=;
 b=XkuCsvgxl5BBCxT2fSdYxAKrYm5ao+zYKFc1WvE4c1uPtzZAYwOJfUst68qE5XFAyO
 kcVmoQ0b607QT6LhRU6L1AUH/Y0RJzsoJ7dVw5vV9EZKSdUj/ia1RFs1Vy7Wp9Zz0kXG
 jvqaMFQs1duGMerOjvuE7F3FlNWYDI6G6ICPbg/HJreZPOX8O6Uw78MaRF9q0s4PxuCd
 IRwM6pLKtrdJHrnzF1GFnJ+v88/srbVcqJUxZz9Tn4RqadtTf91QoqxOurLF6KcFcEhI
 hBhS44JXUoWsjQ4P+SnqoFe4GxR7+D/NS6Eyjit9YAqthZDyObMw7if34AQ9frjPVk3z
 cfxQ==
X-Gm-Message-State: AO0yUKWNrFqXxxfkzonAn+AzoYTPSqT78iPAEqHJRE5kO3kSnMvwpf7Q
 2mijjE3c6/J3haxvMONGktOeQA==
X-Google-Smtp-Source: AK7set/tXHs16dGr+zHyR+V/OhnL8xcadGNdW7FOUPWdkoa4rrfICmIEAi81lYkc9gfGGH+ZXe9EVg==
X-Received: by 2002:a17:902:c406:b0:19a:990c:9c0 with SMTP id
 k6-20020a170902c40600b0019a990c09c0mr14592756plk.3.1677147730761; 
 Thu, 23 Feb 2023 02:22:10 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:10 -0800 (PST)
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
Subject: [PATCH v6 26/34] hw/net/net_tx_pkt: Check the payload length
Date: Thu, 23 Feb 2023 19:20:10 +0900
Message-Id: <20230223102018.141748-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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


