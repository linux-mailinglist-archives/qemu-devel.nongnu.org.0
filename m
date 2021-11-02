Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB570442DEE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:30:23 +0100 (CET)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsvm-0002vA-Fw
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhsAF-0007wt-NR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhsAD-0007KL-Ry
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=udlsoGDbPe8E7SPYh/utZ6LHnxhS4TjNBVPHfD2wtw4=;
 b=PbYTjV2GFA67BATXkDuXBYl6BJTq8nKJNnxq9pQ+Ou/7UAdzMZDXSV6bW/TEFW+QD8ZYim
 dBi45LhncjFK5J+ntmrtMaH+ADX6TJfElXWtDPtp3yepg9jNknm8yi9Jo8H9HDsbarRwgo
 svCiehKeZLXD93GjWuplNbQHRDuOQjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-uDgjkZF3O_Kb0F4G1m6ukw-1; Tue, 02 Nov 2021 07:41:12 -0400
X-MC-Unique: uDgjkZF3O_Kb0F4G1m6ukw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293B25074B
 for <qemu-devel@nongnu.org>; Tue,  2 Nov 2021 11:41:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4C4C5F4EF;
 Tue,  2 Nov 2021 11:41:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] vhost: Fix last queue index of devices with no cvq
Date: Tue,  2 Nov 2021 12:40:58 +0100
Message-Id: <20211102114059.1917341-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -1 assumes that all devices with no cvq have an spare vq allocated=0D
for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This is an invalid=0D
device by the standard, so just stick to the right number of device=0D
models.=0D
=0D
This is not a problem to vhost-net, but it is to vhost-vdpa, which=0D
device model trust to reach the last index to finish starting the=0D
device.=0D
=0D
Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff.=0D
=0D
v2:=0D
* Delete all the conditional code instead of ROUND_DOWN in a=0D
  deinitely too-bit-tricky way.=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  vhost: Fix last queue index of devices with no cvq=0D
=0D
 hw/net/vhost_net.c | 4 ----=0D
 1 file changed, 4 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


