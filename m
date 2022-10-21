Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238760784C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:23:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrzo-0006Jn-B6
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:23:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrjN-0005Qs-0B
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrj4-00051p-A7
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrj1-00082s-KM
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666357571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyQu35qqPeTmSx+O8zA1Jgg4eu8z0lgRUiDgVwFs7b0=;
 b=c4hQ8uJVJTsvUwcEIc49h+Ef9sQjqRIL7gFB5AWiWEyR0/WsMsMWnl7f5T12rnL6zj0a6q
 bQLbcuZSln8jgiuPdzSoHxuyuuJ2QDCRrHJ6ik18C/7rw+I1n6bnJsk128gVEfuAJIZSul
 UXD1d3B7T0DJj50jDi4V6PPygt2PbhQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-cmXnssu2P2SsCqyd46LDEw-1; Fri, 21 Oct 2022 09:06:07 -0400
X-MC-Unique: cmXnssu2P2SsCqyd46LDEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D84FA1C0A100;
 Fri, 21 Oct 2022 13:06:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19C6753AA;
 Fri, 21 Oct 2022 13:06:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL 03/11] dump: Reorder struct DumpState
Date: Fri, 21 Oct 2022 17:05:41 +0400
Message-Id: <20221021130549.111864-4-marcandre.lureau@redhat.com>
In-Reply-To: <20221021130549.111864-1-marcandre.lureau@redhat.com>
References: <20221021130549.111864-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


