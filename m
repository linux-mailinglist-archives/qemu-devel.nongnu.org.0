Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36214589EFE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:57:33 +0200 (CEST)
Received: from localhost ([::1]:37806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdE3-0005gq-Vr
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJdBb-0002pA-T4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJdBZ-0003Yp-VT
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659628496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+nxG0nVD1KmmPXpt/Orl6VooOSUh2kfSsIh8tYcorks=;
 b=TvUgvI2kFwzJYmSKt6nWCW549lJSJzIP8DGxezVSnIYjUN6qXiTVPvyh9tut+yC17PDjl0
 bVtohJnZlXjIFRn7cV+w33nhobouNtePMEnJPxcJbjpdmOjRdd93dfXlhZ6AtA2T4UDRRN
 /e9TYdhcC5FtMExkRyeEwUN43XiSYLI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-iTFqSz_LM-2FaxISFBa48A-1; Thu, 04 Aug 2022 11:54:47 -0400
X-MC-Unique: iTFqSz_LM-2FaxISFBa48A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8EBC8026BA
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 15:54:46 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B680A909FF;
 Thu,  4 Aug 2022 15:54:45 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 0/2] vdpa: do not save failed dma maps in SVQ iova tree
Date: Thu,  4 Aug 2022 17:54:41 +0200
Message-Id: <20220804155443.671136-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

If a map fails for whatever reason, it must not be saved in the tree.=0D
Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.=0D
=0D
v2: Do not dereference failed maps=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  vdpa: Skip the maps not in the iova tree=0D
  vdpa: do not save failed dma maps in SVQ iova tree=0D
=0D
 hw/virtio/vhost-vdpa.c | 24 +++++++++++++++++-------=0D
 1 file changed, 17 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


