Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4960DDA5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncDm-0005KJ-8H; Wed, 26 Oct 2022 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncCp-0000WI-CV
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncCl-0000L2-M8
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666774563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyQu35qqPeTmSx+O8zA1Jgg4eu8z0lgRUiDgVwFs7b0=;
 b=AktWUFsIeUIQ/6/XwgBJVePvwkymm5vfjEjRt9JCvujKafQApDvMgcp/RpeiPOhhuyVy3K
 Xy8Xt6Xq0AuZ6ymUZzAcikDbo+S3hkomT7znJdOwkMgFbhGST9AufeMMkdaYlgLaOpolYY
 vlShH50nT4RzMC33ZVGonxZP1j7bcV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-8MiUyl9WPk6d0HUbbGPw9A-1; Wed, 26 Oct 2022 04:55:57 -0400
X-MC-Unique: 8MiUyl9WPk6d0HUbbGPw9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09FA7101A54E;
 Wed, 26 Oct 2022 08:55:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EA36492B16;
 Wed, 26 Oct 2022 08:55:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL v3 03/11] dump: Reorder struct DumpState
Date: Wed, 26 Oct 2022 12:55:31 +0400
Message-Id: <20221026085540.254253-4-marcandre.lureau@redhat.com>
In-Reply-To: <20221026085540.254253-1-marcandre.lureau@redhat.com>
References: <20221026085540.254253-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

From: Janosch Frank <frankja@linux.ibm.com>

Let's move ELF related members into one block and guest memory related
ones into another to improve readability.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221017083822.43118-4-frankja@linux.ibm.com>
---
 include/sysemu/dump.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 9995f65dc8..9ed811b313 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -154,15 +154,8 @@ typedef struct DumpState {
     GuestPhysBlockList guest_phys_blocks;
     ArchDumpInfo dump_info;
     MemoryMappingList list;
-    uint32_t phdr_num;
-    uint32_t shdr_num;
     bool resume;
     bool detached;
-    ssize_t note_size;
-    hwaddr shdr_offset;
-    hwaddr phdr_offset;
-    hwaddr section_offset;
-    hwaddr note_offset;
     hwaddr memory_offset;
     int fd;
 
@@ -177,6 +170,15 @@ typedef struct DumpState {
     int64_t filter_area_begin;  /* Start address of partial guest memory area */
     int64_t filter_area_length; /* Length of partial guest memory area */
 
+    /* Elf dump related data */
+    uint32_t phdr_num;
+    uint32_t shdr_num;
+    ssize_t note_size;
+    hwaddr shdr_offset;
+    hwaddr phdr_offset;
+    hwaddr section_offset;
+    hwaddr note_offset;
+
     void *elf_section_hdrs;     /* Pointer to section header buffer */
 
     uint8_t *note_buf;          /* buffer for notes */
-- 
2.37.3


