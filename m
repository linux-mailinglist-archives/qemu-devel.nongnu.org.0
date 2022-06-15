Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E209754CE9E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:28:46 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vsr-0005cO-WE
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLz-0004ck-GV
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLx-0007RI-Q7
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3wtO5i98SEnV0F//de1Icuvrrtpm043QJtJUS69i70=;
 b=KYLUEb4c8iu6B+7YT6cwwMkwLlmYDbk0sjdIQroxVNwCrGYLFsWqQCHxi3/sh6fvukjTzh
 QC/hz+eMITYICFqt9F81ZK2tJ8ritqvAWaNlUAo9oGpZALTpJbzhSF72upnpyT3ntDX+MN
 8+2zkC8UUmq7rTSNq7Rho+m9AOzvTz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-r3k9UNdUOkamygpuItgCJw-1; Wed, 15 Jun 2022 11:54:42 -0400
X-MC-Unique: r3k9UNdUOkamygpuItgCJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3061C1DC2438;
 Wed, 15 Jun 2022 15:54:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16B0492C3B;
 Wed, 15 Jun 2022 15:54:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PULL 18/18] linux-aio: explain why max batch is checked in
 laio_io_unplug()
Date: Wed, 15 Jun 2022 16:51:29 +0100
Message-Id: <20220615155129.1025811-19-stefanha@redhat.com>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It may not be obvious why laio_io_unplug() checks max batch. I discussed
this with Stefano and have added a comment summarizing the reason.

Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20220609164712.1539045-3-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/linux-aio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/linux-aio.c b/block/linux-aio.c
index 6078da7e42..9c2393a2f7 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -365,6 +365,12 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
     assert(s->io_q.plugged);
     s->io_q.plugged--;
 
+    /*
+     * Why max batch checking is performed here:
+     * Another BDS may have queued requests with a higher dev_max_batch and
+     * therefore in_queue could now exceed our dev_max_batch. Re-check the max
+     * batch so we can honor our device's dev_max_batch.
+     */
     if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
         (!s->io_q.plugged &&
          !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
-- 
2.36.1


