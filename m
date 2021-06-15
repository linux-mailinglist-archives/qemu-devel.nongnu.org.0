Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C563A8A78
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:53:47 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG4A-0003P9-SY
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyr-0001uP-Jp
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyp-00012n-R0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GSrRGYbIMd1843jZBfSUz5Adw+Pbc8WooYhh2TkHeQ=;
 b=FgyRoTTfjJlCvZgyIw3uoTGTF6Dddp5XHx6rigPyzIXYitCGodVq+Ra6pXT1YmzfSNmGjp
 Z1r6APiVQUJKacLwpjrRICtXgnOCGANByKHKTrgDZoX9Inib4GAeiZuXqoaBqCGZ5V1UtA
 Wa8KxSKj5nMQB8Fpn9GYcD2hNIMig74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-GL52oNkVMCKR232P3sFdUQ-1; Tue, 15 Jun 2021 16:48:13 -0400
X-MC-Unique: GL52oNkVMCKR232P3sFdUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9963C80ED8E;
 Tue, 15 Jun 2021 20:48:12 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF9E5D9CA;
 Tue, 15 Jun 2021 20:48:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/34] block/nbd: nbd_client_handshake(): fix leak of s->ioc
Date: Tue, 15 Jun 2021 15:47:32 -0500
Message-Id: <20210615204756.281505-11-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20210610100802.5888-9-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 08ae47d83c07..77b85ca47189 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1889,6 +1889,8 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
                                  nbd_yank, bs);
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;

         return ret;
     }
-- 
2.31.1


