Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87A2D01CE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 09:29:50 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klpQT-0003aK-6M
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 03:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1klpP1-0002kn-4m
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 03:28:19 -0500
Received: from zxshcas1.zhaoxin.com ([203.148.12.81]:32084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1klpOx-0007uc-Go
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 03:28:18 -0500
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sun, 6 Dec 2020
 16:21:50 +0800
Received: from localhost.localdomain (124.64.18.209) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sun, 6 Dec 2020
 16:21:49 +0800
From: FelixCuioc <FelixCui-oc@zhaoxin.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: [PATCH 1/1] Remove flatview_simplify()
Date: Sun, 6 Dec 2020 16:21:42 +0800
Message-ID: <20201206082142.7519-2-FelixCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201206082142.7519-1-FelixCui-oc@zhaoxin.com>
References: <20201206082142.7519-1-FelixCui-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.64.18.209]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Received-SPF: pass client-ip=203.148.12.81;
 envelope-from=FelixCui-oc@zhaoxin.com; helo=ZXSHCAS1.zhaoxin.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: TonyWWang-oc@zhaoxin.com, FelixCui-oc <FelixCui-oc@zhaoxin.com>,
 qemu-devel@nongnu.org, CobeChen-oc@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: FelixCui-oc <FelixCui-oc@zhaoxin.com>

Flatview_simplify() will cause some innocent mappings
to be unmapped.

Signed-off-by: FelixCui-oc <FelixCui-oc@zhaoxin.com>
Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
---
 softmmu/memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 11ca94d037..66d36dcac4 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -733,7 +733,6 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
                              addrrange_make(int128_zero(), int128_2_64()),
                              false, false);
     }
-    flatview_simplify(view);
 
     view->dispatch = address_space_dispatch_new(view);
     for (i = 0; i < view->nr; i++) {
-- 
2.17.1


