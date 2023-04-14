Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7256E2286
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:46:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHpB-0006gN-6N; Fri, 14 Apr 2023 07:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHme-0004TG-LC
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:28 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmb-0001VX-O5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:04 -0400
Received: by mail-pl1-x633.google.com with SMTP id y6so16936337plp.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472401; x=1684064401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAtKFxybpPPsuBAtIpwRmB3OrmxCztjX4zH5DcY2+A0=;
 b=ctba5npujhu5LwLtxXZdtX10UUq1aN/16moYUFIK+8wNuxVxSG6bvQJEx0Gzm5ND7m
 un6P79F+u/Bfw+ONGu5+uR8RyFxgQSihBG6a61VCttS0UVPOthKrLlti+euenAa9djUm
 VYeOZdXafD2j8QiR4dcw7g2wApBvWq5tgL16DTBzEDT20wQ5cT6yl4/TsiSIQ9z2CLQ3
 n5tcDUYolqyFQwhx6XzQHnzd3Xq43zty52UFmmd/fskyz4xcXUOAsnWXLOZNKNPzvY/V
 Y/pThkRXN4DJZLK+kRgMU55Pzdaaw2SXl1ppRj8XxQWWpYEBK2igTJu741MiNqCYEz6B
 UCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472401; x=1684064401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAtKFxybpPPsuBAtIpwRmB3OrmxCztjX4zH5DcY2+A0=;
 b=PT4lb7M4gnfe+hYMtQLpff/UWHmM5ST6k6MOitRdlytwTKW7FqipOOVw+zIxW/twdp
 lsDsM1TlhIpYY2VUzsCAR8r7UiGbO9HxvtbhvAftNscqGl6Pj6Wtj50iYPiPqVt54i9d
 eLhFWvRkyM4GX8nm8FjSXXxSb60rG1oE9RaKBo8GBbPkDbH9oDJr6vThVscFS8VR+7Ht
 mhvGGdnkUdW3iJpOZj9Ey7L2l3zE8chSYqsYDX4+PDC4c65KQCicRSRG5ZPRleeX7Grr
 K1XI95Ytcs1FXJRgrepGdNMHRy5dmDaLSjnGyV6zt0zqC8CaJAlGV8kEX/f7uYeDDtQb
 /fzg==
X-Gm-Message-State: AAQBX9fluOz2UArwWuMq1Tgxoum98fLmahOUV5NiU9C3NBvkb5ULZ+6W
 cDkUjShwwHFNaa9GHupVPxfr7w==
X-Google-Smtp-Source: AKy350YeLZ7ZF9CjXf3BHJjGWERggxV7VFmbxbek8tP1VS2LbF4oVvV3y02DyCcH7gN+a9W+Os5Y9Q==
X-Received: by 2002:a17:903:41ce:b0:1a5:1842:f7da with SMTP id
 u14-20020a17090341ce00b001a51842f7damr2284028ple.6.1681472400999; 
 Fri, 14 Apr 2023 04:40:00 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:00 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 31/40] igb: Use UDP for RSS hash
Date: Fri, 14 Apr 2023 20:37:28 +0900
Message-Id: <20230414113737.62803-32-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

e1000e does not support using UDP for RSS hash, but igb does.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 16 ++++++++++++++++
 hw/net/igb_regs.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 569897fb99..3ad81b15d0 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -279,6 +279,11 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
             return E1000_MRQ_RSS_TYPE_IPV4TCP;
         }
 
+        if (l4hdr_proto == ETH_L4_HDR_PROTO_UDP &&
+            (core->mac[MRQC] & E1000_MRQC_RSS_FIELD_IPV4_UDP)) {
+            return E1000_MRQ_RSS_TYPE_IPV4UDP;
+        }
+
         if (E1000_MRQC_EN_IPV4(core->mac[MRQC])) {
             return E1000_MRQ_RSS_TYPE_IPV4;
         }
@@ -314,6 +319,11 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
                 return E1000_MRQ_RSS_TYPE_IPV6TCP;
             }
 
+            if (l4hdr_proto == ETH_L4_HDR_PROTO_UDP &&
+                (core->mac[MRQC] & E1000_MRQC_RSS_FIELD_IPV6_UDP)) {
+                return E1000_MRQ_RSS_TYPE_IPV6UDP;
+            }
+
             if (E1000_MRQC_EN_IPV6EX(core->mac[MRQC])) {
                 return E1000_MRQ_RSS_TYPE_IPV6EX;
             }
@@ -352,6 +362,12 @@ igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
     case E1000_MRQ_RSS_TYPE_IPV6EX:
         type = NetPktRssIpV6Ex;
         break;
+    case E1000_MRQ_RSS_TYPE_IPV4UDP:
+        type = NetPktRssIpV4Udp;
+        break;
+    case E1000_MRQ_RSS_TYPE_IPV6UDP:
+        type = NetPktRssIpV6Udp;
+        break;
     default:
         assert(false);
         return 0;
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 22ce909173..03486edb2e 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -659,6 +659,9 @@ union e1000_adv_rx_desc {
 
 #define E1000_RSS_QUEUE(reta, hash) (E1000_RETA_VAL(reta, hash) & 0x0F)
 
+#define E1000_MRQ_RSS_TYPE_IPV4UDP 7
+#define E1000_MRQ_RSS_TYPE_IPV6UDP 8
+
 #define E1000_STATUS_IOV_MODE 0x00040000
 
 #define E1000_STATUS_NUM_VFS_SHIFT 14
-- 
2.40.0


