Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C2155A57
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 16:07:07 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j05Dm-0001pT-BG
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 10:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tianjia.zhang@linux.alibaba.com>) id 1j02Dx-0008GR-8i
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:55:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tianjia.zhang@linux.alibaba.com>) id 1j02Dr-0001fQ-73
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:55:00 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:61457)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tianjia.zhang@linux.alibaba.com>)
 id 1j02Dq-0001LK-T3
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:54:59 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=1; SR=0;
 TI=SMTPD_---0TpMFALF_1581076473; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0TpMFALF_1581076473) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 07 Feb 2020 19:54:34 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: Fix a bug with count variables
Date: Fri,  7 Feb 2020 19:54:33 +0800
Message-Id: <20200207115433.118254-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 47.88.44.36
X-Mailman-Approved-At: Fri, 07 Feb 2020 09:58:38 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The counting code here should use the local variable n_nodes_local.
Otherwise, the variable n_nodes is counting incorrectly, causing the
counting logic of the code to be wrong.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 tests/test-rcu-list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-rcu-list.c b/tests/test-rcu-list.c
index 6f076473e0..c0fc47ded4 100644
--- a/tests/test-rcu-list.c
+++ b/tests/test-rcu-list.c
@@ -219,7 +219,7 @@ static void *rcu_q_updater(void *arg)
             j++;
             if (target_el == j) {
                 struct list_element *new_el = g_new(struct list_element, 1);
-                n_nodes += n_nodes_local;
+                n_nodes_local++;
                 TEST_LIST_INSERT_AFTER_RCU(el, new_el, entry);
                 break;
             }
-- 
2.17.1


