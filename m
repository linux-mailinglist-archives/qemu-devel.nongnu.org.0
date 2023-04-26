Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C66EF250
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYd-0006SV-Uj; Wed, 26 Apr 2023 06:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYc-0006K1-I3
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:30 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYa-0003LP-J1
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b4960b015so5530101b3a.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505567; x=1685097567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJRayCsOMhTmAlO0+FOFmMcdEqB6FQTUEfx99JEjow8=;
 b=cNKNcsgfyKPBx22DHSpNN5SY/y34wFJt4Hegai5FE8Te4q1FaSmaroA2tuMRpLFR4k
 Xv2i8MSMzmvDqa0gmN/NQ2z5sT4iWteVS4RjYWFaIk7z27MBcAXlO1kJr4qf+WHYdp1q
 PdOE+z0Ya3Hu5y8TEmJ7N+NrvjQU1l7kVAZmXVORwdktmIYjWQYEtXNmuwjH9tkbQtf7
 Q+VBW9Bg6eekK3mvQPBtf5PoFtm9A2qFdnn1Z3gTQxJlsw1W/GNkjrq0JGYrCbLett8U
 wWroN3YuEEgWRUkcNhBAm84F7A6eDZ4RsnNadPOrwbyKRXeAHx4IgUc7LXYxQgNf9w3v
 jcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505567; x=1685097567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJRayCsOMhTmAlO0+FOFmMcdEqB6FQTUEfx99JEjow8=;
 b=ACn1BuF1VsnDMdlh5y0G/YJiCJbYfI4CQ6KYL1P7ZY0s0ytqWjwNad1eiICm4GrC4J
 VbzwYi1lrUVQpzT+krqb6HdcBj2ZKW+Ifvqp0m83DubVZRtAIEexs1IESsNCqVp8j/4v
 jaIdB2YE2lpNiETTQNs8/na+e/CgxV9582JwL8uO6HmIufDA3Va+SLCP7o/w/PihjCxX
 X61XbvyaC00WjLLHQzuR0jawieBFu1N+mXUviIzw/c5bS33vvOTVAWMSWpygHdOzZpeW
 8jmYz6qV+LaYoJFIQ6W7NyRRrfxBj913cZkhnnNGo3gCEeO/FGLMk/nH1dmvEgA0ZidQ
 9YlQ==
X-Gm-Message-State: AAQBX9cddG3TFaLhgz22eIsqKZ4KG7Ss8VOp7ofsnXIiPfnP6k3GzPAC
 vORi7y/SlLN7Vf9BqcFKLApYzdOvr2qEAZI/cXI=
X-Google-Smtp-Source: AKy350YrSHmDr3LP5/9U7Q64RxFzCg1y4RQsg/mHZcmQ0GbiuDz2dZWo+M4LXxtIK4ZTooreimHadA==
X-Received: by 2002:a05:6a20:8697:b0:f2:5a2:c04c with SMTP id
 k23-20020a056a20869700b000f205a2c04cmr17771392pze.6.1682505567450; 
 Wed, 26 Apr 2023 03:39:27 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:27 -0700 (PDT)
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
Subject: [PATCH v4 35/48] igb: Use UDP for RSS hash
Date: Wed, 26 Apr 2023 19:37:03 +0900
Message-Id: <20230426103716.26279-36-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
index 6d55b43fb4..41a2e5bf7b 100644
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


