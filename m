Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E624E5155
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:32:11 +0100 (CET)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzDm-0008NR-Dq
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:32:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWz02-00016t-VQ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWz00-0002Pv-79
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Uq7DE7cZO1deQaJbvM3lIszCBeQOVFN9M1aTfL+W9A=;
 b=h4bAfmNF7qz1Y08fPaz95hI9ubY3+FdkqmiGX6HTrONKNmFhQSZ3SrgHwJl42RBfHwIB1q
 2VGiOwpsb9/jErh6fcM0IzoSoUX/AVVExTuU668h8y9TvZ7ZISC9029Lza5w0h5Sj1NtWb
 ai1pSBxfKGld7+btBXDshjelL+pRAW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-qYnK_2vfMROdJMVxiAxeZA-1; Wed, 23 Mar 2022 07:17:52 -0400
X-MC-Unique: qYnK_2vfMROdJMVxiAxeZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00BFC811E76;
 Wed, 23 Mar 2022 11:17:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0E3112132C;
 Wed, 23 Mar 2022 11:17:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 6/8] stubs: add memory_region_from_host() and
 memory_region_get_fd()
Date: Wed, 23 Mar 2022 11:17:25 +0000
Message-Id: <20220323111727.1100209-7-stefanha@redhat.com>
In-Reply-To: <20220323111727.1100209-1-stefanha@redhat.com>
References: <20220323111727.1100209-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, sgarzare@redhat.com
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
index 6f80fec761..1e274d2db2 100644
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
2.35.1


