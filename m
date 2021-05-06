Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D49374CFB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:44:27 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT3y-0006PP-Cq
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0m-0002Y3-Cc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:61826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0k-0007Xn-LX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:08 -0400
IronPort-SDR: cBA71HVk7kOjUm9X509FxykwkbqiqLXCgzbckssNk6cKd9IqLLNqBGwhlFqtXWpPTz54Tq779+
 uUckk05Y6qOQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="283783521"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="283783521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:02 -0700
IronPort-SDR: gHpi7Qln+3G46fad71umHSqklKdUAnUOZATJGR5cUpLHIvB9k7Vq5oB08oueKINbpSYtqNJZ6J
 G8XX0TzS1N2w==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220304"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:40:46 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 01/10] Extend the MemTxAttrs to include a 'debug'
 flag. The flag can be used as general indicator that operation was triggered
 by the debugger.
Date: Thu,  6 May 2021 09:40:28 +0800
Message-Id: <20210506014037.11982-2-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506014037.11982-1-yuan.yao@linux.intel.com>
References: <20210506014037.11982-1-yuan.yao@linux.intel.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=yuan.yao@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

A subsequent patch will set the debug=1 when issuing a memory access
from the gdbstub or HMP commands. This is a prerequisite to support
debugging an encrypted guest. When a request with debug=1 is seen, the
encryption APIs will be used to access the guest memory.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55..c8b56389d6 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -49,6 +49,8 @@ typedef struct MemTxAttrs {
     unsigned int target_tlb_bit0 : 1;
     unsigned int target_tlb_bit1 : 1;
     unsigned int target_tlb_bit2 : 1;
+    /* Memory access request from the debugger */
+    unsigned int debug:1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.20.1


