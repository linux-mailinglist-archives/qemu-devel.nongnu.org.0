Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE583311B6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:10:56 +0100 (CET)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHX5-0002dv-7A
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJHT6-0005kn-G6
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJHT4-0001HL-Tz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615216006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtdIvl849NtSwhObgAWNC1HihBCNlWbPsoigE9tqXac=;
 b=MaIYQea3aBJRMF9gkDz1XevwCAoFT7m7AX+l4KlXH+txUgbajpQDILpzvtwiKyOmyXDTic
 xCUoWGz2QsjyB73sodLfuRvNx4XBc0CP3B59AfnM9keDQ5PNE25GvkYy19JRvl0SB9tb7F
 pTx13fcc940HMW7qH8SEivo2GpAPI3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-KLWDt_O2ON24o01P_EUM7Q-1; Mon, 08 Mar 2021 10:06:42 -0500
X-MC-Unique: KLWDt_O2ON24o01P_EUM7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A12771966323;
 Mon,  8 Mar 2021 15:06:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F209D5D9CD;
 Mon,  8 Mar 2021 15:06:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] softmmu/physmem: Fix ram_block_discard_range() to
 handle shared anonymous memory
Date: Mon,  8 Mar 2021 16:05:50 +0100
Message-Id: <20210308150600.14440-3-david@redhat.com>
In-Reply-To: <20210308150600.14440-1-david@redhat.com>
References: <20210308150600.14440-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can create shared anonymous memory via
    "-object memory-backend-ram,share=on,..."
which is, for example, required by PVRDMA for mremap() to work.

Shared anonymous memory is weird, though. Instead of MADV_DONTNEED, we
have to use MADV_REMOVE. MADV_DONTNEED fails silently and does nothing.

Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/physmem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 62ea4abbdd..2ba815fec6 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3506,6 +3506,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
         /* The logic here is messy;
          *    madvise DONTNEED fails for hugepages
          *    fallocate works on hugepages and shmem
+         *    shared anonymous memory requires madvise REMOVE
          */
         need_madvise = (rb->page_size == qemu_host_page_size);
         need_fallocate = rb->fd != -1;
@@ -3539,7 +3540,11 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
              * fallocate'd away).
              */
 #if defined(CONFIG_MADVISE)
-            ret =  madvise(host_startaddr, length, MADV_DONTNEED);
+            if (qemu_ram_is_shared(rb) && rb->fd < 0) {
+                ret = madvise(host_startaddr, length, MADV_REMOVE);
+            } else {
+                ret = madvise(host_startaddr, length, MADV_DONTNEED);
+            }
             if (ret) {
                 ret = -errno;
                 error_report("ram_block_discard_range: Failed to discard range "
-- 
2.29.2


