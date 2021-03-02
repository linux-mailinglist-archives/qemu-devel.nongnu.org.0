Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029DA32965A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:06:01 +0100 (CET)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyAS-0006dl-VA
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy0c-0003Ll-KW
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy0Z-00022r-VA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614664547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpkThKrYJEf3nNo7jb0IbOx6pzaCQXrfW3UMnParnfk=;
 b=GTkQ7H08K89BBDboRAPwaxuCm0WNDJszQk8Bw9q3/pLisQQENYwOPc+vGSal9cPn7vd9Su
 1dIyaN9wbro0khcyFK2RsH0XqgiGwyKcNtWHFikJczKnsjwabc+/CUs3vZFRJ0I5arwIDa
 VAWPw39A5Gk0UaxywdxnNqCG0pwxy4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-s2k4Bp9ZMiatCrA5u5g9Qg-1; Tue, 02 Mar 2021 00:55:43 -0500
X-MC-Unique: s2k4Bp9ZMiatCrA5u5g9Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E06418B9EC3;
 Tue,  2 Mar 2021 05:55:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-133.pek2.redhat.com
 [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 111815C224;
 Tue,  2 Mar 2021 05:55:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 09/10] cadence_gem: switch to use qemu_receive_packet() for
 loopback
Date: Tue,  2 Mar 2021 13:54:59 +0800
Message-Id: <20210302055500.51954-11-jasowang@redhat.com>
In-Reply-To: <20210302055500.51954-1-jasowang@redhat.com>
References: <20210302055500.51954-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alxndr@bu.edu, philmd@redhat.com, qemu-security@nongnu.org,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7a534691f1..6032395388 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1275,7 +1275,7 @@ static void gem_transmit(CadenceGEMState *s)
                 /* Send the packet somewhere */
                 if (s->phy_loop || (s->regs[GEM_NWCTRL] &
                                     GEM_NWCTRL_LOCALLOOP)) {
-                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
+                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
                                 total_bytes);
                 } else {
                     qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
-- 
2.24.3 (Apple Git-128)


