Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05832832F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:14:16 +0100 (CET)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlBX-0002FW-Op
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lGl9Q-0001Jn-IS
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lGl9O-0003IM-WE
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614615122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mhcC3iMZm80eGpkVvNMZIm69/jqpnpuKyF7oL2vWKOk=;
 b=DLguZLS6oMWcb/W9ps3gUte9dsiWN3vCBIhdcPKuak3Kb0cn3/WqClRr1Xyu4BXETq0U7b
 m7oQcyVai5Zu0JebKL7rKK+GUx+Ih5ssqBLFinYkHu1nqtzIRghnKpuLWGeQV79+3GnN+9
 gVrfGGiCHly9dkHnuthe7+u8SLP+DJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-vzBVHwQFOnWz7RLZnqR86A-1; Mon, 01 Mar 2021 11:11:58 -0500
X-MC-Unique: vzBVHwQFOnWz7RLZnqR86A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EEC080196C;
 Mon,  1 Mar 2021 16:11:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 536D619C45;
 Mon,  1 Mar 2021 16:11:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] softmmu/memory_mapping: optimize dump/tpm for
 virtio-mem
Date: Mon,  1 Mar 2021 17:11:32 +0100
Message-Id: <20210301161137.78941-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

Based-on: 20210224094910.44986-1-david@redhat.com

v1 -> v2:
- "softmmu/memory_mapping: factor out adding physical memory ranges"
-- Simplify based on RamDiscardManager changes: add using a
   MemoryRegionSection
- "softmmu/memory_mapping: optimize for RamDiscardManager sections"
-- Simplify based on RamDiscardManager changes

David Hildenbrand (5):
  tpm: mark correct memory region range dirty when clearing RAM
  softmmu/memory_mapping: reuse qemu_get_guest_simple_memory_mapping()
  softmmu/memory_mapping: never merge ranges accross memory regions
  softmmu/memory_mapping: factor out adding physical memory ranges
  softmmu/memory_mapping: optimize for RamDiscardManager sections

 hw/tpm/tpm_ppi.c         |  4 ++-
 softmmu/memory_mapping.c | 72 ++++++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 30 deletions(-)

-- 
2.29.2


