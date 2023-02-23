Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C06A0619
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8jd-00075n-Pe; Thu, 23 Feb 2023 05:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jZ-0006ol-Lr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:53 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jX-0002Kx-P1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id i3so1778449plg.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJS1Pbqh9Ag1EwpA1FCoisIP0ormv59FdxySXT2YRbY=;
 b=WKGXgFFD4zqfDiCiaatGnovzRym45Dxs0Ces3N6nxHoLWFX0PDuqVPR54h/zg7uHd4
 kUQ53Z2DNVIwh3DAmN5mGQDQhUEpAi2me1CtuZZoW5YWimfX+RA58MSjDJyckyyeoT0U
 1SXYjB07ki0YSIWL9OFMPPZ63oFk/OPmfLvVEUd+p970/piD4nYFZSRVbgvZ01jow6XH
 UH3l8xYyaRnP8145txhdIItH79MrMr4YV8EGz/pOLyvXplOrEQ+TvKma49R7VEl4ezca
 IOTYgGxqy01YgfV/Fn1LLxvm8jWe7pjMZzesVh8dmvSRhZYF3UM9fKACUjkMVcTF+yxe
 P9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJS1Pbqh9Ag1EwpA1FCoisIP0ormv59FdxySXT2YRbY=;
 b=pojzGBhcqO0HFY4JeRJ5bKWcQoM3pBH5PmVpNAWYnh3iogb7FnS8Kq4yLVe+pcLZSZ
 Gc9q4YUrZRh1M40r3P8HFwd74z4hxnVCqq5REse4qEDrhYf5SpV0LeUtuK0+15tr25pI
 6BCK+ts6sZvG59pYrLjXhYpA5G1Ppa1fgoeurNUqvC/ayHkUwAH32kRZWtghr2GikKa0
 juLKnoQ9R42EnZ+wn7Mi4PAzk3CoIjwqZR+YEtP8x/BXnri6290+PU1V0iFg2caaPZx1
 pEIQgyiiy6Q1hzFZwZdEJ/12xid/9fgtgvT4IRd6azeXDowqHlpAf0L9LIRs7IiWLMxF
 d/6A==
X-Gm-Message-State: AO0yUKVe+IpdahUNUCa9h1AJzxaA3Uy/wV8dM/3fdpXe/xSm+zemknaV
 ShEa/NxwGuxlnkGWuTidKkgbgg==
X-Google-Smtp-Source: AK7set907c6NSb7P/o75icaDL4Zu0GNrT7y5kcFaE1bDGTE1S+2n3OGAbpOTsM9tPfDf2R/341mCSw==
X-Received: by 2002:a17:903:1ca:b0:199:41a5:1085 with SMTP id
 e10-20020a17090301ca00b0019941a51085mr15863247plh.33.1677147711139; 
 Thu, 23 Feb 2023 02:21:51 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:50 -0800 (PST)
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
Subject: [PATCH v6 20/34] e1000x: Alter the signature of e1000x_is_vlan_packet
Date: Thu, 23 Feb 2023 19:20:04 +0900
Message-Id: <20230223102018.141748-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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


