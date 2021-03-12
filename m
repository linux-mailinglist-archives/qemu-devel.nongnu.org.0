Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D994338FD3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:24:16 +0100 (CET)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKii7-0003TV-1s
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUe-0002ZK-PZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:20 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:35968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUc-0003oF-Pk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:20 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-7Oab4VnRMQWh3d8csCZ8Jg-1; Fri, 12 Mar 2021 09:10:15 -0500
X-MC-Unique: 7Oab4VnRMQWh3d8csCZ8Jg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B09FEC1A0;
 Fri, 12 Mar 2021 14:10:14 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F0DD5D6D7;
 Fri, 12 Mar 2021 14:10:03 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] virtiofsd: Deal with empty filenames
Date: Fri, 12 Mar 2021 15:10:00 +0100
Message-Id: <20210312141003.819108-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no such thing as an empty file name in POSIX-compliant file systems=
.=0D
The current code base doesn't ensure the client doesn't send requests with=
=0D
such empty names. I've audited the code and only found one place where=0D
the behavior is somewhat altered in lookup_name() :=0D
=0D
    res =3D do_statx(lo, dir->fd, name, &attr,=0D
                   AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);=0D
=0D
lookup_name() is used by lo_rmdir(), lo_rename() and lo_unlink() which=0D
all share the same behavior of doing some action on a file or directory=0D
under a given parent directory. But if an empty name reaches the code=0D
above, do_statx() returns the attributes of the parent directory itself=0D
and lookup_name() might return the inode of the parent directory. This=0D
could potentially cause security concerns in the callers.=0D
=0D
Fortunately, it doesn't as of today. If the parent directory is the root=0D
inode, lookup_name() returns NULL because lo_find() fails to find an=0D
inode with a matching .st_dev. Otherwise, lookup_name() does return the=0D
parent inode but the empty name then gets passed to either unlinkat(),=0D
renameat() or renameat2(), all of which fail with ENOENT in this case.=0D
=0D
Drop AT_EMPTY_PATH from the above code anyway to make it clear empty=0D
names aren't expected by the existing callers. If the need for it=0D
arises in the future, it can be added back but stay safe for now.=0D
=0D
The FUSE protocol doesn't have a notion of AT_EMPTY_PATH actually. The=0D
server should hence never see empty names in client requests. Detect=0D
this early and systematically fail the request with ENOENT in this=0D
case.=0D
=0D
No regression is observed with the POSIX-oriented pjdfstest file system=0D
test suite (https://github.com/pjd/pjdfstest).=0D
=0D
Greg Kurz (3):=0D
  virtiofsd: Don't allow empty paths in lookup_name()=0D
  virtiofsd: Convert some functions to return bool=0D
  virtiofsd: Don't allow empty filenames=0D
=0D
 tools/virtiofsd/passthrough_ll.c | 44 ++++++++++++++++++++++++++++----=0D
 1 file changed, 39 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


