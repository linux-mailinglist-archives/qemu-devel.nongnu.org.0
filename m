Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CB037BD84
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:57:42 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgoQn-0007mN-8E
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgoP5-0005ha-F0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgoP3-0004Ka-PK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620824152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=flaFSSUpHDaHSenoUVgdjAs7r79D4jlrMhV2bQnEetI=;
 b=VW9j5VqBbLFNrEFWL6N/Jpm0o7miSurb/Lv2Y05fTmLJNO8uabnsf/2ZQ31p63e01rUji6
 gjoLDHpic4rduOOWDfYMJHTqMWm6Cy8cP55P75YEfBm1DGFyt6LizcZ3x0SVvzem6yJxml
 jRG2szlayo5zPZBuTJD9EYXGGFD5DJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-tiPNo9OiPWSZf8TR9agomA-1; Wed, 12 May 2021 08:55:50 -0400
X-MC-Unique: tiPNo9OiPWSZf8TR9agomA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AFED801817
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:55:49 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE60FE150;
 Wed, 12 May 2021 12:55:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] virtiofsd: Find original inode ID of mount points
Date: Wed, 12 May 2021 14:55:41 +0200
Message-Id: <20210512125544.9536-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Not announcing submounts to the guest may lead to duplicated
st_dev/st_ino combinations, because inodes on different filesystems
(different st_dev) may share the same inode ID (st_ino).  If the guest
only sees a single st_dev, those inodes will appear to have the same
st_dev/st_ino combination.

Announcing submounts is supposed to solve this problem by making the
guest report different st_dev IDs for different filesystems.

However, there is one loop hole: Submounts are implemented as
auto-mounts, meaning when the virtio-fs filesystem is mounted, the
submounts will not be mounted immediately.  In the guest, it is possible
to stat() these mount points with AT_NO_AUTOMOUNT to receive information
without mounting them, so they will then show whatever st_ino virtiofsd
passes, and the st_dev of the parent filesystem.

Unfortunately, as far as we understood, the only st_ino that virtiofsd
could inquire was the one on the submounted filesystem, i.e. the st_ino
of that FS’s root node.

Thus, we again got a collision: In said case, the guest would see st_dev
of the parent FS, but st_ino of the submounted FS.  This is very likely
to be the same st_dev/st_ino combination as the root node of the parent
FS.

For nested mount structures, this can be reproduced with `find`:
Mounting several filesystems under each other, passing everything into a
guest, mounting the root virtio-fs FS there, and then invoking `find`
would likely result in it complaining about filesystem loops and
refusing to visit the submount points.  (These loops are reported
because it takes notes of st_dev/st_ino combinations, and then reports a
loop when some combination reappears.)  This can only be fixed by
forcing all submounts to be (auto-)mounted.

What we’d need to do is report the inode ID of the mount point directory
that it has on the parent filesystem to the guest, until the submount is
auto-mounted there.  It’s just that we thought there was no way to
inquire this parent FS st_ino.

It turns out that our understand was wrong, though: There is a way,
namely readdir().  The dirent.d_ino field represents (in practice) the
st_ino of some directory entry on the directory’s filesystem, and so is
exactly the value we want to give to the guest.

Let’s do that.


Max Reitz (3):
  virtiofsd: Find original inode ID of mount points
  virtiofs_submounts.py: Do not generate ssh key
  virtiofs_submounts.py: Check `find`

 tools/virtiofsd/passthrough_ll.c              | 104 +++++++++++++++++-
 tests/acceptance/virtiofs_submounts.py        |  10 +-
 .../virtiofs_submounts.py.data/guest.sh       |  56 ++++------
 3 files changed, 122 insertions(+), 48 deletions(-)

-- 
2.31.1


