Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01BB6328A9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox94Q-0000Y9-Ak; Mon, 21 Nov 2022 10:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox945-0000NQ-1S
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:50:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox943-0002WN-NK
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669045831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iV9ZKJXyz5J5Y2N6AknIers0rczbYyUiUiSpvE7LHXs=;
 b=gVjDsT8rPSqhE3p8PxRzWCXXEASw8zQJSqiiW+uuuAgjvXcS46n/wvS0Erld8EtSaMXZvs
 eTW6ajoEV6U/0Z6lzQQi4t5Ld7bufDshjggtpu9EVlarmVR1T7KNHG25AiUephZN6oF8mc
 h2frpC996SFx8eVSfGrLflTCaQYguEU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-36unsiSVNHS_aIllrGPEjA-1; Mon, 21 Nov 2022 10:50:27 -0500
X-MC-Unique: 36unsiSVNHS_aIllrGPEjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2619B3C10696;
 Mon, 21 Nov 2022 15:50:26 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65E714A9255;
 Mon, 21 Nov 2022 15:50:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PATCH RESEND v3 0/2] virtio: remove unnecessary host_features in
 ->get_features()
Date: Mon, 21 Nov 2022 10:50:18 -0500
Message-Id: <20221121155020.1915166-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v3 (resend):
- On top of master instead of the qemu.git/staging tree :)
v3:
- Use an informal comment instead of a full doc comment [Cornelia]
v2:
- Document vdv->get_features() callback [Cornelia]

The vdc->get_features() callbacks are a little inconsistent in how they use
vdev->host_features. This is because the function's behavior changed over time.
Clean things up.

Stefan Hajnoczi (2):
  virtio: document ->host_features usage in vdc->get_features() callback
  virtio: remove unnecessary host_features in ->get_features()

 include/hw/virtio/virtio.h  | 7 +++++++
 hw/block/virtio-blk.c       | 3 ---
 hw/char/virtio-serial-bus.c | 1 -
 hw/net/virtio-net.c         | 3 ---
 hw/scsi/vhost-scsi-common.c | 3 ---
 hw/scsi/virtio-scsi.c       | 4 ----
 hw/virtio/virtio-balloon.c  | 2 --
 7 files changed, 7 insertions(+), 16 deletions(-)

-- 
2.38.1


