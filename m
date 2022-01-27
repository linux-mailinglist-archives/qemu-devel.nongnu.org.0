Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A3649D7D0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 03:04:05 +0100 (CET)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCu8q-00064q-8Q
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 21:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu6f-0004J6-Ac
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:01:49 -0500
Received: from mga12.intel.com ([192.55.52.136]:34862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu6c-0003Dp-Sk
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643248906; x=1674784906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d2VsWESpgj046/PO/YBzhVPv8W3jFc7YMuEQz0lquQQ=;
 b=TiKQp7sJJ16Qwio/v3D1TZ/WXHQazqrA27HS6GzEXLxH8uZLNUQ+yHZS
 Xvmuj6vXozV3W1+2dm1tctBx0ZK7cj+U2juXhmLm4ZoMkdrnadxyDm5Lk
 POkZUQJUcU9RC3QuSDRUe33xEyECp9RoK6q9+QFVp44C/nld3WMbKWcjM
 ELM/21NxY0wUM3EY1klLRZNpmXkCPZ/GgwFmKktGw0DI9SOuKJ7JVnYk0
 trbjfQ54596OB7RszCOJbs/TDo7yp1lVEQxB5ESXMHVvNxZeCUWc0u/Yd
 VciFATK7iisXhYLr0TV96TBvnOVKTx+ldzl/WqJVug5yumwGS/3o090Hj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226695372"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="226695372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:01:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="535434802"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:01:04 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 0/3] Some minor fixes for migration states
Date: Thu, 27 Jan 2022 09:49:54 +0800
Message-Id: <20220127014957.3262813-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series solved some fixme and comments in code.
Please see the details in each patch commit message.

 --V2:
       -Fix typo.


Zhang Chen (3):
  migration/migration.c: Add missed default error handler for migration
    state
  migration/migration.c: Avoid COLO boot in postcopy migration
  migration/migration.c: Remove the MIGRATION_STATUS_ACTIVE when
    migration finished

 migration/migration.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

-- 
2.25.1


