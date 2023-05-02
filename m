Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586346F400D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmEq-00050B-Js; Tue, 02 May 2023 05:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEp-000502-1R
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:59 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEn-000403-I7
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019436; bh=rtmjEodPVMUzwYYrkpmLQm9O2of3D9dbaQl2KB0rulo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=OUU36y49TVqU4eSED4ZfCtTTMEdhfly2QVJN74o2YvkgMKAyo5EpWhI256b1hbnfC
 m+JzdR/ltonzPa2BDw/eY+0uhPuZPpSlcBSrcBxz+BlY1848CFunOuFweyek0V+Pk2
 J2Jc9Xdn4bbCjGpJjmlcytw2el3J/8vLfwdqnppuBC0IYijzEWSXH26LwVegnKaeeY
 VyRY/iKKC8vifsNDOAFb1IZ1Di7kOBW3QWkzydxH+Nd+ELKsi6kMT4Gkv9VWsxgvnM
 Jg25kRpEUzvTMrhrGalpELqZvHxe0Ku0N2x8yyBQcNOVm5p7UAUgWcrgmfm+soWYMx
 +v0TZeB/KqBoA==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 768FA26338B2;
 Tue,  2 May 2023 09:23:54 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 04/12] simpletrace: update code for Python 3.11
Date: Tue,  2 May 2023 11:23:31 +0200
Message-Id: <20230502092339.27341-5-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CSTnMekkgSNKL_y5iZtYNEOu3hNu8vnw
X-Proofpoint-ORIG-GUID: CSTnMekkgSNKL_y5iZtYNEOu3hNu8vnw
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1030 mlxlogscore=724 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305020080
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mads Ynddal <m.ynddal@samsung.com>

The call to `getargspec` was deprecated and in Python 3.11 it has been
removed in favor of `getfullargspec`.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 9981699630..7444a6e090 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -192,7 +192,7 @@ def build_fn(analyzer, event):
             return analyzer.catchall
 
         event_argcount = len(event.args)
-        fn_argcount = len(inspect.getargspec(fn)[0]) - 1
+        fn_argcount = len(inspect.getfullargspec(fn)[0]) - 1
         if fn_argcount == event_argcount + 1:
             # Include timestamp as first argument
             return lambda _, rec: fn(*(rec[1:2] + rec[3:3 + event_argcount]))
-- 
2.38.1


