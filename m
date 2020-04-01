Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A219A6F6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 10:16:41 +0200 (CEST)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJYYC-0003aR-Aq
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 04:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <s.reiter@proxmox.com>) id 1jJYWs-0001rk-GV
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <s.reiter@proxmox.com>) id 1jJYWr-00072G-CY
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:18 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:56477)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <s.reiter@proxmox.com>)
 id 1jJYWo-0006f1-PK; Wed, 01 Apr 2020 04:15:14 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id DB86A458E5;
 Wed,  1 Apr 2020 10:15:10 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v4 0/3] Fix some AIO context locking in jobs
Date: Wed,  1 Apr 2020 10:15:01 +0200
Message-Id: <20200401081504.200017-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, slp@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Contains three seperate but related patches cleaning up and fixing some
issues regarding aio_context_acquire/aio_context_release for jobs. Mostly
affects blockjobs running for devices that have IO threads enabled AFAICT=
.

This is based on the discussions here:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07929.html

Changes from v3:
* commit_job appears to be unset in certain cases when replication_close =
is
  called, only access when necessary to avoid SIGSEGV

Missed this when shuffling around patches, sorry for noise with still-bro=
ken v3.

Changes from v2:
* reordered patch 1 to the end to not introduce temporary breakages
* added more fixes to job txn patch (should now pass the tests)

Changes from v1:
* fixed commit message for patch 1
* added patches 2 and 3


qemu: Stefan Reiter (3):
  job: take each job's lock individually in job_txn_apply
  replication: acquire aio context before calling job_cancel_sync
  backup: don't acquire aio_context in backup_clean

 block/backup.c        |  4 ----
 block/replication.c   |  8 +++++++-
 job.c                 | 48 ++++++++++++++++++++++++++++++++++---------
 tests/test-blockjob.c |  2 ++
 4 files changed, 47 insertions(+), 15 deletions(-)

--=20
2.26.0


