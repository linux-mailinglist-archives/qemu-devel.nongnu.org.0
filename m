Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DFE28DA89
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 09:37:06 +0200 (CEST)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSbLM-0000hL-OV
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 03:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kSbDD-0007vN-K8
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 03:28:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:54373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kSbDB-000450-LA
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 03:28:39 -0400
IronPort-SDR: g0L9fK/bF9wm0a1xPQy0H451BlBddWPYdvV7fb8hPaArve2MkntZzNFCRZ1glDeEAyOQUWthmo
 s6Zti6MoruNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="250751935"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="250751935"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 00:28:34 -0700
IronPort-SDR: xswjruwCl33sxOddG5BUk3RPBhXaGz5WrwO5xQhP+CzhU+PAkAXjxI0oK76ayJmJ2hvMCFPGv9
 LkOROfCOdZyg==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="521323060"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 00:28:33 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 08/10] net/colo-compare.c: Change the timer clock type
Date: Wed, 14 Oct 2020 15:25:54 +0800
Message-Id: <20201014072555.12515-9-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014072555.12515-1-chen.zhang@intel.com>
References: <20201014072555.12515-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:28:22
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=2.199, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

The virtual clock only runs during the emulation. It stops
when the virtual machine is stopped.
The host clock should be used for device models that emulate accurate
real time sources. It will continue to run when the virtual machine
is suspended. COLO need to know the host time here.

Reported-by: Derek Su <dereksu@qnap.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 net/colo-compare.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index f4814c5f09..61c95fe7e9 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -899,7 +899,7 @@ static void check_old_packet_regular(void *opaque)
 
     /* if have old packet we will notify checkpoint */
     colo_old_packet_check(s);
-    timer_mod(s->packet_check_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+    timer_mod(s->packet_check_timer, qemu_clock_get_ms(QEMU_CLOCK_HOST) +
               s->expired_scan_cycle);
 }
 
@@ -933,10 +933,10 @@ static void colo_compare_timer_init(CompareState *s)
 {
     AioContext *ctx = iothread_get_aio_context(s->iothread);
 
-    s->packet_check_timer = aio_timer_new(ctx, QEMU_CLOCK_VIRTUAL,
+    s->packet_check_timer = aio_timer_new(ctx, QEMU_CLOCK_HOST,
                                 SCALE_MS, check_old_packet_regular,
                                 s);
-    timer_mod(s->packet_check_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+    timer_mod(s->packet_check_timer, qemu_clock_get_ms(QEMU_CLOCK_HOST) +
               s->expired_scan_cycle);
 }
 
-- 
2.17.1


