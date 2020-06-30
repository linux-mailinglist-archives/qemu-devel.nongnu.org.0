Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A920F13E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:12:44 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCJn-0001ih-6p
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBc-0002ti-BG
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBP-0002y2-Pp
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYwLcf+pVYTALN5ScB1Ik10sfW/uN0EbKCOlzTQRBqM=;
 b=VYIegBUnAa7RI/LFQM99P613jcDk+J7f7Gbsg9leNR1hFHNvvA84J5ciUnYcaWH7U9b5lA
 3Jb7aWNBOYCQ889hXiFvGFnAk357Yc7abd3ML+LtutzKJ046x6/+6VGC/nZbvQNdCNcFbr
 h6qzA2AZCubIvwOf3rzCpuWNqeFQtMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-6k4DvR3UOGGPsegnsVlN0w-1; Tue, 30 Jun 2020 05:04:00 -0400
X-MC-Unique: 6k4DvR3UOGGPsegnsVlN0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 121EC18A076A
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 09:04:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B4702B4AD;
 Tue, 30 Jun 2020 09:03:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D53C41138477; Tue, 30 Jun 2020 11:03:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/26] vnc: Plug minor memory leak in vnc_display_open()
Date: Tue, 30 Jun 2020 11:03:36 +0200
Message-Id: <20200630090351.1247703-12-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
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


