Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41605BE6C2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:11:29 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oad28-0006vR-LL
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYS-0000Wu-CX; Tue, 20 Sep 2022 06:32:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYQ-0004o1-SB; Tue, 20 Sep 2022 06:32:40 -0400
Received: by mail-pf1-x431.google.com with SMTP id w2so2383018pfb.0;
 Tue, 20 Sep 2022 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WrYLl9/VXe4gyeBTYZXcv9KC/z0Fg3KgFQTbTtkAnvE=;
 b=mnhR8h4tt7UyaJKmWEVvqB0nEpXrWtZtSQenvqPYfo7KTqqT3YbG3EV3ys2Q71tMqm
 ykfSAbPrqIVtGep9YMGOUVHyiDWP9BdGpAFviBm0z1w0KfSl4+CgiPwWZwCjffDKRyTP
 dGdNE7kHDLicHbR/qLMYhboTd8jUIcwUnWQlpGKVmodwA1jMEENFQuAJ0/twOT3OzhcB
 akecN1dS/SousXPDrvMm4HlE/7herxtlzA/8W4ABNSghc8yIqtY8rW3nOr32m0HlTbBf
 +B636/mQrpbT7o6SibcSpAusDL37Ys3R9Nmk/rQYfOmG2RbxjmDuJWZOhm/C5Vl2t2Qt
 HSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WrYLl9/VXe4gyeBTYZXcv9KC/z0Fg3KgFQTbTtkAnvE=;
 b=2z45GSVry/kJ8JpGR8WPGpfI3GAoXi+wmIBJrMX5fBXTzvRuzQneBYJVdKy3u8K12i
 ACmUKfSzyZkb12N0WLHlX+x4OgAvDtl04A0TxJ67iBMd6pSIfmiOGqqDq4XqxKd+xiRl
 ksReBhxV1o06C1eo9eWd60l03OGaZTmfigRuwoAmxGrsCXGJd0TVOzqfjd8bHSZwQ8Aa
 +Bov9bp7uyNtDRba2zFsZDMw4vZPzgWZMrmATZ+WKIz8eYbZMGQXDhMJZFAyWb/O6F9X
 wsOdfZddle8gT59DmF7N9GkhS9TLS7kSmaHm7eIx6iLfRv5D+qaffYdp8C4ucfDd+qSS
 BEjg==
X-Gm-Message-State: ACrzQf2ndGazBgT3HHh9UvJ2le1W3oFfFb/4af7bB+4RXp34ClS0CyJw
 o7TEvAKSK6yHbviXQfMErZO3uF4D4Eo=
X-Google-Smtp-Source: AMsMyM7Yvah4QZTxSHcmfjAkK41p/oQitXwwpsig9Cbs1BhGp68WgTgcTp2jSCDvexw1t4PUJLi8sw==
X-Received: by 2002:a62:7b97:0:b0:551:ab8e:d14 with SMTP id
 w145-20020a627b97000000b00551ab8e0d14mr1687440pfc.24.1663669956204; 
 Tue, 20 Sep 2022 03:32:36 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v2 08/39] block/vvfat: Unify the mkdir() call
Date: Tue, 20 Sep 2022 18:31:28 +0800
Message-Id: <20220920103159.1865256-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is a difference in the mkdir() call for win32 and non-win32
platforms, and currently is handled in the codes with #ifdefs.

glib provides a portable g_mkdir() API and we can use it to unify
the codes without #ifdefs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Change to use g_mkdir()

 block/vvfat.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..723beef025 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include <dirent.h>
+#include <glib/gstdio.h>
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -2726,13 +2727,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
             mapping_t* mapping;
             int j, parent_path_len;
 
-#ifdef __MINGW32__
-            if (mkdir(commit->path))
+            if (g_mkdir(commit->path, 0755)) {
                 return -5;
-#else
-            if (mkdir(commit->path, 0755))
-                return -5;
-#endif
+            }
 
             mapping = insert_mapping(s, commit->param.mkdir.cluster,
                     commit->param.mkdir.cluster + 1);
-- 
2.34.1


