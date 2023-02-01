Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5E685E0A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:40:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vZ-0007jm-3c; Tue, 31 Jan 2023 22:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vW-0007X0-OP
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:50 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vV-0000X7-47
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:50 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso2694732pju.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJS1Pbqh9Ag1EwpA1FCoisIP0ormv59FdxySXT2YRbY=;
 b=RGKxhxwOsdNLCDXSbtD9eAnEZog4mdDyYeDOA8BsLwidwZgqJ4hc8ks7Y60j48S9jD
 Qn6Llxlry+8wuoaRbJQbSe6IXpO+Z3cIK61XerlsHmE4KlRwXReFWqO+luTyVWrv7elL
 d9TYoKh8Eb+I28TS1XKpv9ddC+zAcdoa813wXtTz+Uy/j8hloNjMIWAivMb+MRrfLmmU
 P14aGadR2k48i1M44Ta8Cj6rnWc1k2owgYSbu4TOWT7ZSGdiHK6vrr1VHqqBftD31mH/
 pIYq2fF81ixb9ZlMKBe85VKgkWni7MsdDOWtOTTO2EKfI7INjcArB6LH9NW86Efj67PC
 +2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJS1Pbqh9Ag1EwpA1FCoisIP0ormv59FdxySXT2YRbY=;
 b=21SRTPf6z++v3DwntLiH+zjqJWQqmlEWpKAUyddRvrlb7jr59Zsb4meRMR4TTscAs9
 pb1erow/4cPOTUDuL2xlizpKSA1NdGSz4o4OuTJLNXao13RkfQ/Hxlv4ayuTb3Un8uOS
 iH9YOmg9+kafT62DfgxR5GobtHqQPgxzAwDokFnv9nIuEVZl7Qka7gB45G8Ut37Djamw
 VJ0Ga6UpV2/4pKFWJ5B3y1isgo/SPzR8CO7ItH0Ocelykw1zsH1BQxYaOV+WJQHaDN9t
 ldBzXs6qv6LNZr2CH7GXwshgJi8Uru+zPfESQiJ4xybt6M5izw9fRGOtALAroub/oh/J
 WG4g==
X-Gm-Message-State: AO0yUKVCSbJH3Y4hB8kPeARoHLU5hVD38YuKWC11dZEaCgJLByMhCNdD
 n5DpXz9U/VD8i72E0COXZ5saUA==
X-Google-Smtp-Source: AK7set+o6HOaNCzJj6OwZdQGzkO5zi+PRr9CVUzU2tJm0N0AQQEIUHL/OxhstiG4lMLeB1EH3Mj5rw==
X-Received: by 2002:a17:903:11c7:b0:196:489a:a79f with SMTP id
 q7-20020a17090311c700b00196489aa79fmr1663046plh.6.1675222607808; 
 Tue, 31 Jan 2023 19:36:47 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:47 -0800 (PST)
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
Subject: [PATCH v5 19/29] e1000x: Alter the signature of e1000x_is_vlan_packet
Date: Wed,  1 Feb 2023 12:35:29 +0900
Message-Id: <20230201033539.30049-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
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

e1000x_is_vlan_packet() had a pointer to uint8_t as a parameter, but
it does not have to be uint8_t. Change the type to void *.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000x_common.c | 2 +-
 hw/net/e1000x_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index b3bbf31582..e6387dde53 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -47,7 +47,7 @@ bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac)
     return true;
 }
 
-bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet)
+bool e1000x_is_vlan_packet(const void *buf, uint16_t vet)
 {
     uint16_t eth_proto = lduw_be_p(&PKT_GET_ETH_HDR(buf)->h_proto);
     bool res = (eth_proto == vet);
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index b991d814b1..86a31b69f8 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -178,7 +178,7 @@ uint32_t e1000x_rxbufsize(uint32_t rctl);
 
 bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac);
 
-bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet);
+bool e1000x_is_vlan_packet(const void *buf, uint16_t vet);
 
 bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf);
 
-- 
2.39.1


