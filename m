Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41659EAE7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:25:17 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYaS-0002OR-LR
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVu-0005HV-9e
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVd-00032O-KR
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661278815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wDIne3QrrEPPF9xQvjiXHvclZ5yld+a4jUVui45i1dI=;
 b=RUefIsR+wY7jZkalX0D4RCNSD2rFac470d+48JJkDKohVooLjSAqKQUwmJhVKahUORn4G1
 EK+5bdJ56hkoqXS2ro4SRe0Aszzbi2eEnqaLHSJJxgmnR5zYaUmfFvP0BkS/EuKFOnS+7m
 +y/EO2iK1WZbJUhkBe4l7BHt8naZ/ao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-QzA7mHuQPzGAU0e8lt4Z7A-1; Tue, 23 Aug 2022 14:20:12 -0400
X-MC-Unique: QzA7mHuQPzGAU0e8lt4Z7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 591628041BE;
 Tue, 23 Aug 2022 18:20:12 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ABC740D2830;
 Tue, 23 Aug 2022 18:20:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 0/7] vDPA shadow virtqueue iova tree fixes.
Date: Tue, 23 Aug 2022 20:20:01 +0200
Message-Id: <20220823182008.97141-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Collection of iova tree fixes detected preparing live migration with real=0D
devices and multiqueue.=0D
=0D
These cannot be triggered in simple setups (vdpa_sim_net, no display, no=0D
device reset with different features) but it's possible to trigger them wit=
h=0D
real devices or if the kernel fails some step like memory mapping / unmappi=
ng.=0D
=0D
First two patches are already in the list at [1]. Last one is not a fix by=
=0D
itself but a straightforward merge of the same code.=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00773.html=
=0D
=0D
v2:=0D
* Accept iova_tree_remove map arg by value=0D
* Add error message on unmap fail=0D
=0D
Eugenio P=C3=A9rez (7):=0D
  vdpa: Skip the maps not in the iova tree=0D
  vdpa: do not save failed dma maps in SVQ iova tree=0D
  util: accept iova_tree_remove_parameter by value=0D
  vdpa: Remove SVQ vring from iova_tree at shutdown=0D
  vdpa: Make SVQ vring unmapping return void=0D
  vhost: Always store new kick fd on vhost_svq_set_svq_kick_fd=0D
  vdpa: Use ring hwaddr at vhost_vdpa_svq_unmap_ring=0D
=0D
 hw/virtio/vhost-iova-tree.h        |  2 +-=0D
 include/qemu/iova-tree.h           |  2 +-=0D
 hw/i386/intel_iommu.c              |  6 +--=0D
 hw/virtio/vhost-iova-tree.c        |  2 +-=0D
 hw/virtio/vhost-shadow-virtqueue.c |  4 +-=0D
 hw/virtio/vhost-vdpa.c             | 75 ++++++++++++++++--------------=0D
 net/vhost-vdpa.c                   |  4 +-=0D
 util/iova-tree.c                   |  4 +-=0D
 8 files changed, 51 insertions(+), 48 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


