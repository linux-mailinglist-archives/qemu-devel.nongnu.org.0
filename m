Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A86E4A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:47:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPCL-0006H2-La; Mon, 17 Apr 2023 09:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <you.chen@intel.com>)
 id 1poKPX-0001C0-MW
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:40:31 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <you.chen@intel.com>)
 id 1poKPU-0003jF-DB
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681720828; x=1713256828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4wMXl4Jb2ueE49v0F8kZmSOZgeAsNT+xfCyqjXRuV7A=;
 b=JSV3JeRR5FMjem+r3x2uVDGxLh3ZRXB04JqHPLdonk5BMARacjohgOhQ
 bdzmtvlUT80769uhAiqgKD/uXjnjlS3gl3GsqXLOLjJtH6tG/AvPifvOk
 svQPgAkXdFWDrH9fk+nhM9z2yVx9DWk7bJMyRaefUnDmDSZNk9hwGIr4B
 w8fKk3odBql+CzgNhyLeC9VApefqluFnagM4jq3sva9qhjAPGobkibwAT
 EEpoWrDE7eV60r1SkADNKFC2uRoIQloJGKrFy55Hk1H9y/qsmJYFl/jC+
 zYTYdzeORhoXa0RRR8bj1slzgdoraYjLIzbt9f3NO/mtAwLLA86cvzjmR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344838007"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="344838007"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 01:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684086668"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="684086668"
Received: from unknown (HELO inspur05.sh.intel.com) ([10.112.227.25])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 01:40:18 -0700
From: "you.chen" <you.chen@intel.com>
To: qemu-devel@nongnu.org
Cc: "you.chen" <you.chen@intel.com>,
	"dennis . wu" <dennis.wu@intel.com>
Subject: [PATCH v2 0/2] migration: use qatzip to acclerate the live migration
Date: Mon, 17 Apr 2023 16:39:33 +0800
Message-Id: <20230417083935.415782-1-you.chen@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=you.chen@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Apr 2023 09:47:01 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changes in V2:
1. Added CONFIG_QATZIP macro to control this feature

2. removed useless code changes

3. fixed typos

WIP: tests still under development

Hello, 

qatzip https://github.com/intel/QATzip is a project that
supply the zlib like api with the Intel QAT hardware.
compress and decompress performance with small data block
(4kb page) is low with qatzip API. so we compose multiple
pages into a multi page address structure which is a buffer
list, then we compose these pages together and then call
compress and decompress. we also expand the io_buf_size
since qat is fast have have stress to the IO_BUFF.

If there is no QAT hardware, qatzip will fall back to the
software with proper configuration. that mean if host server
have the QAT hardware, while destination server don't have QAT,
the live migration still work well.

To use the qatzip, one parameter is added in both host and
destination side:
(qemu) migrate_set_parameter compress-with-qat on
if you proper eabled the qatzip, then you can benefit from
the QAT acceleration.

Since the compress/decompress offloading to the QAT hardware,
no CPU resource needed (only a periodic polling need some CPU
resource).

For the performance, with the same threads scale, with QATzip
(HW), the live migration will have 2~4 time of performance.

Plan: so far qatzip API support SVM，but no batch APIs and the
requirement is raised. once the batch APIs ready, the perf expect
to reach close to 10x.

Co-developed-by: dennis.wu <dennis.wu@intel.com>

you.chen (2):
  migration: add build option to support qemu build with qatzip
  migration: add support for qatzip compression when doing live
    migration

 meson.build                    |  11 +-
 meson_options.txt              |   2 +
 migration/migration-hmp-cmds.c |   4 +
 migration/migration.c          |  22 ++
 migration/migration.h          |   1 +
 migration/qemu-file.c          |  15 +-
 migration/qemu-file.h          |   5 +
 migration/ram.c                | 675 +++++++++++++++++++++++++++++----
 qapi/migration.json            |   8 +-
 scripts/meson-buildoptions.sh  |   3 +
 10 files changed, 673 insertions(+), 73 deletions(-)

-- 
2.27.0


