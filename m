Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576049B68F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:43:31 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCN2g-00043p-FN
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCMKd-0000Jp-Mv
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCMKM-0002hr-0T
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643119059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M77iPI+YF6ndI51pnH7a1RRWefMTEbR5eS4Y6gD8ufo=;
 b=NuR+/hCI3IJfF7HhDPXtWFKQM1MP5lfQG3qiFyzquiEWwl/wcEVK9vHVx2Vl39NUlMe6ph
 /lKpkCGPsri5XRM9fldRMbz/itYi3GTvb5/bpHBKWejyJSj3cJRNI5/PbLql/u8qHhB0cv
 OlY7EPMSU9x9nY71zvDupGLWUS0aeOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-MxPDvP7CO3aPofZGooCMtQ-1; Tue, 25 Jan 2022 08:57:37 -0500
X-MC-Unique: MxPDvP7CO3aPofZGooCMtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC4CF1018720
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 13:57:36 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5202377B;
 Tue, 25 Jan 2022 13:57:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] virtio-mem: Handle preallocation with migration
Date: Tue, 25 Jan 2022 14:57:32 +0100
Message-Id: <20220125135734.134928-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While playing with migration of virtio-mem with an ordinary file backing,
I realized that migration and prealloc doesn't currently work as expected
for virtio-mem, especially when migrating zeropages or skipping migration
of some pages.

In contrast to ordinary memory backend preallocation, virtio-mem
preallocates memory before plugging blocks to the guest. Consequently,
when migrating we are not actually preallocating on the destination but
"only" migrate pages. When migrating the zeropage, we might not end up
allocating actual backend memory.

Postcopy needs some extra care, and I realized that prealloc+postcopy is
shaky in general. Let's at least try to mimic what ordinary
prealloc+postcopy does: temporarily allocate the memory, discard it, and
cross fingers that we'll still have sufficient memory when postcopy
actually tries placing pages.

For postcopy to work with prealloc=on, we need a matching "requested-size"
on source and destination, meaning we have to start QEMU on the destination
with the current "requested-size" on the source. Only that way, we can try
temporarily allocating the "requested-size" to see if there is a
fundamental issue. If we detect a mismatch, we don't start postcopy.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>

v1 -> v2:
- Added RBs and Tested-bys
- "virtio-mem: Fail if a memory backend with "prealloc=on" is specified"
-- Fail instead of warn
-- Adjust subject/description

David Hildenbrand (2):
  virtio-mem: Fail if a memory backend with "prealloc=on" is specified
  virtio-mem: Handle preallocation with migration

 hw/virtio/virtio-mem.c         | 142 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-mem.h |   6 ++
 2 files changed, 148 insertions(+)

-- 
2.34.1


