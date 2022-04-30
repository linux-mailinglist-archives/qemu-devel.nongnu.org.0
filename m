Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC7515C9C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 14:00:01 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkllY-00030m-9D
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 08:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e8fb9ed725fe2ed00a275674a84beb5ba6e538a7@lizzy.crudebyte.com>)
 id 1nklgN-0003v7-P0
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 07:54:39 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e8fb9ed725fe2ed00a275674a84beb5ba6e538a7@lizzy.crudebyte.com>)
 id 1nklgM-0007KG-C4
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 07:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=xUTz2/T2xUbJYB4ZKgpzvIQ08LtZSxkXnkIGIsocr2I=; b=OLu6n
 yDKYhIjyD8EF+i+lEJ+pAW6Om55QEhz+3w/+PNY7uyeVEqcmHJVJFjjgfZgO0hDuLZh7iwNvTGT1u
 /NrvyvqheYAqHcWDZlLfGHdZ3EGghh4KLpA2sK5KH6jLtBlR1KD5GjbCUfAcsG4T1Pfv9yF/2sncz
 iYqDZylP3FZGRY61hjWgYUzLOa45bja/iAc9VreHkIb8+VWc12nSQu/JWpmfnRNulJOTiZLdfK7Vc
 jb/CiUS333imwt3k2DpNiqwasYra1a9Ttw/cfotuUWoP6gPf0MEFCIZtuDSxsydVyCEx7hhKs723/
 3/f8lW9ZJY6D4Ks/bDcumy0QoCEBA==;
Message-Id: <e8fb9ed725fe2ed00a275674a84beb5ba6e538a7.1651319081.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651319081.git.qemu_oss@crudebyte.com>
References: <cover.1651319081.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 30 Apr 2022 13:44:42 +0200
Subject: [PULL 7/7] 9pfs: fix qemu_mknodat() to always return -1 on error on
 macOS host
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e8fb9ed725fe2ed00a275674a84beb5ba6e538a7@lizzy.crudebyte.com;
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
index 619c403ba7..a5f8707bb8 100644
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


