Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87AC329653
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:00:32 +0100 (CET)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGy59-00087x-L3
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy0U-00037K-0H
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy0S-0001x8-65
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614664539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/ZGH8rGZUzI+taIsaRThWDpMQrp5KZI0dsoKB2RGns=;
 b=c5VSL/EFiIVQYyUvro2qeLBqW+IhwH8TWAuFSRgwOasJaGWzk67A3/4VCmPefx2hYN9nO6
 oB7WcMNTxdLMMuNZXH75QIaWNkdwfubUWtLIz4PzdOnMAbfM/vr1gHFB3Rm5hErHbUJpZ7
 Xp5kQL0orOfNBG8g7/2uPrxEHzxg2Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-Bb0_qt20N9ahqoap0MksjQ-1; Tue, 02 Mar 2021 00:55:37 -0500
X-MC-Unique: Bb0_qt20N9ahqoap0MksjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDAEC18B9ECC;
 Tue,  2 Mar 2021 05:55:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-133.pek2.redhat.com
 [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF89C5C737;
 Tue,  2 Mar 2021 05:55:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 7/7] rtl8193: switch to use qemu_receive_packet() for
 loopback
Date: Tue,  2 Mar 2021 13:54:57 +0800
Message-Id: <20210302055500.51954-9-jasowang@redhat.com>
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

Buglink: https://bugs.launchpad.net/qemu/+bug/1910826
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/net/rtl8139.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e..90b4fc63ce 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -1795,7 +1795,7 @@ static void rtl8139_transfer_frame(RTL8139State *s, uint8_t *buf, int size,
         }
 
         DPRINTF("+++ transmit loopback mode\n");
-        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
+        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
 
         if (iov) {
             g_free(buf2);
-- 
2.24.3 (Apple Git-128)


