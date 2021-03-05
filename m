Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3632E21F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:28:38 +0100 (CET)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI3wy-0005K8-UV
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vN-0003tz-Mp
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:26:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vM-0005X3-A3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614925615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIJ4xmrWSJEOEqj0apIfOmHHtRWmidVRB8fjizR69mY=;
 b=FJ0228qpVBV2W6y+m/vj9WhdwvPJxmrKaCSkpBQCqPg/uIUEc25c06v7gkD+zeFT0M7zld
 M2L3v+vg1vygLU/uhDN3+ZKytJme9kIshvQIX5JodChA41ww+tODgrNQktbLznTn0bZFGD
 +YvL+Rct/veh7BmwHd2l3eILHF0jWFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-OLmKH10BMXyE8Dw2PU6bbA-1; Fri, 05 Mar 2021 01:26:51 -0500
X-MC-Unique: OLmKH10BMXyE8Dw2PU6bbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89FD21005D4A;
 Fri,  5 Mar 2021 06:26:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-165.pek2.redhat.com
 [10.72.12.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A61B360C5F;
 Fri,  5 Mar 2021 06:26:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-security@nongnu.org
Subject: [PATCH V4 02/10] e1000: switch to use qemu_receive_packet() for
 loopback
Date: Fri,  5 Mar 2021 14:26:30 +0800
Message-Id: <20210305062638.6749-3-jasowang@redhat.com>
In-Reply-To: <20210305062638.6749-1-jasowang@redhat.com>
References: <20210305062638.6749-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alxndr@bu.edu, Jason Wang <jasowang@redhat.com>, philmd@redhat.com,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

This is intended to address CVE-2021-3416.

Cc: Prasad J Pandit <ppandit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 4345d863e6..4f75b44cfc 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -546,7 +546,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf, int size)
 
     NetClientState *nc = qemu_get_queue(s->nic);
     if (s->phy_reg[PHY_CTRL] & MII_CR_LOOPBACK) {
-        nc->info->receive(nc, buf, size);
+        qemu_receive_packet(nc, buf, size);
     } else {
         qemu_send_packet(nc, buf, size);
     }
-- 
2.24.3 (Apple Git-128)


