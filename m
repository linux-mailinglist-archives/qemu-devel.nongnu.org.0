Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A050E0AE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:48:32 +0200 (CEST)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niy8l-0007qA-2n
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5ba5c1058b47466193a6716d5e30f69817fda707@lizzy.crudebyte.com>)
 id 1niy2I-0006KU-Oa; Mon, 25 Apr 2022 08:41:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5ba5c1058b47466193a6716d5e30f69817fda707@lizzy.crudebyte.com>)
 id 1niy2G-0002Ev-VO; Mon, 25 Apr 2022 08:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=zIrDZd4x8Db0Bp3YUnjhpQ8lXXOO3jEp+5fUqSQpDeA=; b=YYKwX
 DWXmNszLy/fskLS6Ap8Phq/CZsS98Q/KnK2615vsgd9HFOm0yMiiK3OYqvjmi1xKq+UrqUXzyy9sJ
 gzaBNgA89I6HHXA2e4FqvXD74yaiL/3I3Nd8GpWxl+uRNrg1GROHrjOSveDEDTKdhEnZ550Mcdp7B
 3Syb/wZGnOwraPm3QW7mHxy3M3GEiOgm9/inNTXszXmGlEuFui16G7zN8EfIyygaZPHHVKvmlQw6C
 yC5IcI+jO9pWAfLRSLTTC9S8Stx8y3B1YUwTXUr9TuDtZRxS5tHmkswZnp5jlLkK08HnJDwEBK9Us
 7u7cEDTTQdunEYG3yK1JlMkJfQv0g==;
Message-Id: <5ba5c1058b47466193a6716d5e30f69817fda707.1650889269.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650889268.git.qemu_oss@crudebyte.com>
References: <cover.1650889268.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 25 Apr 2022 14:20:53 +0200
Subject: [PATCH v3 5/6] 9pfs: fix removing non-existent POSIX ACL xattr on
 macOS host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=5ba5c1058b47466193a6716d5e30f69817fda707@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
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


