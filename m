Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0692287C0A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:06:08 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbEt-0004HU-Mb
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQb93-0007ub-Ls
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQb90-0003fQ-77
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602183601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0A97oHmmt22nM2fjwLFmdd+LbmGslC14whYKKYfsOw=;
 b=PkT8biCn4NFVQIbgoGc9B8hmnOEpPpS8XN6LCo6QapMQf1OHxqWepVdaSNa3mABKcjYMo0
 njnjd5r4uS1vG+gmD+6hBAwvcUtFRqWFPLPTA5kwGCfi5lzYr/Lt5o2crKFEQS+kLVIEaP
 06WI43LvI/QKjzzek3mrX0iIKvQFS/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-MFFMkp9IP4-f3cE6HzTtdg-1; Thu, 08 Oct 2020 14:59:57 -0400
X-MC-Unique: MFFMkp9IP4-f3cE6HzTtdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9301018F88;
 Thu,  8 Oct 2020 18:59:55 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808DC5D9E8;
 Thu,  8 Oct 2020 18:59:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] block/nbd: correctly use qio_channel_detach_aio_context
 when needed
Date: Thu,  8 Oct 2020 13:59:46 -0500
Message-Id: <20201008185951.1026052-4-eblake@redhat.com>
In-Reply-To: <20201008185951.1026052-1-eblake@redhat.com>
References: <20201008185951.1026052-1-eblake@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Don't use nbd_client_detach_aio_context() driver handler where we want
to finalize the connection. We should directly use
qio_channel_detach_aio_context() in such cases. Driver handler may (and
will) contain another things, unrelated to the qio channel.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200903190301.367620-3-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 912ea27be7d8..a495ad7ddff8 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -549,7 +549,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)

     /* Finalize previous connection if any */
     if (s->ioc) {
-        nbd_client_detach_aio_context(s->bs);
+        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
@@ -707,7 +707,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)

     s->connection_co = NULL;
     if (s->ioc) {
-        nbd_client_detach_aio_context(s->bs);
+        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
-- 
2.28.0


