Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470EA1360EF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 20:17:54 +0100 (CET)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipdJY-00055f-R3
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 14:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ipdGB-0003UW-Qq
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 14:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ipdG9-0007GW-JQ
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 14:14:23 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:58345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ipdG9-0006B6-8n; Thu, 09 Jan 2020 14:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=tzD1Y/0YWIrtdRyTWr/mVf8GtEnqdDKa8qDK9CkB7Os=; 
 b=iauRMAAWp8J5hDQkUTXetnRc45AZ9yaishrazL6W7PN4pGfUECTkfhSDR3HdeepiXV7klpeENhS2kUUfx032ddQiTz95PD82/J6un8zI4l8eZNAtf6cSuRON7FE3A/rK1uTOri03t+XLEbICoQktgW5ZkCF8DXBLwwlXZv4CnNTs+Bm2EXZw2JVjwaoaaaXZ+fWB3rPNcmyDLoe2xdU57H+96hfJjMbk4SKRvom297qLQ/TmrdDRGN4FvZQFfvuhsRdczk1s1Y8Z79AwlFukA2gnVwRkRfZG9MUEh4Qyh3kSfebVtLsz3bXrSnZjLYNrYo2ogm40NHhANVpbbok+eQ==;
Received: from [213.99.255.143] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1ipdFp-0006Mk-Oi; Thu, 09 Jan 2020 20:14:01 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1ipdF0-0005Qy-K5; Thu, 09 Jan 2020 20:13:10 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] qcow2: Misc BDRV_SECTOR_SIZE updates
Date: Thu,  9 Jan 2020 20:12:58 +0100
Message-Id: <cover.1578596897.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series gets rid of all the remaining instances of hardcoded
sector sizes in the qcow2 code and adds a check for images whose
virtual size is not a multiple of the sector size.

See the individual patches for details.

Berto

v2:
- Modify output of iotest 080 to make it easier to understand [Nir]
- Use the QEMU_IS_ALIGNED() macro instead of the modulus operator [Nir]
- Tighten some assertions [Kevin]

v1: https://lists.gnu.org/archive/html/qemu-block/2020-01/msg00139.html

Alberto Garcia (4):
  qcow2: Require that the virtual size is a multiple of the sector size
  qcow2: Don't round the L1 table allocation up to the sector size
  qcow2: Tighten cluster_offset alignment assertions
  qcow2: Use BDRV_SECTOR_SIZE instead of the hardcoded value

 block/qcow2-cluster.c      |  7 +++----
 block/qcow2-refcount.c     |  2 +-
 block/qcow2-snapshot.c     |  3 +--
 block/qcow2.c              | 28 +++++++++++++++++-----------
 docs/interop/qcow2.txt     |  3 ++-
 tests/qemu-iotests/080     |  8 ++++++++
 tests/qemu-iotests/080.out |  5 +++++
 7 files changed, 37 insertions(+), 19 deletions(-)

-- 
2.20.1


