Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01C59A2B7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:58:23 +0200 (CEST)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5KA-0003yp-W9
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5GF-0006an-2Y
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5G2-0000Z4-8v
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D+Lxr33uovmXgPhvBPqdOuruujaJpTEd7/w6pPIAy+U=;
 b=Eoiq8XUc15QPEEVdtRwHzCtiy21NIm2Ex9QEz1ZcMYZXhGaxg/1Eu5O5HFlNmufLLu7mNK
 kCEvDYoz0kd46Qp2U6mACp6U5eVjthUskRR0nQ0ynyfjowgv371IY+aPQKn2xSOgyKL3Ev
 3lz1WPjt9RxIsP0juEmJqh3r68Zilzg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-x_b8GRZ0OAK96jfxTp3Hbg-1; Fri, 19 Aug 2022 12:54:01 -0400
X-MC-Unique: x_b8GRZ0OAK96jfxTp3Hbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEECF3801F6A
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 16:54:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F84B2026D4C;
 Fri, 19 Aug 2022 16:53:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/7] vDPA shadow virtqueue iova tree fixes.
Date: Fri, 19 Aug 2022 18:53:50 +0200
Message-Id: <20220819165357.3591965-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Eugenio P=C3=A9rez (7):=0D
  vdpa: Skip the maps not in the iova tree=0D
  vdpa: do not save failed dma maps in SVQ iova tree=0D
  util: make a copy of iova_tree_remove_parameter=0D
  vdpa: Remove SVQ vring from iova_tree at shutdown=0D
  vdpa: Make SVQ vring unmapping return void=0D
  vhost: Always store new kick fd on vhost_svq_set_svq_kick_fd=0D
  vdpa: Use ring hwaddr at vhost_vdpa_svq_unmap_ring=0D
=0D
 hw/virtio/vhost-shadow-virtqueue.c |  4 +-=0D
 hw/virtio/vhost-vdpa.c             | 70 +++++++++++++++---------------=0D
 util/iova-tree.c                   |  4 +-=0D
 3 files changed, 41 insertions(+), 37 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


