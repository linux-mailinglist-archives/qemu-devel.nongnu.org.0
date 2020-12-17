Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FB2DD45A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:41:29 +0100 (CET)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvPE-0006tb-OF
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpum4-0004KX-PY
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpulv-0007p5-Tb
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608217249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ltt4iL5jFMkjpTQF3uqtEyBePOF7b/JkTnpslp6IMrk=;
 b=QrXDImn6EGHiKPVMhRrvb+2yhgLxRY9hiLGT2C6JzmyLeQfmac5WY0xhT8oT8aGBrIXLL9
 tyEYzfJQ+LkrhFQcmc2p/vN3himq2ljv9kBHa9F7OHE8sXKwpcG9IR6Pcl/EaSeTnIhSRA
 xseSQDYyMH+0SXaPWUK9ad+mUMwFmhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-08dbqh1dNimj0rVc4gK3TA-1; Thu, 17 Dec 2020 10:00:47 -0500
X-MC-Unique: 08dbqh1dNimj0rVc4gK3TA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 928B8190D340;
 Thu, 17 Dec 2020 15:00:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0F765D9D5;
 Thu, 17 Dec 2020 15:00:41 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] RFC: few random hacks to improve eventfd fallback path
Date: Thu, 17 Dec 2020 17:00:37 +0200
Message-Id: <20201217150040.906961-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These few patches are the result of a random hacking I did to make the qemu=
=0D
cope with eventfd allocation failure, when using an iothread,=0D
as it happened in bz #1897550.=0D
=0D
I am not 100% sure which patches in this series are worth to merge, or if=
=0D
this can be fixed in a better way.=0D
=0D
After this patch series applied, qemu still hangs while running reproducer =
for=0D
this BZ due to ABBA lock inversion which needs some heavy rework to get rid=
 of.=0D
I explained all the (gory) details in the bugzilla.=0D
=0D
This patch series was (lightly) tested with make check, iotests and with=0D
the reproducer.=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (3):=0D
  scsi: virtio-scsi: don't process IO on fenced dataplane=0D
  virtio-scsi: don't uninitialize queues that we didn't initialize=0D
  event_notifier: handle initialization failure better=0D
=0D
 hw/scsi/virtio-scsi-dataplane.c | 26 +++++++++++++++++++-------=0D
 include/qemu/event_notifier.h   |  1 +=0D
 util/event_notifier-posix.c     | 16 ++++++++++++++++=0D
 3 files changed, 36 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


