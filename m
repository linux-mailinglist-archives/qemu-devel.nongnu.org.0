Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBF351202
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:28:20 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtch-00049h-VI
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtXE-0006s7-Va
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:49892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX5-0006Ur-6b
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=ekx+sVi13apei4mNX/i6GowawZdZltdKXlwiXY93H5Y=; b=gcTYmw/5tf4J
 su82W3sNu1v3CDvhZFGxDL7V/1yCq6AceDAHVmhv4/HhCOEDJi+l7SD9/COrX0lGQE2i3x4e58DqS
 HLM6D5K2nWeHSQK9ImWscotBUJcGNpqXnY+NvRRbn0ApXE2MaLCoy/Hwv4VMusvMD2cv51AO0Q16O
 J5ySU=;
Received: from [192.168.15.162] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX1-000DxR-AD; Thu, 01 Apr 2021 12:22:27 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH for-6.0 v1 0/4] migration: Fixes to the 'background-snapshot'
 code
Date: Thu,  1 Apr 2021 12:22:22 +0300
Message-Id: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
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

Changes v0->v1:
 * Fixes to coding style and commit messages
 * Renamed 'bs' to 'block' in migration/ram.c background snapshot code

This patch series contains:
 * Fix to the issue with occasionally truncated non-iterable device state
 * Solution to compatibility issues with virtio-balloon device
 * Fix to the issue when discarded or never populated pages miss UFFD
   write protection and get into migration stream in dirty state
 * Renaming of 'bs' to commonly used 'block' in migration/ram.c background
   snapshot code

Andrey Gruzdev (4):
  migration: Fix missing qemu_fflush() on buffer file in
    bg_migration_thread
  migration: Inhibit virtio-balloon for the duration of background
    snapshot
  migration: Pre-fault memory before starting background snasphot
  migration: Rename 'bs' to 'block' in background snapshot code

 hw/virtio/virtio-balloon.c |   8 ++-
 include/migration/misc.h   |   2 +
 migration/migration.c      |  22 ++++++-
 migration/ram.c            | 119 ++++++++++++++++++++++++++-----------
 migration/ram.h            |   1 +
 5 files changed, 115 insertions(+), 37 deletions(-)

-- 
2.27.0


