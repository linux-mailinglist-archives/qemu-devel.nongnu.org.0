Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E701A59CB6C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:28:54 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQFuf-0001Mu-Ul
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqU-0001i6-OD
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqT-0004bc-3x
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661207072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fu/a45rJHMIUEyQrGQeb6Alviz1AoFhUo7br1qxbQeo=;
 b=PbLvbY0IU2jmN8fVEWsdYLXe+WStj3jQBuH66n6E446rmV99zLEPW7YnF1ihI9cIpzjwYh
 Zc2fJo5L9nHJ77FadrFeZl31I8kpIOgILZpBgPweCDC6LqNrJK9DgIeIXm7IoVPrBO5JrN
 /WPghbLb+SHzIEWj+/kZRw9G7tm1ruw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-J10edu_iP2i70YJRS1iNRQ-1; Mon, 22 Aug 2022 18:24:27 -0400
X-MC-Unique: J10edu_iP2i70YJRS1iNRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C39DC3C0D843;
 Mon, 22 Aug 2022 22:24:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B9D3141511A;
 Mon, 22 Aug 2022 22:24:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Peter Xu <peterx@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
Subject: [RFC v4 08/11] exec/cpu-common: add qemu_ram_get_fd()
Date: Mon, 22 Aug 2022 18:23:59 -0400
Message-Id: <20220822222402.176088-9-stefanha@redhat.com>
In-Reply-To: <20220822222402.176088-1-stefanha@redhat.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function to get the file descriptor for a RAMBlock. Device
emulation code typically uses the MemoryRegion APIs but vhost-style code
may use RAMBlock directly for sharing guest memory with another process.

This new API will be used by the libblkio block driver so it can share
guest memory via .bdrv_register_buf().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/cpu-common.h | 1 +
 softmmu/physmem.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 2281be4e10..ccef44b3d3 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -90,6 +90,7 @@ void qemu_ram_set_uf_zeroable(RAMBlock *rb);
 bool qemu_ram_is_migratable(RAMBlock *rb);
 void qemu_ram_set_migratable(RAMBlock *rb);
 void qemu_ram_unset_migratable(RAMBlock *rb);
+int qemu_ram_get_fd(RAMBlock *rb);
 
 size_t qemu_ram_pagesize(RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dc3c3e5f2e..f2bdad2583 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1765,6 +1765,11 @@ void qemu_ram_unset_migratable(RAMBlock *rb)
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
2.37.2


