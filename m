Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214E39A2E7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:17:56 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looAV-0000hZ-CG
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1loo8v-00082h-L8
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:16:17 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:39276
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1loo8s-0000y0-Ce
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:16:17 -0400
HMM_SOURCE_IP: 172.18.0.48:43350.1944152304
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-4635ad37ca0946d7a5dce8d7170400e8
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C3F03280029;
 Thu,  3 Jun 2021 22:16:02 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 4635ad37ca0946d7a5dce8d7170400e8 for
 qemu-devel@nongnu.org; Thu Jun  3 22:16:01 2021
X-Transaction-ID: 4635ad37ca0946d7a5dce8d7170400e8
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/migration: parse the thread-id key of CpuInfoFast
Date: Thu,  3 Jun 2021 22:19:53 +0800
Message-Id: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

thread_id in CpuInfoFast is deprecated, parse thread-id instead
after execute qmp query-cpus-fast. fix this so that test can
go smoothly.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 208e095794..9e16fa92d2 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -113,7 +113,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
         vcpus = src.command("query-cpus-fast")
         src_threads = []
         for vcpu in vcpus:
-            src_threads.append(vcpu["thread_id"])
+            src_threads.append(vcpu["thread-id"])
 
         # XXX how to get dst timings on remote host ?
 
-- 
2.24.3


