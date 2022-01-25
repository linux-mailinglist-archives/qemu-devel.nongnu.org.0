Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D349B781
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:22:42 +0100 (CET)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNeb-0003NE-UO
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCMZ0-0002Ww-JP
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:12:52 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:52716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCMYq-0004aa-Vq
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:12:42 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-kZb8AemdP6m8NSau7XZx1w-1; Tue, 25 Jan 2022 09:12:37 -0500
X-MC-Unique: kZb8AemdP6m8NSau7XZx1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2242B86A071;
 Tue, 25 Jan 2022 14:12:33 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 009408464F;
 Tue, 25 Jan 2022 14:12:13 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] virtiofsd: Add support for FUSE_SYNCFS request
Date: Tue, 25 Jan 2022 15:12:10 +0100
Message-Id: <20220125141213.361930-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FUSE_SYNCFS allows the client to flush the host page cache.=0D
=0D
v4: - based on upstream linux FUSE_SYNCFS=0D
    - added support for the '-o announce_submounts' case, i.e. client sends=
=0D
      a FUSE_SYNCFS request for each submount (identified by its root inode=
)=0D
    - adapted the case without '-o announce_submounts' so that syncfs() is=
=0D
      no longer called with lo->mutex held=0D
=0D
v3: - track submounts and do per-submount syncfs() (Vivek)=0D
    - based on new version of FUSE_SYNCFS (still not upstream)=0D
      https://listman.redhat.com/archives/virtio-fs/2021-May/msg00025.html=
=0D
=0D
v2: - based on new version of FUSE_SYNCFS=0D
      https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166.htm=
l=0D
    - propagate syncfs() errors to client (Vivek)=0D
=0D
Greg Kurz (2):=0D
  virtiofsd: Track mounts=0D
  virtiofsd: Add support for FUSE_SYNCFS request=0D
=0D
 tools/virtiofsd/fuse_lowlevel.c       |  11 ++=0D
 tools/virtiofsd/fuse_lowlevel.h       |  13 +++=0D
 tools/virtiofsd/passthrough_ll.c      | 141 +++++++++++++++++++++++++-=0D
 tools/virtiofsd/passthrough_seccomp.c |   1 +=0D
 4 files changed, 163 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


