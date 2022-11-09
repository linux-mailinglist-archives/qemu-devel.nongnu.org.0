Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E93C622238
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 03:50:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osb9I-0001Ig-Gz; Tue, 08 Nov 2022 21:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1osb9G-0001IV-0B
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:49:06 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1osb9D-0003A9-SH
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667962143; x=1699498143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JT9qSmVCOixLyiZtI/BYbFb8KHWsKh1ohNOUIG3QAi0=;
 b=HAOwEvDnWT8E1wgWsUgPr9WFvnLLNTB3blkdRWt8mCL5ca6p6M72DQaY
 +e25tU5apbrhDw1nusoJFjjcWUHijye0pAum00Hw3dJt/tlLf9tHP13lO
 1AqdMcis6N4zQGeIMveIu9jJr1WkjtHXDk8E9jtKMKNHKMN+Ss6oGRCPy
 cz9r2qbLRSe30UWR1/1GTzcr0Y0K272IAZcJEGI6wj3hyR6SB8lLHgqie
 /SF8M22kC6scpoPwt5VRSyvjZhBcKzDwwTujC9hlLQqpuG1G4fqxBSVP3
 P5IproPP8anFIF7MbdZme3P/k7cJ+7vXJUSNVqyLEV/nBbwIObwkv68mA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="290588889"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="290588889"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 18:48:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="669787893"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="669787893"
Received: from scswain-mobl.amr.corp.intel.com (HELO
 khuang2-desk.gar.corp.intel.com) ([10.212.115.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 18:48:54 -0800
From: Kai Huang <kai.huang@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, yang.zhong@linux.intel.com, seanjc@google.com,
 Kai Huang <kai.huang@intel.com>
Subject: [PATCH] target/i386: Add SGX aex-notify and EDECCSSA support
Date: Wed,  9 Nov 2022 15:48:34 +1300
Message-Id: <20221109024834.172705-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=kai.huang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The new SGX Asynchronous Exit (AEX) notification mechanism (AEX-notify)
allows one enclave to receive a notification in the ERESUME after the
enclave exit due to an AEX.  EDECCSSA is a new SGX user leaf function
(ENCLU[EDECCSSA]) to facilitate the AEX notification handling.

Whether the hardware supports to create enclave with AEX-notify support
is enumerated via CPUID.(EAX=0x12,ECX=0x1):EAX[10].  The new EDECCSSA
user leaf function is enumerated via CPUID.(EAX=0x12,ECX=0x0):EAX[11].

Add support to allow to expose the new SGX AEX-notify feature and the
new EDECCSSA user leaf function to KVM guest.

Link: https://lore.kernel.org/lkml/166760360549.4906.809756297092548496.tip-bot2@tip-bot2/
Link: https://lore.kernel.org/lkml/166760360934.4906.2427175408052308969.tip-bot2@tip-bot2/
Reviewed-by: Yang Zhong <yang.zhong@linux.intel.com>
Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37dd..51f212cef50d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1233,7 +1233,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             "sgx1", "sgx2", NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, "sgx-edeccssa",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -1273,7 +1273,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             NULL, "sgx-debug", "sgx-mode64", NULL,
             "sgx-provisionkey", "sgx-tokenkey", NULL, "sgx-kss",
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "sgx-aex-notify", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,

base-commit: 466e81ff12013d026e2d0154266fce82bce2ee9b
-- 
2.38.1


