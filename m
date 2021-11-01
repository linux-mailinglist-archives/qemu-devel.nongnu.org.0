Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A3C441507
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:08:25 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSMi-00006s-EJ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJy-0003Jb-Oj
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJv-0004NE-9a
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="228421398"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="228421398"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 01:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488541588"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 01:05:26 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v2 4/7] colo: fixed 'Segmentation fault' when the simplex mode
 PVM poweroff
Date: Mon,  1 Nov 2021 15:57:02 +0800
Message-Id: <1635753425-11756-5-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=lei.rao@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The GDB statck is as follows:
Program terminated with signal SIGSEGV, Segmentation fault.
0  object_class_dynamic_cast (class=0x55c8f5d2bf50, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:832
         if (type->class->interfaces &&
[Current thread is 1 (Thread 0x7f756e97eb00 (LWP 1811577))]
(gdb) bt
0  object_class_dynamic_cast (class=0x55c8f5d2bf50, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:832
1  0x000055c8f2c3dd14 in object_dynamic_cast (obj=0x55c8f543ac00, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:763
2  0x000055c8f2c3ddce in object_dynamic_cast_assert (obj=0x55c8f543ac00, typename=0x55c8f2f7379e "qio-channel",
    file=0x55c8f2f73780 "migration/qemu-file-channel.c", line=117, func=0x55c8f2f73800 <__func__.18724> "channel_shutdown") at qom/object.c:786
3  0x000055c8f2bbc6ac in channel_shutdown (opaque=0x55c8f543ac00, rd=true, wr=true, errp=0x0) at migration/qemu-file-channel.c:117
4  0x000055c8f2bba56e in qemu_file_shutdown (f=0x7f7558070f50) at migration/qemu-file.c:67
5  0x000055c8f2ba5373 in migrate_fd_cancel (s=0x55c8f4ccf3f0) at migration/migration.c:1699
6  0x000055c8f2ba1992 in migration_shutdown () at migration/migration.c:187
7  0x000055c8f29a5b77 in main (argc=69, argv=0x7fff3e9e8c08, envp=0x7fff3e9e8e38) at vl.c:4512

The root cause is that we still want to shutdown the from_dst_file in
migrate_fd_cancel() after qemu_close in colo_process_checkpoint().
So, we should set the s->rp_state.from_dst_file = NULL after
qemu_close().

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/colo.c b/migration/colo.c
index 616dc00af7..907241ab5c 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -640,6 +640,7 @@ out:
      */
     if (s->rp_state.from_dst_file) {
         qemu_fclose(s->rp_state.from_dst_file);
+        s->rp_state.from_dst_file = NULL;
     }
 }
 
-- 
2.30.2


