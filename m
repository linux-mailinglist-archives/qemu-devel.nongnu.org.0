Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F156B185
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 06:26:59 +0200 (CEST)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9fZy-0006Zx-Jj
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 00:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSu-0003oS-8s
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSs-0000Nr-8L
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657253977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W23/TQNesWgtF+AvyiYshwh897niXnOhB3RFFC8PjA8=;
 b=iLQ3inbMjR1UZaZIZIP1vEincJQmeDoJh3PT8cIbRi7CPVxHP3CvSnuRSSVIrFkijgHipi
 EhDjnodcINxo3KRibfGqNNJHFhNG6RvyInU6W09nMCkyBv7N7Tb8a7lZL+uOKekCn1g+IZ
 GAqdJXefuo5NMrNcnrA0jbpYiFmEldk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-qBOOxxoQMhWThCLp8JlcJQ-1; Fri, 08 Jul 2022 00:19:33 -0400
X-MC-Unique: qBOOxxoQMhWThCLp8JlcJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB008316FB;
 Fri,  8 Jul 2022 04:19:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76EBB1121315;
 Fri,  8 Jul 2022 04:19:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC v3 6/8] stubs: add memory_region_from_host() and
 memory_region_get_fd()
Date: Fri,  8 Jul 2022 05:17:35 +0100
Message-Id: <20220708041737.1768521-7-stefanha@redhat.com>
In-Reply-To: <20220708041737.1768521-1-stefanha@redhat.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

The blkio block driver will need to look up the file descriptor for a
given pointer. This is possible in softmmu builds where the memory API
is available for querying guest RAM.

Add stubs so tools like qemu-img that link the block layer still build
successfully. In this case there is no guest RAM but that is fine.
Bounce buffers and their file descriptors will be allocated with
libblkio's blkio_alloc_mem_region() so we won't rely on QEMU's
memory_region_get_fd() in that case.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 stubs/memory.c    | 13 +++++++++++++
 stubs/meson.build |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 stubs/memory.c

diff --git a/stubs/memory.c b/stubs/memory.c
new file mode 100644
index 0000000000..e9ec4e384b
--- /dev/null
+++ b/stubs/memory.c
@@ -0,0 +1,13 @@
+#include "qemu/osdep.h"
+#include "exec/memory.h"
+
+MemoryRegion *memory_region_from_host(void *host, ram_addr_t *offset)
+{
+    return NULL;
+}
+
+int memory_region_get_fd(MemoryRegion *mr)
+{
+    return -1;
+}
+
diff --git a/stubs/meson.build b/stubs/meson.build
index d8f3fd5c44..fbd3dfa7b4 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -25,6 +25,7 @@ stub_ss.add(files('is-daemonized.c'))
 if libaio.found()
   stub_ss.add(files('linux-aio.c'))
 endif
+stub_ss.add(files('memory.c'))
 stub_ss.add(files('migr-blocker.c'))
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
-- 
2.36.1


