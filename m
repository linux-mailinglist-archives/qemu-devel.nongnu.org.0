Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE873482270
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 07:19:48 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3BGV-0005pg-8n
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 01:19:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7S-0003NA-RE
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:3740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7P-0008Hl-VG
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640931023; x=1672467023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s3k6kkrt1N9POwJjN6dnIlEGBhgDYluFhq9ap4BR2zI=;
 b=APRn2cLPTPPQ5iS0qIxnZhbt6gmF/K06UQxrt2YcAwsWyYNlBxH4xPT7
 1IZiwqMm49oXzUM/aPTWtZpXwxqfotsAjSWhB1LYMeF7kOqxrBIaxz5K6
 tQHfglNl63+ZK6e0Zz5vjpTFbw3+/W8t4hMCsJuCbMJyUfFEVZSn70m95
 fCgcHQI6zIppodeD4S4RiMpmM1Othp26AMvB5u51ywWg8xS+2PL3EyANO
 fDZAa2gyvjFhCnYGOMNp0YFPZ3k6gTZLFvS+Z+VgMaXzirSByHMyJPfFZ
 4ggmkjcz0m0KQ6Bav9gcXq4xXHoculhuQ4ncpwb1hYDkx33ZV7oxi5Xw0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="328110754"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="328110754"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="470867779"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:17 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 0/3] Some minor fixes for migration states
Date: Fri, 31 Dec 2021 13:59:32 +0800
Message-Id: <20211231055935.1878503-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


