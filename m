Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C9257B9C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 17:05:00 +0200 (CEST)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kClMh-0001wr-7X
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 11:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kClJS-00069l-3R
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 11:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kClJP-0004Tt-6t
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 11:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598886093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RJRT4zHeLM58IQVPnpfioQsjElJ0yxpdl4WV4GBXRK8=;
 b=aVyeELYjFDv0xPTDUezewVkP3bUHjgRcMDtr3DGUuJR7cqyuw+NO0QZ+bSQjanck9LvriC
 ZPIHRGQ72L+i3T3+F+wWylT5aHuvM8XJWFjCRX4sRmCnCrtw5Uc0hG3QfB/r9at6fiLyaq
 Hvhjxa3sgzrTMSm7CWQHtGyStmIiCOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-ti5QzDIzPgym0fOGj2x3PA-1; Mon, 31 Aug 2020 11:01:31 -0400
X-MC-Unique: ti5QzDIzPgym0fOGj2x3PA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F2D118A2242;
 Mon, 31 Aug 2020 15:01:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729BE19C4F;
 Mon, 31 Aug 2020 15:01:25 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/9] Fix scsi devices plug/unplug races w.r.t virtio-scsi
 iothread
Date: Mon, 31 Aug 2020 18:01:15 +0300
Message-Id: <20200831150124.206267-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!=0D
=0D
This is a patch series that is a result of my discussion with Paulo on=0D
how to correctly fix the root cause of the BZ #1812399.=0D
=0D
The root cause of this bug is the fact that IO thread is running mostly=0D
unlocked versus main thread on which device hotplug is done.=0D
=0D
qdev_device_add first creates the device object, then places it on the bus,=
=0D
and only then realizes it.=0D
=0D
However some drivers and currently only virtio-scsi enumerate its child bus=
=0D
devices on each request that is received from the guest and that can happen=
 on the IO=0D
thread.=0D
=0D
Thus we have a window when new device is on the bus but not realized and ca=
n be accessed=0D
by the virtio-scsi driver in that state.=0D
=0D
Fix that by doing two things:=0D
=0D
1. Add partial RCU protection to the list of a bus's child devices.=0D
This allows the scsi IO thread to safely enumerate the child devices=0D
while it races with the hotplug placing the device on the bus.=0D
=0D
2. Let scsi_device_find not return devices that are on the bus but not real=
ized=0D
=0D
Note that in the particular bug report the issue wasn't a race but rather d=
ue=0D
to combination of things, the .realize code in the middle managed to trigge=
r IO on the virtqueue=0D
which caused the virtio-scsi driver to access the half realized device. How=
ever=0D
since this can happen as well with real IO thread, this patch series was do=
ne,=0D
which fixes this as well.=0D
=0D
Changes from V3:=0D
=0D
* Rebased to latest qemu=0D
=0D
* Added a new patch to fix related race in scsi_target_emulate_report_luns=
=0D
=0D
* Moved the non-realized device check to scsi core, since there is no=0D
  way a device driver will want to see non realized devices on a scsi bus.=
=0D
  (scsi-bus still needs this and can using an internal function)=0D
=0D
* Splitted patch that added drain_rcu and used it, to patch that only adds =
it, and one=0D
  that uses it (no other changes so I kept Reviewed-by)=0D
=0D
*Some tweaks to commits=0D
=0D
This series was tested by adding a virtio-scsi drive with iothread,=0D
then running fio stress job in the guest in a loop, and then adding/removin=
g=0D
the scsi drive on the host in the loop.=0D
This test was failing usually on 1st iteration withouth this patch series,=
=0D
and now it seems to work smoothly.=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (9):=0D
  scsi/scsi_bus: switch search direction in scsi_device_find=0D
  rcu: Implement drain_call_rcu=0D
  device_core: use drain_call_rcu in in hmp_device_del/qmp_device_add=0D
  device-core: use RCU for list of childs of a bus=0D
  device-core: use atomic_set on .realized property=0D
  scsi/scsi-bus: scsi_device_find: don't return unrealized devices=0D
  scsi/scsi_bus: Add scsi_device_get=0D
  virtio-scsi: use scsi_device_get=0D
  scsi/scsi_bus: fix races in REPORT LUNS=0D
=0D
 hw/core/bus.c          |  28 +++++---=0D
 hw/core/qdev.c         |  56 +++++++++++----=0D
 hw/scsi/scsi-bus.c     | 151 ++++++++++++++++++++++++++---------------=0D
 hw/scsi/virtio-scsi.c  |  27 +++++---=0D
 include/hw/qdev-core.h |  11 +++=0D
 include/hw/scsi/scsi.h |   1 +=0D
 include/qemu/rcu.h     |   1 +=0D
 qdev-monitor.c         |  22 ++++++=0D
 util/rcu.c             |  55 +++++++++++++++=0D
 9 files changed, 265 insertions(+), 87 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


