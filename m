Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69623483AA5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:43:25 +0100 (CET)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZnI-0005vW-Ia
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n4Zle-00056J-L5
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:41:42 -0500
Received: from mga04.intel.com ([192.55.52.120]:65439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n4Zlc-0008Gv-U3
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641264100; x=1672800100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+fkN4eu9ZoZAvq3O4mDDjGoU03esThWhxOHYWGEmC5o=;
 b=PFxA1j9hpMPH2LAABBinpZXg087k08f28iUy7n3+55vmPvh/f6vYJi1M
 7sAjOi2trWX2ioVVGT8qbFhkhV3rSm4T/Du5hRUG7eXRyrkE9rn+iOk4j
 xBBQmaCUqvniDX3o8NIopTvIcjC6rQm3XPAh4Dqa/lgzmiA/DwCggjpUj
 115eBhUsv1i9SF7NnNhL3tXxJM0uusPxBAnSQ33iFDL7CnSOyTHmNwbmE
 9VzUDzELxP65bZMbwekWntLdBe7rDwgUiT8s1aolNe79NiOHV15uoGR5J
 KWh4quLp/8c27v6GZnvBESM9Js38yauI8oczWl86ZpvlIq3D94ilcWOLR w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="240965491"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="240965491"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 18:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="512289780"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 03 Jan 2022 18:41:37 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] sysemu: Cleanup qemu_run_machine_init_done_notifiers()
Date: Tue,  4 Jan 2022 10:41:36 +0800
Message-Id: <20220104024136.1433545-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove qemu_run_machine_init_done_notifiers() since no implementation
and user.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 include/sysemu/sysemu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667172ac..b9421e03ffdd 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -16,7 +16,6 @@ extern bool qemu_uuid_set;
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
-void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
 
-- 
2.27.0


