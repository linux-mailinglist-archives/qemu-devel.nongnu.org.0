Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377645ECD46
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:56:17 +0200 (CEST)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odGgi-0007yG-71
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odGNC-0001jY-0z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odGN9-0004p4-1C
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664307361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LO1Yk9Zyzrv9MQU42UWrwS5AGoOuZeWvHnsE7ewd4ko=;
 b=ApMkEgw1iI9HlvplIKIFM5olRUEueO12gyHxCPHvIDyykXw/oQahPaLBE56BYCHCca1qSj
 0H92HfiSZAoubZ8rrXec2vJyr6LzwJuebh7UgRzQfae28smb/sdQP5ZaDXXaqPRyiEhPvj
 5pvSRvFxfrH1r2T+0uYd+Ip1VgzZF9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-zI1beZonNnq0Tdwd--5rpg-1; Tue, 27 Sep 2022 15:35:55 -0400
X-MC-Unique: zI1beZonNnq0Tdwd--5rpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621FA830F99;
 Tue, 27 Sep 2022 19:35:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B59FA2166B26;
 Tue, 27 Sep 2022 19:35:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Eric Blake <eblake@redhat.com>,
 integration@gluster.org, David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, afaria@redhat.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Subject: [PATCH v5 10/12] stubs: add qemu_ram_block_from_host() and
 qemu_ram_get_fd()
Date: Tue, 27 Sep 2022 15:34:29 -0400
Message-Id: <20220927193431.22302-11-stefanha@redhat.com>
In-Reply-To: <20220927193431.22302-1-stefanha@redhat.com>
References: <20220927193431.22302-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The blkio block driver will need to look up the file descriptor for a
given pointer. This is possible in softmmu builds where the RAMBlock API
is available for querying guest RAM.

Add stubs so tools like qemu-img that link the block layer still build
successfully. In this case there is no guest RAM but that is fine.
Bounce buffers and their file descriptors will be allocated with
libblkio's blkio_alloc_mem_region() so we won't rely on QEMU's
qemu_ram_get_fd() in that case.

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


