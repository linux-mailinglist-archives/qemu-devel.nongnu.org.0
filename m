Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301395F6B16
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:57:46 +0200 (CEST)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTFp-00013E-9F
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf9-000405-H3; Thu, 06 Oct 2022 11:19:52 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf8-0005z4-0W; Thu, 06 Oct 2022 11:19:51 -0400
Received: by mail-pl1-x630.google.com with SMTP id x1so2003790plv.5;
 Thu, 06 Oct 2022 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=bMVRBtF3rB9T4NqykypNCMk2ByApFkJzbP0tPQbYH9zFBXwv76pzcKh0GQsssA0fe9
 84Gma0ShLPS74WDZIfb73cEu7wRi7Fl1RYG0V72ZfM3Io/ga+1TjZJPs+kkyaBsFSUZc
 wM/jDUWW2YC7+/WgoX3iwEuJ+RFlzdSpI/4HE/mh2SLnJyv86t9hx/SbClXPj1eOr6J7
 YnBMT6yJIhj9zk1JVdjfkHFPgZ0RNx1f5mw5KG9wiZyGV/Q2ZYQgrgW6WvcbxdJR+Z/E
 2BfOJXgEJtMe+KdQu96Cq1FOF6T0p3369rfOWc+A7sgxInu/4qBKib+sDWVl96N9arCx
 W4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=0eFhMYgBZFRvSnyAQm/cJh17mmS5e3Oa70Dok/rLIyP9XGvmv3rZepM3SP9FE0/ybA
 LRDT+b+pDLSw37ai6zULMg4ve4MpGj9c38Rhi3zCeBpk1kSAqv5V2n4UTKxqjG0h+7Im
 afpK7YYeD+Yt4/mRVKyMtWqmz2W+ykpWnPVEVIREXdeRxPA85o3jGm1xEuGTT09axv4I
 npD5QWru5Iqp4Zfea9pFeQc7S+BG7O8SxR8nxr88Xm2sYPkmnAjQTewNlxbPJpm/nb/Y
 NYzotps7bIn2qbS3HVSalh6/8KBaCalQaWAIbZJ6ocxhTeXQYhTuMNkaarRmrD+Xi4U8
 lhPw==
X-Gm-Message-State: ACrzQf0AoFIE65yqTxHE++Xl8YdTkHvunEQi4Nm1Q9UJavK+NejHvMjl
 5PiylFN6eAPFasMtIXx3JoiV3X64yAk=
X-Google-Smtp-Source: AMsMyM7tTZtw8TsZNcGbFjxrNfD6VzPtYHliDYnsoAWF3N0tNRJ9MsnmcXnn3GIibw40ZnJFklfqcg==
X-Received: by 2002:a17:902:b907:b0:178:2898:8084 with SMTP id
 bf7-20020a170902b90700b0017828988084mr405257plb.140.1665069588006; 
 Thu, 06 Oct 2022 08:19:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v5 05/18] block/vvfat: Unify the mkdir() call
Date: Thu,  6 Oct 2022 23:19:14 +0800
Message-Id: <20221006151927.2079583-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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


