Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48620352F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 12:56:34 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnK7t-00030r-3Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 06:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnJus-0007VQ-QM
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:43:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23213
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnJuo-0005Nq-21
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592822581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYwLcf+pVYTALN5ScB1Ik10sfW/uN0EbKCOlzTQRBqM=;
 b=IaOG/UcKJIWBPNQvUqPp9rpzFQWermLboIG225X1iyfp47+O0JPx/H7eIuf7nb1LkvRksI
 qMQLK/A/BHL+b18J7bAUFkj5rP1NeVfMzbTuQPf9XBnzYmTfU0ZhgnjGKb3cbhy8Bsb1Cd
 XH2I5IMk7ZN93GFAEgShEa/nXajyvng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Ie1VV9K7OUCSL1un44RDqQ-1; Mon, 22 Jun 2020 06:42:59 -0400
X-MC-Unique: Ie1VV9K7OUCSL1un44RDqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6DD210059A1
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 10:42:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF2AE1CA;
 Mon, 22 Jun 2020 10:42:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 286A81138479; Mon, 22 Jun 2020 12:42:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/22] vnc: Plug minor memory leak in vnc_display_open()
Date: Mon, 22 Jun 2020 12:42:39 +0200
Message-Id: <20200622104250.1404835-12-armbru@redhat.com>
In-Reply-To: <20200622104250.1404835-1-armbru@redhat.com>
References: <20200622104250.1404835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vnc_display_print_local_addr() leaks the Error object when
qio_channel_socket_get_local_address() fails.  Seems unlikely.  Called
when we create a VNC display with vnc_display_open().  Plug the leak
by passing NULL to ignore the error.

Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/vnc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 0702a76cce..527ad25124 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3274,13 +3274,12 @@ int vnc_display_pw_expire(const char *id, time_t expires)
 static void vnc_display_print_local_addr(VncDisplay *vd)
 {
     SocketAddress *addr;
-    Error *err = NULL;
 
     if (!vd->listener || !vd->listener->nsioc) {
         return;
     }
 
-    addr = qio_channel_socket_get_local_address(vd->listener->sioc[0], &err);
+    addr = qio_channel_socket_get_local_address(vd->listener->sioc[0], NULL);
     if (!addr) {
         return;
     }
-- 
2.26.2


