Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C3146BC85
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:28:44 +0100 (CET)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muaWQ-0003PI-LG
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muaSW-0000ln-68
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muaSR-0005yX-Ip
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638883474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r2isEaCd6xk+f4LxeTB/xnxK27KBL9Gzn5hEP87ohGk=;
 b=K9Kw4gYbiqKvwaxtXtLmibEbGmcL02Rkgllho55+fvcLfhh1hRquX+6SL7y3Tgf98cGeW2
 worgxb943zmHilFavZldmtgfDOa5eYz8sXDJT5mh6g3STN3VlMLqbd7HXN3bUlLWkJ/2qI
 P8bRcKpwUEQlDQr5h7txQATRYwiBwZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-pq0CVYb0N9-a5LHy6DfeXw-1; Tue, 07 Dec 2021 08:24:31 -0500
X-MC-Unique: pq0CVYb0N9-a5LHy6DfeXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D621B2C981;
 Tue,  7 Dec 2021 13:24:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3765276612;
 Tue,  7 Dec 2021 13:23:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] aio-posix: split poll check from ready handler
Date: Tue,  7 Dec 2021 13:23:30 +0000
Message-Id: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>,
 Stefan Weil <sw@weilnetz.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:=0D
- Fixed FUSE export aio_set_fd_handler() call that I missed and double-chec=
ked=0D
  for any other missing call sites using Coccinelle [Rich]=0D
v2:=0D
- Cleaned up unused return values in nvme and virtio-blk [Stefano]=0D
- Documented try_poll_mode() ready_list argument [Stefano]=0D
- Unified virtio-blk/scsi dataplane and non-dataplane virtqueue handlers [S=
tefano]=0D
=0D
The first patch improves AioContext's adaptive polling execution time=0D
measurement. This can result in better performance because the algorithm ma=
kes=0D
better decisions about when to poll versus when to fall back to file descri=
ptor=0D
monitoring.=0D
=0D
The remaining patches unify the virtio-blk and virtio-scsi dataplane and=0D
non-dataplane virtqueue handlers. This became possible because the dataplan=
e=0D
handler function now has the same function signature as the non-dataplane=
=0D
handler function. Stefano Garzarella prompted me to make this refactoring.=
=0D
=0D
Stefan Hajnoczi (6):=0D
  aio-posix: split poll check from ready handler=0D
  virtio: get rid of VirtIOHandleAIOOutput=0D
  virtio-blk: drop unused virtio_blk_handle_vq() return value=0D
  virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane=0D
  virtio: use ->handle_output() instead of ->handle_aio_output()=0D
  virtio: unify dataplane and non-dataplane ->handle_output()=0D
=0D
 include/block/aio.h             |  4 +-=0D
 include/hw/virtio/virtio-blk.h  |  2 +-=0D
 include/hw/virtio/virtio.h      |  5 +-=0D
 util/aio-posix.h                |  1 +=0D
 block/curl.c                    | 11 ++--=0D
 block/export/fuse.c             |  4 +-=0D
 block/io_uring.c                | 19 ++++---=0D
 block/iscsi.c                   |  4 +-=0D
 block/linux-aio.c               | 16 +++---=0D
 block/nfs.c                     |  6 +--=0D
 block/nvme.c                    | 51 ++++++++++++-------=0D
 block/ssh.c                     |  4 +-=0D
 block/win32-aio.c               |  4 +-=0D
 hw/block/dataplane/virtio-blk.c | 16 +-----=0D
 hw/block/virtio-blk.c           | 14 ++----=0D
 hw/scsi/virtio-scsi-dataplane.c | 60 +++-------------------=0D
 hw/scsi/virtio-scsi.c           |  2 +-=0D
 hw/virtio/virtio.c              | 73 +++++++++------------------=0D
 hw/xen/xen-bus.c                |  6 +--=0D
 io/channel-command.c            |  6 ++-=0D
 io/channel-file.c               |  3 +-=0D
 io/channel-socket.c             |  3 +-=0D
 migration/rdma.c                |  8 +--=0D
 tests/unit/test-aio.c           |  4 +-=0D
 util/aio-posix.c                | 89 +++++++++++++++++++++++++--------=0D
 util/aio-win32.c                |  4 +-=0D
 util/async.c                    | 10 +++-=0D
 util/main-loop.c                |  4 +-=0D
 util/qemu-coroutine-io.c        |  5 +-=0D
 util/vhost-user-server.c        | 11 ++--=0D
 30 files changed, 219 insertions(+), 230 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


