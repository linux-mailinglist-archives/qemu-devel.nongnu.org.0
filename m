Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C16728B0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIEPQ-0002bz-4R; Wed, 18 Jan 2023 14:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPO-0002bc-0e
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPM-0000nh-B4
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674071258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rnaFAjKWsrII/scAaq2CnmFVDzuiA390GpNjkf5D+3g=;
 b=O0gmat4L9ZTIek9xnm+12o+ZuQ8nnaQ8aNORF6Ty7c/98Jt2B5ZFvgzEE+w3Rt0kCbLR47
 JDcHDVWmGY3QODdqSGtaYjz1jRPVqCMwbWZziSKrS3wIaHXvi4En1FJBxHvOi3TifM4w2K
 1LRl9nnibIigtq5Vepe3v+SIp6OMamI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-KXbYBgb3PFOqU5McfpJVzw-1; Wed, 18 Jan 2023 14:47:35 -0500
X-MC-Unique: KXbYBgb3PFOqU5McfpJVzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A1B2380671B;
 Wed, 18 Jan 2023 19:47:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 021A8140EBF6;
 Wed, 18 Jan 2023 19:47:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [RFC 0/3] virtio-blk: add iothread-vq-mapping parameter
Date: Wed, 18 Jan 2023 14:47:29 -0500
Message-Id: <20230118194732.1258208-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

This is a preview of the iothread-vq-mapping parameter that assigns virtqueues
to IOThreads. The syntax is implemented but multiple IOThreads are not actually
supported yet. The purpose of this RFC is to reach agreement on the syntax and
to prepare for libvirt support.

virtio-blk and virtio-scsi devices will need a way to specify the
mapping between IOThreads and virtqueues. At the moment all virtqueues
are assigned to a single IOThread or the main loop. This single thread
can be a CPU bottleneck, so it is necessary to allow finer-grained
assignment to spread the load.

This series introduces command-line syntax for the new iothread-vq-mapping
property is as follows:

  --device '{"driver":"virtio-blk-pci","iothread-vq-mapping":[{"iothread":"iothread0","vqs":[0,1,2]},...]},...'

IOThreads are specified by name and virtqueues are specified by 0-based
index.

It will be common to simply assign virtqueues round-robin across a set
of IOThreads. A convenient syntax that does not require specifying
individual virtqueue indices is available:

  --device '{"driver":"virtio-blk-pci","iothread-vq-mapping":[{"iothread":"iothread0"},{"iothread":"iothread1"},...]},...'

There is no way to reassign virtqueues at runtime and I expect that to be a
very rare requirement.

Perhaps libvirt only needs to support round-robin because specifying individual
virtqueues is very specific and probably only useful for low-level performance
investigation. The libvirt domain XML syntax for this could be:

  <driver name='qemu' type='qcow2'>
    <iothreads>
      <iothread id="1"/>
      <iothread id="2"/>
      <iothread id="3"/>
    </iothreads>
    ...
  </driver>

and that would generate this QEMU command-line snippet:

  "iothread-vq-mapping":[{"iothread":"iothread1"},{"iothread":"iothread2"},{"iothread":"iothread3"}]

Note that JSON --device syntax is required for the iothread-vq-mapping
parameter because it's non-scalar.

What do you think?

Stefan Hajnoczi (3):
  qdev-properties: alias all object class properties
  qdev: add IOThreadVirtQueueMappingList property type
  virtio-blk: add iothread-vq-mapping parameter

 qapi/virtio.json                    | 30 +++++++++++
 include/hw/qdev-properties-system.h |  4 ++
 include/hw/virtio/virtio-blk.h      |  2 +
 hw/block/virtio-blk.c               | 78 +++++++++++++++++++++++++++++
 hw/core/qdev-properties-system.c    | 47 +++++++++++++++++
 hw/core/qdev-properties.c           | 18 ++++---
 6 files changed, 171 insertions(+), 8 deletions(-)

-- 
2.39.0


