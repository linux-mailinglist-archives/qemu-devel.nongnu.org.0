Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD372C6705
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:40:21 +0100 (CET)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidz2-00011F-S1
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvG-0005kc-S9; Fri, 27 Nov 2020 08:36:27 -0500
Received: from relay.sw.ru ([185.231.240.75]:52350 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidv5-000353-5u; Fri, 27 Nov 2020 08:36:25 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kiduZ-00AfjY-KL; Fri, 27 Nov 2020 16:35:43 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v3 0/5] Increase amount of data for monitor to read
Date: Fri, 27 Nov 2020 16:35:41 +0300
Message-Id: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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
https://patchew.org/QEMU/20190610105906.28524-1-dplotnikov@virtuozzo.com/#
Message-ID: <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
and v2:
Message-Id: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>

This series is a solution for the issue with overflow of the monitor queue
with QMP requests if we keep the maximum queue length unchanged (=8).

v3:
  01: New
  02: New
  03: The additional little JSON parser removed and the resources of the
      existing JSON parser were used to track the end of a QMP command.
  04: The amount of read input data increases only.

Andrey Shinkevich (4):
  monitor: change function obsolete name in comments
  monitor: drain requests queue with 'channel closed' event
  monitor: let QMP monitor track JSON message content
  monitor: increase amount of data for monitor to read

Vladimir Sementsov-Ogievskiy (1):
  iotests: 129 don't check backup "busy"

 include/qapi/qmp/json-parser.h |  5 ++--
 monitor/monitor.c              |  2 +-
 monitor/qmp.c                  | 66 ++++++++++++++++++++++++------------------
 qga/main.c                     |  2 +-
 qobject/json-lexer.c           | 30 +++++++++++++------
 qobject/json-parser-int.h      |  8 +++--
 qobject/json-streamer.c        | 15 +++++-----
 qobject/qjson.c                |  2 +-
 tests/qemu-iotests/129         |  1 -
 tests/qtest/libqtest.c         |  2 +-
 10 files changed, 79 insertions(+), 54 deletions(-)

-- 
1.8.3.1


