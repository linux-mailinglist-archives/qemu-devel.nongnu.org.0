Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1F3D236B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:39:21 +0200 (CEST)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xyy-0005nk-9t
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6Xwa-0002zY-H5
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6XwX-0004RC-V1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626957409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=67KhO+RWmcoZZ9vDhr4KbLwNOua7cxusSO/6zFq+C0g=;
 b=AVFdr8ZTUiNGaDtb0nWYueWo9OZUh4G1+3qGD+YhIsFXF9ZIj+weyxBDJOYBofpzdjiwt4
 5j01sGlrz8JCD2yksjIYLhL5NYlCCdRRAzr4oDZs4qikrrsCsux72BVTL1f5Zx6eDgLnme
 KSrLKSBsXvPoBv6CB8l/mX05BXp6/7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-AXHFotTBMhi_WdlpRvcp8A-1; Thu, 22 Jul 2021 08:36:46 -0400
X-MC-Unique: AXHFotTBMhi_WdlpRvcp8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0941A107BEF5;
 Thu, 22 Jul 2021 12:36:46 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 446299329;
 Thu, 22 Jul 2021 12:36:36 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Date: Thu, 22 Jul 2021 14:36:29 +0200
Message-Id: <20210722123635.60608-1-david@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

#1 adds support for MADV_POPULATE_WRITE, #2 cleans up the code to avoid
global variables and prepare for concurrency, #3 and #4 optimize thread
handling, #5 makes os_mem_prealloc() safe to be called from multiple
threads concurrently and #6 makes the SIGBUS handler coexist cleanly with
the MCE SIGBUS handler under Linux.

Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
Linux commit 4ca9b3859dac ("mm/madvise: introduce
MADV_POPULATE_(READ|WRITE) to prefault page tables") and in the latest man
page patch [1].

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

[1] https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>

David Hildenbrand (6):
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
 util/oslib-posix.c   | 220 +++++++++++++++++++++++++++++++++----------
 3 files changed, 181 insertions(+), 50 deletions(-)

-- 
2.31.1


