Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA426883C5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc7l-0007fh-DR; Thu, 02 Feb 2023 11:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7g-0007Km-H2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7e-00055y-EC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzSBIR6LRz6N4Dl8hXA3eueT1HX6gOU9Tw+HrG3oo/w=;
 b=NVLiv0vDNv1dKj8JXRBVwNT9EAk6pVoW770KOpmD54whW4yrLrGwR3FbDucOXIOn2R6op9
 RkkTJOciCc1h6qvaQXSH1eNhUVVuS36Y+yYuFkDS70xGG2FXPtKtwi1F/nYa/ZPJ+TPvDG
 qUmB79XbUhequhk3S7BIfmx1zYkzPzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-8fT2XfxdNgG5ccuNzhdn1A-1; Thu, 02 Feb 2023 11:07:34 -0500
X-MC-Unique: 8fT2XfxdNgG5ccuNzhdn1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50ED418E0923;
 Thu,  2 Feb 2023 16:07:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAB9851FF;
 Thu,  2 Feb 2023 16:07:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>
Subject: [PULL 09/26] migration/ram: Don't explicitly unprotect when
 unregistering uffd-wp
Date: Thu,  2 Feb 2023 17:06:23 +0100
Message-Id: <20230202160640.2300-10-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: David Hildenbrand <david@redhat.com>

When unregistering uffd-wp, older kernels before commit f369b07c86143
("mm/uffd:reset write protection when unregister with wp-mode") won't
clear the uffd-wp PTE bit. When re-registering uffd-wp, the previous
uffd-wp PTE bits would trigger again. With above commit, the kernel will
clear the uffd-wp PTE bits when unregistering itself.

Consequently, we'll clear the uffd-wp PTE bits now twice -- whereby we
don't care about clearing them at all: a new background snapshot will
re-register uffd-wp and re-protect all memory either way.

So let's skip the manual clearing of uffd-wp. If ever relevant, we
could clear conditionally in uffd_unregister_memory() -- we just need a
way to figure out more recent kernels.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 73e5ca93e5..efaae07dd8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1918,12 +1918,6 @@ fail:
         if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
             continue;
         }
-        /*
-         * In case some memory block failed to be write-protected
-         * remove protection and unregister all succeeded RAM blocks
-         */
-        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
-                false, false);
         uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
         /* Cleanup flags and remove reference */
         block->flags &= ~RAM_UF_WRITEPROTECT;
@@ -1949,9 +1943,6 @@ void ram_write_tracking_stop(void)
         if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
             continue;
         }
-        /* Remove protection and unregister all affected RAM blocks */
-        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
-                false, false);
         uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
 
         trace_ram_write_tracking_ramblock_stop(block->idstr, block->page_size,
-- 
2.39.1


