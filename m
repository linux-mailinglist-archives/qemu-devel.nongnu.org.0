Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48386525527
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:51:59 +0200 (CEST)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDuo-0005MO-Bk
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4b-0000J2-5n
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4Z-0001hJ-KU
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uZOqlhaI/JSx/LtMSKylrFxm/Dotc7VR1fmorvE0q1Y=;
 b=A3gKfYNqAvQ/c5NyQDQJmqQDVbrAaM/PddV1zuyZGm8CxL5pU+IgTA3Hxb8RopECxv8iLF
 U86aKR6g1UXjFWFCxn/vbSaRRR4fMoXiuxdXqkhjH1xOByRLXbo3vS104axhiEsjzPkC5d
 JdvBy5/Y30575Fr5AWXHdf0Eulj4bnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-BvwhVuiyMZytx-5BMY-A6g-1; Thu, 12 May 2022 13:57:54 -0400
X-MC-Unique: BvwhVuiyMZytx-5BMY-A6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4DE68039D7;
 Thu, 12 May 2022 17:57:51 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A296543E3A0;
 Thu, 12 May 2022 17:57:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH 0/6] Shadow VirtQueue Fixes
Date: Thu, 12 May 2022 19:57:41 +0200
Message-Id: <20220512175747.142058-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Random fixes found while developing control virtqueue + multiqueue but the =
last=0D
one, found by coverity. The previous one is a patch created by Philippe=0D
Mathieu-Daud=C3=A9 <f4bug@amsat.org>, send as a RFC in another series but a=
lready=0D
acked.=0D
=0D
All but Philippe's ones are bugs non-triggable, since there is still no=0D
possibility to enable SVQ unless we manually add code to master.=0D
=0D
Comments are welcome.=0D
=0D
Eugenio P=C3=A9rez (5):=0D
  vhost: Track descriptor chain in private at SVQ=0D
  vhost: Fix device's used descriptor dequeue=0D
  vdpa: Fix bad index calculus at vhost_vdpa_get_vring_base=0D
  vdpa: Fix index calculus at vhost_vdpa_svqs_start=0D
  vhost: Fix element in vhost_svq_add failure=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/virtio: Replace g_memdup() by g_memdup2()=0D
=0D
 hw/virtio/vhost-shadow-virtqueue.h |  6 +++++=0D
 hw/net/virtio-net.c                |  3 ++-=0D
 hw/virtio/vhost-shadow-virtqueue.c | 35 +++++++++++++++++++++++++-----=0D
 hw/virtio/vhost-vdpa.c             |  6 ++---=0D
 hw/virtio/virtio-crypto.c          |  6 ++---=0D
 5 files changed, 43 insertions(+), 13 deletions(-)=0D
=0D
--=0D
2.27.0=0D
=0D


