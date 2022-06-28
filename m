Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E618655D403
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:13:21 +0200 (CEST)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B1t-0006wa-1R
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzL-00043X-Gy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzJ-0008BD-2V
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8z2kDBg0FzaZBlUu3MBo+G5OeZdJvfazLdw41XsSkME=;
 b=aAGe6FrrhwXQeLvZ4FoFeAdgfFPMtYOy2x9FWL77DUKunol7zANVK2cKKzN9CNcrkzfc+z
 NWVnz3kGUOo0zReq4UGYLDW/ieIdaRUjRrHTj1jqSBZCxvV/aRShizA2YUnn4RuYLsjJ0J
 JA8pp4L+FKV9GKXlGkwFeRFMvvJEQts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-_cZyTiHbP_SL2gKpvDZoFg-1; Tue, 28 Jun 2022 09:10:35 -0400
X-MC-Unique: _cZyTiHbP_SL2gKpvDZoFg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0EC21C0896B;
 Tue, 28 Jun 2022 13:10:34 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0D64492CA4;
 Tue, 28 Jun 2022 13:10:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 00/12] s390-ccw bios fixes and clean-ups
Date: Tue, 28 Jun 2022 15:10:20 +0200
Message-Id: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The s390-ccw bios currently fails to boot a guest that has been
installed into a partition on a DASD drive with 4k sectors.
While trying to fix this, I noticed a couple of other problems
and possibilites for clean-ups that this series is trying to
address now.

The first patch is an old one which I already sent out a year
ago, but it got never included since there were no other bios-related
patches pending and this patch alone never justified a bios rebuild.

The main problem (with the bios not getting the geometry right)
comes from the virtio_disk_is_scsi() [sic] function in the file
pc-bios/s390-ccw/virtio-blkdev.c - this more or less always
currently reports that the geometry is wrong for virtio-block
devices, which causes the code to call virtio_assume_scsi() that
sets a "guessed" geometry with 512-byte sectors. To get this fixed
and cleaned up, a couple of other preparing patches were necessary,
which you can find in patches 2 - 5.

While working on the above problem, I also noticed that the virtio
init sequence is not done according to the virtio specification.
It's currently not a problem since QEMU is very forgiving, but we
should clean this up anyway to be sure to avoid future problems. This
is done in patches 6 - 10.

Patch 11 simply beautifies up an oddity in a header, and patch 12
silences a compiler warning with Clang.

I know, it's more than one topic in this series now, but I wanted to
send them out as one series since some of the patches depend on each
other and I've got to rebuild the bios images at the end anyway, so
it's easier to keep everything together.

Thomas Huth (12):
  pc-bios/s390-ccw: Add a proper prototype for main()
  pc-bios/s390-ccw/virtio: Introduce a macro for the DASD block size
  pc-bios/s390-ccw/bootmap: Improve the guessing logic in
    zipl_load_vblk()
  pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
    virtio_ipl_disk_is_valid()
  pc-bios/s390-ccw/virtio-blkdev: Remove virtio_assume_scsi()
  pc-bios/s390-ccw/virtio: Set missing status bits while initializing
  pc-bios/s390-ccw/virtio: Read device config after feature negotiation
  pc-bios/s390-ccw/virtio: Beautify the code for reading virtqueue
    configuration
  pc-bios/s390-ccw: Split virtio-scsi code from
    virtio_blk_setup_device()
  pc-bios/s390-ccw/virtio-blkdev: Request the right feature bits
  pc-bios/s390-ccw/virtio: Remove "extern" keyword from prototypes
  pc-bios/s390-ccw/netboot.mak: Ignore Clang's warnings about GNU
    extensions

 pc-bios/s390-ccw/netboot.mak     |  7 ++-
 pc-bios/s390-ccw/s390-ccw.h      |  1 +
 pc-bios/s390-ccw/virtio-scsi.h   |  2 +-
 pc-bios/s390-ccw/virtio.h        | 16 +++---
 pc-bios/s390-ccw/bootmap.c       | 25 +++++++--
 pc-bios/s390-ccw/main.c          | 27 ++++++----
 pc-bios/s390-ccw/virtio-blkdev.c | 91 +++++---------------------------
 pc-bios/s390-ccw/virtio-scsi.c   | 19 ++++++-
 pc-bios/s390-ccw/virtio.c        | 28 ++++++----
 9 files changed, 103 insertions(+), 113 deletions(-)

-- 
2.31.1


