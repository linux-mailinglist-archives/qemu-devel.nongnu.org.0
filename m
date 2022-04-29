Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503FC514803
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:25:01 +0200 (CEST)
Received: from localhost ([::1]:42846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOk8-0000bR-8j
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c714b5e1cae225ab7575242c45ee0fe4945eb6ad@lizzy.crudebyte.com>)
 id 1nkO6R-0007VJ-23; Fri, 29 Apr 2022 06:43:59 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c714b5e1cae225ab7575242c45ee0fe4945eb6ad@lizzy.crudebyte.com>)
 id 1nkO6P-0008DO-Kt; Fri, 29 Apr 2022 06:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=M8pYgY9HNMhKEkwruRWVG1Le2uLEC0KaabEbJ3It6c8=; b=PNhwX
 KLj8zlsk7gQ5eB/AtLIDuVgM5xZSLjQLp07I9xWxTTa3tzanrD7nj++pgn1PnGbh6yaT9BH9b4XH6
 Jw3/mPDAyoqK6saIVgLUuKw8622tqE617WaZQzyYpji7/+M98XjFJpGPzuBqmWgKcMNClvZBRQTjl
 a3wYHIXl7fwngcXzVDJoe8xcCntSRi6EBpY3rmlpKQB7ecZEZ830UYw8fybnAT93mbDRKMMTh8gYh
 MBj05/F/J+E0cVs+u7pmRSbkAIvy0W9s5hUL8I37z53mQdTjEPaD/Umjo4bjj8ZthzERAIjMg+H1z
 rjiEzuMY17LobYxhAYcAdxu45joeQ==;
Message-Id: <c714b5e1cae225ab7575242c45ee0fe4945eb6ad.1651228001.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651228000.git.qemu_oss@crudebyte.com>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 29 Apr 2022 12:25:29 +0200
Subject: [PATCH v5 6/6] 9pfs: fix qemu_mknodat() to always return -1 on error
 on macOS host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c714b5e1cae225ab7575242c45ee0fe4945eb6ad@lizzy.crudebyte.com;
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
2.32.0 (Apple Git-132)


