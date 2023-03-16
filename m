Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39006BD3FE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:38:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpfV-0006lL-1R; Thu, 16 Mar 2023 11:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcpfN-0006kJ-6I
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcpfK-0005jX-PK
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678981033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6fOvcCIGyuwF+q73UO4mi5McSmHVa7JUvhH2dMP2j+s=;
 b=WkjgZtxnpf6sVVxd7LXRurU33t6TO7+R54Pf/5TD5vET/JreeM0gMA/EbxnEN9AjBU6u5h
 s314Rd35ca4+UQZ8xCBQc4LL1R+yW2qkwY4Y/aeMZi3mZUK9qzaDZwyL1ZEtXmtooBSynv
 TNMB8ZmKsr5EN97hcAKsbanlWMlN3h4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-wAgT8nb6P0igvN7KvMl7Mg-1; Thu, 16 Mar 2023 11:37:11 -0400
X-MC-Unique: wAgT8nb6P0igvN7KvMl7Mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C5163C20EF8
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 15:37:00 +0000 (UTC)
Received: from t480s.in.tum.de (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E6E35453;
 Thu, 16 Mar 2023 15:36:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 0/3] vhost: memslot handling improvements
Date: Thu, 16 Mar 2023 16:36:55 +0100
Message-Id: <20230316153658.214487-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following up on my previous work to make virtio-mem consume multiple
memslots dynamically [1] that requires precise accounting between used vs.
reserved memslots, I realized that vhost makes this extra hard by
filtering out some memory region sections (so they don't consume a
memslot) in the vhost-user case, which messes up the whole memslot
accounting.

This series fixes what I found to be broken and prepares for more work on
[1]. Further, it cleanes up the merge checks that I consider unnecessary.

[1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>

v1 -> v2:
- "vhost: Rework memslot filtering and fix "used_memslot" tracking"
-- New approach: keep filtering, but make filtering less generic and
   track separately. This should keep any existing setups working.
- "softmmu/physmem: Fixup qemu_ram_block_from_host() documentation"
-- As requested by Igor

David Hildenbrand (3):
  vhost: Rework memslot filtering and fix "used_memslot" tracking
  vhost: Remove vhost_backend_can_merge() callback
  softmmu/physmem: Fixup qemu_ram_block_from_host() documentation

 hw/virtio/vhost-user.c            | 21 ++---------
 hw/virtio/vhost-vdpa.c            |  1 -
 hw/virtio/vhost.c                 | 62 ++++++++++++++++++++++++-------
 include/exec/cpu-common.h         | 15 ++++++++
 include/hw/virtio/vhost-backend.h |  9 +----
 softmmu/physmem.c                 | 17 ---------
 6 files changed, 68 insertions(+), 57 deletions(-)

-- 
2.39.2


