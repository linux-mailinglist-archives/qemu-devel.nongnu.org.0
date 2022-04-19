Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6828506C94
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:37:09 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngn6S-0006pu-MR
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <284de6154d7ad57ac6539a7318aa2364261da105@lizzy.crudebyte.com>)
 id 1ngmqj-0003OP-FY; Tue, 19 Apr 2022 08:20:53 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:56073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <284de6154d7ad57ac6539a7318aa2364261da105@lizzy.crudebyte.com>)
 id 1ngmqh-0004jd-SY; Tue, 19 Apr 2022 08:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=XX4vAZPK+i1VCEUgVN1ZDqJ7cSYFegRWNpXFl/BkX44=; b=YsP2E
 k51azw51zOahjxrJW7yBipmKKibcnBQ6SHidv8f9S2LCOQ/ywQmZPTs3EE9JAuotGofSbL7qOPK7e
 cLNoiSfDkHNUgvP2zSHxL/SrNA+UnMMkAmpdcZJjSSVg+k1sChRQZecBLy7P8WSRoLMEos7DJS3BY
 iDMjn+9oDpPBIb/VDnvDDD6ko8qne7/n/4k6zNhmdPh4RrR2zUiQOrzQ0Q1Tl2dkstRg/JOJ8VDIE
 mW6mILcf0ujo9zWyiEJUFLRQymQ52qqnPPH9e3Dbb8D1c4wuBg5u6tCfftu0S3MP0pv+ULrcL0AtM
 DkrTbwUA6BeSijhasoBBVgAGPS9/w==;
Message-Id: <284de6154d7ad57ac6539a7318aa2364261da105.1650370027.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650370026.git.qemu_oss@crudebyte.com>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 19 Apr 2022 13:43:30 +0200
Subject: [PATCH 5/5] 9pfs: fix removing non-existent POSIX ACL xattr on macOS
 host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=284de6154d7ad57ac6539a7318aa2364261da105@lizzy.crudebyte.com;
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
ENOATTR instead, so ignore ENOATTR errors as well.

This patch fixes e.g. a command on Linux guest like:

  cp --preserve=mode old new

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-posix-acl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-posix-acl.c b/hw/9pfs/9p-posix-acl.c
index eadae270dd..2bf155f941 100644
--- a/hw/9pfs/9p-posix-acl.c
+++ b/hw/9pfs/9p-posix-acl.c
@@ -65,7 +65,13 @@ static int mp_pacl_removexattr(FsContext *ctx,
     int ret;
 
     ret = local_removexattr_nofollow(ctx, path, MAP_ACL_ACCESS);
-    if (ret == -1 && errno == ENODATA) {
+    if (ret == -1 &&
+          (errno == ENODATA
+#ifdef ENOATTR
+          || errno == ENOATTR
+#endif
+          )
+    ) {
         /*
          * We don't get ENODATA error when trying to remove a
          * posix acl that is not present. So don't throw the error
-- 
2.32.0 (Apple Git-132)


