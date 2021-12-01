Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0B464EE1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:36:53 +0100 (CET)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPn2-0004QN-0P
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPir-0001gn-ER
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:35 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:32956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPih-0003aI-Ae
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2DDAB81EE7;
 Wed,  1 Dec 2021 13:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F2EC53FCF;
 Wed,  1 Dec 2021 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638365537;
 bh=EMNfiMydvF4mhB/qZzPFrK+R0Fcj8elSL0Bwu4kKVlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KRQgs1gfoXgUTOgNWHewyQNJi7E4o+ei6p2x9v38Fyrws5upYt7OIUTFKZk8rBlxu
 tv+Oo0jRCvNYwDETYBNRGnrnZ/bRTjG71BBWCLE9Us/r02QS1ey+yuceV1HmXqxIna
 sZX/X7sH+Xe/A23W+YG9KNJJzTth7YIYP1RtfcJGbI7r9upHHugbjZKBYtIymLfly/
 3axKNKTBePfWGeIebn7DRIa5j8JFVoXdDFDrkIaU4KlMMw8QzpsSMo6go7WLK+lYDi
 i3Y4lxKz/GtVGN82G8c8JR8bTAIN/OMkVXPK1HwSTSlMLw+A/71TuI2bzOxbigsnG2
 gbgkJ5HLze2xA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1msPiH-0007ru-T1; Wed, 01 Dec 2021 14:31:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 1/4] firmware: qemu_fw_cfg: fix NULL-pointer deref on
 duplicate entries
Date: Wed,  1 Dec 2021 14:25:25 +0100
Message-Id: <20211201132528.30025-2-johan@kernel.org>
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
 linux-kernel@vger.kernel.org, Qiushi Wu <wu000273@umn.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit fe3c60684377 ("firmware: Fix a reference count leak.") "fixed"
a kobject leak in the file registration helper by properly calling
kobject_put() for the entry in case registration of the object fails
(e.g. due to a name collision).

This would however result in a NULL pointer dereference when the
release function tries to remove the never added entry from the
fw_cfg_entry_cache list.

Fix this by moving the list-removal out of the release function.

Note that the offending commit was one of the benign looking umn.edu
fixes which was reviewed but not reverted. [1][2]

[1] https://lore.kernel.org/r/202105051005.49BFABCE@keescook
[2] https://lore.kernel.org/all/YIg7ZOZvS3a8LjSv@kroah.com

Fixes: fe3c60684377 ("firmware: Fix a reference count leak.")
Cc: stable@vger.kernel.org      # 5.8
Cc: Qiushi Wu <wu000273@umn.edu>
Cc: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/firmware/qemu_fw_cfg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 172c751a4f6c..a9c64ebfc49a 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -388,9 +388,7 @@ static void fw_cfg_sysfs_cache_cleanup(void)
 	struct fw_cfg_sysfs_entry *entry, *next;
 
 	list_for_each_entry_safe(entry, next, &fw_cfg_entry_cache, list) {
-		/* will end up invoking fw_cfg_sysfs_cache_delist()
-		 * via each object's release() method (i.e. destructor)
-		 */
+		fw_cfg_sysfs_cache_delist(entry);
 		kobject_put(&entry->kobj);
 	}
 }
@@ -448,7 +446,6 @@ static void fw_cfg_sysfs_release_entry(struct kobject *kobj)
 {
 	struct fw_cfg_sysfs_entry *entry = to_entry(kobj);
 
-	fw_cfg_sysfs_cache_delist(entry);
 	kfree(entry);
 }
 
-- 
2.32.0


