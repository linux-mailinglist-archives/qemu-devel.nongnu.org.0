Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D229E2E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 20:38:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUF5c-00026i-Tp
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 14:38:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hUF3f-0000rd-L2
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hUF3e-0008Lm-Kx
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:36:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hUF3e-0008L6-B8
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:36:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC6863082E0F;
	Fri, 24 May 2019 18:36:44 +0000 (UTC)
Received: from localhost (ovpn-117-142.ams2.redhat.com [10.36.117.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0624D5C1B4;
	Fri, 24 May 2019 18:36:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 24 May 2019 19:36:35 +0100
Message-Id: <20190524183638.20745-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 24 May 2019 18:36:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 0/3] scsi: restart dma after vm change state
 handlers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
 * Fix s/k->vmstate_change/vdc->vmstate_change/
 * Still RFC, waiting for customer to confirm this fixes the issue
v2:
 * Do it properly with a clean API instead of deferring to a BH!
   Thanks for encouraging me to do this, Kevin.

These patches solve a deadlock when the 'cont' command is used and there =
are
failed requests on a virtio-scsi device with iothreads.  The deadlock its=
elf is
actually not the thing we need to fix because we should never reach that =
case
anyway.  Instead we need to make sure DMA restart is only performed after=
 the
virtio-scsi iothread is re-initialized.

Stefan Hajnoczi (3):
  virtio: add vdc->vmchange_state() callback
  scsi: add scsi_bus_dma_restart()
  virtio-scsi: fix iothread deadlock on 'cont'

 include/hw/scsi/scsi.h     |  5 +++++
 include/hw/virtio/virtio.h |  7 +++++++
 hw/scsi/scsi-bus.c         | 37 ++++++++++++++++++++++++++++++-------
 hw/scsi/virtio-scsi.c      | 17 +++++++++++++++++
 hw/virtio/virtio.c         |  9 +++++++++
 5 files changed, 68 insertions(+), 7 deletions(-)

--=20
2.21.0


