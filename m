Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32726914BB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:38:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGU9-0002Lv-R2; Thu, 09 Feb 2023 18:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGU7-0002Kw-Ra
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGU6-0007gE-8b
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOoM/jysyMMLXInKHjz8rdvH/wPBwEQg/f/iK2pEkbw=;
 b=TpzXHI9d41t0buCY9x9cy/q7gS1OsH0yZMBrYLwnH7M+9pJGM3c2Q/9F8x5mh7zypcD4Iw
 2bQ+BSwsMI/VQCBb86jLDIlXT3WsP7U5b014HxSE5XMagRMeGQ/vcolqDdS4Iu0stURXoe
 cHUMcmyQxo6VRIsX1aW8ghZytVXgZxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-pCdLGbQNPNyJnD1-_BfgaA-1; Thu, 09 Feb 2023 18:37:40 -0500
X-MC-Unique: pCdLGbQNPNyJnD1-_BfgaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2056A3806102;
 Thu,  9 Feb 2023 23:37:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6938140EBF6;
 Thu,  9 Feb 2023 23:37:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 4/4] ram: Document migration ram flags
Date: Fri, 10 Feb 2023 00:37:30 +0100
Message-Id: <20230209233730.38288-5-quintela@redhat.com>
In-Reply-To: <20230209233730.38288-1-quintela@redhat.com>
References: <20230209233730.38288-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

0x80 is RAM_SAVE_FLAG_HOOK, it is in qemu-file now.
Bigger usable flag is 0x200, noticing that.
We can reuse RAM_SAVe_FLAG_FULL.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 32fab7b5ee..3648cfc357 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -67,22 +67,26 @@
 /***********************************************************/
 /* ram save/restore */
 
-/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
+/*
+ * RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
  * worked for pages that where filled with the same char.  We switched
  * it to only search for the zero value.  And to avoid confusion with
  * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
  */
-
-#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
+/*
+ * RAM_SAVE_FLAG_FULL was obsoleted in 2009, it can be reused now
+ */
+#define RAM_SAVE_FLAG_FULL     0x01
 #define RAM_SAVE_FLAG_ZERO     0x02
 #define RAM_SAVE_FLAG_MEM_SIZE 0x04
 #define RAM_SAVE_FLAG_PAGE     0x08
 #define RAM_SAVE_FLAG_EOS      0x10
 #define RAM_SAVE_FLAG_CONTINUE 0x20
 #define RAM_SAVE_FLAG_XBZRLE   0x40
-/* 0x80 is reserved in migration.h start with 0x100 next */
+/* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 #define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
+/* We can't use any flag that is bigger than 0x200 */
 
 int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
      uint8_t *, int) = xbzrle_encode_buffer;
-- 
2.39.1


