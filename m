Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA083D6044
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:06:35 +0200 (CEST)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m837i-00064z-9D
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m835f-0001wY-0v
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m835b-0001yD-Tf
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627315462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CzkMjeISLoni3Sf0vMbk2oEEGiGN9XSJbtFiZ8FpKa0=;
 b=FpyaH6mESIuPU1j4SyuNJihIjAftTYwvmNajtvcuKsFkp1T7mt8ATsM3hZ8qUAoj5+zqP7
 6GN2lTnerDFw353BMEqCCAuIrVe/jKh0ZJB7WfIT95FdGgoxnucrhLOPhVbabm7mDq+6HX
 SOYSl12j3q86Pg2WAqIfX7G9zlJYN9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-EQSqtDr0N5yS9C2DiYO80g-1; Mon, 26 Jul 2021 12:04:21 -0400
X-MC-Unique: EQSqtDr0N5yS9C2DiYO80g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A7C87498F;
 Mon, 26 Jul 2021 16:04:19 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-199.ams2.redhat.com [10.36.112.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DCD15C1D1;
 Mon, 26 Jul 2021 16:03:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] softmmu/memory_mapping: optimize dump/tpm for
 virtio-mem
Date: Mon, 26 Jul 2021 18:03:42 +0200
Message-Id: <20210726160346.109915-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor fixes and cleanups, followed by an optimization for virtio-mem
regarding guest dumps and tpm.

virtio-mem logically plugs/unplugs memory within a sparse memory region
and notifies via the RamDiscardMgr interface when parts become
plugged (populated) or unplugged (discarded).

Currently, guest_phys_blocks_append() appends the whole (sparse)
virtio-mem managed region and therefore tpm code might zero the hole
region and dump code will dump the whole region. Let's only add logically
plugged (populated) parts of that region, skipping over logically
unplugged (discarded) parts by reusing the RamDiscardMgr infrastructure
introduced to handle virtio-mem + VFIO properly.

v2 -> v4:
- "tpm: mark correct memory region range dirty when clearing RAM"
-- Fix calculation of offset into memory region (thanks Peter!)
- "softmmu/memory_mapping: reuse qemu_get_guest_simple_memory_mapping()"
-- Dropped

v1 -> v2:
- "softmmu/memory_mapping: factor out adding physical memory ranges"
-- Simplify based on RamDiscardManager changes: add using a
   MemoryRegionSection
- "softmmu/memory_mapping: optimize for RamDiscardManager sections"
-- Simplify based on RamDiscardManager changes

David Hildenbrand (4):
  tpm: mark correct memory region range dirty when clearing RAM
  softmmu/memory_mapping: never merge ranges accross memory regions
  softmmu/memory_mapping: factor out adding physical memory ranges
  softmmu/memory_mapping: optimize for RamDiscardManager sections

 hw/tpm/tpm_ppi.c         |  5 +++-
 softmmu/memory_mapping.c | 64 ++++++++++++++++++++++++++--------------
 2 files changed, 46 insertions(+), 23 deletions(-)

-- 
2.31.1


