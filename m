Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64760E847
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onldJ-0008D3-4m; Wed, 26 Oct 2022 15:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldE-0008B2-Ei
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldC-00076L-N8
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ov9LlVdAmY4zKszPQs7UIbK54KodWua/XGmUavCUwS0=;
 b=GcLeFiNszJUUJ8kcYdsKHOa6bTbytgxuUb3vwNmqp+ZAbM+bcb4MyUFwfRExIdLf7UjHIJ
 C1YxSJK6Y61Sxz+PLqhBtyMq7t1bRwxW8chE2EGYJ22tU7xZzJYO9xlQVweAJijOPzmalG
 NNHPQHKBJYwzM7pTnKAsoBnAtdcuWXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-QgKYaK-qOWyQxvaH1hxULQ-1; Wed, 26 Oct 2022 14:59:58 -0400
X-MC-Unique: QgKYaK-qOWyQxvaH1hxULQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD7273C00086;
 Wed, 26 Oct 2022 18:59:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B570145BEE0;
 Wed, 26 Oct 2022 18:59:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Subject: [PULL 11/13] stubs: add qemu_ram_block_from_host() and
 qemu_ram_get_fd()
Date: Wed, 26 Oct 2022 14:58:44 -0400
Message-Id: <20221026185846.120544-12-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The blkio block driver will need to look up the file descriptor for a
given pointer. This is possible in softmmu builds where the RAMBlock API
is available for querying guest RAM.

Add stubs so tools like qemu-img that link the block layer still build
successfully. In this case there is no guest RAM but that is fine.
Bounce buffers and their file descriptors will be allocated with
libblkio's blkio_alloc_mem_region() so we won't rely on QEMU's
qemu_ram_get_fd() in that case.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20221013185908.1297568-12-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 stubs/physmem.c   | 13 +++++++++++++
 stubs/meson.build |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 stubs/physmem.c

diff --git a/stubs/physmem.c b/stubs/physmem.c
new file mode 100644
index 0000000000..1fc5f2df29
--- /dev/null
+++ b/stubs/physmem.c
@@ -0,0 +1,13 @@
+#include "qemu/osdep.h"
+#include "exec/cpu-common.h"
+
+RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
+                                   ram_addr_t *offset)
+{
+    return NULL;
+}
+
+int qemu_ram_get_fd(RAMBlock *rb)
+{
+    return -1;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index d8f3fd5c44..4314161f5f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -29,6 +29,7 @@ stub_ss.add(files('migr-blocker.c'))
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
+stub_ss.add(files('physmem.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
-- 
2.37.3


