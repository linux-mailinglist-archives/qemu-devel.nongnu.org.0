Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCCA43CBD3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:18:41 +0200 (CEST)
Received: from localhost ([::1]:56368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjlI-0005EE-1o
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cc82fde9c7b4b598907914896ee6942fa866258c@lizzy.crudebyte.com>)
 id 1mfj0Y-00074z-Eq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:26 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cc82fde9c7b4b598907914896ee6942fa866258c@lizzy.crudebyte.com>)
 id 1mfj0S-0008KO-K0
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=qEgYYYFODGYaDwvKrWVyugQSMZX0F3EapHRlySQpKA8=; b=Sb/dg
 GMd7kuQiAJ4oydPF/ilc7ioPVv5X8zgszsE074H5kqQEs4yqOckefHSNhnLa3bUJdXfBO63CUxV1S
 LZu8wM6rdcBXObX3JKvL7LTm2CIV/pB+IZKN8awy2RwRtWrthNEVIea3SY3OE8ez4H4TqA4OYh0kq
 HIqhX790l1Kh1gZWTlxvw6MwOGHgb0xLuTH0cUS4YWSMTAB44UK+xUm3r+ixOmhU7xJuk+VrdR0Yr
 RDV4D2N9zt+ovOgMG1PL0+lDOAOhP8zlacIBq67LceBqkfep23I5/+StqRTxIUCtxE008jTiFYO10
 BmuIz5vScbekK8+me7sSQFdK+5TAw==;
Message-Id: <cc82fde9c7b4b598907914896ee6942fa866258c.1635340713.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 7/8] 9pfs: make V9fsPath usable via P9Array API
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=cc82fde9c7b4b598907914896ee6942fa866258c@lizzy.crudebyte.com;
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

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <79a0ddf8375f6c95f0565ef155a1bf1e9387664f.1633097129.git.qemu_oss@crudebyte.com>
---
 fsdev/file-op-9p.h | 2 ++
 hw/9pfs/9p.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 42f677cf38..8fd89f0447 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -18,6 +18,7 @@
 #include <utime.h>
 #include <sys/vfs.h>
 #include "qemu-fsdev-throttle.h"
+#include "p9array.h"
 
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
@@ -105,6 +106,7 @@ struct V9fsPath {
     uint16_t size;
     char *data;
 };
+P9ARRAY_DECLARE_TYPE(V9fsPath);
 
 typedef union V9fsFidOpenState V9fsFidOpenState;
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index e874899ef5..15bb16f466 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -50,6 +50,8 @@ enum {
     Oappend = 0x80,
 };
 
+P9ARRAY_DEFINE_TYPE(V9fsPath, v9fs_path_free);
+
 static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
 {
     ssize_t ret;
-- 
2.20.1


