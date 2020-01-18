Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E88014190C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 20:12:23 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1istW9-0003I0-SQ
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 14:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1istTs-0001Sp-HU
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1istTr-0004Oj-7i
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:10:00 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:48333)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1istTq-0004N4-Sv; Sat, 18 Jan 2020 14:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=jj7eKp47Dqs+1Ph2YMZLgJzB6XaqJGC3MNK0nOIJeHE=; 
 b=OLuohjgCZPGxVGMA588eIU1TNwVmuiHED8bww7fu/BOfDdxCBj2Xj0f0o8/AY5qGHBqEbZVzOYEahGmRS+5KisMwggOikGFyC61rKdQl0RbnXU623OC/93x1ZTsln5az5EoWOHuybAb8Hu8bx3aII6tbwwl8wVhJoEgF7BRxtn3EVCV2RuFbEa9u/uTxeVjFpf5KShn77/kjIQx9InWtiUtupSvA30nX5pbtJRo4oC5Hp2NuJjskvvCiyVqG9l9Gm7m4G/twbf+FbVWlMUigay3X3alU9AJiPv+7Lhqxc6u9LbFlL0jqWA+36DKrXkd5Q1QX2yICmBmh5trIGLaaBw==;
Received: from [80.30.177.7] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1istTn-000657-7D; Sat, 18 Jan 2020 20:09:55 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1istTW-0002JT-NL; Sat, 18 Jan 2020 20:09:38 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Misc BDRV_SECTOR_SIZE updates
Date: Sat, 18 Jan 2020 20:09:25 +0100
Message-Id: <cover.1579374329.git.berto@igalia.com>
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

This series gets rid of all the remaining instances of hardcoded
sector sizes in the qcow2 code and adds a check for images whose
virtual size is not a multiple of the sector size.

See the individual patches for details.

Berto

v3:
- Patch 2: Use offset_into_cluster() instead of QEMU_IS_ALIGNED
- Patch 3: Rewrite qcow2_write_l1_entry() to use bl.request_alignment [Kevin]
- Patch 4: Remove alignment check in qcow2_co_copy_range_from()

v2: https://lists.gnu.org/archive/html/qemu-block/2020-01/msg00169.html
- Modify output of iotest 080 to make it easier to understand [Nir]
- Use the QEMU_IS_ALIGNED() macro instead of the modulus operator [Nir]
- Tighten some assertions [Kevin]

v1: https://lists.gnu.org/archive/html/qemu-block/2020-01/msg00139.html

Alberto Garcia (5):
  qcow2: Don't round the L1 table allocation up to the sector size
  qcow2: Tighten cluster_offset alignment assertions
  qcow2: Use bs->bl.request_alignment when updating an L1 entry
  qcow2: Don't require aligned offsets in qcow2_co_copy_range_from()
  qcow2: Use BDRV_SECTOR_SIZE instead of the hardcoded value

 block/qcow2-cluster.c  | 30 +++++++++++++++++-------------
 block/qcow2-refcount.c |  2 +-
 block/qcow2-snapshot.c |  3 +--
 block/qcow2.c          | 23 +++++++++--------------
 4 files changed, 28 insertions(+), 30 deletions(-)

-- 
2.20.1


