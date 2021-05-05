Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29068373600
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:06:30 +0200 (CEST)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCY9-0005tq-9B
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1leCR3-0007Rf-8Q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1leCR1-0006vV-Gr
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620201546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=931qKze80ucCHe9sis7KsCv/4qQ1OmeN2T3v+GWp5tg=;
 b=SfU8fkp7c02EFp/+a1PJSC7xUUc2UJptQeU1mxnCgc1A8wBDX4Xa/r2l0kUkuGXt+9Rwvz
 /JwkOpkMbHvwrRKUxQdZLyeBYwri1C0+wKpSsJI75//48GIrNlJSmQ7tCO5DUyUYb9HS6I
 Oq/vAyS8/ZmnsGHzMpd0XxGAb4TG8GQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-h5lejfAONPekllhgHWtKqw-1; Wed, 05 May 2021 03:59:05 -0400
X-MC-Unique: h5lejfAONPekllhgHWtKqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E08326D591;
 Wed,  5 May 2021 07:59:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D72A31002D71;
 Wed,  5 May 2021 07:59:03 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE5B05533F;
 Wed,  5 May 2021 07:59:03 +0000 (UTC)
Date: Wed, 5 May 2021 03:59:03 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
In-Reply-To: <603798381.17174916.1620200426349.JavaMail.zimbra@redhat.com>
Subject: Prevent compiler warning on block.c
MIME-Version: 1.0
X-Originating-IP: [10.40.192.172, 10.4.195.23]
Thread-Topic: Prevent compiler warning on block.c
Thread-Index: ZQfkvE+NRwyFJWCI41vTjxwszg2NPw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced uninitialized
variable to_cow_parent in bdrv_replace_node_common function that is used only when
detach_subchain is true. It is used in two places. First if block properly initialize
the variable and second block use it.

However, compiler treats this two blocks as two independent cases so it thinks first
block can fail test and second one pass (although both use same condition). This cause
warning that variable can be uninitialized in second block.

To prevent this warning, initialize the variable with NULL.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
diff --git a/block.c b/block.c
index 874c22c43e..3ca27bd2d9 100644
--- a/block.c
+++ b/block.c
@@ -4851,7 +4851,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
-    BlockDriverState *to_cow_parent;
+    BlockDriverState *to_cow_parent = NULL;
     int ret;

     if (detach_subchain) {


