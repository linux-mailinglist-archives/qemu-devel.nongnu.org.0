Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621B610FB9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:31:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNY3-0005Fj-5Z; Fri, 28 Oct 2022 07:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8c75b8bbb7db0b22bac56a27d6618506be26905e@lizzy.crudebyte.com>)
 id 1ooNY1-0005FT-EZ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:29:13 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8c75b8bbb7db0b22bac56a27d6618506be26905e@lizzy.crudebyte.com>)
 id 1ooNXw-00027n-Gv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=L4OSP1zwqK6EzMnuOSfhOc51Sh/aJtE5mnLGbaPEW3I=; b=kqlnH
 y/m7DdVR8BfSbnW7xH8CpSule31kfkOu9/iuzqyQg597VDLO0/7eSfZzSzSCDRDIJhi4f4uT4otS6
 36LZwikeBox5CR5/ommvjMszCYeAp5q+/6Pxx4K06IpyUC+xGFosDQmdq/sKDb1y/07+1cjPOxVSI
 dA9UvnpXm5nMs5G3HCZudjEFzVfdXou/EqS4vq6GgeX44PjPEwJhkMnCZ045yYW5Wot3oY4qeiGKG
 eZZgrf33QGGmKTBvsFb2nASlYPpxF7NpQ10KhV05sFF7ySKVvbRcxoPeQTiwmUpxJiuwp2U+HYyzO
 zfksUQLx8Foja9KBx6HNOBfZ5wmVA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 28 Oct 2022 13:21:51 +0200
Subject: [PATCH] 9pfs: fix missing sys/mount.h include
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Bin Meng <bin.meng@windriver.com>
Message-Id: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=8c75b8bbb7db0b22bac56a27d6618506be26905e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes the following build error:

  fsdev/file-op-9p.h:156:56: error: declaration of 'struct statfs' will
  not be visible outside of this function [-Werror,-Wvisibility]
    int (*statfs)(FsContext *s, V9fsPath *path, struct statfs *stbuf);
                                                       ^

As Windows neither has statfs, nor sys/mount.h, don't include it there.

Fixes: 684f91203439 ("tests/9p: split virtio-9p-test.c ...")
Link: https://lore.kernel.org/all/2690108.PsDodiG1Zx@silver/
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 fsdev/file-op-9p.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 4997677460..700f1857b4 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -24,6 +24,8 @@
 #endif
 #ifdef CONFIG_DARWIN
 # include <sys/param.h>
+#endif
+#ifndef CONFIG_WIN32
 # include <sys/mount.h>
 #endif
 
-- 
2.30.2


