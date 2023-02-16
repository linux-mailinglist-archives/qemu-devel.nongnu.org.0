Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD469939A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSck4-0004B7-IL; Thu, 16 Feb 2023 06:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSck2-00046t-GO
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:47:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSck1-0005bW-1K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676548076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RKBmBa98oz/JAvbelrA2uoTDIWgdyA7kiBXOFr+vRp8=;
 b=MnaPm0dXnRpqn3f0BvVeEb3d+isc3Yo59WkFVt06Zk6dc1m0iSVPU1pZeVYmQT9Leou4EM
 DjXUfsXx8927H+qPyWCnR2vHXJAgD+Jh+6QKksudFdNe+hNQpcQAKueLS5vZm1uAf9bzHJ
 UNUQiaukBrtjt8mPtVCe9NA836gx+XY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-1KFeyNaFPJ6ZJYFFwN1fZA-1; Thu, 16 Feb 2023 06:47:55 -0500
X-MC-Unique: 1KFeyNaFPJ6ZJYFFwN1fZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C873A811E9C
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:47:54 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.195.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2D2140EBF6;
 Thu, 16 Feb 2023 11:47:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v1 0/2] vhost: memslot handling improvements
Date: Thu, 16 Feb 2023 12:47:50 +0100
Message-Id: <20230216114752.198627-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

David Hildenbrand (2):
  vhost: Defer filtering memory sections until building the vhost memory
    structure
  vhost: Remove vhost_backend_can_merge() callback

 hw/virtio/vhost-user.c            | 14 -----
 hw/virtio/vhost-vdpa.c            |  1 -
 hw/virtio/vhost.c                 | 85 ++++++++++++++++++++-----------
 include/hw/virtio/vhost-backend.h |  4 --
 4 files changed, 56 insertions(+), 48 deletions(-)

-- 
2.39.1


