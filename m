Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E6FFE21
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 06:51:20 +0100 (CET)
Received: from localhost ([::1]:58232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWZwV-0000iF-NZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 00:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iWZuS-0007cH-0v
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 00:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iWZuQ-0005aW-TD
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 00:49:11 -0500
Received: from relay.sw.ru ([185.231.240.75]:42494)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iWZuQ-0005a7-KS; Mon, 18 Nov 2019 00:49:10 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iWZuL-00029C-0V; Mon, 18 Nov 2019 08:49:05 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v8 0/3] qcow2: advanced compression options
Date: Mon, 18 Nov 2019 08:49:01 +0300
Message-Id: <1574056144-625164-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compression filter driver is introduced as suggested by Max.
A sample usage of the filter can be found in the test #214.
Now, multiple clusters can be written compressed.
It is useful for the backup job.

v8: The filter child was changed from the 'backing' to the 'file' one.

  Discussed in the email thread with the message ID
  <1573670589-229357-1-git-send-email-andrey.shinkevich@virtuozzo.com>

Andrey Shinkevich (3):
  block: introduce compress filter driver
  qcow2: Allow writing compressed data of multiple clusters
  tests/qemu-iotests: add case to write compressed data of multiple
    clusters

 block/Makefile.objs        |   1 +
 block/filter-compress.c    | 201 +++++++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c              | 102 +++++++++++++++++------
 qapi/block-core.json       |  10 ++-
 tests/qemu-iotests/214     |  43 ++++++++++
 tests/qemu-iotests/214.out |  14 ++++
 6 files changed, 340 insertions(+), 31 deletions(-)
 create mode 100644 block/filter-compress.c

-- 
1.8.3.1


