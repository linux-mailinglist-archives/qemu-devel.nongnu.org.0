Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082B2C0F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:48:04 +0100 (CET)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khE4R-0006ZH-Dt
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1P-0005Aq-AX; Mon, 23 Nov 2020 10:44:55 -0500
Received: from relay.sw.ru ([185.231.240.75]:43414 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1M-0008JE-2u; Mon, 23 Nov 2020 10:44:54 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE0x-009zBo-1F; Mon, 23 Nov 2020 18:44:27 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com,
 dgilbert@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v2 0/2] Increase amount of data for monitor to read
Date: Mon, 23 Nov 2020 18:44:32 +0300
Message-Id: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

The subject was discussed here:
https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg00206.html

This series is a solution for the issue with QMP monitor buffered input.
A JSON little parser is introduced to separate QMP commands read from the
input buffer so that incoming requests do not overwhelm the monitor queue.
A side effect raised in the test #247 was managed in the first patch.
It may be considered as a workaround. Any sane fix suggested will be
appreciated.

Note:
This series goes after the Vladimir's one:
'[PATCH v3 00/25] backup performance: block_status + async"'
To make the test #129 passed, the following patch should be applied first:
'[PATCH v3 01/25] iotests: 129 don't check backup "busy"'.

v2:
  02: The static JSONthrottle object was made a member of the Chardev structure.
      The fd_chr_read functions were merged.
      The monitor thread synchronization was added to protect the input queue
      from overflow.

Andrey Shinkevich (2):
  iotests: add another bash sleep command to 247
  monitor: increase amount of data for monitor to read

 chardev/char-fd.c          | 35 +++++++++++++++++++++++++++++++++--
 chardev/char-socket.c      | 42 +++++++++++++++++++++++++++++++++++++++---
 chardev/char.c             | 41 +++++++++++++++++++++++++++++++++++++++++
 include/chardev/char.h     | 15 +++++++++++++++
 monitor/monitor.c          |  2 +-
 tests/qemu-iotests/247     |  2 ++
 tests/qemu-iotests/247.out |  1 +
 7 files changed, 132 insertions(+), 6 deletions(-)

-- 
1.8.3.1


