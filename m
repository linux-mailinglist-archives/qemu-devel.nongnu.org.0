Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B182870BB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 10:32:43 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQRLu-0008NP-GB
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 04:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kQRK3-0007HK-85
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 04:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kQRK1-0006NH-6f
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 04:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602145842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FTmMH04fqsaRqzPsj6E9qcOHdzljqjQWvgI/t4Jka8M=;
 b=fHOHFTUyf1aFdO64/0FYHENOItV2NP24o/ronoiJhbLvnHqooLI7mpiCDenkKbgx5L9vU/
 WTuJHbAcjnB59FGqSKg90fso1DoYTKre60bPU/+HQXgPHm/iqsWMONXK4swi9fkKqHtEVT
 p776Cp9zdblTlQrbOzbLNucW/vlWE40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-ed-w1e0TNF2wHG0n_4DgyQ-1; Thu, 08 Oct 2020 04:30:39 -0400
X-MC-Unique: ed-w1e0TNF2wHG0n_4DgyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1125B101FFA2;
 Thu,  8 Oct 2020 08:30:38 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2D645C1BD;
 Thu,  8 Oct 2020 08:30:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] virtio-mem: block size and address-assignment
 optimizations
Date: Thu,  8 Oct 2020 10:30:23 +0200
Message-Id: <20201008083029.9504-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Let's try to detect the actual THP size and use it as default block size
(unless the page size of the backend indicates that THP don't apply).
Always allow to set a block size of 1 MiB, but warn if the configured block
size is smaller than the default. Handle large block sizes better, avoiding
a virtio-spec violation and optimizing address auto-detection.

For existing setups (x86-64), the default block size won't change (was, and
will be 2 MiB on anonymous memory). For existing x86-64 setups, the address
auto-detection won't change in relevant setups (esp., anonymous memory
and hugetlbfs with 2 MiB pages and no manual configuration of the block
size). I don't see the need for compatibility handling (especially, as
virtio-mem is still not considered production-ready).

Most of this is a preparation for future architectures, using hugetlbfs
to full extend, and using manually configured, larger block sizes
(relevant for vfio in the future).

v1 -> v2:
- Reordered patches to have fixes upfront
- Tweaked some patch descriptions
- "virtio-mem: Check that "memaddr" is multiples of the block size"
-- Renamed to "virtio-mem: Make sure "addr" is always multiples of the
   block size"
- "virtio-mem: Make sure "usable_region_size" is always multiples of the
   block size"
-- Added

v1 -> v2:
- Tweak some patch descriptions
- "virtio-mem: Probe THP size to determine default block size"
-- Beautify THP detection a bit.
-- Assume THP might only get used if the memory backend page size corresponds
   to the real hostpage size.
-- Use virtio_mem_default_block_size(RAMBlock *rb) to handle selection
   of the default block size for a RAMBlock.
-- Implement virtio_mem_get_block_size() as preparation for patch #5
- "memory-device: Add get_min_alignment() callback"
-- Simplify documentation.
- "virito-mem: Implement get_min_alignment()"
-- Simplify due to changes in patch #1.

David Hildenbrand (6):
  virtio-mem: Make sure "addr" is always multiples of the block size
  virtio-mem: Make sure "usable_region_size" is always multiples of the
    block size
  virtio-mem: Probe THP size to determine default block size
  memory-device: Support big alignment requirements
  memory-device: Add get_min_alignment() callback
  virito-mem: Implement get_min_alignment()

 hw/mem/memory-device.c         |  20 ++++--
 hw/virtio/virtio-mem-pci.c     |   7 ++
 hw/virtio/virtio-mem.c         | 113 +++++++++++++++++++++++++++++++--
 include/hw/mem/memory-device.h |  10 +++
 4 files changed, 140 insertions(+), 10 deletions(-)

-- 
2.26.2


