Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4056D50A9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:34:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjP0D-0001lJ-Us; Mon, 03 Apr 2023 14:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjP0C-0001l4-3b
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjP0A-0001H7-Os
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680546837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLGTNhZNr3bIXX7Mx11PRwkKdI3CfrxoXkyIIe5WNhM=;
 b=F+KGODZeWnjO06iBeGXu1GsIu2iw04oQLGujd32EevpihS9Rzx5T4Qqtfrde3BHMI4LZgx
 iYk27pdQUail9zYFunJ3RytksdYoSbs+oUuJVGn/eXH1RzdkZ8BNdIHrOaXRiKQ/nf/wQn
 +6IYJL4BHd8jmiVFQeTEV2m4dfzayFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-j26lxWggN_O159O5n3-PNg-1; Mon, 03 Apr 2023 14:33:46 -0400
X-MC-Unique: j26lxWggN_O159O5n3-PNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3118C885620;
 Mon,  3 Apr 2023 18:30:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71C5440C6EC4;
 Mon,  3 Apr 2023 18:30:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, <qemu-block@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH 11/13] block/fuse: take AioContext lock around
 blk_exp_ref/unref()
Date: Mon,  3 Apr 2023 14:30:02 -0400
Message-Id: <20230403183004.347205-12-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These functions must be called with the AioContext acquired:

  /* Callers must hold exp->ctx lock */
  void blk_exp_ref(BlockExport *exp)
  ...
  /* Callers must hold exp->ctx lock */
  void blk_exp_unref(BlockExport *exp)

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/fuse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 06fa41079e..18394f9e07 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -244,7 +244,9 @@ static void read_from_fuse_export(void *opaque)
     FuseExport *exp = opaque;
     int ret;
 
+    aio_context_acquire(exp->common.ctx);
     blk_exp_ref(&exp->common);
+    aio_context_release(exp->common.ctx);
 
     do {
         ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
@@ -256,7 +258,9 @@ static void read_from_fuse_export(void *opaque)
     fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
 
 out:
+    aio_context_acquire(exp->common.ctx);
     blk_exp_unref(&exp->common);
+    aio_context_release(exp->common.ctx);
 }
 
 static void fuse_export_shutdown(BlockExport *blk_exp)
-- 
2.39.2


