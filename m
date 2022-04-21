Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8334950A57A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:30:17 +0200 (CEST)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZhA-0007pk-HW
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe@lizzy.crudebyte.com>)
 id 1nhYlK-000608-NG; Thu, 21 Apr 2022 11:30:30 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:41185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe@lizzy.crudebyte.com>)
 id 1nhYl2-00087C-1D; Thu, 21 Apr 2022 11:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=eTluQCFgI7OoQcVt3cFvqiYpJgT6CI4WQTBT5ox/fB0=; b=EOrzB
 uQ7G6JnrRCy+2VEc9trPRMbuFlUFI1F5kcfzGWQ7fa7KDNxxVBtNyt0ETpt0vEa9d0tnD52pBmO2/
 NFILdfvd4TQk+Z0gQNKziKFDsC2FR6ZIBbdq55fALkqQqlgmk9LR/J3sW9gOW95GxwgOGfiCuoAQr
 Zhq5vU7IGTEJrKdsW5Jf+7TCkaOwAF1LtG0fgL8CH6AYLhtRqTOgWuUnMhVEWosJ2yvOZhhl5ppsh
 wEk1xgKUiZE3qBB9ExB0IvJUCBVkkqklMp2b32zFh1K6/Gkz47QELKqwJ8LmSYaXS95JbrCH9x8vF
 l+KI7PYbio+FCroqCneiZsoXxET4w==;
Message-Id: <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe.1650553693.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 21 Apr 2022 17:07:55 +0200
Subject: [PATCH v2 5/5] 9pfs: fix removing non-existent POSIX ACL xattr on
 macOS host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When mapped POSIX ACL is used, we are ignoring errors when trying
to remove a POSIX ACL xattr that does not exist. On Linux hosts we
would get ENODATA in such cases, on macOS hosts however we get
ENOATTR instead.

As we can be sure that ENOATTR is defined as being identical on Linux
hosts (at least by qemu/xattr.h), it is safe to fix this issue by
simply comparing against ENOATTR instead of ENODATA.

This patch fixes e.g. a command on Linux guest like:

  cp --preserve=mode old new

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Link: https://lore.kernel.org/qemu-devel/2866993.yOYK24bMf6@silver/
---
 hw/9pfs/9p-posix-acl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-posix-acl.c b/hw/9pfs/9p-posix-acl.c
index eadae270dd..4b2cb3c66c 100644
--- a/hw/9pfs/9p-posix-acl.c
+++ b/hw/9pfs/9p-posix-acl.c
@@ -65,7 +65,11 @@ static int mp_pacl_removexattr(FsContext *ctx,
     int ret;
 
     ret = local_removexattr_nofollow(ctx, path, MAP_ACL_ACCESS);
-    if (ret == -1 && errno == ENODATA) {
+    /*
+     * macOS returns ENOATTR (!=ENODATA on macOS), whereas Linux returns
+     * ENODATA (==ENOATTR on Linux), so checking for ENOATTR is fine
+     */
+    if (ret == -1 && errno == ENOATTR) {
         /*
          * We don't get ENODATA error when trying to remove a
          * posix acl that is not present. So don't throw the error
@@ -115,7 +119,11 @@ static int mp_dacl_removexattr(FsContext *ctx,
     int ret;
 
     ret = local_removexattr_nofollow(ctx, path, MAP_ACL_DEFAULT);
-    if (ret == -1 && errno == ENODATA) {
+    /*
+     * macOS returns ENOATTR (!=ENODATA on macOS), whereas Linux returns
+     * ENODATA (==ENOATTR on Linux), so checking for ENOATTR is fine
+     */
+    if (ret == -1 && errno == ENOATTR) {
         /*
          * We don't get ENODATA error when trying to remove a
          * posix acl that is not present. So don't throw the error
-- 
2.32.0 (Apple Git-132)


