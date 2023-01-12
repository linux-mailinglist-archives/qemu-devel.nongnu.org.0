Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72D667CCC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1Jq-0006R7-Nf; Thu, 12 Jan 2023 12:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1Jn-0006QX-8R
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1Jl-0008EO-FW
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2eVgQnytJqbJEosfGhHUCnXQYlQAfjp7LLW5DrztsQQ=;
 b=DQemzaaquLvi4nwRddKvqJlLCkagz+ZHiCAo7U7SwiII4TitJ6miW8nOaTVGgwTvsvbhtY
 zDAPVnn9kpd6vw4hieWdliA/VgSXrgJjqbpQHHmtLKD/h0m1AOLeiqPt6PCH/+rNQSc6f9
 f6hcqZHkIbRMnfTRhUXmQ85RLMwETfE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-jEXm1EPBNhCTVT3T-Jzp2A-1; Thu, 12 Jan 2023 12:24:40 -0500
X-MC-Unique: jEXm1EPBNhCTVT3T-Jzp2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01E813806721;
 Thu, 12 Jan 2023 17:24:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCA514078903;
 Thu, 12 Jan 2023 17:24:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC v2 00/13] Dinamycally switch to vhost shadow virtqueues at vdpa
 net migration
Date: Thu, 12 Jan 2023 18:24:21 +0100
Message-Id: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

It's possible to migrate vdpa net devices if they are shadowed from the=0D
start.  But to always shadow the dataplane is effectively break its host=0D
passthrough, so its not convenient in vDPA scenarios.=0D
=0D
This series enables dynamically switching to shadow mode only at=0D
migration time.  This allow full data virtqueues passthrough all the=0D
time qemu is not migrating.=0D
=0D
Successfully tested with vdpa_sim_net (but it needs some patches, I=0D
will send them soon) and qemu emulated device with vp_vdpa with=0D
some restrictions:=0D
* No CVQ.=0D
* VIRTIO_RING_F_STATE patches.=0D
* Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like=0D
  DPDK.=0D
=0D
Comments are welcome, especially in the patcheswith RFC in the message.=0D
=0D
v2:=0D
- Use a migration listener instead of a memory listener to know when=0D
  the migration starts.=0D
- Add stuff not picked with ASID patches, like enable rings after=0D
  driver_ok=0D
- Add rewinding on the migration src, not in dst=0D
- v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.html=
=0D
=0D
Eugenio P=C3=A9rez (13):=0D
  vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check=0D
  vdpa net: move iova tree creation from init to start=0D
  vdpa: copy cvq shadow_data from data vqs, not from x-svq=0D
  vdpa: rewind at get_base, not set_base=0D
  vdpa net: add migration blocker if cannot migrate cvq=0D
  vhost: delay set_vring_ready after DRIVER_OK=0D
  vdpa: delay set_vring_ready after DRIVER_OK=0D
  vdpa: Negotiate _F_SUSPEND feature=0D
  vdpa: add feature_log parameter to vhost_vdpa=0D
  vdpa net: allow VHOST_F_LOG_ALL=0D
  vdpa: add vdpa net migration state notifier=0D
  vdpa: preemptive kick at enable=0D
  vdpa: Conditionally expose _F_LOG in vhost_net devices=0D
=0D
 include/hw/virtio/vhost-backend.h |   4 +=0D
 include/hw/virtio/vhost-vdpa.h    |   1 +=0D
 hw/net/vhost_net.c                |  25 ++-=0D
 hw/virtio/vhost-vdpa.c            |  64 +++++---=0D
 hw/virtio/vhost.c                 |   3 +=0D
 net/vhost-vdpa.c                  | 247 +++++++++++++++++++++++++-----=0D
 6 files changed, 278 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


