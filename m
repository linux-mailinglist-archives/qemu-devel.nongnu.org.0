Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809901F1123
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 03:48:30 +0200 (CEST)
Received: from localhost ([::1]:53208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ji6tp-0003aE-3e
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 21:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1ji6t2-00035p-26
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 21:47:40 -0400
Received: from mga07.intel.com ([134.134.136.100]:29986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1ji6t0-0008CY-56
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 21:47:39 -0400
IronPort-SDR: U5EYRy6M9iZdpjJJBkDQCOTyYY9GHpiPP1aV0RPhl985tVPlezA/RzdduUUM+VnU3t0ekTXEyX
 LcUeWu0YSNSQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2020 18:47:27 -0700
IronPort-SDR: lGcwjIKfY9OMbkkkDt7fhx0D3oqqqXB3mHbfvX7ykWtJ+P8IeN1PN58HYbtad9OBdSqm/gynEO
 kQ/2NeXnaiUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,486,1583222400"; d="scan'208";a="472535312"
Received: from devel-ww.sh.intel.com ([10.239.48.118])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2020 18:47:25 -0700
From: Wei Wang <wei.w.wang@intel.com>
To: qemu-devel@nongnu.org, dgilbert@redhat.com, richard.henderson@linaro.org
Subject: [PATCH] migration: fix xbzrle encoding rate calculation
Date: Mon,  8 Jun 2020 08:53:27 +0800
Message-Id: <1591577607-13998-1-git-send-email-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=wei.w.wang@intel.com; helo=mga07.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/07 21:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: yi.y.sun@intel.com, wei.w.wang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's reported an error of implicit conversion from "unsigned long" to
"double" when compiling with Clang 10. Simply make the encoding rate 0
when the encoded_size is 0.

Fixes: e460a4b1a4
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 migration/ram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 41cc530..069b6e3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -913,10 +913,8 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
         unencoded_size = (xbzrle_counters.pages - rs->xbzrle_pages_prev) *
                          TARGET_PAGE_SIZE;
         encoded_size = xbzrle_counters.bytes - rs->xbzrle_bytes_prev;
-        if (xbzrle_counters.pages == rs->xbzrle_pages_prev) {
+        if (xbzrle_counters.pages == rs->xbzrle_pages_prev || !encoded_size) {
             xbzrle_counters.encoding_rate = 0;
-        } else if (!encoded_size) {
-            xbzrle_counters.encoding_rate = UINT64_MAX;
         } else {
             xbzrle_counters.encoding_rate = unencoded_size / encoded_size;
         }
-- 
2.7.4


