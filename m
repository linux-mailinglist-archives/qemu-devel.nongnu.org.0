Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E03503E3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:56:01 +0200 (CEST)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdCJ-0001bt-Vn
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRd4r-0002bh-MX
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:48:17 -0400
Received: from relay.sw.ru ([185.231.240.75]:58770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRd4p-0003NB-HH
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=dRk7v0qRsWFBk9SvSvFpfMdMexwniOQLP8F1LKU7U60=; b=KXD3F3n1SZP3
 7FAbdIJXew7msGRKugol+E+Ol1GbRJoU9a6QMRO524vpTecLPmMuERxxW7wnMnaBEbNLNKYTR9OBn
 7QR1/P2i1euhX5LYWUPaktCJspdA1mKZlMzFZQb8T9NufVyxH6ks7lM2O3cYMFvpTtXelfWMstYop
 ipfXA=;
Received: from [192.168.15.162] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRd4k-000CqQ-9a; Wed, 31 Mar 2021 18:48:10 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v2 0/3] migration: Fixes to the 'background-snapshot' code
Date: Wed, 31 Mar 2021 18:48:06 +0300
Message-Id: <20210331154809.86052-1-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Changes v1->v2:
 * Added comment over the overlooked qemu_flush() in bg_migration_thread

Changes v0->v1:
 * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
   page size in ram_block_populate_pages()
 * More elegant implementation of ram_block_populate_pages()

This patch series contains:
 * Fix to the issue with occasionally truncated non-iterable device state
 * Solution to compatibility issues with virtio-balloon device
 * Fix to the issue when discarded or never populated pages miss UFFD
   write protection and get into migration stream in dirty state

Andrey Gruzdev (3):
  migration: Fix missing qemu_fflush() on buffer file in
    bg_migration_thread
  migration: Inhibit virtio-balloon for the duration of background
    snapshot
  migration: Pre-fault memory before starting background snasphot

 hw/virtio/virtio-balloon.c |  8 +++++--
 include/migration/misc.h   |  2 ++
 migration/migration.c      | 22 ++++++++++++++++-
 migration/ram.c            | 48 ++++++++++++++++++++++++++++++++++++++
 migration/ram.h            |  1 +
 5 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.27.0


