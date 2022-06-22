Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C655454A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:29:47 +0200 (CEST)
Received: from localhost ([::1]:34208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xcI-0006rq-R1
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o3xFl-00050v-Iv
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:06:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:54159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o3xFi-0006cs-FK
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655892386; x=1687428386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MNlUHG0wC8dyue6athWWQfrzm2nSNw0NPO5SypbCtGE=;
 b=UF9rV5398wv005qk0rMQGpV7mEyHf1w+GcQ3S33HSeXzI45KploJPnjx
 9gs7/Lz8h6Mi0GbTHmJ0FSgNS026+eTNA/bamZodUJF4ynjinHOdd96Hk
 ytMrBsgxXiW0nfAm+I3BVL8tZzCC4DoTiL3B5BfWd1Ml1/vnSDkCQwJS8
 y7DRzk+Kg2U19Gao5hsNJ2rqlNzyJ9HZmMBvLQStGNJQUzWgN88lyIwyk
 8A5iI8Y+LXVliK5MvVK9GKNkHbLaRkjb6TJxDEElPKOh6qxWx62w8rwYj
 nChHxizVqnm21LE0HyzeflGssaqNYErt+EVcgRcJfh2QSaBqn5iO0mk8F A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260196695"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260196695"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:06:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="592112686"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:06:22 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, f4bug@amsat.org
Subject: [PATCH] memory: Fix wrong end address dump
Date: Wed, 22 Jun 2022 17:59:12 +0800
Message-Id: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=zhenzhong.duan@intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The end address of memory region section isn't correctly calculated
which leads to overflowed mtree dump:

  Dispatch
    Physical sections
      ......
      #70 @0000000000002000..0000000000011fff io [ROOT]
      #71 @0000000000005000..0000000000005fff (noname)
      #72 @0000000000005000..0000000000014fff io [ROOT]
      #73 @0000000000005658..0000000000005658 vmport
      #74 @0000000000005659..0000000000015658 io [ROOT]
      #75 @0000000000006000..0000000000015fff io [ROOT]

After fix:
      #70 @0000000000002000..0000000000004fff io [ROOT]
      #71 @0000000000005000..0000000000005fff (noname)
      #72 @0000000000005000..0000000000005657 io [ROOT]
      #73 @0000000000005658..0000000000005658 vmport
      #74 @0000000000005659..0000000000005fff io [ROOT]
      #75 @0000000000006000..000000000000ffff io [ROOT]

Fixes: 5e8fd947e2670 ("memory: Rework "info mtree" to print flat views and dispatch trees")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 214cb04c8fc3..cbabd10ac0bf 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3701,7 +3701,7 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
                     " %s%s%s%s%s",
             i,
             s->offset_within_address_space,
-            s->offset_within_address_space + MR_SIZE(s->mr->size),
+            s->offset_within_address_space + MR_SIZE(s->size),
             s->mr->name ? s->mr->name : "(noname)",
             i < ARRAY_SIZE(names) ? names[i] : "",
             s->mr == root ? " [ROOT]" : "",
-- 
2.25.1


