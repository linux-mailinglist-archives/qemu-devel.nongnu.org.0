Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE966680F68
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUWn-0004nW-13; Mon, 30 Jan 2023 08:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWO-0004Ug-LL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:32 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWI-0003oV-Rt
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:32 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so3101856pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJS1Pbqh9Ag1EwpA1FCoisIP0ormv59FdxySXT2YRbY=;
 b=JIyLJ2T4ojfTLXdjr+NIuFRxSId+0RAkzmP0UOca7vlAZYb0C1hrDyFBMXgUwWfQBJ
 a5S/wKbFYB9GtGcZojArn5KqwFS66iEdziIfkOvz5OvtFyHGSF5kE75PAGZO2hooayZA
 jW+2DFnW0GflalUiV89h92JkrK+wsRmjSXzsKVAEcUMlLah8X0lKRofaHEyNnUEN288n
 QyrnJ/JDzdUp9l/anUB6wW9DTYHVdGtmTcjyfO3lGfn9qSRF6NiQBgW3mSokWcWVY3zx
 WyVO3n7ojbw6qK/yI4f9B/JAG1HqOAsVtmcsc4SRGh14D6FD+0jNfInC/pbB2bXYL8RG
 GMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJS1Pbqh9Ag1EwpA1FCoisIP0ormv59FdxySXT2YRbY=;
 b=2z+Czl0xboR0DE3SRUmmnmtPFHDlNQ4iXtTJyxFH01x6Q8x7n5J3qtAdkcJKzgIuUn
 FpF9k9NXlDUPJ9/lknCXVNi76ES9gRUh/0CrgsavrEiNA4foz2RHST/BmFyjdlfSyj/a
 6RNCJ/ngx/Oz7OXQGnmoNGhF7u/HKgtVSg1MqwuDmMv+sYVrdopYV5mwRrnfSIOaPfUh
 TA0au1MHrddY/elowY4UcALFOD+O4CbufKfbZwZzMvgB+P8Tra0TU+b12FbceEpsPcKL
 IfZJ4VuQJgxZv5d5pCfi/C3NI+budSaFpXPJ6cGPuLmxt+AQR2SIbuK08IShoaD17j5F
 UsVg==
X-Gm-Message-State: AFqh2koB8TYhjsjrcb8keVCALaqeGk9J0tUqyXX0JyjIMzN/G0Kocdwi
 lluhachgrSfAhgYzK56W1PkqkA==
X-Google-Smtp-Source: AMrXdXv7stYCX0eiWCsd5nVhZOqzvo6zVnAWLFjX0CxGCdqFF1woDgoy3Y29nY9HpM/5IFld5IGkWA==
X-Received: by 2002:a17:902:e845:b0:192:f45e:4197 with SMTP id
 t5-20020a170902e84500b00192f45e4197mr65841994plg.31.1675086505376; 
 Mon, 30 Jan 2023 05:48:25 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:25 -0800 (PST)
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
Subject: [PATCH v4 19/28] e1000x: Alter the signature of e1000x_is_vlan_packet
Date: Mon, 30 Jan 2023 22:47:06 +0900
Message-Id: <20230130134715.76604-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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


