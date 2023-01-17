Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B41670B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9R-0000zL-0m; Tue, 17 Jan 2023 17:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9N-0000kx-W3
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9M-0007Zs-9c
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=266iSbql5BbyDtqQckxWDJK2IyS5vgAVX9Vmr1kym90=;
 b=bxRdHozBwIlq6gM3a63FtXFeyr8IrvEmbVDBzjRHOMQJTmzT/Sto25zvlb3ZmmlXkLmdXD
 soMLuDCLZibuRdJNOxsb07HQxQD8tb6HVagn6g4PIe8bkTQKUAswmT9m+k2WE8yDIABjI/
 9/iV5xCSqhSOcQsRwGgBlgjSLnfk92o=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423--GRA8lHUMqGiz-kUp4lrTA-1; Tue, 17 Jan 2023 17:09:46 -0500
X-MC-Unique: -GRA8lHUMqGiz-kUp4lrTA-1
Received: by mail-vk1-f197.google.com with SMTP id
 u197-20020a1f2ece000000b003e1b0286c0fso704607vku.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=266iSbql5BbyDtqQckxWDJK2IyS5vgAVX9Vmr1kym90=;
 b=1/jVJ5EBq1BebaY2IjSv6WJia70qqj0x1P3EJYMVRw8fSjzYvrHORLABTJebDTce8s
 i0i7U1UhLOogxL3zcsQfnf6E2bLJqlGtTqPGuhodh8PDcI368yDHO8WERHVB48/dv890
 uTVTZC18mQic2/u2ZeYuQKRJaHZqJaKFa88HnV5EyyZpWtRr71IkkKJq6eNIuohlAC1H
 cWK16cbshoRTryIWJwATRThpKPOzT3LcPSffJfAYAT1q4kbpYzalm8Qy9XzH3Zc9xG+e
 XeN1TlGDpYdrvFRRs09Skmjio4V5MjWUscSSfcI/QbBvuCyvOkcu+a34Dmb2PDMFiX9v
 3ufQ==
X-Gm-Message-State: AFqh2kp0c8rbPp6rmexC3/x/An99IO1g+nQIO1aNqX/m8xPo8t96HuiP
 u6WunK7XWRrP/c+zkpOjO1a2AtzCqUXBSgJytylc5Rggtx2jHBjtP/b8DE+A75IHFzwjOPwO/Fc
 NXYyhTz92DopC7rHof4J1kwwd5iWKQwQk9Grbv9yTYcGp/AsOrwg6iDn6r1DKtCWY
X-Received: by 2002:a67:f30d:0:b0:3c4:a880:7312 with SMTP id
 p13-20020a67f30d000000b003c4a8807312mr2546250vsf.27.1673993385373; 
 Tue, 17 Jan 2023 14:09:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvd557uB39Mv6N4IAkGYzlvyzL96KiLz9/ZXzfyT1BC10KRf9Xw82eeXQujZDUmxaJZo2mbAA==
X-Received: by 2002:a67:f30d:0:b0:3c4:a880:7312 with SMTP id
 p13-20020a67f30d000000b003c4a8807312mr2546231vsf.27.1673993385129; 
 Tue, 17 Jan 2023 14:09:45 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:44 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 10/21] ramblock: Add ramblock_file_map()
Date: Tue, 17 Jan 2023 17:09:03 -0500
Message-Id: <20230117220914.2062125-11-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add a helper to do mmap() for a ramblock based on the cached informations.

A trivial thing to mention is we need to move ramblock->fd setup to be
earlier, before the ramblock_file_map() call, because it'll need to
reference the fd being mapped.  However that should not be a problem at
all, majorly because the fd won't be freed if successful, and if it failed
the fd will be freeed (or to be explicit, close()ed) by the caller.

Export it - prepare to be used outside this file.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ram_addr.h |  1 +
 softmmu/physmem.c       | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 0bf9cfc659..56db25009a 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -98,6 +98,7 @@ bool ramblock_is_pmem(RAMBlock *rb);
 
 long qemu_minrampagesize(void);
 long qemu_maxrampagesize(void);
+void *ramblock_file_map(RAMBlock *block);
 
 /**
  * qemu_ram_alloc_from_file,
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6096eac286..cdda7eaea5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1532,17 +1532,31 @@ static int file_ram_open(const char *path,
     return fd;
 }
 
+/* Do the mmap() for a ramblock based on information already setup */
+void *ramblock_file_map(RAMBlock *block)
+{
+    uint32_t qemu_map_flags;
+
+    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
+    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
+    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
+    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
+
+    return qemu_ram_mmap(block->fd, block->mmap_length, block->mr->align,
+                         qemu_map_flags, block->file_offset);
+}
+
 static void *file_ram_alloc(RAMBlock *block,
                             int fd,
                             bool truncate,
                             off_t offset,
                             Error **errp)
 {
-    uint32_t qemu_map_flags;
     void *area;
 
     /* Remember the offset just in case we'll need to map the range again */
     block->file_offset = offset;
+    block->fd = fd;
     block->page_size = qemu_fd_getpagesize(fd);
     if (block->mr->align % block->page_size) {
         error_setg(errp, "alignment 0x%" PRIx64
@@ -1588,19 +1602,14 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
-    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
-    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
-    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
-    area = qemu_ram_mmap(fd, block->mmap_length, block->mr->align,
-                         qemu_map_flags, offset);
+    area = ramblock_file_map(block);
+
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
         return NULL;
     }
 
-    block->fd = fd;
     return area;
 }
 #endif
-- 
2.37.3


