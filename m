Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1169DC84
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWa-0007iB-1c; Tue, 21 Feb 2023 04:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWX-0007ht-Bx
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:21 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWV-0005Us-PU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970077; bh=rtmjEodPVMUzwYYrkpmLQm9O2of3D9dbaQl2KB0rulo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=D5gaas3ozPewLlW4MR4IfA6oFenQNtWnmo7h8IzbJ5lKgBQeiaLK7ZZeuD4FYPTWo
 t/sZalTqoSvrdejUW9ZVVkfnPcB6BeoOqI0mEtm+0sJknPGGJFM1CpzwQ12alkRPh5
 swR/IIKTEjda2ciNptofwSLV4UuxKlCRYsLPmKs/SYgPXD9wFeo5M4YO2uo+niUa0C
 LO/IxVApSNfc7v+BjXfcawIKgtwbp83qlnVWaHAKAzF6tlwf2b1CCVjVObyeEH5hFg
 U6UrLdkPQa60+RPki9vkIG0YY4iDPxytJDy5P7XOndXj1MYsm05+5XIDuGPrdejdRT
 uh2pVSfBZQPtw==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 4726E962DE4;
 Tue, 21 Feb 2023 09:01:16 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 4/9] simpletrace: update code for Python 3.11
Date: Tue, 21 Feb 2023 10:00:59 +0100
Message-Id: <20230221090104.86103-5-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221090104.86103-1-mads@ynddal.dk>
References: <20230221090104.86103-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cZ0hWgeFBoV-sSyB4EZnM3M0CmC-emT7
X-Proofpoint-GUID: cZ0hWgeFBoV-sSyB4EZnM3M0CmC-emT7
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=754
 phishscore=0 adultscore=0 spamscore=0 clxscore=1030 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302210078
Received-SPF: pass client-ip=17.58.23.181; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


