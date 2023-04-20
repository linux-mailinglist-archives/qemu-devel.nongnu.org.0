Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218876E89B9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAt-0001qR-RK; Thu, 20 Apr 2023 01:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAm-0001VN-Kb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:37 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAc-0001SP-RW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so6782895ad.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969765; x=1684561765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpLAmFhaGGWzHy8uwTYLfcxMLDVGf3X74q8OXPUW5Xg=;
 b=chMZfarAFrXYMrwltz7tLPs/pXcION/Sf437LUpeY5JjrPajE+n+ZaMEcNS3iheS8R
 3In2b0zWKRzPxhnqH8piDUMGb9tcV8OgywgGmf66YKmJgjEbwTPwK+ay6TDvvRxmlhbJ
 d7xblFBNCelLX+OxbSIZRMFyq5qkw2dp1j1e9gAhJdr3uLqGoOtLSztGMZQ0WXLfWC/k
 tbQMWh4fAMR97SVvhAzcPcjxF8AUW8W2EZ39T003viS4BW/em9Ogz+M+ml/U4i6IxFMy
 97qhgiw2Vo/jn5aONrUFna8km1mbWuIylqQtcVdRZ1yOsrkHR3jXrOrA8TL7ldq9P00g
 uRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969765; x=1684561765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpLAmFhaGGWzHy8uwTYLfcxMLDVGf3X74q8OXPUW5Xg=;
 b=V3fw9TwoUYutc1KvWtluSp/SSCXJFBmyJCbXgYmW8xVWDBO4tbFNDaRpoMN1qq7p86
 uuITnXlZVnPZlAx3rw15aMBT3jtcBX6c4KfxU4fnrYJrV+FtH31kIJVvzQsilWK8SEH5
 2x9hjL6/S26M464qhVyr4qEKq0iKYX6b6UTc3M7aBSu75TbAikEERq01HPrnX7rAeNmO
 /d+cO+Z9mblQAvLNKIu28PZvQ4tN48kmkdnSVJmRKwLtEp+kTlibB0WoFjVIfHQVXLDZ
 K/65thBQBbUDYYdUKsp0Y9DNy8Jjw9qAmRvjwx5hl8nMgO0Nb1zKKOHGx6ku0vCv2CMg
 fp6g==
X-Gm-Message-State: AAQBX9djk3LakUcPI8UR/inR4OG/ZvyJNOfcm7mfevvzoYHnwWmASI1b
 lsbUbNR3Nt0mSDp9DiV2hT9d1A==
X-Google-Smtp-Source: AKy350aClLECq8MRP9EmMXz+f+TdmRyiL+CjubvZV0jvLeEd4fiCGocGPw6moA05q2ywLV9hAztmtg==
X-Received: by 2002:a17:903:495:b0:1a6:7fb1:8de7 with SMTP id
 jj21-20020a170903049500b001a67fb18de7mr465337plb.24.1681969764945; 
 Wed, 19 Apr 2023 22:49:24 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 31/41] igb: Use UDP for RSS hash
Date: Thu, 20 Apr 2023 14:46:47 +0900
Message-Id: <20230420054657.50367-32-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
 hw/net/igb_regs.h |  3 +++
 hw/net/igb_core.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index eb995d8b2e..e6ac26dc0e 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -659,6 +659,9 @@ union e1000_adv_rx_desc {
 
 #define E1000_RSS_QUEUE(reta, hash) (E1000_RETA_VAL(reta, hash) & 0x0F)
 
+#define E1000_MRQ_RSS_TYPE_IPV4UDP 7
+#define E1000_MRQ_RSS_TYPE_IPV6UDP 8
+
 #define E1000_STATUS_IOV_MODE 0x00040000
 
 #define E1000_STATUS_NUM_VFS_SHIFT 14
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 2c287688c7..4dc8e3ae7b 100644
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
                 return E1000_MRQ_RSS_TYPE_IPV6TCPEX;
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
-- 
2.40.0


