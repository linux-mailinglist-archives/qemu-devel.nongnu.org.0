Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3531463179
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:45:47 +0100 (CET)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0du-0003M8-I6
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0a7-0005Zv-Ct
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0a2-0000xd-T5
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638268904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=44lt3tfKyJ4Nu/1TqxaL3VXi9xOmq6yMyFndRTyYdgk=;
 b=PdZg13YdhqTcOLbAqDUm0bDgZT5hpSd9pqrqFqdqbIaeON9G+93AdcpvMN9SJXt0mJTWhG
 CkwlvRHk9zbzmajPhVWrvxq1dH9tIyOIEWBh0avuQqmb9KK7HQIEu2Y7FROobY8ldkQ23/
 UrWYDkg+LBvliZ8+16EMDTC5OlYBOkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-l-bJhDEmNBWY88tnM6x42A-1; Tue, 30 Nov 2021 05:41:41 -0500
X-MC-Unique: l-bJhDEmNBWY88tnM6x42A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FB71192CC40;
 Tue, 30 Nov 2021 10:41:40 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5764E100EBB8;
 Tue, 30 Nov 2021 10:41:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/8] virtio-mem: Support "prealloc=on"
Date: Tue, 30 Nov 2021 11:41:28 +0100
Message-Id: <20211130104136.40927-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20211130092838.24224-1-david@redhat.com>

Patch #1 - #7 are fully reviewed [1] but did not get picked up yet, so I'm
sending them along here, as they are required to use os_mem_prealloc() in
a safe way once the VM is running.

Support preallocation of memory to make virtio-mem safe to use with
scarce memory resources such as hugetlb. Before acknowledging a plug
request from the guest, we'll try preallcoating memory. If that fails,
we'll fail the request gracefully and warn the usr once.

To fully support huge pages for shared memory, we'll have to adjust shared
memory users, such as virtiofsd, to map guest memory via MAP_NORESERVE as
well, because otherwise, they'll end up overwriting the "reserve=off"
decision made by QEMU and try reserving huge pages for the sparse memory
region.

In the future, we might want to process guest requests, including
preallocating memory, asynchronously via a dedicated iothread.

[1] https://lkml.kernel.org/r/20211004120208.7409-1-david@redhat.com

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Hui Zhu <teawater@gmail.com>
Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Michal Prívozník <mprivozn@redhat.com>

David Hildenbrand (8):
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
  virtio-mem: Support "prealloc=on" option

 hw/virtio/virtio-mem.c         |  39 +++++-
 include/hw/virtio/virtio-mem.h |   4 +
 include/qemu/osdep.h           |   7 +
 softmmu/cpus.c                 |   4 +
 util/oslib-posix.c             | 231 +++++++++++++++++++++++++--------
 5 files changed, 226 insertions(+), 59 deletions(-)

-- 
2.31.1


