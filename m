Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE217109B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 06:52:12 +0100 (CET)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7C5j-0000E1-Eo
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 00:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1j7C4K-0007Sa-5H
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 00:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1j7C4I-0000sv-K6
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 00:50:43 -0500
Received: from mgwym01.jp.fujitsu.com ([211.128.242.40]:27140)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1j7C4I-0000np-4f
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 00:50:42 -0500
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
 mgwym01.jp.fujitsu.com with smtp
 id 3836_174b_0a30eff7_7bb8_4dff_a2a0_3fb3310b7f60;
 Thu, 27 Feb 2020 14:50:32 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
 (g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
 by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63DB6AC009B
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 14:50:31 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
 by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id 830745842D0;
 Thu, 27 Feb 2020 14:50:30 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 14:50:30 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <virtio-fs@redhat.com>
Subject: [PATCH v4 0/2] virtiofsd: Fix xattr operations
Date: Thu, 27 Feb 2020 14:59:25 +0900
Message-ID: <20200227055927.24566-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 211.128.242.40
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
Cc: qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently xattr operations on virtiofs does not work properly in some case:
 - directory ... cannot set
 - special files (pipe) ... cause hang

This fixes these problems and now xfstests generic/062 passes on virtiofs
with -o xattr option (I tested with xfs).

v3 -> v4:
 - No logic change
 - Some code style fix/update comments and commit log as suggested by Vivek
 - CC qemu-devel ML too

Previous versions can be found in virtiofs ML:
 v3: https://www.redhat.com/archives/virtio-fs/2020-February/msg00032.html

Thanks,
Misono Tomohiro (2):
  virtiofsd: passthrough_ll: cleanup getxattr/listxattr
  virtiofsd: Fix xattr operations

 tools/virtiofsd/fuse_virtio.c    |  13 +++
 tools/virtiofsd/passthrough_ll.c | 139 ++++++++++++++++---------------
 tools/virtiofsd/seccomp.c        |   6 ++
 3 files changed, 89 insertions(+), 69 deletions(-)

-- 
2.21.1


