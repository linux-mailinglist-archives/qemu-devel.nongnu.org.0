Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DBAEA14
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 14:14:04 +0200 (CEST)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7f22-0007fN-BB
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 08:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyR-0006FU-Cj
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyQ-0006MX-G8
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:19 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:8562)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyP-0006LW-Tp
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:18 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5d77929f6f2-e1ea2;
 Tue, 10 Sep 2019 20:10:07 +0800 (CST)
X-RM-TRANSID: 2eec5d77929f6f2-e1ea2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35d7792822a8-7d847;
 Tue, 10 Sep 2019 20:10:07 +0800 (CST)
X-RM-TRANSID: 2ee35d7792822a8-7d847
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 20:09:27 +0800
Message-Id: <20190910120927.1669283-4-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
References: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
Subject: [Qemu-devel] =?utf-8?q?=5BPATCH_3/3=5D_tests/migration=EF=BC=9Afi?=
 =?utf-8?q?x_unreachable_path_in_stress_test?=
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
Cc: tony.nguyen@bt.com, armbru@redhat.com,
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
 tests/migration/stress.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 4bc3a249e6..36f7d71d37 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -232,6 +232,8 @@ static int stressone(unsigned long long ramsizeMB)
 
     free(data);
     free(ram);
+
+    return 0;
 }
 
 
@@ -256,9 +258,7 @@ static int stress(unsigned long long ramsizeGB, int ncpus)
                        stressthread,   &ramsizeMB);
     }
 
-    stressone(ramsizeMB);
-
-    return 0;
+    return stressone(ramsizeMB);
 }
 
 
-- 
2.17.1




