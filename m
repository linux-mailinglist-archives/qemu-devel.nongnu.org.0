Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61767332B9D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:10:57 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJewi-0004ua-A8
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeez-0003z0-UP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeeq-0000xp-F2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=famiGsegrLOhl74QG+tE8DFiV7TJOmMUdMekIU06b3c=;
 b=Lqo9OLzBKzxkOtvLyZs6qQ82wIuiZioAoWKE+R0EXht++P3rrlI/fwflowZMQ5YR95A6vW
 NlAVb4r/djZA+2uvhYIPIzWP3TMgJebZA2TEckVt+GMw+t81/56LQiM+QHox6diG7/D2t7
 v3DoWp/t7IaPV48ZxjrXDMwq42cuDEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-nUo07nq1MrOZOSf5BGo6iw-1; Tue, 09 Mar 2021 10:52:24 -0500
X-MC-Unique: nUo07nq1MrOZOSf5BGo6iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDC3804331;
 Tue,  9 Mar 2021 15:52:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E443019C46;
 Tue,  9 Mar 2021 15:52:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/17] blockdev: fix drive_backup_prepare() missed error
Date: Tue,  9 Mar 2021 09:51:52 -0600
Message-Id: <20210309155202.1312571-8-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We leak local_err and don't report failure to the caller. It's
definitely wrong, let's fix.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210202124956.63146-5-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 blockdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index cd438e60e35a..65884a282658 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1825,9 +1825,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     aio_context_acquire(aio_context);

     if (set_backing_hd) {
-        bdrv_set_backing_hd(target_bs, source, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (bdrv_set_backing_hd(target_bs, source, errp) < 0) {
             goto unref;
         }
     }
-- 
2.30.1


