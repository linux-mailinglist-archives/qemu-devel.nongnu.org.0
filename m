Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270E506C4E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:24:43 +0200 (CEST)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmuQ-0007Wj-9F
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2a515431fdc02b0b2d3613f5d569305a32cfba30@lizzy.crudebyte.com>)
 id 1ngmqM-0002cn-8f; Tue, 19 Apr 2022 08:20:33 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:54949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2a515431fdc02b0b2d3613f5d569305a32cfba30@lizzy.crudebyte.com>)
 id 1ngmqK-0004hu-Jr; Tue, 19 Apr 2022 08:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=TICQYmVG2fGq8oMs38SR7J85rthZ4dIAGNyEZ4xB9iE=; b=Onh+6
 PpM2JXXxqHN0Stx6CzLatDbj/92HqpWLvK25+0bZYpbM/nNprfqkP0emd7Ck+waA37jGpiIaXr3KK
 GMi/Ik1vusOHAa0XbfkeFwfriDWcY+SsNRo7iMy0Kgld1BpaNOxZ/JbmUr1gj4n/jmfDtBaPgRvN/
 YXDlW5b0izHpPl4pbhk8HTOfLhPdHO4LcUyGviars7oVo4swC0jWqgNR/ulP/znG2IUvYSR95H8Ex
 Tfm9VPFIHeN2MD4ZMqtI2aR6B7Bki2FIYE4RHXH+R954DSBdrdHPttouV7oedDZiWn5v+JYD6Az8a
 IPftywauV543Sow2iy2wqgGg9gj2A==;
Message-Id: <2a515431fdc02b0b2d3613f5d569305a32cfba30.1650370026.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650370026.git.qemu_oss@crudebyte.com>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 19 Apr 2022 13:40:48 +0200
Subject: [PATCH 1/5] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=2a515431fdc02b0b2d3613f5d569305a32cfba30@lizzy.crudebyte.com;
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

mknod() on macOS does not support creating regular files, so
divert to openat_file() if S_IFREG is passed with mode argument.

Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
equivalent to type S_IFREG".

Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util-darwin.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index bec0253474..53e0625501 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -77,6 +77,10 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
 int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
+
+    if (S_ISREG(mode) || !(mode & S_IFMT)) {
+        return openat_file(dirfd, filename, O_CREAT, mode);
+    }
     if (!pthread_fchdir_np) {
         error_report_once("pthread_fchdir_np() not available on this version of macOS");
         return -ENOTSUP;
-- 
2.32.0 (Apple Git-132)


