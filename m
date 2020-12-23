Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAFD2E222B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:39:41 +0100 (CET)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBrA-0006tb-Cz
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBg6-0002uu-My
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBg5-0004aX-3g
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfogaUzYYJYcMZaceB8d8ylhgTPbwyT56i+x1XLi8EY=;
 b=cERP+oxdx2uesL4eQYNR6OUvY9qwIkQ2yFGaPtZg4YP+77fBWJpoHXAO9STB1gXl61KyoL
 mk/Zq7E2SzDKRulRiTLnuYmRQO3dZJJQ1iGPLkogJi3QH4NvOG1OCHaS664Rk3iKDoZpkf
 Eto4lOLmJV2V2hlQ5E1tEEnvRIabTbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-Ids3ZmPsO4mHzoUP6H3ETQ-1; Wed, 23 Dec 2020 16:28:09 -0500
X-MC-Unique: Ids3ZmPsO4mHzoUP6H3ETQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7850B180A08A;
 Wed, 23 Dec 2020 21:28:08 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7670C2CF2B;
 Wed, 23 Dec 2020 21:28:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 15/15] bugfix: hostmem: Free host_nodes list right after visited
Date: Wed, 23 Dec 2020 16:27:35 -0500
Message-Id: <20201223212735.512062-16-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keqian Zhu <zhukeqian1@huawei.com>

In host_memory_backend_get_host_nodes, we build host_nodes
list and output it to v (a StringOutputVisitor) but forget
to free the list. This fixes the memory leak.

The memory leak stack:

 Direct leak of 32 byte(s) in 2 object(s) allocated from:
    #0 0xfffda30b3393 in __interceptor_calloc (/usr/lib64/libasan.so.4+0xd3393)
    #1 0xfffda1d28b9b in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x58b9b)
    #2 0xaaab05ca6e43 in host_memory_backend_get_host_nodes backends/hostmem.c:94
    #3 0xaaab061ddf83 in object_property_get_uint16List qom/object.c:1478
    #4 0xaaab05866513 in query_memdev hw/core/machine-qmp-cmds.c:312
    #5 0xaaab061d980b in do_object_child_foreach qom/object.c:1001
    #6 0xaaab0586779b in qmp_query_memdev hw/core/machine-qmp-cmds.c:328
    #7 0xaaab0615ed3f in qmp_marshal_query_memdev qapi/qapi-commands-machine.c:327
    #8 0xaaab0632d647 in do_qmp_dispatch qapi/qmp-dispatch.c:147
    #9 0xaaab0632d647 in qmp_dispatch qapi/qmp-dispatch.c:190
    #10 0xaaab0610f74b in monitor_qmp_dispatch monitor/qmp.c:120
    #11 0xaaab0611074b in monitor_qmp_bh_dispatcher monitor/qmp.c:209
    #12 0xaaab063caefb in aio_bh_poll util/async.c:117
    #13 0xaaab063d30fb in aio_dispatch util/aio-posix.c:459
    #14 0xaaab063cac8f in aio_ctx_dispatch util/async.c:268
    #15 0xfffda1d22a6b in g_main_context_dispatch (/usr/lib64/libglib-2.0.so.0+0x52a6b)
    #16 0xaaab063d0e97 in glib_pollfds_poll util/main-loop.c:218
    #17 0xaaab063d0e97 in os_host_main_loop_wait util/main-loop.c:241
    #18 0xaaab063d0e97 in main_loop_wait util/main-loop.c:517
    #19 0xaaab05c8bfa7 in main_loop /root/rpmbuild/BUILD/qemu-4.1.0/vl.c:1791
    #20 0xaaab05713bc3 in main /root/rpmbuild/BUILD/qemu-4.1.0/vl.c:4473
    #21 0xfffda0a83ebf in __libc_start_main (/usr/lib64/libc.so.6+0x23ebf)
    #22 0xaaab0571ed5f  (aarch64-softmmu/qemu-system-aarch64+0x88ed5f)
 SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).

Fixes: 4cf1b76bf1e2 (hostmem: add properties for NUMA memory policy)
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Tested-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201210075226.20196-1-zhukeqian1@huawei.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 backends/hostmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4bde00e8e7..9f9ac95edd 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -105,6 +105,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
 
 ret:
     visit_type_uint16List(v, name, &host_nodes, errp);
+    qapi_free_uint16List(host_nodes);
 }
 
 static void
-- 
2.28.0


