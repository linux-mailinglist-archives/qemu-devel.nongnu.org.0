Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D515735A34B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:28:08 +0200 (CEST)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtzL-00072F-TA
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnk-0007aV-Ka
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtni-0003Le-NB
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4rs2GIunkVXTiERjt/BtjkxPnrk2e2igFzTgpneroE=;
 b=FFqSNVArzb6KQ62DSWddcddQNVef4zuK9u9LfREDp9JzL2ndE32zR0UJlgvavQ00g+5x6E
 XQX1bKgvarxp1vDbWVyIJK7dOjCVrdXgvrEIM6bBqO59c07NsOWvKPjQ7z+EN/eh7gW32p
 x+Gdp0Ze6ZRtbp8NkjEQuLGVvrwl4wQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-P-D5wflCOdewDmrD-SKG1g-1; Fri, 09 Apr 2021 12:16:01 -0400
X-MC-Unique: P-D5wflCOdewDmrD-SKG1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 999631883522;
 Fri,  9 Apr 2021 16:16:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A871B5D6A1;
 Fri,  9 Apr 2021 16:15:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/10] block/rbd: fix memory leak in qemu_rbd_co_create_opts()
Date: Fri,  9 Apr 2021 18:15:40 +0200
Message-Id: <20210409161548.341297-3-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

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
Message-Id: <20210329150129.121182-3-sgarzare@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


