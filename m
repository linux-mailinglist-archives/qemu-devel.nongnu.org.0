Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6B48AED3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:48:49 +0100 (CET)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HW4-0002aL-A0
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gll-0004pj-Ow
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:00:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Glk-0005gF-7c
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGSYPXKX7ZULzPp4ZznmYHOOL6TgtLyH+Wfqf39kLds=;
 b=LQ+5pnHxarPpaZztfa0vXj3J5j0XTFh7rnEydSIwfbmLia45c7xyLCpZMBZnNaMot+MLd7
 sgt00zeFKgIAFsax7msW4x2Z55vbSFBK9Puiu15g7V7dhgY7JJ36n6ehn1UFU6O/PkvLE5
 bm95aGXfRTApWXqaPwSPHpYsL2MLj/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-PZmYbH9DN7691NAcWOW0gA-1; Tue, 11 Jan 2022 08:00:54 -0500
X-MC-Unique: PZmYbH9DN7691NAcWOW0gA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311FB92504;
 Tue, 11 Jan 2022 13:00:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 332541059179;
 Tue, 11 Jan 2022 13:00:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/23] migration: simplify do_compress_ram_page
Date: Tue, 11 Jan 2022 14:00:06 +0100
Message-Id: <20220111130024.5392-6-quintela@redhat.com>
In-Reply-To: <20220111130024.5392-1-quintela@redhat.com>
References: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goto is not needed at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fa49d22e69..422c6bce28 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 {
     RAMState *rs = ram_state;
     uint8_t *p = block->host + offset;
-    bool zero_page = false;
     int ret;
 
     if (save_zero_page_to_file(rs, f, block, offset)) {
-        zero_page = true;
-        goto exit;
+        ram_release_page(block->idstr, offset);
+        return true;
     }
 
     save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
@@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
-        return false;
     }
-
-exit:
-    ram_release_page(block->idstr, offset);
-    return zero_page;
+    return false;
 }
 
 static void
-- 
2.34.1


