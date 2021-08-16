Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8AC3ED145
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:49:31 +0200 (CEST)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZFJ-00004v-Sz
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFZDp-0005zU-Tw
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFZDl-00050F-O9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629107272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iNV1YL9IUvWjng4vGHQxfCq1cTu6N5PVelr3pW6GVH8=;
 b=a/9krgxWV5/kWuWWIdiMPvMuug5dlwUzluPNVTqlsm+VSD012ryhPIy2hE38sDQupDL2OS
 SAlZysT3eZ3lRmow6A5b2q/lKH+60aqXYUMsQqc2OhevAR5pQNYOnOmxjuoU4aUPQb6hPq
 fr2e4865YrMgN6g1SbOf/Pkb5Q4iG3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-UQg43PdbOc-MfRXIz7lFFA-1; Mon, 16 Aug 2021 05:47:51 -0400
X-MC-Unique: UQg43PdbOc-MfRXIz7lFFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78698799EC;
 Mon, 16 Aug 2021 09:47:50 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07D7C19C44;
 Mon, 16 Aug 2021 09:47:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Date: Mon, 16 Aug 2021 11:47:32 +0200
Message-Id: <20210816094739.21970-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
and in the man page proposal [1].

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

[1] https://lkml.kernel.org/r/20210816081922.5155-1-david@redhat.com

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


