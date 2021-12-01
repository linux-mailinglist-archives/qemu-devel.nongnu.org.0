Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3D464EEB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:39:44 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPpm-0008FB-V0
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPir-0001gm-4t
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:35 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:32942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPih-0003aF-Bk
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C71A8B81EE6;
 Wed,  1 Dec 2021 13:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F4FC53FD1;
 Wed,  1 Dec 2021 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638365537;
 bh=zbIAB0xAPmHrLVaWtGAiUDtaS268VPsxSnRQ1pw/suo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gRbHTxnTCb1a0XCCIt7q5yKJ0gI8CmE6HsDkKKBzjfJtBtZXwpxADr/2lgHPZjKtJ
 EApK+62hGbiEiR0OYxygV525zebiVIw1Ne9vrAkHS/hxdjYqmhJ3XpkVCGnm7gTuxX
 ZHUseGqnlTnb5v6HPiCWkCXScfYVcx8Z8HXvIWEMHZ3SZBiqot9s3FVqY8joinEnet
 3wMgHlX6IK2SLIPdN24th2VjRTVUx+gIG9OfYtLUTWcou9ma3gjUfsrzW/1Y7lQLxs
 zcO9C7Cs775Qk8Y6goY2dH6SiroOFS8n4HztmOaUEisEaZOtj5DyrNHBIjkAMuAJmp
 cMFHTy+nD4tZg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1msPiH-0007ry-VV; Wed, 01 Dec 2021 14:31:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 2/4] firmware: qemu_fw_cfg: fix kobject leak in probe error
 path
Date: Wed,  1 Dec 2021 14:25:26 +0100
Message-Id: <20211201132528.30025-3-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201132528.30025-1-johan@kernel.org>
References: <20211201132528.30025-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=johan@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kees Cook <keescook@chromium.org>, qemu-devel@nongnu.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An initialised kobject must be freed using kobject_put() to avoid
leaking associated resources (e.g. the object name).

Commit fe3c60684377 ("firmware: Fix a reference count leak.") "fixed"
the leak in the first error path of the file registration helper but
left the second one unchanged. This "fix" would however result in a NULL
pointer dereference due to the release function also removing the never
added entry from the fw_cfg_entry_cache list. This has now been
addressed.

Fix the remaining kobject leak by restoring the common error path and
adding the missing kobject_put().

Fixes: 75f3e8e47f38 ("firmware: introduce sysfs driver for QEMU's fw_cfg device")
Cc: stable@vger.kernel.org      # 4.6
Cc: Gabriel Somlo <somlo@cmu.edu>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/firmware/qemu_fw_cfg.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a9c64ebfc49a..ccb7ed62452f 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -603,15 +603,13 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
 	/* register entry under "/sys/firmware/qemu_fw_cfg/by_key/" */
 	err = kobject_init_and_add(&entry->kobj, &fw_cfg_sysfs_entry_ktype,
 				   fw_cfg_sel_ko, "%d", entry->select);
-	if (err) {
-		kobject_put(&entry->kobj);
-		return err;
-	}
+	if (err)
+		goto err_put_entry;
 
 	/* add raw binary content access */
 	err = sysfs_create_bin_file(&entry->kobj, &fw_cfg_sysfs_attr_raw);
 	if (err)
-		goto err_add_raw;
+		goto err_del_entry;
 
 	/* try adding "/sys/firmware/qemu_fw_cfg/by_name/" symlink */
 	fw_cfg_build_symlink(fw_cfg_fname_kset, &entry->kobj, entry->name);
@@ -620,9 +618,10 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
 	fw_cfg_sysfs_cache_enlist(entry);
 	return 0;
 
-err_add_raw:
+err_del_entry:
 	kobject_del(&entry->kobj);
-	kfree(entry);
+err_put_entry:
+	kobject_put(&entry->kobj);
 	return err;
 }
 
-- 
2.32.0


