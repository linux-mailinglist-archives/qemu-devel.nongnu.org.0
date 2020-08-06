Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B280923E320
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:25:48 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3mSR-00050f-Oy
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k3lgO-0002Rh-Qb; Thu, 06 Aug 2020 15:36:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:56452 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k3lgJ-0000Kk-Pq; Thu, 06 Aug 2020 15:36:08 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k3lgB-0003k9-K1; Thu, 06 Aug 2020 22:35:55 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v13 00/11] iotests: Dump QCOW2 dirty bitmaps metadata
Date: Thu,  6 Aug 2020 22:35:46 +0300
Message-Id: <1596742557-320265-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 15:35:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

v13:
  01: Bitmaps are added without launching VM (suggested by Eric).
      The code amendments suggested by Vladimir.
  07: Bitmap table entry size zeroed up for all types but serialized.
  09: The extra dict variables removed. to_dict() renamed to to_json().
      The to_json() added to the class Qcow2BitmapTable. (By Vladimir).


Andrey Shinkevich (11):
  iotests: add test for QCOW2 header dump
  qcow2_format.py: make printable data an extension class member
  qcow2_format.py: change Qcow2BitmapExt initialization method
  qcow2_format.py: dump bitmap flags in human readable way.
  qcow2_format.py: Dump bitmap directory information
  qcow2_format.py: pass cluster size to substructures
  qcow2_format.py: Dump bitmap table serialized entries
  qcow2.py: Introduce '-j' key to dump in JSON format
  qcow2_format.py: collect fields to dump in JSON format
  qcow2_format.py: support dumping metadata in JSON format
  iotests: dump QCOW2 header in JSON in #303

 tests/qemu-iotests/303             |  63 +++++++++++
 tests/qemu-iotests/303.out         | 158 +++++++++++++++++++++++++++
 tests/qemu-iotests/group           |   1 +
 tests/qemu-iotests/qcow2.py        |  18 +++-
 tests/qemu-iotests/qcow2_format.py | 215 ++++++++++++++++++++++++++++++++++---
 5 files changed, 434 insertions(+), 21 deletions(-)
 create mode 100755 tests/qemu-iotests/303
 create mode 100644 tests/qemu-iotests/303.out

-- 
1.8.3.1


