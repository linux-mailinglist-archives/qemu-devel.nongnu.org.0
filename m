Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE843CBC0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:13:54 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjgf-0007pS-TC
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <669ced09b3b6070d478acce51810591b78ab0ccd@lizzy.crudebyte.com>)
 id 1mfizi-0006fm-PK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:30 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <669ced09b3b6070d478acce51810591b78ab0ccd@lizzy.crudebyte.com>)
 id 1mfizh-0008FP-B0
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=D2bTfbiS2cveK8Nowp4RPRX/8NKh2O3bMkdTquL+C1Y=; b=IMREL
 plX+/5ccogDuE/PY38RcGZWgBwFRJ0FyvKb6+FdALmK0pTV2TcjwMX+etaVG9PXUG2pgNakHvuoxE
 5ehvi/JYg2C6kAfK8PdlfdetZjOC/eIOprLFPhbt44di9EgYeNeR24coJ8QyiH92HkCHOiDJki0PN
 y7MO78UqhkpW2QphFv4HlzCn+CFWy7RNqmx4zuTHgkCn0/2u/KupgvwF+7LxUyQ4gHSfxIbwTH1vD
 MHs1NsXxfLncRKGxQoa/VEDKI6G6WveDesCPxEKid4sT+kA/2IzKsQssrqZFdoFcpkQ9ttkWxdzaR
 VhPR/zdTycN/Af53coFQwA9Ev/YLw==;
Message-Id: <669ced09b3b6070d478acce51810591b78ab0ccd.1635340713.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 1/8] 9pfs: fix wrong I/O block size in Rgetattr
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=669ced09b3b6070d478acce51810591b78ab0ccd@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

When client sent a 9p Tgetattr request then the wrong I/O block
size value was returned by 9p server; instead of host file
system's I/O block size it should rather return an I/O block
size according to 9p session's 'msize' value, because the value
returned to client should be an "optimum" block size for I/O
(i.e. to maximize performance), it should not reflect the actual
physical block size of the underlying storage media.

The I/O block size of a host filesystem is typically 4k, so the
value returned was far too low for good 9p I/O performance.

This patch adds stat_to_iounit() with a similar approach as the
existing get_iounit() function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1mT2Js-0000DW-OH@lizzy.crudebyte.com>
---
 hw/9pfs/9p.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index c857b31321..708b030474 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1262,6 +1262,25 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
 #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields above */
 
 
+static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
+{
+    int32_t iounit = 0;
+    V9fsState *s = pdu->s;
+
+    /*
+     * iounit should be multiples of st_blksize (host filesystem block size)
+     * as well as less than (client msize - P9_IOHDRSZ)
+     */
+    if (stbuf->st_blksize) {
+        iounit = stbuf->st_blksize;
+        iounit *= (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
+    }
+    if (!iounit) {
+        iounit = s->msize - P9_IOHDRSZ;
+    }
+    return iounit;
+}
+
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
                                 V9fsStatDotl *v9lstat)
 {
@@ -1273,7 +1292,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_gid = stbuf->st_gid;
     v9lstat->st_rdev = stbuf->st_rdev;
     v9lstat->st_size = stbuf->st_size;
-    v9lstat->st_blksize = stbuf->st_blksize;
+    v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
     v9lstat->st_blocks = stbuf->st_blocks;
     v9lstat->st_atime_sec = stbuf->st_atime;
     v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
-- 
2.20.1


