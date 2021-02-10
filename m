Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603F316D16
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:44:39 +0100 (CET)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tXa-0006nN-Kg
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t5y-000365-99
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t5t-0001Wr-E0
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612977360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=keap8Kx+LA0eqQv21Wh/s8LXVtj1f2ySJ6wjBQ7NTHg=;
 b=Oc9oVwmlacVwvZOhuzy/DM6n+umO2DaIeaPNVxtnnU7DV79tAsIk1eKSK8soPcVVBxyV45
 NMrCHtPRzJiH7d+ailtd6w6LrUJg8cG6ZMHGnZx8mjSwrUX3k2wh6cs6vEOeKuIBLU+ZNb
 ep+wab3AOnS/7qdiKdzLvyXt4MURpbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-v_deq233Nrie7hx9fuf_Cg-1; Wed, 10 Feb 2021 12:15:56 -0500
X-MC-Unique: v_deq233Nrie7hx9fuf_Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 533B780196E;
 Wed, 10 Feb 2021 17:15:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-218.ams2.redhat.com [10.36.113.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F284660657;
 Wed, 10 Feb 2021 17:15:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/5] softmmu/memory_mapping: optimize dump/tpm for
 virtio-mem
Date: Wed, 10 Feb 2021 18:15:32 +0100
Message-Id: <20210210171537.32932-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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

Based-on: https://lkml.kernel.org/r/20210121110540.33704-1-david@redhat.com

David Hildenbrand (5):
  tpm: mark correct memory region range dirty when clearing RAM
  softmmu/memory_mapping: reuse qemu_get_guest_simple_memory_mapping()
  softmmu/memory_mapping: never merge ranges accross memory regions
  softmmu/memory_mapping: factor out adding physical memory ranges
  softmmu/memory_mapping: optimize for RamDiscardMgr sections

 hw/tpm/tpm_ppi.c         |   4 +-
 softmmu/memory_mapping.c | 118 +++++++++++++++++++++++++++------------
 2 files changed, 84 insertions(+), 38 deletions(-)

-- 
2.29.2


