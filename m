Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FF92D9D4A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:11:50 +0100 (CET)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korO1-0000Ar-CT
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korI6-0001U7-B1
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korI3-0005UE-Qx
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ofxiw979EA5hQ5retJsvejrszYOaT4OA8K7Ptz7ohEw=;
 b=EM+I3GCCGzu2Jh5GVGP+ES/Px4uajrYiH2e9bSfM7auj49BzuxhzzWCS3IKMkrca4qTmQk
 pG+LNCgJrul0q1TQlGd3J3aFA/w1pcf+re9vL4YK5HYw33M7h201QnbRRaDuKZg4p+6K6U
 MPn095yyND9NAwic6TghobVpESBhXUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-gNP_Li97NzyoS-gY09zc6A-1; Mon, 14 Dec 2020 12:05:35 -0500
X-MC-Unique: gNP_Li97NzyoS-gY09zc6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0CE11074640;
 Mon, 14 Dec 2020 17:05:33 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D775D6AB;
 Mon, 14 Dec 2020 17:05:20 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] nbd/server: Quiesce coroutines on context switch
Date: Mon, 14 Dec 2020 18:05:15 +0100
Message-Id: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series allows the NBD server to properly switch between AIO contexts,=
=0D
having quiesced recv_coroutine and send_coroutine before doing the transiti=
on.=0D
=0D
We need this because we send back devices running in IO Thread owned contex=
ts=0D
to the main context when stopping the data plane, something that can happen=
=0D
multiple times during the lifetime of a VM (usually during the boot sequenc=
e or=0D
on a reboot), and we drag the NBD server of the correspoing export with it.=
=0D
=0D
While there, fix also a problem caused by a cross-dependency between=0D
closing the export's client connections and draining the block=0D
layer. The visible effect of this problem was QEMU getting hung when=0D
the guest request a power off while there's an active NBD client.=0D
=0D
v2:=0D
 - Replace "virtio-blk: Acquire context while switching them on=0D
 dataplane start" with "block: Honor blk_set_aio_context() context=0D
 requirements" (Kevin Wolf)=0D
 - Add "block: Avoid processing BDS twice in=0D
 bdrv_set_aio_context_ignore()"=0D
 - Add "block: Close block exports in two steps"=0D
 - Rename nbd_read_eof() to nbd_server_read_eof() (Eric Blake)=0D
 - Fix double space and typo in comment. (Eric Blake)=0D
=0D
Sergio Lopez (4):=0D
  block: Honor blk_set_aio_context() context requirements=0D
  block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()=0D
  nbd/server: Quiesce coroutines on context switch=0D
  block: Close block exports in two steps=0D
=0D
 block.c                         |  27 ++++++-=0D
 block/export/export.c           |  10 +--=0D
 blockdev-nbd.c                  |   2 +-=0D
 hw/block/dataplane/virtio-blk.c |   4 ++=0D
 hw/block/dataplane/xen-block.c  |   7 +-=0D
 hw/scsi/virtio-scsi.c           |   6 +-=0D
 include/block/export.h          |   4 +-=0D
 nbd/server.c                    | 120 ++++++++++++++++++++++++++++----=0D
 qemu-nbd.c                      |   2 +-=0D
 stubs/blk-exp-close-all.c       |   2 +-=0D
 10 files changed, 156 insertions(+), 28 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


