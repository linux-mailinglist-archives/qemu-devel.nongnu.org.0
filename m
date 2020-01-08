Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87171349D1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 18:52:17 +0100 (CET)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipFVA-0006vF-JZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 12:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ipFTL-0005SI-Q4
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 12:50:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ipFTK-00015m-Nv
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 12:50:23 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:55166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ipFTK-0000WO-2T; Wed, 08 Jan 2020 12:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=y4oppToXUz7Pqd9IVpKABvMohF74IoeilOKJFW27wPs=; 
 b=G49sP6g1vxSwKagMErYYYEBd2T3Zlx7bd9JCAsraezGbn4ego1Yta1tYeolV6iJADsIkmHz8zLY8xrBrnFwaUlWvkJqetuK1kwxtCdOT+FOFEUnm924Ooq59P38VhbsLJBa30xp4BqY/k5wAn3Ng8SCUXqyFvYFAw7SAtVvudwmWXese+707PSJS2sygPIrSjzPoSKt3zVYb/lqmxP6LU2N8pa1le9Mc6dmFhkArOMZd9Zgh5OVbZLCNEhSjpmqTqMCBvP+SXV4q9qYnizxQBBa2C1ghFeFqEPtJGVt+ed3b2A+l1TVPRNgS1PsiyGSQnqpf4MmEdbSU/FsTYChzQA==;
Received: from [213.99.255.143] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1ipFT1-0001HN-Py; Wed, 08 Jan 2020 18:50:03 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1ipFSD-0000DX-9w; Wed, 08 Jan 2020 18:49:13 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qcow2: Misc BDRV_SECTOR_SIZE updates
Date: Wed,  8 Jan 2020 18:49:07 +0100
Message-Id: <cover.1578505678.git.berto@igalia.com>
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
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series gets rid of all the remaining instances of hardcoded
sector sizes in the qcow2 code and adds a check for images whose
virtual size is not a multiple of the sector size.

See the individual patches for details.

Berto

Alberto Garcia (3):
  qcow2: Require that the virtual size is a multiple of the sector size
  qcow2: Don't round the L1 table allocation up to the sector size
  qcow2: Use BDRV_SECTOR_SIZE instead of the hardcoded value

 block/qcow2-cluster.c      |  7 +++----
 block/qcow2-refcount.c     |  2 +-
 block/qcow2-snapshot.c     |  3 +--
 block/qcow2.c              | 25 +++++++++++++++++--------
 docs/interop/qcow2.txt     |  3 ++-
 tests/qemu-iotests/080     |  7 +++++++
 tests/qemu-iotests/080.out |  4 ++++
 7 files changed, 35 insertions(+), 16 deletions(-)

-- 
2.20.1


