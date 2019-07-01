Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E110CA4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 20:19:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLtpX-0001yL-JC
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 14:19:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLtkb-0007N2-RO
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:14:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLtka-0002bN-0P
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:14:37 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:38855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hLtkZ-0002RF-F0; Wed, 01 May 2019 14:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:Cc:To:From;
	bh=VpAjM62bTp4qH7PxA2I0vH56bsFYsGYttjkSE3mbP8M=; 
	b=gSOVxN6blVerRfnd1BfkZpO1rEe2IvxQIbBUX13K8RX/pu84aL2JJTrrFi3FT6O9bG/UFbzmA7haqtrBzxugSuS9HhqMEg44HthXMWwjmhsHCAU9SZ6D5oc/RuPco+o3PYiGHbjHwamXyofpc9YsVw5KMeC3BRwR/xkIUJuM79jNKXpkkg7dytuuB7IhvjxrpBfXBnvJPG4Q6JCAvtR3VJweuzIYu+gGJcNL3/KsO4sMaYSPpFxYQVpxMgvA6Wm3YGZeDtCIkcb996M50QXMapLfEWZ9/pAbETO3H7K4ePVgauT4Awv07Udk0SZCIza1TXV8ToQic4xipxDYj2tDbw==;
Received: from 87-92-6-174.bb.dnainternet.fi ([87.92.6.174] helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hLtkH-0002E9-7Q; Wed, 01 May 2019 20:14:17 +0200
Received: from berto by perseus.local with local (Exim 4.89)
	(envelope-from <berto@igalia.com>)
	id 1hLtk2-0002yH-HC; Wed, 01 May 2019 21:14:02 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 21:13:54 +0300
Message-Id: <cover.1556732434.git.berto@igalia.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: [Qemu-devel] [PATCH v2 0/5] Remove bdrv_read() and bdrv_write()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

this API only had a few users left so it can be easily removed.

Regards,

Berto

v2:
- Patch 2: Add QEMU_BUILD_BUG_ON(sizeof(VdiHeader) != 512) [Kevin]
           Correct size parameter in bdrv_pwrite() call [Kevin]
           Return 0 on success, never a positive number [Kevin]
- Patch 3: Check that the return values of bdrv_pread()/bdrv_pwrite()
           are strictly < 0 for errors, not simply != 0 [Kevin]
- Patch 4: Reuse the documenation of bdrv_write() for bdrv_pwrite()

v1: https://lists.gnu.org/archive/html/qemu-block/2019-04/msg00832.html

Output of git backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/5:[----] [--] 'qcow2: Replace bdrv_write() with bdrv_pwrite()'
002/5:[0006] [FC] 'vdi: Replace bdrv_{read,write}() with bdrv_{pread,pwrite}()'
003/5:[0004] [FC] 'vvfat: Replace bdrv_{read,write}() with bdrv_{pread,pwrite}()'
004/5:[0007] [FC] 'block: Remove bdrv_read() and bdrv_write()'
005/5:[----] [--] 'qcow2: Remove BDRVQcow2State.cluster_sectors'

Alberto Garcia (5):
  qcow2: Replace bdrv_write() with bdrv_pwrite()
  vdi: Replace bdrv_{read,write}() with bdrv_{pread,pwrite}()
  vvfat: Replace bdrv_{read,write}() with bdrv_{pread,pwrite}()
  block: Remove bdrv_read() and bdrv_write()
  qcow2: Remove BDRVQcow2State.cluster_sectors

 block/io.c             | 43 +++++++------------------------------------
 block/qcow2-refcount.c |  4 ++--
 block/qcow2.c          |  1 -
 block/qcow2.h          |  1 -
 block/vdi.c            | 15 +++++++++------
 block/vvfat.c          | 12 +++++++-----
 include/block/block.h  |  4 ----
 7 files changed, 25 insertions(+), 55 deletions(-)

-- 
2.11.0


