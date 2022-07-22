Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9157DD03
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 10:59:10 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEoV3-0003IK-F3
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 04:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oEoPk-00083J-V1
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:53:41 -0400
Received: from mga06b.intel.com ([134.134.136.31]:41955 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oEoPh-0008Lq-SG
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658480017; x=1690016017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=buxSHgisBk+wMiwpjmZecXS7yAvR9q+2wzyTRyF+Nvk=;
 b=CvI9BD994i/t+HRJI3DH8NQQkGtxXtt9KI4NUzZvg5vkb4cU8yeCHvH/
 qhpHIpgCDLpL4NnljGfqyqJskjcXbhuK2vIK98RBsS7z/ng5ZtcM5XMmH
 r4E+PqxymZugb5Yt8X1GqJzENOeoPpjlGT/9ALqsIP3jyLJ/Tyj2jGlg/
 6buBCrxcJiUiJYWAt/iGbl6NBAqBUGJOQUjQO4fz4mYzDW89uPvYPjLim
 jBa7/+pEait019D6rIf1e4pvSrsj86XaClIpl20Wro2kTBH53Ll2xO7WF
 TX6PSodOWx/7BkB6flxrIis98wWnUxobPCTGhwjzO1uLj1tg3mroQorIm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="348973155"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="348973155"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 01:53:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="626487293"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 01:53:30 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, f4bug@amsat.org
Subject: [PATCH v2] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Date: Fri, 22 Jul 2022 16:45:39 +0800
Message-Id: <20220722084539.187393-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=zhenzhong.duan@intel.com; helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The comment of flatview_access_allowed() suggests to pass address
within that memory region, this isn't true in some call sites.

This makes qemu log in flatview_access_allowed() confusing and
potential risk if the input parameter will be checked in the future.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
v2: Fix typo and removed Fixed-by per David

 softmmu/physmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index fb16be57a6c6..214cb04c8fc3 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2850,7 +2850,7 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
-    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+    if (!flatview_access_allowed(mr, attrs, addr1, l)) {
         return MEMTX_ACCESS_ERROR;
     }
     return flatview_write_continue(fv, addr, attrs, buf, len,
@@ -2917,7 +2917,7 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
-    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+    if (!flatview_access_allowed(mr, attrs, addr1, l)) {
         return MEMTX_ACCESS_ERROR;
     }
     return flatview_read_continue(fv, addr, attrs, buf, len,
-- 
2.25.1


