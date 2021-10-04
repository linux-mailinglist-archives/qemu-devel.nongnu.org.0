Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8F420ABA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 14:18:30 +0200 (CEST)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXMvN-0004rO-Je
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 08:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mXMia-0005M1-R8
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mXMiU-0003ep-K6
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633349109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SwGglNhxnTLcc5/PppeelRryuMPL/0bJYyozPFFiLg8=;
 b=NGf7yLumpNGorBCuozUjjnDLjdUFwoWoWDQmUf72X3FNZdJTLS2hMvm4FpLPfvrWc+VRWD
 YzhvJNQ0gRgEM50AAUj4/iatMgv2fyndV1ETMMGZNPeINGr6lQHM2VQapvgOf2sOJ/AW5c
 QmgW/uUmJtWdxrCSit+qMV4SPGfQWfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-XV5VBneqPsqxb44V8gTMrw-1; Mon, 04 Oct 2021 08:02:39 -0400
X-MC-Unique: XV5VBneqPsqxb44V8gTMrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FD861084696;
 Mon,  4 Oct 2021 12:02:38 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2161F422;
 Mon,  4 Oct 2021 12:02:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Date: Mon,  4 Oct 2021 14:02:01 +0200
Message-Id: <20211004120208.7409-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

#1 is a preparation for improved error reporting, #2 adds support for
MADV_POPULATE_WRITE, #3 cleans up the code to avoid global variables and
prepare for concurrency, #4 and #5 optimize thread handling, #6 makes
os_mem_prealloc() safe to be called from multiple threads concurrently and
#7 makes the SIGBUS handler coexist cleanly with the MCE SIGBUS handler
under Linux.

Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
Linux commits 4ca9b3859dac ("mm/madvise: introduce
MADV_POPULATE_(READ|WRITE) to prefault page tables") and eb2faa513c24
("mm/madvise: report SIGBUS as -EFAULT for MADV_POPULATE_(READ|WRITE)"),
and in the man page update [1].

v3 -> v4:
- Added ACKs
- "util/oslib-posix: Support concurrent os_mem_prealloc() invocation"
-- Remove stale comment from patch description

v2 -> v3:
- "util/oslib-posix: Let touch_all_pages() return an error"
-- Added
- Added ACKs/RBs
- "util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()"
-- Set error code accordingly

v1 -> v2:
- "util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()"
-- Handle thread with no data to initialize
-- Always set use_madv_populate_write properly
-- Add comment regarding future fallocate() optimization
- "util/oslib-posix: Don't create too many threads with small memory or
   little pages"
-- Added
- "util/oslib-posix: Avoid creating a single thread with
   MADV_POPULATE_WRITE"
-- Added
- "util/oslib-posix: Support concurrent os_mem_prealloc() invocation"
-- Add missing g_once_init_leave()
-- Move g_once_init_enter() to the place where it is actually needed
- "util/oslib-posix: Forward SIGBUS to MCE handler under Linux"
-- Added

[1] https://lkml.kernel.org/r/20210823120645.8223-1-david@redhat.com

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>

David Hildenbrand (7):
  util/oslib-posix: Let touch_all_pages() return an error
  util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
  util/oslib-posix: Introduce and use MemsetContext for
    touch_all_pages()
  util/oslib-posix: Don't create too many threads with small memory or
    little pages
  util/oslib-posix: Avoid creating a single thread with
    MADV_POPULATE_WRITE
  util/oslib-posix: Support concurrent os_mem_prealloc() invocation
  util/oslib-posix: Forward SIGBUS to MCE handler under Linux

 include/qemu/osdep.h |   7 ++
 softmmu/cpus.c       |   4 +
 util/oslib-posix.c   | 231 ++++++++++++++++++++++++++++++++-----------
 3 files changed, 187 insertions(+), 55 deletions(-)

-- 
2.31.1


