Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDA6065EE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:37:21 +0200 (CEST)
Received: from localhost ([::1]:46584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYXi-0005VP-GN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:37:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYAh-0001uT-UW
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olXrS-0006Q0-Iw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olXrC-00065J-Bl
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666281194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xePMAbB6TuUMKDZBvP5YKkyZHr0BKWOTXCcOOq0zH+g=;
 b=FhbUuVYq7MYhuFhGUshTjnitwcjZWIYKY6QhaDu1pKagZ6oofcXVdkrLn/gVFK5jz52Le7
 mfwpVQkk7V03O2YhQm4Jx6lVuxCrhkdP3BH/WlfY9iR+klk+ExpJRqAQhKItxp3lOqRYxF
 QEOhh/2VBY65B6g+vjfguR4s38pDCLU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214--m6FXL6eNMe8geXhiZ4hHQ-1; Thu, 20 Oct 2022 11:53:11 -0400
X-MC-Unique: -m6FXL6eNMe8geXhiZ4hHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB36A1C08976;
 Thu, 20 Oct 2022 15:53:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DBA240CA41E;
 Thu, 20 Oct 2022 15:52:57 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
Subject: [PATCH 0/4] Shadow VirtQueue event index support
Date: Thu, 20 Oct 2022 17:52:47 +0200
Message-Id: <20221020155251.398735-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Event idx helps to reduce the number of notifications between the device=0D
and the driver. It allows them to specify an index on the circular=0D
descriptors rings where to issue the notification, instead of a single=0D
binary indicator.=0D
=0D
Adding support for SVQ.=0D
=0D
These patches are sent on top of [1] series, so trivial conflicts could ari=
se=0D
if it is applied directly on master. Future versions can be not based on=0D
it is more convenient.=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03280.html=
=0D
=0D
Eugenio P=C3=A9rez (4):=0D
  vhost: allocate event_idx fields on vring=0D
  vhost: toggle device callbacks using used event idx=0D
  vhost: use avail event idx on vhost_svq_kick=0D
  vhost: Accept event idx flag=0D
=0D
 hw/virtio/vhost-shadow-virtqueue.c | 39 ++++++++++++++++++++++++------=0D
 1 file changed, 31 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


