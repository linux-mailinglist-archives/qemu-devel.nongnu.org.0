Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152B1943AE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 16:58:06 +0100 (CET)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHUtQ-0002YS-53
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 11:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <s.reiter@proxmox.com>) id 1jHUs5-0000qx-Tg
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:56:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <s.reiter@proxmox.com>) id 1jHUs4-0002eG-QY
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:56:41 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:57081)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <s.reiter@proxmox.com>)
 id 1jHUs2-0002ZH-F0; Thu, 26 Mar 2020 11:56:38 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0336842E0D;
 Thu, 26 Mar 2020 16:56:36 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/3] Fix some AIO context locking in jobs
Date: Thu, 26 Mar 2020 16:56:25 +0100
Message-Id: <20200326155628.859862-1-s.reiter@proxmox.com>
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

I *think* the second patch also fixes the hangs on backup abort that I an=
d
Dietmar noticed in v1, but I'm not sure, they we're somewhat intermittent
before too.

Changes from v1:
* fixed commit message for patch 1
* added patches 2 and 3

Stefan Reiter (3):
  backup: don't acquire aio_context in backup_clean
  job: take each job's lock individually in job_txn_apply
  replication: acquire aio context before calling job_cancel_sync

 block/backup.c      |  4 ----
 block/replication.c |  6 +++++-
 job.c               | 32 ++++++++++++++++++++++++--------
 3 files changed, 29 insertions(+), 13 deletions(-)

--=20
2.26.0



