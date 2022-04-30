Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511F515C9E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 14:02:20 +0200 (CEST)
Received: from localhost ([::1]:58488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nklnn-0005bx-El
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 08:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <096af171274cc76c51bf11366ae257391ddfed2a@lizzy.crudebyte.com>)
 id 1nklfq-0002sc-3M
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 07:54:06 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:46579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <096af171274cc76c51bf11366ae257391ddfed2a@lizzy.crudebyte.com>)
 id 1nklfo-0007Ie-Jc
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 07:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=C5l63rnifQ9IJrl0xxrAJKuGJe/pQG2u2yCendSHmc8=; b=SdAK/
 Kkk+G5MW1slQoo53y5XfGKANDXN9WJqDHCdXIYH80nkaUWWGITEjOVT4t0iDOCNiSTC2fLXY2+hNp
 aR7y2RnO614Jf8yiD5VEqWZdErWHPpoFMnJ0wyLiyJNk9N9NM6XPrHyFiiEzQLkv4NaCYfoWReNO8
 MqXkTELXYof5SNO79P1i0FjEGUyNFrtXGo9E4L9DtxPeTIeGtKazwKyPBkezAidqnuNiIciGk+AGb
 jiRWgUGsOeDRnSumCN5GKWbLQNDUuTJd1rZDQMsuB5VSbD5TUSukdbcXXSZD1b1/XcSoki3daH+fV
 KFrOdhknGt1Wif0jfoVUagoHvCx9g==;
Message-Id: <096af171274cc76c51bf11366ae257391ddfed2a.1651319081.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651319081.git.qemu_oss@crudebyte.com>
References: <cover.1651319081.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 30 Apr 2022 13:44:42 +0200
Subject: [PULL 2/7] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=096af171274cc76c51bf11366ae257391ddfed2a@lizzy.crudebyte.com;
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
Reviewed-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <3102ca936f88bc1f79d2a325e5bc68f48f54e6e3.1651228000.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util-darwin.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index bec0253474..e24d09763a 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -77,6 +77,15 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
 int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
+
+    if (S_ISREG(mode) || !(mode & S_IFMT)) {
+        int fd = openat_file(dirfd, filename, O_CREAT, mode);
+        if (fd == -1) {
+            return fd;
+        }
+        close(fd);
+        return 0;
+    }
     if (!pthread_fchdir_np) {
         error_report_once("pthread_fchdir_np() not available on this version of macOS");
         return -ENOTSUP;
-- 
2.30.2


