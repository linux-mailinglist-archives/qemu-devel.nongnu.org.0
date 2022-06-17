Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4354F242
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:55:28 +0200 (CEST)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26pD-0008QV-9q
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lS-0005Xq-Rs
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:35 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28828 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lR-0007CE-BG
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452293; x=1686988293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SEZhIf8jMNQNhciEdWpMu+aT2ALSvfXugGxJqxuImrg=;
 b=ODUr3e2RAbhecC8etg6pDLnilOhAXtP4/32KpLbp1lTPIAS7T58ZpoFG
 eVT4mdlynXZX9FSiLGY1Teq1FsN6x7ILPt5Zh3yR5LGgFgL/JOtviAGMr
 VlUK1UBWF1EBxXh8lYNRBL52lkrqRw8vMoPo7tmC0s58rGpGsesgi73O1
 2eugCWUc1YJVOV4XQW5lncBcl4H89ZYZq48WWsqLDA1EG+rK7cCpOi86T
 X7+UHad7XNx/ZsBgRMj/SrtBeW34l8nh1zh4f9yjBQiRctvr4u1yoWDgc
 EZLKeJFk2UDthIUtBOEkvJQ3sH3bd2duj5IE0Nq0ftS8t+YSWybwT3OWm A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102171"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102171"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936768"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:28 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 09/12] softmmu/vl.c: Add filter-ubpf for netdev as other
 netfilters
Date: Fri, 17 Jun 2022 15:36:27 +0800
Message-Id: <20220617073630.535914-10-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 softmmu/vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4c1e94b00e..d924fb1c71 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1822,7 +1822,8 @@ static bool object_create_early(const char *type)
         g_str_equal(type, "filter-redirector") ||
         g_str_equal(type, "colo-compare") ||
         g_str_equal(type, "filter-rewriter") ||
-        g_str_equal(type, "filter-replay")) {
+        g_str_equal(type, "filter-replay") ||
+        g_str_equal(type, "filter-ubpf")) {
         return false;
     }
 
-- 
2.25.1


