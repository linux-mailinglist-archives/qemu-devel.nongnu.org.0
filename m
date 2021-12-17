Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC54478CFA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:01:13 +0100 (CET)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDnL-0007Et-04
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:01:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDZ1-0005Xf-Ft
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:46:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDYy-0008DV-8t
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q4DhipH+tvhGTuTz2zHGGAmhkd/90Qz6w8UY4vmhcK4=;
 b=WpxVp0Ygt+DEHleCp3LIN750+lQEyI/S5J1vvHgq16vS6K3EPRByyiqJOt6V042DF6fq9o
 sc4xOCB0ubWU7YariiS55dO8FeVw37BhTMcv+a51CgLygme4fX6r6ax6rrm6RT2efoTTzK
 hgCoOqYjYZY1emZyLrOZqkEq5AA6mKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-5Qzu9GBdNzWhTumoNgV4vQ-1; Fri, 17 Dec 2021 08:46:16 -0500
X-MC-Unique: 5Qzu9GBdNzWhTumoNgV4vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 944708042CC;
 Fri, 17 Dec 2021 13:46:15 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4C8F4E2CB;
 Fri, 17 Dec 2021 13:46:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] virtio-mem: Support "prealloc=on"
Date: Fri, 17 Dec 2021 14:46:03 +0100
Message-Id: <20211217134611.31172-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Based-on: <20211217134039.29670-1-david@redhat.com>

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

v1 -> v2:
- Rebased
- Added RBs

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


