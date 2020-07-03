Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC83213AB8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:17:52 +0200 (CEST)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLZf-00041b-2h
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLW4-0006vo-9t; Fri, 03 Jul 2020 09:14:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:60344 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVv-0007eP-Tw; Fri, 03 Jul 2020 09:14:07 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVj-0004Vj-Hx; Fri, 03 Jul 2020 16:13:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 00/10] iotests: Dump QCOW2 dirty bitmaps metadata
Date: Fri,  3 Jul 2020 16:13:40 +0300
Message-Id: <1593782030-521984-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 09:13:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirty bitmap information to QCOW2 metadata dump in the qcow2_format.py.

v8:
  01: Hard refactoring of the v7 code in qcow2_format.py based on Vladimir's
      review. See the thread with the message ID:
      <1591920302-1002219-1-git-send-email-andrey.shinkevich@virtuozzo.com>

Andrey Shinkevich (10):
  qcow2: Fix capitalization of header extension constant.
  qcow2_format.py: make printable data an extension class member
  qcow2_format.py: change Qcow2BitmapExt initialization method
  qcow2_format.py: dump bitmap flags in human readable way.
  qcow2_format.py: Dump bitmap directory information
  qcow2_format.py: pass cluster size to substructures
  qcow2_format.py: Dump bitmap table serialized entries
  qcow2.py: Introduce '-j' key to dump in JSON format
  qcow2_format.py: collect fields to dump in JSON format
  qcow2_format.py: support dumping metadata in JSON format

 block/qcow2.c                      |   2 +-
 docs/interop/qcow2.txt             |   2 +-
 tests/qemu-iotests/291.out         |  90 ++++++++++++++++
 tests/qemu-iotests/qcow2.py        |  19 +++-
 tests/qemu-iotests/qcow2_format.py | 212 ++++++++++++++++++++++++++++++++++---
 5 files changed, 304 insertions(+), 21 deletions(-)

-- 
1.8.3.1


