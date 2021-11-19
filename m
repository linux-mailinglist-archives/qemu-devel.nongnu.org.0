Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AE456D2E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:23:15 +0100 (CET)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo133-0005S3-MG
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mo10m-0003Yb-6y
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mo10j-0006kW-Tf
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637317249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GPYfCNIRXxwxh+bgkS98AicfYBv9yDlVsIV7ucYtS2A=;
 b=aPCjfus0cRcK0gF0hjWRM/hd46sE5ft1OjJfnWWPrD2Vl1jXZmzkPBjDJAzyy4r1+pXmB0
 Up40dhWJyZ+mgO9dWBndQk1s31crX1cLhbK1U7P7UhZLa3SUnbvj3qGX1/ivvhkLgoXxcP
 L1GAaf/OG0beYFX/i0D7++CVPPIc9Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-LSy7Gh1FPo2ECBkHnLAFvQ-1; Fri, 19 Nov 2021 05:20:46 -0500
X-MC-Unique: LSy7Gh1FPo2ECBkHnLAFvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D22B9F92A;
 Fri, 19 Nov 2021 10:20:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50B915C1A1;
 Fri, 19 Nov 2021 10:20:38 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vdpa: Fix SIGSEGV on failed vdpa devices
Date: Fri, 19 Nov 2021 11:20:30 +0100
Message-Id: <20211119102033.36149-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu falls back on userland handlers even if vhost-user and vhost-vdpa=0D
cases. These assumes a tap device can handle the packets.=0D
=0D
If a vdpa device fail to start, it can trigger a sigsegv because of=0D
that. Add dummy receivers that return no progress so it can keep=0D
running.=0D
=0D
Tested with a modified version of vp_vdpa to fail negotiation.=0D
=0D
This is another bersion of the patch proposed in [1], but the subject=0D
didn't match the patch anymore.=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg03719.html=
=0D
=0D
Eugenio P=C3=A9rez (3):=0D
  virtio-net: Fix indentation=0D
  vdpa: Add dummy receive callbacks=0D
  virtio-net: Fix log message=0D
=0D
 hw/net/virtio-net.c | 13 +++++++------=0D
 net/vhost-vdpa.c    | 16 ++++++++++++++++=0D
 2 files changed, 23 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


