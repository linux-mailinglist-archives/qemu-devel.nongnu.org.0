Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8D36B3D4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:10:53 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb10m-000050-KG
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1laulF-0004va-6b; Mon, 26 Apr 2021 02:30:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:63423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1laulB-0007xK-6Q; Mon, 26 Apr 2021 02:30:24 -0400
IronPort-SDR: 0VQnWplUhKdcBxraKGIz+dc89vL8s7r9Krgs9GRwjyQXdxqLugkaALEg2lMnR+ynKRLxFg5p18
 ENEu4JxoZncw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="260240567"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; d="scan'208";a="260240567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2021 23:30:06 -0700
IronPort-SDR: AkVlfQ4N4YI3SAok1heT26gTzJ9I0Q1ZPNjLzbTtvrLmq96LDme3WI3tSInu0yxB4Rm93tA0Fv
 cuPHhWETssGA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; d="scan'208";a="429264602"
Received: from duan-optiplex-7080.bj.intel.com ([10.238.156.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2021 23:30:05 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cutils: Fix memleak in get_relocated_path()
Date: Tue, 27 Apr 2021 06:30:42 +0800
Message-Id: <20210426223042.119554-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=zhenzhong.duan@intel.com; helo=mga07.intel.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 09:08:51 -0400
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
 Zhenzhong Duan <zhenzhong.duan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Valgrind complains definitely loss in get_relocated_path(), because
GString is leaked in get_relocated_path() when returning with gchar *.
Use g_string_free(, false) to free GString while preserving gchar *.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 util/cutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index ee908486da..f58c2157d2 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
         assert(G_IS_DIR_SEPARATOR(dir[-1]));
         g_string_append(result, dir - 1);
     }
-    return result->str;
+    return g_string_free(result, FALSE);
 }
-- 
2.25.1


