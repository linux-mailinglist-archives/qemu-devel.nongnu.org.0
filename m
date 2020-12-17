Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C22DD5A9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:06:07 +0100 (CET)
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwj8-0000FG-OL
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwa3-00038i-JG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:56:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwZl-0002xE-II
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608224184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EJT+jvN8WcyUSOUlK9CUxOuH5Ft7XrNhFPmabbHA27A=;
 b=OjzUdSnrgrv1eWMtAzyt8RPv5wB4m/CJeWnfMgNFlH9wdyb9gi6m6r1Y9TdS8c25oMCIcE
 ku/20HgtClipfZfO6lin6fQDF/BhWQlrK41c7sLHy9dB0GaQaSfAepAoWJeokG+r3mwa78
 vjVQr/bl90Pse0AaEsoa/NVvT3I9vxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-jxeZ41j7NsSGkW016QQ3ng-1; Thu, 17 Dec 2020 11:56:22 -0500
X-MC-Unique: jxeZ41j7NsSGkW016QQ3ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91AC7104FB63;
 Thu, 17 Dec 2020 16:56:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 486A527CA2;
 Thu, 17 Dec 2020 16:56:13 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] SCSI: fix transfer limits for SCSI passthrough
Date: Thu, 17 Dec 2020 18:56:07 +0200
Message-Id: <20201217165612.942849-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series attempts to provide a solution to the problem of the tran=
sfer=0D
limits of the raw file driver (host_device/file-posix), some of which I=0D
already tried to fix in the past.=0D
=0D
I included 2 patches from Tom Yan which fix two issues with reading the lim=
its=0D
correctly from the */dev/sg* character devices in the first place.=0D
=0D
The only change to these patches is that I tweaked a bit the comments in th=
e=0D
source to better document the /dev/sg quirks.=0D
=0D
The other two patches in this series split the max transfer limits that qem=
u=0D
block devices expose in two:=0D
One limit is for the regular IO, and another is for the SG_IO (aka bdrv_*_i=
octl),=0D
and the two device drivers (scsi-block and scsi-generic) that use the later=
=0D
are switched to the new interface.=0D
=0D
This should ensure that the raw driver can still advertise the unlimited=0D
transfer  length, unless it is used for SG_IO, because that yields the high=
est=0D
performance.=0D
=0D
Also I include a somewhat unrelated fix to a bug I found in qemu's=0D
SCSI passthrough while testing this:=0D
When qemu emulates the VPD block limit page, for a SCSI device that doesn't=
=0D
implement it, it doesn't really advertise the emulated page to the guest.=
=0D
=0D
I tested this by doing both regular and SG_IO passthrough of my=0D
USB SD card reader.=0D
=0D
That device turned out to be a perfect device for the task, since it has ma=
x=0D
transfer size of 1024 blocks (512K), and it enforces it.=0D
=0D
Also it didn't implement the VPD block limits page,=0D
(transfer size limit probably comes from something USB related) which trigg=
ered=0D
the unrelated bug.=0D
=0D
I was able to see IO errors without the patches, and the wrong max transfer=
=0D
size in the guest, and with patches both issues were gone.=0D
=0D
I also found an unrelated issue in /dev/sg passthrough in the kernel.=0D
It turns out that in-kernel driver has a limitation of 16 requests in fligh=
t,=0D
regardless of what underlying device supports.=0D
=0D
With a large multi-threaded fio job  and a debug print in qemu, it is easy =
to=0D
see it, although the errors don't do much harm to the guest as it retries t=
he=0D
IO, and eventually succeed.=0D
It is an open question if this should be solved.=0D
=0D
V2: fixed an issue in a patch from Tom Yan (thanks), and removed=0D
refactoring from last patch according to Paulo's request.=0D
=0D
V3: few cosmitic changes due to the review feedback.=0D
=0D
Maxim Levitsky (3):=0D
  block: add max_ioctl_transfer to BlockLimits=0D
  block: use blk_get_max_ioctl_transfer for SCSI passthrough=0D
  block/scsi: correctly emulate the VPD block limits page=0D
=0D
Tom Yan (2):=0D
  file-posix: split hdev_refresh_limits from raw_refresh_limits=0D
  file-posix: add sg_get_max_segments that actually works with sg=0D
=0D
 block/block-backend.c          | 12 ++++++=0D
 block/file-posix.c             | 76 +++++++++++++++++++++++++++-------=0D
 block/io.c                     |  2 +=0D
 block/iscsi.c                  |  1 +=0D
 hw/scsi/scsi-generic.c         | 13 ++++--=0D
 include/block/block_int.h      |  4 ++=0D
 include/sysemu/block-backend.h |  1 +=0D
 7 files changed, 90 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


