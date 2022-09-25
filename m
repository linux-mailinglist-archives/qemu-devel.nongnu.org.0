Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C725E92E7
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:02:19 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQKw-000607-WF
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrQ-0002v5-RZ; Sun, 25 Sep 2022 07:31:52 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrP-0006OR-EY; Sun, 25 Sep 2022 07:31:48 -0400
Received: by mail-pf1-x434.google.com with SMTP id e68so4194425pfe.1;
 Sun, 25 Sep 2022 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=T/c1Ie4xiK/itSGbdjFWp79DpP8SzIdHZMBx2ABtzib0ylNv07zcy7xXU3NaAu1TAQ
 P8HbIKai/6nAp3WrbaKBzofCq+ru0/pK8Lnbtmt55F3SJ8aiPH6nMvY9iVU6siVD31N6
 1PWEDcmPD4gx+f7KhtpuwBcL4F3w/th5CTP+WYSYzK+dfSx5yUx8KOnPGzI18B27n0pr
 ZUlGxr9ZODAIR6+kOi9a9tGt+ZMoRnIKwQ1J/KGEqsTB3WlW2F6A5ItEkQPMCLPqKVXL
 e+pXpd8lL7POEy3Quo+T3y9Xi3vFfuDgkKO3lRkoB0hsNrc9c4U04lNSnEi5xZuk+aKi
 vUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=dm2YfQpe1fLpwHgQJFgqxLlzAoyy/WLU9T+BMfWFEyD/Tpja2QI4VzsxI1dFqlq+Id
 mNYFvnIsdbKd8o/pBQPVWXqONgdpCj73owqUNeM9+zUJFHMWk9C+rBOioxAjUk0zl4kj
 JvE37UxilppBFqOshd5eq22BeOZU07lQBxulqa5JSlOIY8sTgWX8W4mSFLUHR//fjxiz
 pdUZXmgsvRwkiiEA4q233eWmo/jK4P/l7YWI9SAVsPxHDxj1L1Ul9xZUmt4HjEEOFsKp
 FeAtYYWUVj/PNDfa5S1R/krnFk7vgqBwcvoUV59VclQ7w6LAoqHPpA/Qo0za0ZS2+ZlD
 ynaQ==
X-Gm-Message-State: ACrzQf03yiMivoyzIjYj+V/jJx0iFh/+8G0fI0bHdd2j9/XLJri6VXpW
 4Ju2Er0/I5xEkNI7WALQC6UAM1BZi3g=
X-Google-Smtp-Source: AMsMyM71GS+dydzBR6N5JwYed3msH3GIGN5545/yaH05bI6sJEFAlBcdXBF32X1dnP8LzdjShEGzCg==
X-Received: by 2002:a63:1546:0:b0:42c:50dc:2115 with SMTP id
 6-20020a631546000000b0042c50dc2115mr15522845pgv.613.1664105505711; 
 Sun, 25 Sep 2022 04:31:45 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 25/54] block/vvfat: Unify the mkdir() call
Date: Sun, 25 Sep 2022 19:30:03 +0800
Message-Id: <20220925113032.1949844-26-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

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


