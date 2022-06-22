Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76DE554022
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 03:38:15 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3pJu-0004AP-DE
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 21:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o3pIf-0002zp-J2
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 21:36:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:15499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o3pIc-00082S-Ng
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 21:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655861814; x=1687397814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UurBGQMX7BtYqXxNGQylmXDohRVhHyf9lKhqJcU4n0U=;
 b=B+O80782gEZgLQQwFcTBoTRzQtFu0uOvG6A3W0bojtkQeS4fuxp1KL3b
 /YT642Hgnw+5XGP/9U5vrlPytsa7OWBYvgRxSSfT3VxmKC8QEQXma+s8l
 Rsexw6qISldLxHn4iIn+bXe1VGu6ZKM9J9UvnGadupem8hSCGNWu7EaYK
 3oo2b76hCZJzFOFduuNnQd4Qt9BS64sZvLE/N4aCgaITBy8CpoDLmoTcM
 NY9sqRgFfHy9hvhGP7XJMcKFj/CaapIymoi7igfzKz//6RtHlYd7QL/3W
 yyBosPGoWn3ywlaZDGaWNLAyAT7mEge+iSuAHVfkr13IBfq48cRixpobV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280330280"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="280330280"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 18:36:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="591920897"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 18:36:45 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, f4bug@amsat.org
Subject: [PATCH] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Date: Wed, 22 Jun 2022 09:28:39 +0800
Message-Id: <20220622012839.3419865-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
within that memory region, this isn't ture in some call sites.

This makes qemu log in flatview_access_allowed() confusing and
potential risk if the input parameter will be checked in the future.

Fixes: 3ab6fdc91b72 ("softmmu/physmem: Introduce MemTxAttrs::memory field and MEMTX_ACCESS_ERROR")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
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


