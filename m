Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8C45D818
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:18:37 +0100 (CET)
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBps-0002O9-6D
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mqBo0-0000W9-LU
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mqBno-0000SY-A8
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637835385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JqGpDUOtCBmVP3DZmadrFNpM6A4drV6H0kNtP7vtk3Y=;
 b=Ia7JXBNl59AmmlpG+Uu5VjHMW6+ZatCNZkYn4aB+dbx9SKqugLunkp3S4u4r9TVOfIu1YP
 tyeGctgWTZPaM76Dk2R42W8M9VvVZSJ0637kFjv/jDNDEH7gN8Zb5iPkPgaHK5OFQitBQN
 cHZKiUIU503Cm/L9yUhliyKnda1mLDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-kq-0PVSKPAGD0qvU0U96tQ-1; Thu, 25 Nov 2021 05:16:23 -0500
X-MC-Unique: kq-0PVSKPAGD0qvU0U96tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC9451006AA1;
 Thu, 25 Nov 2021 10:16:22 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9274B7E205;
 Thu, 25 Nov 2021 10:16:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] vdpa: Fix SIGSEGV on failed vdpa devices
Date: Thu, 25 Nov 2021 11:16:12 +0100
Message-Id: <20211125101614.76927-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
v2:=0D
* Replace dummy receive_{iov,raw} with receive callback.=0D
* Delete fix indentation commit, we don't touch that code anymore.=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  vdpa: Add dummy receive callback=0D
  virtio-net: Fix log message=0D
=0D
 hw/net/virtio-net.c | 11 ++++++-----=0D
 net/vhost-vdpa.c    |  8 ++++++++=0D
 2 files changed, 14 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


