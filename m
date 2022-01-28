Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED64A00A1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 20:07:05 +0100 (CET)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDWaO-0002v7-Dm
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 14:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW5E-00068q-QZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:34:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW59-000136-Pu
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTuNu9HO4jPGub59vmHdns8TqyGd7V+63Di/4oQVtOQ=;
 b=KBFghhJhbrikm4yK1t2RylcJ2c2k8Sww/cSi0LADIr4gTDq02Pa/EiBKpQVNSzyvnwF8xU
 jW0TurW34a9tCdSI91bGruBOkXbE9K66Vub8Sev2e7TJgv6zXbPAEQ7N/IOBJfk8PneP59
 NJkr4B5qeWMKIxYGI6wJnW5DHtjA37g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-cg4pu1jpNEGZwPsMc3yHnA-1; Fri, 28 Jan 2022 13:34:41 -0500
X-MC-Unique: cg4pu1jpNEGZwPsMc3yHnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CE1C8145E0;
 Fri, 28 Jan 2022 18:34:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D62177456;
 Fri, 28 Jan 2022 18:34:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] migration: simplify do_compress_ram_page
Date: Fri, 28 Jan 2022 19:30:02 +0100
Message-Id: <20220128183033.31998-6-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goto is not needed at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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


