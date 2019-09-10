Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E92AEA12
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 14:13:41 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7f1f-0007bM-W1
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 08:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyQ-0006Et-Kf
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyP-0006M7-Nm
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:18 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:3006)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyP-0006KG-56
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:17 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15d77928b8a4-e1eb3;
 Tue, 10 Sep 2019 20:09:51 +0800 (CST)
X-RM-TRANSID: 2ee15d77928b8a4-e1eb3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35d7792822a8-7d7f1;
 Tue, 10 Sep 2019 20:09:51 +0800 (CST)
X-RM-TRANSID: 2ee35d7792822a8-7d7f1
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 20:09:25 +0800
Message-Id: <20190910120927.1669283-2-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
References: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH 1/3] tests/migration: mem leak fix
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

Cc: armbru@redhat.com
Cc: laurent@vivier.eu
Cc: tony.nguyen@bt.com

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 tests/migration/stress.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index d9aa4afe92..e6c9a6b243 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -181,6 +181,8 @@ static int stressone(unsigned long long ramsizeMB)
     if (!ram) {
         fprintf(stderr, "%s (%05d): ERROR: cannot allocate %llu MB of RAM: %s\n",
                 argv0, gettid(), ramsizeMB, strerror(errno));
+        if (data)
+            free(data);
         return -1;
     }
     if (!data) {
-- 
2.17.1




