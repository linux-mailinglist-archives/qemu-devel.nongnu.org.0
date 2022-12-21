Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74856531CE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yro-0005YA-9e; Wed, 21 Dec 2022 08:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7yrj-0005Jm-8I
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:10:35 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7yrg-0005Ck-W1
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:10:34 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id D875FCED1B;
 Wed, 21 Dec 2022 14:10:31 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	xieyongji@bytedance.com
Cc: marcel@holtmann.org
Subject: [PATCH v3 08/10] libvduse: Provide _GNU_SOURCE when compiling outside
 of QEMU
Date: Wed, 21 Dec 2022 14:10:24 +0100
Message-Id: <4626f514d87bf8dc5ed5b16672f1799acea69f6e.1671628158.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671628158.git.marcel@holtmann.org>
References: <cover.1671628158.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the libvduse sources are used by another project, it can not be
guaranteed that _GNU_SOURCE is set by the build system. If it is for
example not set, errors like this show up.

  CC       libvduse.o
libvduse.c: In function ‘vduse_log_get’:
libvduse.c:172:9: error: implicit declaration of function ‘ftruncate’; did you mean ‘strncat’? [-Werror=implicit-function-declaration]
  172 |     if (ftruncate(fd, size) == -1) {
      |         ^~~~~~~~~
      |         strncat

The simplest way to allow external complication of libvduse.[ch] by
setting _GNU_SOURCE if it is not already set by the build system.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 subprojects/libvduse/libvduse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index e089d4d546cf..c871bd331a6b 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -16,6 +16,10 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdbool.h>
-- 
2.38.1


