Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055B575C51
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 09:29:19 +0200 (CEST)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCFlF-000391-Te
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 03:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCFhP-0007KB-4V
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 03:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCFhL-0000zh-FD
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 03:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657869912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YMCa4CL7CI1xcJji7VdadzNsrL92RCbX96SQDLAxJG8=;
 b=Y4zmhoIIb9sYsQyQtmn3AbPTakf6RmIBearkGXw8C9uiZOlJ3CLFYDuHXrsm856msqjemc
 PHrOjyPyb3+Lz2NhnHdazE0FAElLMt8RheddCxprZCi7aKlzZkrk883cYgM5BvIbjdOE1i
 L6UxUri1oTiCL6Bik7lbKAb2C0MKRwg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-ToqeP_YbPSCQQMWyxs9k0A-1; Fri, 15 Jul 2022 03:25:11 -0400
X-MC-Unique: ToqeP_YbPSCQQMWyxs9k0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADBF938041E4
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 07:25:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCE2A2166B26;
 Fri, 15 Jul 2022 07:25:09 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/2] vhost: Get vring base from vq, not svq
Date: Fri, 15 Jul 2022 09:25:05 +0200
Message-Id: <20220715072507.2600431-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

The SVQ vring used idx usually match with the guest visible one, as long=0D
as all the guest buffers (GPA) maps to exactly one buffer within qemu's=0D
VA. However, as we can see in virtqueue_map_desc, a single guest buffer=0D
could map to many buffers in SVQ vring.=0D
=0D
The solution is to stop using the device's used idx and check for the=0D
last avail idx. Since we cannot report in-flight descriptors with vdpa,=0D
let's rewind all of them.=0D
=0D
Also, move this rewind to the destination, so we keep migrating the in-flig=
ht=0D
ones in case the destnation backend support them (vhost-kernel, emulated vi=
rtio=0D
in qemu, etc.)=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  vhost: Get vring base from vq, not svq=0D
  vhost: Move SVQ queue rewind to the destination=0D
=0D
 hw/virtio/vhost-vdpa.c | 24 ++++++++++++------------=0D
 1 file changed, 12 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


