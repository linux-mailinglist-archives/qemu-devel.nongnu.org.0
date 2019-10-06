Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B9CCD5C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 02:06:05 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGu3o-0007oI-CF
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 20:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGu19-0006HQ-Jv
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGu18-0001kJ-Mt
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:11791)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGu18-0001jx-FN
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 17:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="393909931"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2019 17:03:15 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 0/3] migration/postcopy: replace have_listen_thread check with
 PostcopyState check
Date: Sun,  6 Oct 2019 08:02:46 +0800
Message-Id: <20191006000249.29926-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

have_listen_thread is used to be a indication of whether postcopy thread is
running. Since we use PostcopyState to record state and the postcopy thread
only runs when postcopy_is_running(), we can leverage the PostcopyState to
replace the meaning of have_listen_thread.

To do so, two preparation cleanup is included.

Wei Yang (3):
  migration/postcopy: mis->have_listen_thread check will never be
    touched
  migration/postcopy: postpone setting PostcopyState to END
  migration/postcopy: replace have_listen_thread check with
    PostcopyState check

 migration/migration.h    |  1 -
 migration/postcopy-ram.c |  2 --
 migration/ram.c          |  2 +-
 migration/ram.h          |  1 +
 migration/savevm.c       | 11 +++--------
 5 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.17.1


