Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF418D675
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 19:02:08 +0100 (CET)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFLyB-0004GT-F7
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 14:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <db76c7042cf249ca51ef0269c824213eb73452b0@lizzy.crudebyte.com>)
 id 1jFLx2-0003dG-EP
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <db76c7042cf249ca51ef0269c824213eb73452b0@lizzy.crudebyte.com>)
 id 1jFLwz-0000IT-NH
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:00:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <db76c7042cf249ca51ef0269c824213eb73452b0@lizzy.crudebyte.com>)
 id 1jFLwz-0007Z6-5r
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=zP/O9dNFAwWU85LXtneEDXITdC18w33LH28i7aVy9Gg=; b=hvo8z
 TUbyCYACIgd2N8gQ61N6rRQ7ftubru30Hk94MrGFPMLRZStSAAF6hfmKRyFFcP6lH7kpTAL+Yg3mO
 xbk4wR93MKhhGd30BtuPww/XhQpgcnfP1ILY52+UoFPzSZ6j1t1NOXlK5047YXbP9M/EuwaDuE1CZ
 iEQ/7Hr2I918qkeBcW+34yfa8Fshsybhdjsv/Fq3Hk8PMrQDmoeRnPYzSMNJG4hljqisMTY8gEbUD
 HAYHhmsRmSJJCmSw9uFnd5+ulexpkAAdOX5Stj5/DAcIxeKKPgl9nWHlHdq6zTxsZGx9YkGjF04sc
 veb2xkGoOB7IXF58hu0lYwAmLnqQA==;
Message-Id: <cover.1584723662.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 20 Mar 2020 18:01:02 +0100
Subject: [PATCH v2 0/4] add support for QEMU 9pfs 'multidevs' option
To: libvir-list@redhat.com
Cc: qemu-devel@nongnu.org,
    Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.194.90.13
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

QEMU 4.2 added a new option 'multidevs' for 9pfs. The following patch adds
support for this new option to libvirt.

In short, what is this about: to distinguish files uniquely from each other
in general, numeric file IDs are typically used for comparison, which in
practice is the combination of a file's device ID and the file's inode
number. Unfortunately 9p protocol's QID field used for this purpose,
currently is too small to fit both the device ID and inode number in, which
hence is a problem if one 9pfs export contains multiple devices and may
thus lead to misbheaviours on guest (e.g. with SAMBA file servers) in that
case due to potential file ID collisions.

To mitigate this problem with 9pfs a 'multidevs' option was introduced in
QEMU 4.2 for defining how to deal with this, e.g. multidevs=remap will cause
QEMU's 9pfs implementation to remap all inodes from host side to different
inode numbers on guest side in a way that prevents file ID collisions.

NOTE: In the libvirt docs changes of this libvirt patch I simply assumed
"since 6.2.0". So the final libvirt version number would need to be adjusted
in that text if necessary.

See QEMU discussion with following Message-ID for details:
8a2ffe17fda3a86b9a5a437e1245276881f1e235.1567680121.git.qemu_oss@crudebyte.com

v1->v2:

  * Unrelated docs/formatdomain.html.in changes to separate patch.
    [patch 1]

  * Added new capability QEMU_CAPS_VIRTFS_MULTIDEVS.
    [patch 2]

  * XML changes as isolated patch.
    [patch 3]

  * Code style fix.
    [patch 3]

  * QEMU 'multidevs' command handling as isolated patch.
    [patch 4]

  * Error out if not QEMU_CAPS_VIRTFS_MULTIDEVS capability.
    [patch 4]

  * Error out on virtiofs (since it does not have the 'multidevs' option).
    [patch 4]

TODO:

  * Capabilities test cases would fail if <flag name='virtfs-multidevs'/>
    was added to the other architectures' test case xml files, why?
    [patch 2]

  * The requested test cases to add: Sorry, the libvirt test case
    environment is yet a mystery to me, I would not even know where to
    start here.

Message-ID of v1: E1jEFpL-00028n-Qj@lizzy.crudebyte.com

Christian Schoenebeck (4):
  docs: virtfs: add section separators
  qemu: capabilities: add QEMU_CAPS_VIRTFS_MULTIDEVS
  conf: add 'multidevs' option
  qemu: add support for 'multidevs' option

 docs/formatdomain.html.in                     | 47 ++++++++++++++++++-
 docs/schemas/domaincommon.rng                 | 10 ++++
 src/conf/domain_conf.c                        | 29 ++++++++++++
 src/conf/domain_conf.h                        | 13 +++++
 src/qemu/qemu_capabilities.c                  |  5 ++
 src/qemu/qemu_capabilities.h                  |  1 +
 src/qemu/qemu_command.c                       |  7 +++
 src/qemu/qemu_domain.c                        | 12 +++++
 .../caps_4.2.0.x86_64.xml                     |  1 +
 .../caps_5.0.0.aarch64.xml                    |  1 +
 .../caps_5.0.0.x86_64.xml                     |  1 +
 11 files changed, 126 insertions(+), 1 deletion(-)

-- 
2.20.1


