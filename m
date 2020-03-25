Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEC192157
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 07:51:53 +0100 (CET)
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGztI-0005aP-HK
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 02:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.hu@linux.intel.com>) id 1jGzs9-0004mH-4Q
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 02:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.hu@linux.intel.com>) id 1jGzs8-0003vR-4f
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 02:50:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:16672)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <robert.hu@linux.intel.com>)
 id 1jGzs7-0003dc-TO
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 02:50:40 -0400
IronPort-SDR: Lnmjbkb8iNgBpKJYlMSvbVzI8aXTUyjubhDcJ9oJ+8eHpUiGWTVagrjhoBzbZ7kVGyD50eB4I1
 FvYMUTl9nJCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 23:50:33 -0700
IronPort-SDR: VKlaw+bhzTXJ4huxMnj3R1isTGuBVE0tVuGQGY7Es/DQGgLkNtzGQhKYjdUUnXSS010RHneb2o
 wK1aTt8Eqkaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,303,1580803200"; d="scan'208";a="326149618"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga001.jf.intel.com with ESMTP; 24 Mar 2020 23:50:32 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org
Subject: [PATCH 1/2] util/bufferiszero: assign length_to_accel value for each
 accelerator case
Date: Wed, 25 Mar 2020 14:50:20 +0800
Message-Id: <1585119021-46593-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.120
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
Cc: robert.hu@intel.com, Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because in unit test, init_accel() will be called several times, each with
different accelerator type.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
---
 util/bufferiszero.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index 6639035..b801253 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -254,13 +254,16 @@ static void init_accel(unsigned cache)
     bool (*fn)(const void *, size_t) = buffer_zero_int;
     if (cache & CACHE_SSE2) {
         fn = buffer_zero_sse2;
+        length_to_accel = 64;
     }
 #ifdef CONFIG_AVX2_OPT
     if (cache & CACHE_SSE4) {
         fn = buffer_zero_sse4;
+        length_to_accel = 64;
     }
     if (cache & CACHE_AVX2) {
         fn = buffer_zero_avx2;
+        length_to_accel = 64;
     }
 #endif
 #ifdef CONFIG_AVX512F_OPT
-- 
1.8.3.1


