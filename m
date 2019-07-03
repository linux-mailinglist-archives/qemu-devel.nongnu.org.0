Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E95E5A7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 15:42:16 +0200 (CEST)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hifWZ-0008Er-1Y
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 09:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cf19fce96353c8215111eba71751775d135cbdb4@lizzy.crudebyte.com>)
 id 1hifVY-0007kc-FU
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 09:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cf19fce96353c8215111eba71751775d135cbdb4@lizzy.crudebyte.com>)
 id 1hifVX-0003dS-CG
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 09:41:12 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <cf19fce96353c8215111eba71751775d135cbdb4@lizzy.crudebyte.com>)
 id 1hifVW-000319-Qe
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 09:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Subject:Date:Cc:To:From:Message-Id:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DRjjk94BM7fXzEJR1Qbu5HLK7dXcFI1n43aYgj2CyFY=; b=c0+Yv/VTYbMH0EIRKZDepZKZzK
 9uEVkbt5sPN5gniHGuyh++5jD2m+9B+eWBbhZ9mxbsLoqmO0vlTVP2O7JUYpV2EprRXQYgyAJrmK8
 1+JBK+PHfMWnoaCRlkt9T+LzrxKjIDXp1ITu5sui+YGu5UG56X34vn58MqGOGvK4NUcbh0k/kaOVf
 Oq+Q360bcDW5RxmVRg0sYigeMBO7M6ImW3ZjdPYM99SiBXONOmVbWo+kBusqPEx+5zUVzY+dtaGWP
 HfH4tu2OV0nbr9VeMnx/vWUzy6n+wwD5FL1bbjMVOCvCypDIVVOg3i0HHE5p3TOdGw5f6TdlJz4t1
 ZWqMgZHQ==;
Message-Id: <cover.1562154272.git.qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Date: Wed, 3 Jul 2019 13:44:32 +0200
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.194.90.13
Subject: [Qemu-devel] [PATCH v5 0/5] 9p: Fix file ID collisions
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
From: Christian Schoenebeck via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v5 of a proposed patch set for fixing file ID collisions with 9pfs.

v4->v5:

  All Patches:

  * Added details to individual commit logs of what has been changed
    exactly by me on top of Antonios' original 4 patches.

  Patch 1:

  * Fixed format specifiers in hw/9pfs/trace-events.

  Patch 2:

  * Fixed typo in commit log.

  * Assign dev_id to export root's device already in
    v9fs_device_realize_common(), not postponed in stat_to_qid().

  * Return -ENODEV instead of -ENOSYS in stat_to_qid().

  Patch 3:

  * Added missing manual parts for new virtfs option 'remap_inodes' in
    qemu-options.hx.

  * Capture root_ino in v9fs_device_realize_common() as well, not just the
    device id.

  * Added function dirent_to_qid().

  * Fixed v9fs_do_readdir() having exposed info outside export root with
    '..' entry (no matter if inode remapping was on or not).

  * Fixed v9fs_do_readdir() not having remapped inodes.

  * Fixed definition of QPATH_INO_MASK.

  * Log error message when running out of prefixes in qid_path_prefixmap().

  * Adjusted changes in stat_to_qid() to qemu code style guidelines.

  Patch 4:

  * Log error message when running out of prefixes in qid_path_fullmap().

  * Log error message about potential degraded performance in
    qid_path_prefixmap() (that is when qid_path_fullmap() will start to
    kick in next).

  * Fixed typo in code comment.

  Patch 5:

  * Dropped fixed (16 bit) size prefix code and hence removed usage of
    P9_VARI_LENGTH_INODE_SUFFIXES macro checks all over the place.

  * Dropped function expGolombEncodeK0(uint64_t n) which was optimized for
    the expected default value of k=0; instead always use the generalized
    function expGolombEncode(uint64_t n, int k) instead now.

  * Adjusted changes in hw/9pfs/9p.c to qemu code style guidelines.

  * Adjusted functions' API comments in hw/9pfs/9p.c.

v3->v4:

  * Rebased to latest git master head.

  * Splitted Antonios' patch set to its original 4 individual patches.
    (was merged previously as only 1 patch).

  * Addressed discussed issues directly on Antonios' patches
    (was a separate patch before).

  * Added virtfs command line option "remap_inodes": Unless this option
    is not enabled, no inode remapping is performed at all, the user
    just gets an error message when trying to use more than 1 device
    per export.

  * Dropped persistency feature of QIDs beyond reboots.

  * Dropped disputed "vii" feature.

Christian Schoenebeck (5):
  9p: unsigned type for type, version, path
  9p: Treat multiple devices on one export as an error
  9p: Added virtfs option 'remap_inodes'
  9p: stat_to_qid: implement slow path
  9p: Use variable length suffixes for inode remapping

 fsdev/9p-marshal.h      |   6 +-
 fsdev/file-op-9p.h      |   1 +
 fsdev/qemu-fsdev-opts.c |   7 +-
 fsdev/qemu-fsdev.c      |   6 +
 hw/9pfs/9p.c            | 508 +++++++++++++++++++++++++++++++++++++++++++++---
 hw/9pfs/9p.h            |  51 +++++
 hw/9pfs/trace-events    |  14 +-
 qemu-options.hx         |  25 ++-
 vl.c                    |   3 +
 9 files changed, 573 insertions(+), 48 deletions(-)

-- 
2.11.0


