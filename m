Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4E4CADB1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:37:22 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTqj-000642-CF
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:37:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkW-0001KC-Oo
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkT-0000IJ-LN
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/tUAUHrfKEnNVvUml1ZoiqMP8LRb/CPtkxhJDhvYh0=;
 b=YZOkSOYbEg7N6cdXdZUaLxqBgSYPmsBIu2jC5fcsVq70g6e+WQLy2UWvQGJJfEU++whSzp
 yxEeV/pyooZ0Znsi1PPkXedoY3rKe0Y3jnWC5DxvScBi5n8Vv++ZjNUtyEM5M1TU62wY78
 jDuOOYuVTSY4K16KlEJPrkjs3cv7E4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-KJINpXWcNJ2cpTEmX-0O9A-1; Wed, 02 Mar 2022 13:30:52 -0500
X-MC-Unique: KJINpXWcNJ2cpTEmX-0O9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB3D3801DDB;
 Wed,  2 Mar 2022 18:30:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34C691059170;
 Wed,  2 Mar 2022 18:30:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 11/18] migration: Dump ramblock and offset too when
 non-same-page detected
Date: Wed,  2 Mar 2022 18:29:29 +0000
Message-Id: <20220302182936.227719-12-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

In ram_load_postcopy() we'll try to detect non-same-page case and dump error.
This error is very helpful for debugging.  Adding ramblock & offset into the
error log too.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-6-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Fix up long line
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fe3de84856..a9d0d100bd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3707,8 +3707,12 @@ static int ram_load_postcopy(QEMUFile *f)
             } else if (tmp_page->host_addr !=
                        host_page_from_ram_block_offset(block, addr)) {
                 /* not the 1st TP within the HP */
-                error_report("Non-same host page %p/%p", tmp_page->host_addr,
-                             host_page_from_ram_block_offset(block, addr));
+                error_report("Non-same host page detected.  "
+                             "Target host page %p, received host page %p "
+                             "(rb %s offset 0x"RAM_ADDR_FMT" target_pages %d)",
+                             tmp_page->host_addr,
+                             host_page_from_ram_block_offset(block, addr),
+                             block->idstr, addr, tmp_page->target_pages);
                 ret = -EINVAL;
                 break;
             }
-- 
2.35.1


