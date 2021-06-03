Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17939A2E8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:18:18 +0200 (CEST)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looAr-0001fk-Tu
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1loo9O-00009H-KU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:16:48 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:39368
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1loo9G-0001M8-Tp
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:16:46 -0400
HMM_SOURCE_IP: 172.18.0.218:40366.1597356571
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-34a40403366d4bdebfa57641a0f5b98c
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id AC49B28009A;
 Thu,  3 Jun 2021 22:16:39 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 34a40403366d4bdebfa57641a0f5b98c for
 qemu-devel@nongnu.org; Thu Jun  3 22:16:37 2021
X-Transaction-ID: 34a40403366d4bdebfa57641a0f5b98c
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/migration: fix "downtime_limit" type when
 "migrate-set-parameters"
Date: Thu,  3 Jun 2021 22:20:37 +0800
Message-Id: <31d82df24cc0c468dbe4d2d86730158ebf248071.1622729934.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
References: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
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

migrate-set-parameters parse "downtime_limit" as integer type when
execute "migrate-set-parameters" before migration, and, the unit
dowtime_limit is milliseconds, fix this two so that test can go
smoothly.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 9e16fa92d2..7c991c4407 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -153,7 +153,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                            max_bandwidth=scenario._bandwidth * 1024 * 1024)
 
         resp = src.command("migrate-set-parameters",
-                           downtime_limit=scenario._downtime / 1024.0)
+                           downtime_limit=scenario._downtime)
 
         if scenario._compression_mt:
             resp = src.command("migrate-set-capabilities",
-- 
2.24.3


