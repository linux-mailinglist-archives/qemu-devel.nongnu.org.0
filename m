Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1DB51649B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 15:25:18 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl9Zd-0004rB-UN
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 09:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <063c75db2e03938b2fadb052c4661adae36e352c@lizzy.crudebyte.com>)
 id 1nl9TF-00029q-8m
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:18:41 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <063c75db2e03938b2fadb052c4661adae36e352c@lizzy.crudebyte.com>)
 id 1nl9TD-0005Na-Qi
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=+inl/5cpOXs40ozy4YakG2iXX+wQU4SPqqeXKR162vs=; b=NCZ4X
 WeyV3RU+xdT9wrUT+Hodqkg/1SOoMxp5/1U9oZbTy8jiBcMn9X/PBvhXdRVWhEKlidkbg4rG6u8yP
 0qMczixQFKzrNG3G2ZcQLNiW/LDbTp7VNYa3CLyro0us2PTfPjJBgfVA0+7SJRW/XYGpNey96OwDj
 p0aILc4VQxZE9iX4ipXRvO1LpyT4EH+5JIsxvVnb26giCmTosCGqAuqaJjAmGvOXcvymb3+Cdkb7w
 JTU1quGEJIV9Fj+L0raPk4knAlcjnfPPeDMIKHcBVA4X+AcQtVZ9U6TPEwtOYozRbQ8xQ4FxjRw9s
 HKy5Mk+QBmgiyTM/o3pmPzXJe8Eiw==;
Message-Id: <063c75db2e03938b2fadb052c4661adae36e352c.1651410615.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651410615.git.qemu_oss@crudebyte.com>
References: <cover.1651410615.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 01 May 2022 15:10:16 +0200
Subject: [PULL v2 7/7] 9pfs: fix qemu_mknodat() to always return -1 on error
 on macOS host
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=063c75db2e03938b2fadb052c4661adae36e352c@lizzy.crudebyte.com;
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

qemu_mknodat() is expected to behave according to its POSIX API, and
therefore should always return exactly -1 on any error, and errno
should be set for the actual error code.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <c714b5e1cae225ab7575242c45ee0fe4945eb6ad.1651228001.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util-darwin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index bd2dd81548..95146e7354 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -124,7 +124,8 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
     }
     if (!pthread_fchdir_np) {
         error_report_once("pthread_fchdir_np() not available on this version of macOS");
-        return -ENOTSUP;
+        errno = ENOTSUP;
+        return -1;
     }
     if (pthread_fchdir_np(dirfd) < 0) {
         return -1;
-- 
2.30.2


