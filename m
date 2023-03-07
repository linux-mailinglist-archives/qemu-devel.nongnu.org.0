Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5706AD826
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:15:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRST-00012f-M0; Tue, 07 Mar 2023 02:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSQ-00010t-UI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSP-0005VP-EW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CTQ3R6E/qbj3JCR54sI1bZNLu02x1VgFh7tt3eRCBF4=;
 b=iIFU9m9UaKfZO38OopRizpLeIVvSDMQvhlfjRo1WCek0vVeR2njLGnfJCj44i3dYUqfikZ
 S0sfzJPlhAo1SCg+fXEvCqNcs+jFG7xPMw0zaE0Z8dFNhaQgXzo4eSbEEQ8k2qneECVGWx
 3u9QVhadEM9IXQP3gpLE9tXiCZchwzU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-06JDwnYzMHipdIjozXOATA-1; Tue, 07 Mar 2023 02:09:52 -0500
X-MC-Unique: 06JDwnYzMHipdIjozXOATA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0451838123A6;
 Tue,  7 Mar 2023 07:09:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E31540C10FA;
 Tue,  7 Mar 2023 07:09:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/51] e1000x: Alter the signature of e1000x_is_vlan_packet
Date: Tue,  7 Mar 2023 15:07:45 +0800
Message-Id: <20230307070816.34833-21-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

e1000x_is_vlan_packet() had a pointer to uint8_t as a parameter, but
it does not have to be uint8_t. Change the type to void *.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000x_common.c | 2 +-
 hw/net/e1000x_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index b3bbf31..e6387dd 100644
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
index b991d81..86a31b6 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -178,7 +178,7 @@ uint32_t e1000x_rxbufsize(uint32_t rctl);
 
 bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac);
 
-bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet);
+bool e1000x_is_vlan_packet(const void *buf, uint16_t vet);
 
 bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf);
 
-- 
2.7.4


