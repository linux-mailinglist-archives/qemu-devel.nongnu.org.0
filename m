Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EF5891CF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:54:13 +0200 (CEST)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIZQ-0004Ot-Kt
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJII4-0001b7-M1
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJIHy-0000Cq-HI
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659548170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w/vPDFe0PPvw3+IyxYb8aa8oj3r8jaBAms5hzVlHlKE=;
 b=Sj76cACa4sC/0jzfEXj0/+krMOyIqr9hPTKipyVikm76/nm0zBc00ucJVpaCJtxIYjCWLU
 KQcN22kht1ivcQX4dOxIy92ykynBInpyueT16hsszdvIzBC/Rf97HLT4BZA8juaX1/GzLT
 1bJZSa373B3/lXWsy0mfjLpNiCdzAy8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-e08pO71EMrevqVDTgpOKKw-1; Wed, 03 Aug 2022 13:36:08 -0400
X-MC-Unique: e08pO71EMrevqVDTgpOKKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 786258037B3;
 Wed,  3 Aug 2022 17:36:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2C3840C1288;
 Wed,  3 Aug 2022 17:36:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Amit Shah <amit@kernel.org>,
 Laurent Vivier <lvivier@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 0/2] virtio: remove unnecessary host_features in
 ->get_features()
Date: Wed,  3 Aug 2022 13:36:04 -0400
Message-Id: <20220803173606.965926-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

v2:
- Document vdv->get_features() callback [Cornelia]

The vdc->get_features() callbacks are a little inconsistent in how they use
vdev->host_features. This is because the function's behavior changed over time.
Clean things up.

Stefan Hajnoczi (2):
  virtio: document vdc->get_features() callback
  virtio: remove unnecessary host_features in ->get_features()

 include/hw/virtio/virtio.h  | 20 ++++++++++++++++++++
 hw/block/virtio-blk.c       |  3 ---
 hw/char/virtio-serial-bus.c |  1 -
 hw/net/virtio-net.c         |  3 ---
 hw/scsi/vhost-scsi-common.c |  3 ---
 hw/scsi/virtio-scsi.c       |  4 ----
 hw/virtio/virtio-balloon.c  |  2 --
 7 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.37.1


