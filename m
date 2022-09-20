Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4A5BE5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:27:13 +0200 (CEST)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacLE-0007dQ-S5
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYF-0000Uj-7i; Tue, 20 Sep 2022 06:32:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYB-0004mS-7C; Tue, 20 Sep 2022 06:32:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id y11so2545343pjv.4;
 Tue, 20 Sep 2022 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=++8A+cTrk8kA5OevUgBZAOwhpsyp4kigQ5hSHOgI1dQ=;
 b=aIt61akS7rkQwFGGnHSKpJpxh6I9pgtgaoPNSg9RkwBOA4WgDaBb7BQNhwPPZIfPIK
 tM8oNZrQLp6ERHyzm3y5FCgLv/gL32gUisFV5QKD+LZTZNonfRC6oXeR1P6SYMKQDY0B
 3XKOJm2DbqVWZVYufCbNWRwtsEi771zl5AErUkZ5bXPogrQdb/h1TSFVJJ6ZMTB1HQe6
 GtNOOHayYNIzc2XpbY4HP08Z5mf+k5hB8ux9Qv0azyVANC1mNaVgn1a/XUdlnKFCdb9X
 Zz/scClBBI5kCXCE+xgCb76wIgRUyiPfWJdJC7y+UZTPziJmz77A/8Tet27xH2nfk534
 pdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=++8A+cTrk8kA5OevUgBZAOwhpsyp4kigQ5hSHOgI1dQ=;
 b=hUU/nOT7vZRzRiDk2GwOAMS2q5zDAQ1D6xAWLF58HZ9i6uwtINwFL1vB81TsGolsPY
 mtfmjTDroS9iGDUPXUhuH3c1lCPT4+17TwYg6lGVp0Lwvg7xde83gs0NebjqEvvj90/5
 v+V5wux+Hv4jpahrBasvhfBnT8paeFfTO3n2nC8P5iaN5QGTOjrqnAcMBs723kF8Obva
 eOqPzx6tW1J9khLEW04kWCgkJ00SR4L4WqUY7O4g/WtakEyZaCVNnM716wc/nPA0VzT/
 wW0Q0peGeJ50xJH4vKdjBzQ1UXamqH4kCPH70YUB7rwzrRkC6K7rzs033RMi949yoMh2
 KO9Q==
X-Gm-Message-State: ACrzQf2TFLjXMakanlqYBTPtSwu4zkw9krjLKWppzT0cTaCs/p/1noXM
 nu+G2gJhEtuaqkHZ+WDCAGnSRO/mbHw=
X-Google-Smtp-Source: AMsMyM4D/o9hXvQKSKCGe9ukUVSF8sp9ppnb1rXe/iJmw97pDPGMzN1GjxrM4n8GyNG47TdZV39TzQ==
X-Received: by 2002:a17:90b:3b92:b0:203:a4c6:383c with SMTP id
 pc18-20020a17090b3b9200b00203a4c6383cmr3104443pjb.92.1663669941413; 
 Tue, 20 Sep 2022 03:32:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v2 03/39] block: Unify the get_tmp_filename() implementation
Date: Tue, 20 Sep 2022 18:31:23 +0800
Message-Id: <20220920103159.1865256-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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

At present get_tmp_filename() has platform specific implementations
to get the directory to use for temporary files. Switch over to use
g_get_tmp_dir() which works on all supported platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 block.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index bc85f46eed..d06df47f72 100644
--- a/block.c
+++ b/block.c
@@ -864,21 +864,10 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
  */
 int get_tmp_filename(char *filename, int size)
 {
-#ifdef _WIN32
-    char temp_dir[MAX_PATH];
-    /* GetTempFileName requires that its output buffer (4th param)
-       have length MAX_PATH or greater.  */
-    assert(size >= MAX_PATH);
-    return (GetTempPath(MAX_PATH, temp_dir)
-            && GetTempFileName(temp_dir, "qem", 0, filename)
-            ? 0 : -GetLastError());
-#else
     int fd;
     const char *tmpdir;
-    tmpdir = getenv("TMPDIR");
-    if (!tmpdir) {
-        tmpdir = "/var/tmp";
-    }
+    tmpdir = g_get_tmp_dir();
+
     if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
         return -EOVERFLOW;
     }
@@ -891,7 +880,6 @@ int get_tmp_filename(char *filename, int size)
         return -errno;
     }
     return 0;
-#endif
 }
 
 /*
-- 
2.34.1


