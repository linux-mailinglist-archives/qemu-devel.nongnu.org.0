Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F523C9D1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 12:14:16 +0200 (CEST)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3GR5-0006LU-Me
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 06:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1k3GLZ-0007qK-TG; Wed, 05 Aug 2020 06:08:33 -0400
Received: from relay.sw.ru ([185.231.240.75]:59668 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1k3GLV-0001JP-N0; Wed, 05 Aug 2020 06:08:33 -0400
Received: from [192.168.15.207] (helo=iris.lishka.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1k3GLQ-0004tP-0v; Wed, 05 Aug 2020 13:08:24 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] block/block-backend: add converter from BlockAcctStats to
 BlockBackend
Date: Wed,  5 Aug 2020 13:08:22 +0300
Message-Id: <20200805100824.16817-2-den@openvz.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805100824.16817-1-den@openvz.org>
References: <20200805100824.16817-1-den@openvz.org>
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 06:08:25
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now BlockAcctStats is always reside on BlockBackend. This structure
is not used in any other place. Thus we are able to create a converter
from one pointer to another.

Signed-off-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
---
 block/block-backend.c          | 5 +++++
 include/sysemu/block-backend.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 3a13cb5f0b..88e531df98 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2153,6 +2153,11 @@ BlockAcctStats *blk_get_stats(BlockBackend *blk)
     return &blk->stats;
 }
 
+BlockBackend *blk_stats2blk(BlockAcctStats *s)
+{
+    return container_of(s, BlockBackend, stats);
+}
+
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
                   BlockCompletionFunc *cb, void *opaque)
 {
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 8203d7f6f9..bd4694e7bc 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -227,6 +227,7 @@ void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify);
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
 BlockAcctStats *blk_get_stats(BlockBackend *blk);
+BlockBackend *blk_stats2blk(BlockAcctStats *stats);
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk);
 void blk_update_root_state(BlockBackend *blk);
 bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk);
-- 
2.17.1


