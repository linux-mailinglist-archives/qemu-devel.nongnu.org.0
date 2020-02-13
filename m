Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2A15BBDC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 10:42:59 +0100 (CET)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2B1O-000649-SX
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 04:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fengzhimin1@huawei.com>) id 1j2Awz-0006gu-NF
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 04:38:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fengzhimin1@huawei.com>) id 1j2Awy-00051H-RR
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 04:38:25 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2767 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fengzhimin1@huawei.com>)
 id 1j2Awy-0004qC-Gl
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 04:38:24 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9E6BC3112DDA4FD972F1;
 Thu, 13 Feb 2020 17:38:15 +0800 (CST)
Received: from huawei.com (10.173.220.198) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 17:38:07 +0800
From: Zhimin Feng <fengzhimin1@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <armbru@redhat.com>,
 <eblake@redhat.com>
Subject: [PATCH RFC 00/14] *** multifd for RDMA v2 ***
Date: Thu, 13 Feb 2020 17:37:41 +0800
Message-ID: <20200213093755.370-1-fengzhimin1@huawei.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.220.198]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: jemmy858585@gmail.com, Zhimin Feng <fengzhimin1@huawei.com>,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

This is a version against current code. It is based on the multifd work.
we can use the multifd parameters for rdma transport. All data is
transported by the multifd RDMA channels and the main channel is only
used to distribute its to the different multifd channels.

Zhimin Feng (14):
  migration: add the 'migrate_use_rdma_pin_all' function
  migration: judge whether or not the RDMA is used for migration
  migration/rdma: Create multiFd migration threads
  migration/rdma: Export the RDMAContext struct
  migration/rdma: Create the multifd channels for RDMA
  migration/rdma: Transmit initial packet
  migration/rdma: Export the 'qemu_rdma_registration_handle' and
    'qemu_rdma_exchange_send' functions
  migration/rdma: Add the function for dynamic page registration
  migration/rdma: register memory for multifd RDMA channels
  migration/rdma: Wait for all multifd to complete registration
  migration/rdma: use multifd to migrate VM for rdma-pin-all mode
  migration/rdma: use multifd to migrate VM for NOT rdma-pin-all mode
  migration/rdma: only register the memory for multifd channels
  migration/rdma: RDMA cleanup for multifd migration

 migration/migration.c |  19 ++
 migration/migration.h |   2 +
 migration/multifd.c   | 192 +++++++++++++-
 migration/multifd.h   |  12 +
 migration/qemu-file.c |   5 +
 migration/qemu-file.h |   1 +
 migration/rdma.c      | 579 +++++++++++++++++++++++-------------------
 migration/rdma.h      | 268 +++++++++++++++++++
 8 files changed, 804 insertions(+), 274 deletions(-)

--=20
2.19.1



