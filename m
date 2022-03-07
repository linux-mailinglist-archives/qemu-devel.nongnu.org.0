Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86694CFDDA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:09:40 +0100 (CET)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCBI-0007wc-28
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:09:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <67a71e3b71a2834d028031a92e76eb9444e423c6@lizzy.crudebyte.com>)
 id 1nRBUa-0005Wj-Uv
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:25:33 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:48867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <67a71e3b71a2834d028031a92e76eb9444e423c6@lizzy.crudebyte.com>)
 id 1nRBUT-000752-SU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=gEkMfmU/1Fn/SSfM8FnRnK2abQo4v0plT/myHJeapCw=; b=CQ+gL
 Oj2EYTNMoUVD9Z8mfWDlznIDBjpXbBc7k04sD3Iu9q3Ym0uXI3+RT6xnZZW0jJGC5EtHEGEvUPRfA
 cPPhI+SHjKWA9StZWuDO0ziuBFt6030RsIH1eM1kJBzrdE44vVQ/8jjZ/D9NxrIcjU+Qa0pm/FtJR
 2aZCpCdJ2IcTumtTLLf1FdNZdDHvR3CUMuG53SNRJhG0iC1E3UJFy5P6IHT2f4RhqKDxAjKRkQpfX
 1BdX9OTMmByiC8ncbehztRJOLmXaUDHus+/jzPTcAnO8Fq46Go8FqQqp1/RTmjwHyFoK29IIBnLhl
 GEJxogLitK/aS9004irPyuAyFP8Iw==;
Message-Id: <67a71e3b71a2834d028031a92e76eb9444e423c6.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 05/19] 9p: darwin: Ignore O_{NOATIME, DIRECT}
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=67a71e3b71a2834d028031a92e76eb9444e423c6@lizzy.crudebyte.com;
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
[C.S.: - Fix compiler warning "unused label 'again'". ]
Link: https://lore.kernel.org/qemu-devel/11201492.CjeqJxXfGd@silver/
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util.h |  4 ++++
 hw/9pfs/9p.c      | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 7449733c15..a48da32f04 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -37,10 +37,13 @@ static inline int openat_file(int dirfd, const char *name, int flags,
 {
     int fd, serrno, ret;
 
+#ifndef CONFIG_DARWIN
 again:
+#endif
     fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                 mode);
     if (fd == -1) {
+#ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
              * The client passed O_NOATIME but we lack permissions to honor it.
@@ -53,6 +56,7 @@ again:
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


