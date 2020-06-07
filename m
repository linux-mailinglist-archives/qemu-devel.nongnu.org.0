Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDD81F0F69
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 22:02:19 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ji1Uo-0005rY-1z
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 16:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ji1Pv-0000lp-Hf
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 15:57:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:14944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ji1Pu-0006Uc-NN
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 15:57:15 -0400
IronPort-SDR: hSy4R+TIpphgrH5qLwb7HZPsHXP8fRjSSSMTRzbNLY9/3YzcIk7lwnH/El2gQroEtkdH4G2+lz
 HJ5BqqV9eW6w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2020 12:57:12 -0700
IronPort-SDR: yc+xQq563Rd0ooyLNDsYv/GcJ3bxMS1YloeXFuvGk+RuUmp2SYArOO3hES0Lh2sj40R02UBZW4
 bj9Rvqbb8uRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,485,1583222400"; d="scan'208";a="446509269"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga005.jf.intel.com with ESMTP; 07 Jun 2020 12:57:11 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V3 3/3] migration/migration.c: Remove MIGRATION_STATUS_ACTIVE
 in migration_iteration_finish
Date: Mon,  8 Jun 2020 03:46:11 +0800
Message-Id: <20200607194611.24763-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607194611.24763-1-chen.zhang@intel.com>
References: <20200607194611.24763-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/07 15:57:07
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Zhang Chen <chen.zhang@intel.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

MIGRATION_STATUS_ACTIVE is invalid here, handle it by default case.

Suggested-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 migration/migration.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9059238e3d..9958b15202 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3319,11 +3319,6 @@ static void migration_iteration_finish(MigrationState *s)
          */
         s->vm_was_running = true;
         /* Fallthrough */
-    case MIGRATION_STATUS_ACTIVE:
-        /*
-         * We should really assert here, but since it's during
-         * migration, let's try to reduce the usage of assertions.
-         */
     case MIGRATION_STATUS_FAILED:
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_CANCELLING:
-- 
2.17.1


