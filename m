Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D560E813
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:01:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onldF-0008Bm-M8; Wed, 26 Oct 2022 15:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldC-00087e-2N
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldA-00075r-Cn
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5Nsk4yu5vYAWw8daYmNvNEP8/xkI+wJxlfskmxdGlM=;
 b=POzJREwO8AEugbAtWWAGPSAI+7bOG7rIrKOwE5eGepKTdk8hBB6k2ang4aHaYZSZIO7eZ4
 YHnhL7SjGappJYZ/jQQvXy55/1eyW4c/I/3MDUKSeBb8yL5FRiZG/zc75KR4It3EZZFHHA
 hRW+4glhkqgK0caYIrfDIjiAEsqAK6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-jgXPeLAXNfSTT_pLIQcPBQ-1; Wed, 26 Oct 2022 14:59:56 -0400
X-MC-Unique: jgXPeLAXNfSTT_pLIQcPBQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85F5D800186;
 Wed, 26 Oct 2022 18:59:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E10A44A9254;
 Wed, 26 Oct 2022 18:59:54 +0000 (UTC)
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
Subject: [PULL 10/13] exec/cpu-common: add qemu_ram_get_fd()
Date: Wed, 26 Oct 2022 14:58:43 -0400
Message-Id: <20221026185846.120544-11-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a function to get the file descriptor for a RAMBlock. Device
emulation code typically uses the MemoryRegion APIs but vhost-style code
may use RAMBlock directly for sharing guest memory with another process.

This new API will be used by the libblkio block driver so it can share
guest memory via .bdrv_register_buf().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20221013185908.1297568-11-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/cpu-common.h | 1 +
 softmmu/physmem.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index c493510ee9..6feaa40ca7 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -92,6 +92,7 @@ void qemu_ram_set_uf_zeroable(RAMBlock *rb);
 bool qemu_ram_is_migratable(RAMBlock *rb);
 void qemu_ram_set_migratable(RAMBlock *rb);
 void qemu_ram_unset_migratable(RAMBlock *rb);
+int qemu_ram_get_fd(RAMBlock *rb);
 
 size_t qemu_ram_pagesize(RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 56e03e07b5..d9578ccfd4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1748,6 +1748,11 @@ void qemu_ram_unset_migratable(RAMBlock *rb)
     rb->flags &= ~RAM_MIGRATABLE;
 }
 
+int qemu_ram_get_fd(RAMBlock *rb)
+{
+    return rb->fd;
+}
+
 /* Called with iothread lock held.  */
 void qemu_ram_set_idstr(RAMBlock *new_block, const char *name, DeviceState *dev)
 {
-- 
2.37.3


