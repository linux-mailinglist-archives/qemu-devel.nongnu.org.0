Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289874450D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:03:37 +0100 (CET)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYem-0002I3-AK
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYa3-0003n7-I1
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYa2-000115-3n
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPrajxVI3EG7oEK3FbUHDchzsqfsHSPzqU9rl06oiDc=;
 b=LlRLV/mGqVprvAbe7rl79bYqNTXp0I3HVOas2DuQSj/qU++8e5fLx7eQu0mXYDjonPUWK3
 9fKrAN9eG6RhWrPEWiO0qZqDXR0M600tCdB7G+TUCZmkPPuA+YW30noZjgHfPDzFB3t9Xt
 KVuXmR/JksR1IHqdiH4IvaBxnnbKzlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-6XADHIaXNd-2iWcSqLAlDA-1; Thu, 04 Nov 2021 04:58:40 -0400
X-MC-Unique: 6XADHIaXNd-2iWcSqLAlDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39EC41006AA3;
 Thu,  4 Nov 2021 08:58:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB6B708E2;
 Thu,  4 Nov 2021 08:58:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B6A7C11380AA; Thu,  4 Nov 2021 09:58:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] docs/block-replication: use blockdev-backup
Date: Thu,  4 Nov 2021 09:58:09 +0100
Message-Id: <20211104085811.1736654-2-armbru@redhat.com>
In-Reply-To: <20211104085811.1736654-1-armbru@redhat.com>
References: <20211104085811.1736654-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to deprecate drive-backup, so don't mention it here.
Moreover, blockdev-backup seems more correct in the context.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/block-replication.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 108e9166a8..59eb2b33b3 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -79,7 +79,7 @@ Primary |                 ||  Secondary disk <--------- hidden-disk 5 <---------
                           ||        |                         |
                           ||        |                         |
                           ||        '-------------------------'
-                          ||           drive-backup sync=none 6
+                          ||         blockdev-backup sync=none 6
 
 1) The disk on the primary is represented by a block device with two
 children, providing replication between a primary disk and the host that
@@ -101,7 +101,7 @@ should support bdrv_make_empty() and backing file.
 that is modified by the primary VM. It should also start as an empty disk,
 and the driver supports bdrv_make_empty() and backing file.
 
-6) The drive-backup job (sync=none) is run to allow hidden-disk to buffer
+6) The blockdev-backup job (sync=none) is run to allow hidden-disk to buffer
 any state that would otherwise be lost by the speculative write-through
 of the NBD server into the secondary disk. So before block replication,
 the primary disk and secondary disk should contain the same data.
-- 
2.31.1


