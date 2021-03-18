Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F8340C3F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:56:09 +0100 (CET)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwsS-0003Er-JF
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwja-0005YT-S2
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:46:58 -0400
Received: from relay.sw.ru ([185.231.240.75]:57072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwjW-0007W5-A7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=uZqo79+4riuaU4kPC8ycWiLbiue3kPv1vjTtedZbklw=; b=S7JKTW43Nv0n
 bzE63iZAzj/WhIwowQUfqU8mzxSowincwFjYd/T72zF9+X3mvqWpM2RfkXCLCJrG/EijSG3r82MuL
 jxaKNzfovJSWfoaRjoDuWWdgtbs8j8qicBdjdJNqW5eM6FKQX3dC5l1iL7asbK4KGt3MipDgViTs3
 6eWmU=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwio-003De5-DS; Thu, 18 Mar 2021 20:46:10 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH 0/3] migration: Fixes to the 'background-snapshot' code
Date: Thu, 18 Mar 2021 20:46:08 +0300
Message-Id: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
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

 hw/virtio/virtio-balloon.c |  8 ++++--
 include/migration/misc.h   |  2 ++
 migration/migration.c      | 18 +++++++++++++-
 migration/ram.c            | 51 ++++++++++++++++++++++++++++++++++++++
 migration/ram.h            |  1 +
 5 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.25.1


