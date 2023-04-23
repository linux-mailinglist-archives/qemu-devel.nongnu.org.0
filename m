Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3306EBCE9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:24:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDc-0005dD-JP; Sun, 23 Apr 2023 00:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDQ-0004z8-HL
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDP-0001Jt-15
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1a677dffb37so30396725ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223642; x=1684815642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=My9HbARa4eVK0tRqKS7MdfcBJeo0zTosYnCJLEGFlV0=;
 b=YsFha5N/pNUhBW7jCamuq69TD8egyooDL78KUiD5VouobTHew3UTJkGBnByokuKv0H
 KIVjaVnoWy+nj49UIqZBS6a75X6ESXF9/er0pLIGgYzVg1RuTA9IXGDNCCTRz6ty16mY
 JkCL8wDqnrtk8F/oPY0Jd7HsfuSHSwFRHfmYUnM+72l1ZEj7V4YDBPMY9Y1u4lT857wk
 PTrbDhvA1xWmeTfxJfw7R4tjgkqrPXOrGJmFglolfjF6czi88LAIini6hgixkmFYA1n3
 s8ly42NHi9OIDXdyE74V8FHQ5IgX0/nfgmZ7gAvT9farE4r0HPdLWJ8IhDBJdNxr07qQ
 WKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223642; x=1684815642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=My9HbARa4eVK0tRqKS7MdfcBJeo0zTosYnCJLEGFlV0=;
 b=NaUG4MR+MOFH3BNs7Jk2TMWBBG6gzKEpXCbUk63HAz36wdJF+xGmfLtBr3Bsd2QraJ
 1BpcjDBEr9Mqak1P/7wWs9wYFhz7RpME3XojferBbHpHpucCBI/Lsl1DPnMigKQmSIKK
 i7f06f0iOsH6OO88PGWLH3rLRL2QYPn2faRaMR3TnIwCVgxV2gmbrThjy/8OGTJtRlJc
 f5HhvZQVIb0cSGDYY+6nZlOYUa3OIBEm0j3RqaF83rOipMdWGsvsLL40E2FEjxtRtUVc
 xEuFVl2n4jt2+KCiAkkkZY/73PTkQZ/wECmr04961gCWFb3sVeh57GJ5NJxtOzK79F+/
 PW7Q==
X-Gm-Message-State: AAQBX9ebjpL/6wZpvt4YHz7k1wNbWAPSLdsJ6xoplvoK+Y0wf0fV6vPU
 rwB49iHqtum6Lazg+VWjARD60A==
X-Google-Smtp-Source: AKy350YJ2Dl2+5Nw0KbacnHy8pgypfDFQAlr7RQOT9YXra0aFtkqIDClgc1H9M3EysbYT3xu3lvebg==
X-Received: by 2002:a17:902:70c9:b0:1a8:bc5:4930 with SMTP id
 l9-20020a17090270c900b001a80bc54930mr9033543plt.61.1682223641906; 
 Sat, 22 Apr 2023 21:20:41 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:41 -0700 (PDT)
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
Subject: [PATCH v3 35/47] igb: Use UDP for RSS hash
Date: Sun, 23 Apr 2023 13:18:21 +0900
Message-Id: <20230423041833.5302-36-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
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
index 46babe85a9..a3267c0b7a 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -287,6 +287,11 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
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
@@ -322,6 +327,11 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
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
@@ -360,6 +370,12 @@ igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
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


