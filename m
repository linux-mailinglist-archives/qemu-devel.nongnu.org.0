Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85496383CCC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:57:33 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiQm-0004z0-HM
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlp-0006mI-CK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:20 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004XR-9V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:09 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmQUL-1l0oNG1Igr-00iRwu; Mon, 17
 May 2021 20:14:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 48/59] linux-user: Add copy_file_range to strace.list
Date: Mon, 17 May 2021 20:14:13 +0200
Message-Id: <20210517181424.8093-49-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YKL/9PRgPYm0NczyJyikvanbOG76z5gMe+EymXSlC5oaNZTnQ28
 KwzFiSK2b30x5ww48E4GF3ZbDmq6usXBd5+RZ74M0sHGojJRiLsUzjoLtl0RIDejbzw+YvU
 tpXeQu+K/bO9/0mbxgKJ6HOXMMQmIGJ5LSGM7svd56I1RpUr2WiDOtIWsNZ73gGbPENQadS
 T/LqIzLRriXoavtcyPIDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sZu91EdWcpc=:7iAlsnxUF3gkItIzNXi0Wi
 2B/HfjxE4nEvyfFtogi2U6sEXv+mI9Ebt8VTkfJVClIvJo+WpIIWbAXkqwLDJsiEYknhkI+p0
 kyO6rax4u7JsSNpErw1laQ3fAlpmBBOZbEQCmASHJBUUXqtf2j0L42CT9cd9UFGbFsF8TGVMG
 J8mLnma/2IHUihfRcoLhZvfVK/BJ2rS2GAoOfHgq+PP3K5iI+leNFuiz+jYpCV/hSn8S8lVNX
 hzoPGOynqyFFzHfTnfvlGedgV5S6SJaj28DmxydiVDkWbfWZVwnW0zgWVLAQZWKi6wkhdh5Qj
 mys6mHASsdlSfRCiti5dJ+uM540SiSomXunWsFk3FG7UWwLb8fDHPCoowYx/q8dKvvBFW1tmT
 S4BlSvupz1qpvm9ZcmbHGXtMFK9ytMFSweGcVD1eSJ4U7H8F+K9r/rOnxvqGddugO+oqKRS9R
 g7tZvybtYbJzchPh100Gd3a7SqgwAPnftvM04yoOUbqmeYLDIuc7qQKDcS+UZV60NZAE0zv+S
 LGMZzLsqj4yUhKJW/MR4sw=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210503174159.54302-2-thatlemon@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 18f72172754f..278596acd131 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1668,3 +1668,6 @@
 #ifdef TARGET_NR_statx
 { TARGET_NR_statx, "statx", NULL, print_statx, NULL },
 #endif
+#ifdef TARGET_NR_copy_file_range
+{ TARGET_NR_copy_file_range, "copy_file_range", "%s(%d,%p,%d,%p,"TARGET_ABI_FMT_lu",%u)", NULL, NULL },
+#endif
-- 
2.31.1


