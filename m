Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F3177A32
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 16:17:30 +0100 (CET)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j99IX-0007AQ-Pm
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 10:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j99HL-0005rB-Ji
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 10:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j99HK-0003xj-0q
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 10:16:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j99HJ-0003xa-Po
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 10:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583248572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dCs7dVNzpfDoTIcLBBKcSFcsDDUYhAkER1mvRnDYnv0=;
 b=RydaoRdK/pShWyngiX+MFAjhIuPxy2dzawDRZ/NAX6wW0bMPyBzYybJ3Vh8Jk9vkjKko7N
 FsdI4vxBPfyPMn7pyl2knO2m5RktPmyXTnilOFghPFSsiscgFkTm1Jcv8J6Eh7olePiEie
 wGXKSK12dxXd96AXn42KAa4fa3jHxW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-67twT0RHPmaeAn-fUWRtQA-1; Tue, 03 Mar 2020 10:16:10 -0500
X-MC-Unique: 67twT0RHPmaeAn-fUWRtQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3CAC8017CC
 for <qemu-devel@nongnu.org>; Tue,  3 Mar 2020 15:16:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-2.ams2.redhat.com
 [10.36.117.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 673FF90766
 for <qemu-devel@nongnu.org>; Tue,  3 Mar 2020 15:16:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] virtiofs queue
Date: Tue,  3 Mar 2020 15:16:04 +0000
Message-Id: <20200303151606.108736-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 104933c4a973960dea605b06fcd5d0d478255d77=
:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o staging (2020-03-03 12:03:59 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20200303

for you to fetch changes up to bdfd66788349acc43cd3f1298718ad491663cfcc:

  virtiofsd: Fix xattr operations (2020-03-03 15:13:24 +0000)

----------------------------------------------------------------
Virtiofsd pull 2020-03-03

xattr fixes from Misono.

----------------------------------------------------------------
Misono Tomohiro (2):
      virtiofsd: passthrough_ll: cleanup getxattr/listxattr
      virtiofsd: Fix xattr operations

 tools/virtiofsd/fuse_virtio.c    |  13 ++++
 tools/virtiofsd/passthrough_ll.c | 139 ++++++++++++++++++++---------------=
----
 tools/virtiofsd/seccomp.c        |   6 ++
 3 files changed, 89 insertions(+), 69 deletions(-)


