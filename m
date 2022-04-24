Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07650D16B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 13:09:10 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nia73-00054p-JG
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 07:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nia5B-0004EV-I4
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 07:07:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:24900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nia59-0000G7-5R
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 07:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650798431; x=1682334431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MtAHVFfKlLKFQVuNv4nlYgXNBJRN1ruIxBGa+ZkEiyk=;
 b=J8TC6o5jlnBR6w72PaGUr5wId21tod2rWDVp73O+inKOWJ6Lrnmwow5W
 0xEJv5wNNHmaAS55QEkEGeO+00/AD4vNt13x3GSeMTWH4suVtgz3Of0YD
 KcWTnl/tOwNHmxrabfV82nGptghxwWg2k7DcYcS/GIHm7fTOmMwe1gN9D
 Bsd30GZFxdAQQVqRYHWwg/7IRkbljFRA19sfQ4qUUhIK64ttqy1HnVIuN
 CgpUMNn7fs1JjWGkF/aBEkiOYRI3egYtDXl0sjiGynqAr0YhLQ9XZ6y7/
 2lZ05c0/pry30hmC9ybEWQlnu6uqS+ttorDYlvOi5oVUdGP7nUdNNZ+hk g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="244958203"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; d="scan'208";a="244958203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 04:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; d="scan'208";a="675390006"
Received: from npg-dpdk-haiyue-2.sh.intel.com ([10.67.111.4])
 by orsmga004.jf.intel.com with ESMTP; 24 Apr 2022 04:07:02 -0700
From: Haiyue Wang <haiyue.wang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] error-report: fix g_date_time_format assertion
Date: Sun, 24 Apr 2022 18:31:20 +0800
Message-Id: <20220424103120.284688-1-haiyue.wang@intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=haiyue.wang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Haiyue Wang <haiyue.wang@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'g_get_real_time' returns the number of microseconds since January
1, 1970 UTC, but 'g_date_time_new_from_unix_utc' needs the number of
seconds, so it will cause the invalid time input:

(process:279642): GLib-CRITICAL (recursed) **: g_date_time_format: assertion 'datetime != NULL' failed

Call 'g_date_time_new_now' with UTC time zone, it has the same result as
'g_date_time_new_from_unix_utc(g_get_real_time()/1e6)';

Fixes: 73dab893b569 ("error-report: replace deprecated g_get_current_time() with glib >= 2.62")
Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index dbadaf206d..4000fff14a 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -173,7 +173,7 @@ static char *
 real_time_iso8601(void)
 {
 #if GLIB_CHECK_VERSION(2,62,0)
-    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    g_autoptr(GDateTime) dt = g_date_time_new_now(g_time_zone_new_utc());
     /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-- 
2.36.0


