Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EC5EC1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:46:19 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od92Q-0004uy-7R
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RM-0002p9-8j; Tue, 27 Sep 2022 07:07:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RK-0004zz-Bw; Tue, 27 Sep 2022 07:07:51 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso15270661pjk.0; 
 Tue, 27 Sep 2022 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=UZM/j2lk1sGIINoePExJQWIgZdnFHZL2YFTUPXbY87EmUVwUdw/UBAPQp8HH+dbY1b
 pHg5Qz/vezWkhxAICUoGhQGlAyDea1ajkrVYRPaHKAuCYz6D8preYRi0l+EX3wCFlAyR
 TIzxVatDwOK7SmdVIxoSF7tNtrmYlTPCW3C9wNfPHuIyEEsUtc69HZZKDGZ+VOqnmSz0
 KHt/qc7sopRe1riJCCmAkJKDXhxEuEmtiDrZOYDyYTQ1343rKwRKCVUWtjklMnu3gCt7
 OWM5s1V22i3yqreBdpUzkn2Qkm2C35gWB4B93CGHldz9v8Srga4NM2yz6xE0kaLFHjOT
 5W3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mASgTbgC1fZZDNGRrUnVCNQGIWuAR0DCWfyrQC7EGTU=;
 b=lolZCTaK0Ji8dIW6boVTB/IyOxOA6BM/SZpYGIY/Dg+gKuFI977OoENOc+R2W/+0K4
 nPtNWfyKZpaXKVeknIvaHzCscAyRMjc0Z5ml2UBwa9OirBW3+/qHbHMmbS037Aybu/Ea
 AXZZpDgfO9UuhgIS11O70q5u1zUr/shMROY6V1z4XBBkDOJZsG1MwpSOOyj4Ej13L9/5
 OPuZVGhY5rris+1svREY/YPDj0D6m1H6vSBeXSChdG44aTyKK7Vl1mBCIoFvaTHbdQBv
 yZ2Ac8bmn4Ob2mqqKNm6Ri7HoNOJfo3J/zriXdpGRQrqn4OikPBm+eT4GM/049PYx5zn
 TIHg==
X-Gm-Message-State: ACrzQf2uBAdTpgAuMnAZhSznz/DruswFMpQVYmTpJeuXfpk3W48CRy4s
 XbfVL5Vlthd+1hPkDOP8N8WRzPnYhno=
X-Google-Smtp-Source: AMsMyM5skg2pYPxSEADOlNkBBqcJ8Egrk8huHfPzMR4ocU7lP/0LNnRKldv9w0K6rzULoiojd7KxUg==
X-Received: by 2002:a17:903:244b:b0:176:c8ee:a5ee with SMTP id
 l11-20020a170903244b00b00176c8eea5eemr26039812pls.46.1664276868491; 
 Tue, 27 Sep 2022 04:07:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v4 25/54] block/vvfat: Unify the mkdir() call
Date: Tue, 27 Sep 2022 19:06:03 +0800
Message-Id: <20220927110632.1973965-26-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
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


