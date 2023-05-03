Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5716F5CF4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:21:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puGAU-0006HV-FD; Wed, 03 May 2023 13:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puGAS-0006Gv-Hc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puGAQ-0004TN-T0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xS8HYYbGBok8WmX9bIxzCdu86hg5l0FRv7PPYQmXbgo=;
 b=izpKhPc6cpMeDZoJjysfyeizLSaRCUn3YXHyLLz1bC94ZqwoLnPTTcpeHaLkUvyUPlbVnb
 icZIRUp2lvxfWkYhRqkQid8pAR+3suyccm73Ny2FVUJHeVNUAat0oAUOjpQLpdGdcfVHAz
 mgAx9DdlJSEL+0PRXFxHX4pJdemff/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-rquvulMnONaqLYJZJGPvTw-1; Wed, 03 May 2023 13:21:25 -0400
X-MC-Unique: rquvulMnONaqLYJZJGPvTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFE0E884344;
 Wed,  3 May 2023 17:21:24 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFD3AC15BAD;
 Wed,  3 May 2023 17:21:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/3] vhost: memslot handling improvements
Date: Wed,  3 May 2023 19:21:18 +0200
Message-Id: <20230503172121.733642-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>

v2 -> v3:
- Add ACKs
- "softmmu/physmem: Fixup qemu_ram_block_from_host() documentation"
-- Fix typo in description

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
2.40.0


