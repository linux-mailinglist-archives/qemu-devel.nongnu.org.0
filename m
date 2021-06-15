Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048CD3A8AF2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:19:09 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGSh-0000cx-QT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzH-0003Gb-Re
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0001FF-MI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fb8CRE5Sp++9H3ScBiFAJgZbGVVw56PvVfWYcQsn8DM=;
 b=cImgh4zFdpXDXfH6tPCf0RKwgtGb8JTEKBbKhiyQ0KgxSQW1Cv9fMK1vrfpqqwOHlHqc/U
 5oi5peeI4aPSSJbNIabqkyGwkt4Kt+iF+1WbWsSHxUIjujJ02hcIaxBw/bmg89tvTNWTd8
 +SO5JuJUS/LpXR9B06vWAaurCV+qUqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-JmOwEe74Nj-z4kYdi9hSOA-1; Tue, 15 Jun 2021 16:48:31 -0400
X-MC-Unique: JmOwEe74Nj-z4kYdi9hSOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACAF5107ACF6;
 Tue, 15 Jun 2021 20:48:30 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41D8A5D9CA;
 Tue, 15 Jun 2021 20:48:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/34] block-coroutine-wrapper: allow non bdrv_ prefix
Date: Tue, 15 Jun 2021 15:47:51 -0500
Message-Id: <20210615204756.281505-30-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to reuse the script to generate a nbd_ function in
further commit. Prepare the script now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-28-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0461fd1c459c..85dbeb9ecf9c 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -98,12 +98,13 @@ def snake_to_camel(func_name: str) -> str:


 def gen_wrapper(func: FuncDecl) -> str:
-    assert func.name.startswith('bdrv_')
-    assert not func.name.startswith('bdrv_co_')
+    assert not '_co_' in func.name
     assert func.return_type == 'int'
     assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']

-    name = 'bdrv_co_' + func.name[5:]
+    subsystem, subname = func.name.split('_', 1)
+
+    name = f'{subsystem}_co_{subname}'
     bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
     struct_name = snake_to_camel(name)

-- 
2.31.1


