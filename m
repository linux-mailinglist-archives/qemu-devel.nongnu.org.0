Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01E34D34F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:07:55 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtUg-00047f-1w
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lQtP2-000867-Vl
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lQtOs-0002Nl-GM
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617030112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/h/9FCHLPUALSSaLJ05cd+OsJaZfWoRB6csTz/uUqP0=;
 b=Lu9UJdmCyS67DuSXdD7GFswf9yBzCNsPPKJdIKhSGOoIpL98xD9wji9yc5bX1KHwQbTygc
 /DKFrb8yhv6tO8yFlGNwlpJqGLXyxcUKnFgBhcTSh5sGIdjzJmptWuRmo4W3/scWAAxJwP
 62CsUTf9iq+1EB/tb7s6C+Ade6YOltI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-hCuQxWtHOyK57PyvFVfPlw-1; Mon, 29 Mar 2021 11:01:49 -0400
X-MC-Unique: hCuQxWtHOyK57PyvFVfPlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2216A50204;
 Mon, 29 Mar 2021 15:01:48 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-72.ams2.redhat.com
 [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 530D95D9D3;
 Mon, 29 Mar 2021 15:01:40 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] block/rbd: fix memory leak in qemu_rbd_co_create_opts()
Date: Mon, 29 Mar 2021 17:01:29 +0200
Message-Id: <20210329150129.121182-3-sgarzare@redhat.com>
In-Reply-To: <20210329150129.121182-1-sgarzare@redhat.com>
References: <20210329150129.121182-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Florian Florensa <fflorensa@online.net>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we allocate 'q_namespace', we forgot to set 'has_q_namespace'
to true. This can cause several issues, including a memory leak,
since qapi_free_BlockdevCreateOptions() does not deallocate that
memory, as reported by valgrind:

  13 bytes in 1 blocks are definitely lost in loss record 7 of 96
     at 0x4839809: malloc (vg_replace_malloc.c:307)
     by 0x48CEBB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x48E3FE3: g_strdup (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x180010: qemu_rbd_co_create_opts (rbd.c:446)
     by 0x1AE72C: bdrv_create_co_entry (block.c:492)
     by 0x241902: coroutine_trampoline (coroutine-ucontext.c:173)
     by 0x57530AF: ??? (in /usr/lib64/libc-2.32.so)
     by 0x1FFEFFFA6F: ???

Fix setting 'has_q_namespace' to true when we allocate 'q_namespace'.

Fixes: 19ae9ae014 ("block/rbd: Add support for ceph namespaces")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/rbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/rbd.c b/block/rbd.c
index 24cefcd0dc..f098a89c7b 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -444,6 +444,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
     loc->user        = g_strdup(qdict_get_try_str(options, "user"));
     loc->has_user    = !!loc->user;
     loc->q_namespace = g_strdup(qdict_get_try_str(options, "namespace"));
+    loc->has_q_namespace = !!loc->q_namespace;
     loc->image       = g_strdup(qdict_get_try_str(options, "image"));
     keypairs         = qdict_get_try_str(options, "=keyvalue-pairs");
 
-- 
2.30.2


