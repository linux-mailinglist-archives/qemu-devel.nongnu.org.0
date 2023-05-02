Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4F6F4018
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFb-0005OR-Kz; Tue, 02 May 2023 05:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFZ-0005Iq-5J
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:45 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFX-00044U-IK
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019482; bh=0TM9Xz67OYngDEuTQ62kPsInUQpx3kaf2lzF824GJ1Y=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ey5TFeHAWdB3RBwJDadJ62+sNvJ8ckchSdq5ZyRQNITYg34lnaNrMn5qa+CDFMt9M
 JbT3TVZXtL85kb77USZR0FEsvk3/07alzkFRKvOlXePNY3OTzeNOYswg84efzqdErc
 uEx+5gCNQIMG+bsWnDJX6OxCCuVL/aB/u3FyqEMKXWPN7Zm0TzGmUR9heE5UsNffVL
 z9kCA/fQ38eVcD9uD2SLWq1Xxt181EpWMLpNbqqowEpMvzYYikcKTtKsgQrhWoXMjv
 ep00v1mvmNOSJ3ZQu+wY2yKhmepnq90hBn1JuI0aWa6H2p58CZt7HgLe3L7xWzRxti
 giOv8FqV/XzkA==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 128CE2633AF2;
 Tue,  2 May 2023 09:24:40 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 11/12] scripts/analyse-locks-simpletrace.py: changed
 iteritems() to items()
Date: Tue,  2 May 2023 11:23:38 +0200
Message-Id: <20230502092339.27341-12-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Python 3 removed `dict.iteritems()` in favor of `dict.items()`. This
means the script curerntly doesn't work on Python 3.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/analyse-locks-simpletrace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/analyse-locks-simpletrace.py b/scripts/analyse-locks-simpletrace.py
index 63c11f4fce..d650dd7140 100755
--- a/scripts/analyse-locks-simpletrace.py
+++ b/scripts/analyse-locks-simpletrace.py
@@ -75,7 +75,7 @@ def get_args():
            (analyser.locks, analyser.locked, analyser.unlocks))
 
     # Now dump the individual lock stats
-    for key, val in sorted(analyser.mutex_records.iteritems(),
+    for key, val in sorted(analyser.mutex_records.items(),
                            key=lambda k_v: k_v[1]["locks"]):
         print ("Lock: %#x locks: %d, locked: %d, unlocked: %d" %
                (key, val["locks"], val["locked"], val["unlocked"]))
-- 
2.38.1


