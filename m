Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD960A333
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:52:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvLG-0007yU-Dj; Mon, 24 Oct 2022 07:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f723f626627fda681327075105701695d7c630e5@lizzy.crudebyte.com>)
 id 1omvLE-0007yC-NJ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:10:00 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f723f626627fda681327075105701695d7c630e5@lizzy.crudebyte.com>)
 id 1omvLD-0006YY-Cg
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=OOUuvHQ3ZvZyswiEWMATddvQ5xkB4LreZjcDVjUK7VY=; b=GpGSn
 /H/KE6l1LELX785RJ/WiyVR3EV2bRUDRo4ikiHPsBgm9mZ4SZoBlfbK7HHYFQLP5H94vBqGC5p7/y
 osolgqcUvL3BQUDTF/zS88m0yFM6V7+DmX1WlbnFQPd9jaX0Ign/oxxKFIQl4/SmpF5F2lnZkiyQw
 MV3XJtj/Ugy+1nUFlW/iw5WOXELGbBjcXnOd2Ybk6DzvHQ/EhrhYgCRgzsGQBWdk80pk9PMDDvcsj
 4+8u1SRz/fMC5IFN8jjg9l8i+yUYril+qVYjc9q3TVS0jGNRTqezc6MwEisFAsrICGnu9N8dMzp6P
 wJB9ZqMUkOw0FbEFnNRVwJvqIpAxQ==;
Message-Id: <f723f626627fda681327075105701695d7c630e5.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 01/23] fsdev/virtfs-proxy-helper: Use g_mkdir()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>,
    Bin Meng <bin.meng@windriver.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f723f626627fda681327075105701695d7c630e5@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20220927110632.1973965-27-bmeng.cn@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 fsdev/virtfs-proxy-helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 2dde27922f..5cafcd7703 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include <sys/resource.h>
 #include <getopt.h>
 #include <syslog.h>
@@ -639,7 +640,7 @@ static int do_create_others(int type, struct iovec *iovec)
         if (retval < 0) {
             goto err_out;
         }
-        retval = mkdir(path.data, mode);
+        retval = g_mkdir(path.data, mode);
         break;
     case T_SYMLINK:
         retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);
-- 
2.30.2


