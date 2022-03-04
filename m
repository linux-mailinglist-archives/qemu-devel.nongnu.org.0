Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7313D4CD592
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:54:01 +0100 (CET)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Nc-0005Yj-If
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8744e9fc25ac8cc29c97ba3ee48050add2ba6b57@lizzy.crudebyte.com>)
 id 1nQ7wP-0001oz-1L
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:25:53 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:58635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8744e9fc25ac8cc29c97ba3ee48050add2ba6b57@lizzy.crudebyte.com>)
 id 1nQ7wM-0006VF-Kb
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=w23H3Dx87Ym5W3lYIQkXR14VvSyrEGHNHHYkXrQq2Io=; b=iHqPb
 JaZu7IcW+5YRiGJm10mqTgaKSldyCF1cNKReq5tKydRqKzvgmUmaVgdajC04J/8cCf+os4FhuXoDI
 mAL6fVaPO3bAqBfK1Ayy8q6aPcLTPLcDrHfSdp2IBGz/qoUC+3WLg9TojlFn/Csmd76LBCWVYolpK
 N+eWtRqeUxNM4YkDoaSjzUYvMYq/FsTqBE4H+IsxXmHRB1/nkulIBpRQMRoraLO5gSP3MKseqbpbs
 tR8UXe/tRLK7c3FUWeJ/nLoBam5COQQ+KKZAXqD0yIgtPFYefXgCZylZn7FsW8NRG7vZg8htGVFsb
 ZXn4Q3mTsb72iou6oailuUgXZ+L7A==;
Message-Id: <8744e9fc25ac8cc29c97ba3ee48050add2ba6b57.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 05/19] 9p: darwin: Ignore O_{NOATIME, DIRECT}
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=8744e9fc25ac8cc29c97ba3ee48050add2ba6b57@lizzy.crudebyte.com;
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

From: Keno Fischer <keno@juliacomputing.com>

Darwin doesn't have either of these flags. Darwin does have
F_NOCACHE, which is similar to O_DIRECT, but has different
enough semantics that other projects don't generally map
them automatically. In any case, we don't support O_DIRECT
on Linux at the moment either.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Message-Id: <20220227223522.91937-6-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util.h |  2 ++
 hw/9pfs/9p.c      | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 7449733c15..2b9ac74291 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -41,6 +41,7 @@ again:
     fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                 mode);
     if (fd == -1) {
+#ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
              * The client passed O_NOATIME but we lack permissions to honor it.
@@ -53,6 +54,7 @@ again:
             flags &= ~O_NOATIME;
             goto again;
         }
+#endif
         return -1;
     }
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index caf3b240fe..14e84c3bcf 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -138,11 +138,20 @@ static int dotl_to_open_flags(int flags)
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
+#ifndef CONFIG_DARWIN
+        { P9_DOTL_NOATIME, O_NOATIME },
+        /*
+         *  On Darwin, we could map to F_NOCACHE, which is
+         *  similar, but doesn't quite have the same
+         *  semantics. However, we don't support O_DIRECT
+         *  even on linux at the moment, so we just ignore
+         *  it here.
+         */
         { P9_DOTL_DIRECT, O_DIRECT },
+#endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
-        { P9_DOTL_NOATIME, O_NOATIME },
         { P9_DOTL_SYNC, O_SYNC },
     };
 
@@ -171,10 +180,12 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      */
     flags = dotl_to_open_flags(oflags);
     flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
+#ifndef CONFIG_DARWIN
     /*
      * Ignore direct disk access hint until the server supports it.
      */
     flags &= ~O_DIRECT;
+#endif
     return flags;
 }
 
-- 
2.20.1


