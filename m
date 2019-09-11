Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12052AF4B2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 05:35:03 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tPJ-00027T-V6
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 23:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLx-00077J-1E
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLv-0003gR-QI
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:32 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2080)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLv-0003ZO-79
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:31 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35d786a84012-eb741;
 Wed, 11 Sep 2019 11:31:16 +0800 (CST)
X-RM-TRANSID: 2ee35d786a84012-eb741
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d786a7b269-ac9ba;
 Wed, 11 Sep 2019 11:31:16 +0800 (CST)
X-RM-TRANSID: 2ee15d786a7b269-ac9ba
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 11:31:04 +0800
Message-Id: <555aac83ecd42d21e6311962e793dd4ce2a77902.1568170994.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
In-Reply-To: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] =?utf-8?q?=5BPATCH_v2_3/3=5D_tests/migration?=
 =?utf-8?q?=EF=BC=9Afix_unreachable_path_in_stress_test?=
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if stress function always return 0, the path
'if (stress(ramsizeGB, ncpus) < 0)' is nerver unreachable,
so fix it to allow the test failed.

Cc: armbru@redhat.com
Cc: laurent@vivier.eu
Cc: tony.nguyen@bt.com

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 tests/migration/stress.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 19a6eff5fd..35903d90c4 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -224,6 +224,7 @@ static int stressone(unsigned long long ramsizeMB)
             }
         }
     }
+    return 0;
 }
 
 
@@ -248,9 +249,7 @@ static int stress(unsigned long long ramsizeGB, int ncpus)
                        stressthread,   &ramsizeMB);
     }
 
-    stressone(ramsizeMB);
-
-    return 0;
+    return stressone(ramsizeMB);
 }
 
 
-- 
2.17.1




