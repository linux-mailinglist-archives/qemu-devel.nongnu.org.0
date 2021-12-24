Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250847EE7D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:14:21 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iWi-0003lw-1C
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUO-00018V-Kk
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:57 -0500
Received: from relay.sw.ru ([185.231.240.75]:48177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUL-0003OT-Nw
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=DaYKrtPkUWUiZctSGq11L92UGGVV5crOdnu7xlftBUQ=; b=pEJHM//8jqt9
 NjxfPeoq+gwxdE1ugxtPpfjWsgICgLpwvvKvLUB6zOCNNvGH+9PLKjs0qLeX69zcJTyNj9GgJEUyA
 2rHUMn4ZF83qNwiB1epLgqoss9Wiue8n83AX7uYljA21J6fvCRw1Z7iLnsUwMUkBFGo9GH9Zc13Tu
 2CRZ0=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUG-004OwN-TP; Fri, 24 Dec 2021 14:11:48 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 0/6] migration: Add 'no-ram' and 'ram-only' cpabilities
Date: Fri, 24 Dec 2021 14:11:42 +0300
Message-Id: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=nikita.lapshin@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We want to implement exteranl bg-snapshot tool for saving RAM. For this it
is important to be able manage migration stream because tool has no idea
about non-RAM part and its size.

Possible solution is to send RAM separately. This can be done with
implemented RAM capabilities. These capabilities allow to send only RAM part
or non-RAM part so tool can save non-RAM part without special handlers.
RAM will be saved with special handlers for postcopy load.

Nikita Lapshin (6):
  migration: is_ram changed to is_iterable
  migration: should_skip() implemented
  migration: Add no-ram capability
  migration: Add ram-only capability
  migration: analyze-migration script changed
  migration: Test for ram capabilities

 migration/migration.c                         | 29 +++++-
 migration/migration.h                         |  2 +
 migration/ram.c                               |  6 ++
 migration/savevm.c                            | 63 ++++++------
 qapi/migration.json                           | 11 ++-
 scripts/analyze-migration.py                  | 19 ++--
 .../tests/migrate-ram-capabilities-test       | 96 +++++++++++++++++++
 .../tests/migrate-ram-capabilities-test.out   |  5 +
 8 files changed, 192 insertions(+), 39 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/migrate-ram-capabilities-test
 create mode 100644 tests/qemu-iotests/tests/migrate-ram-capabilities-test.out

-- 
2.27.0


