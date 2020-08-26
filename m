Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3C252E96
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 14:18:49 +0200 (CEST)
Received: from localhost ([::1]:52888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAuO8-0005Gw-50
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 08:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kAuMe-0003aS-7T; Wed, 26 Aug 2020 08:17:16 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kAuMb-0004Cm-ST; Wed, 26 Aug 2020 08:17:15 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 228B9448BE;
 Wed, 26 Aug 2020 14:17:01 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] Add support for sequential backups
Date: Wed, 26 Aug 2020 14:13:56 +0200
Message-Id: <20200826121359.15450-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 08:17:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Backups can already be done for multiple drives in a transaction. However, these
jobs will start all at once, potentially hogging a lot of disk IO all at once.
This problem is made worse, since IO throttling is only available on a per-job
basis.

Add a flag to QMP to support sequential transactions for backups. This way,
every job will be executed one after the other, while still providing the
benefit of transactions (i.e. once one fails, all remaining ones will be
cancelled).

We've internally (in Proxmox VE) been doing sequential backups for a long time
with great success, albeit in a different fashion. This series is the result of
aligning our internal changes closer to upstream, and might be useful for other
people as well.


Stefan Reiter (3):
  job: add sequential transaction support
  blockdev: add sequential mode to *-backup transactions
  backup: initialize bcs bitmap on job create, not start

 block/backup.c        |  4 ++--
 blockdev.c            | 25 ++++++++++++++++++++++---
 include/qemu/job.h    | 12 ++++++++++++
 job.c                 | 24 ++++++++++++++++++++++++
 qapi/transaction.json |  6 +++++-
 5 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.20.1



