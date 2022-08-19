Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4F59A2EE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:34:58 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5tZ-0000Mp-CV
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z1-00014w-2H
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Yx-0003Qv-WF
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660929219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wgqTWh15Iao6f1EeoxBpNDGHySQ4xn3QU69ayPbvf2s=;
 b=a0hAZEGWSKWeDTdh5SeAJQO6A6Nq/WKLhUxGKJqL0cDkSTkTPK43fZQySGMgoRYCiXNiy0
 Dus+Smik6OSfCv+P3oSgFRNy9/hMI3sdq8xqWM+++15x58y+vf8u/FgghqoaCEf+KHL/Hu
 O2p0j2fvTs6MqaX4hrM1tyncgtUHd3A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-6kquhzm4N0inRMIN4FgARw-1; Fri, 19 Aug 2022 13:13:36 -0400
X-MC-Unique: 6kquhzm4N0inRMIN4FgARw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3939A101A586;
 Fri, 19 Aug 2022 17:13:35 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7728840CF8EE;
 Fri, 19 Aug 2022 17:13:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 0/5] Vhost-vdpa Shadow Virtqueue multiqueue support.
Date: Fri, 19 Aug 2022 19:13:24 +0200
Message-Id: <20220819171329.3597027-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

This series enables shadowed CVQ to intercept multiqueue commands through=0D
shadowed CVQ, update the virtio NIC device model so qemu send it in a=0D
migration, and the restore of that MQ state in the destination.=0D
=0D
It needs to be applied on top of [1].=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02965.html=0D
=0D
Eugenio P=C3=A9rez (5):=0D
  vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load=0D
  vdpa: Add vhost_vdpa_net_load_mq=0D
  vdpa: validate MQ CVQ commands=0D
  virtio-net: Update virtio-net curr_queue_pairs in vdpa backends=0D
  vdpa: Allow MQ feture in SVQ=0D
=0D
 hw/net/virtio-net.c | 17 ++++------=0D
 net/vhost-vdpa.c    | 82 +++++++++++++++++++++++++++++++++++++--------=0D
 2 files changed, 74 insertions(+), 25 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


