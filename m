Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D3C366F25
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 17:27:57 +0200 (CEST)
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZElg-0000iU-FN
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 11:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1lZEjM-0007V7-Mw
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:25:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1lZEjK-0006GU-OH
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619018728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CCtmOtwws9SINVeLkgek76f/V4rXU+1c62jCYog0mqU=;
 b=Y7ZOQI8n89J9o4FzZYze4zgz9SumnTeBJNP1WtttUYYslKHgab/I6ijE9zYppT19tBUsvy
 yyM9sLSXC4rvIAsYikYdi1sa53K4ZO1PpQgbt9mt+qWkm9cyjrsG4w/c38O9rmA60yns6o
 jIRinpBA46PoUJ+Bk/42XqnZAUCGDow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-fI8GWUH2NUO9W6kUTUAkJQ-1; Wed, 21 Apr 2021 11:24:42 -0400
X-MC-Unique: fI8GWUH2NUO9W6kUTUAkJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A79710A23C1;
 Wed, 21 Apr 2021 15:22:52 +0000 (UTC)
Received: from worklaptop.home (ovpn-117-254.rdu2.redhat.com [10.10.117.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBBC35C1B4;
 Wed, 21 Apr 2021 15:22:51 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0] net: tap: fix crash on hotplug
Date: Wed, 21 Apr 2021 11:22:45 -0400
Message-Id: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attempting to hotplug a tap nic with libvirt will crash qemu:

$ sudo virsh attach-interface f32 network default
error: Failed to attach interface
error: Unable to read from monitor: Connection reset by peer

0x000055875b7f3a99 in tap_send (opaque=0x55875e39eae0) at ../net/tap.c:206
206	        if (!s->nc.peer->do_not_pad) {
gdb$ bt

s->nc.peer may not be set at this point. This seems to be an
expected case, as qemu_send_packet_* explicitly checks for NULL
s->nc.peer later.

Fix it by checking for s->nc.peer here too. Padding is applied if
s->nc.peer is not set.

https://bugzilla.redhat.com/show_bug.cgi?id=1949786
Fixes: 969e50b61a2

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
* Or should we skip padding if nc.peer is unset? I didn't dig into it
* tap-win3.c and slirp.c may need a similar fix, but the slirp case
  didn't crash in a simple test.

 net/tap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index dd42ac6134..937559dbb8 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -203,7 +203,7 @@ static void tap_send(void *opaque)
             size -= s->host_vnet_hdr_len;
         }
 
-        if (!s->nc.peer->do_not_pad) {
+        if (!s->nc.peer || !s->nc.peer->do_not_pad) {
             if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
                 buf = min_pkt;
                 size = min_pktsz;
-- 
2.31.1


