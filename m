Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306359F6B4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:47:03 +0200 (CEST)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmyU-0008H1-JD
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsv-00027F-FB; Wed, 24 Aug 2022 05:41:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmst-0001KP-Vk; Wed, 24 Aug 2022 05:41:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id 2so15218274pll.0;
 Wed, 24 Aug 2022 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oO0SYzbawNGrDg6auw+O7c5purm7PS7f7P59XKUxYbE=;
 b=bHffE/UwOb1YAe22yBuG5fn/8y6I7CgETiarUmwh0cOsZ4toU1fBE240zfzNmvuEkD
 AtwCBy016YB072o6x/1itEcsJ5I9Acq97/h9DabW+wKtYunIWYOB6HbqbGD3PvBcAjRK
 LjCHTZLLzVptMLV3gkWIfMwRWBZif/c5rdLwZUHu5OAQzFKqfBXEkh/TJCpihpNgXumt
 xugWUmQVUeQLyE9gkr5qK43uzs0PYUbzyIEIRTeakubsceLeGFOlojLTJL3EGzg3ydOr
 6deW8S5esFxDpdbfNWYnm1m7GOFpkQDrJivCWFlObMHRXkz1CRl3XQqR0uHEADgpiRaY
 7S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oO0SYzbawNGrDg6auw+O7c5purm7PS7f7P59XKUxYbE=;
 b=z4W5Fu/goIrBhvmx6KtNtYqW3pS/C8SPFZQvWTr9UF9na1egtjpjp6aKl3J4x2Y3dj
 /3Q7OQWvXSUWUqyOWeCyDnQ3ApNiJvYNKBjs52NTjcZpcDxbqfnJ3OzJnt08J9WsULlr
 mWcmQmglNpWG9sNPajtWeBsUMfb79DA2xgES8f3of6tUN12OCtwG1YNwVwfUE6eLCd/9
 nZxXswThuSHQT95FPjwlQ4sNj8/jH9Qj13XdetGiDcQAPfIjO7BJvCFhqIroLKWi/NnH
 uPvXQruMNi8T9WYLsCcpBZK2pz0hWkD8P/6kFO6qVgrgqG3lGE8ZS6iUALtME7U2AKVE
 sY/Q==
X-Gm-Message-State: ACgBeo0lQJJQgcxjP4wnjW7Cf3yeDRGMEUSlDHfuls3lgkXiywMd5Bob
 cCZxJTKSQu/U34FW/GwAGjRYwD5R4DA=
X-Google-Smtp-Source: AA6agR6WF5MDSNfIXFV63CN8Viuk6Y1f0mlwIKX0E4X/WN200TS/sctBRDiJLarwM/v19YIWslMj9A==
X-Received: by 2002:a17:903:2483:b0:16c:dfcf:38e8 with SMTP id
 p3-20020a170903248300b0016cdfcf38e8mr28430232plw.43.1661334074159; 
 Wed, 24 Aug 2022 02:41:14 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:41:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 03/51] block: Unify the get_tmp_filename() implementation
Date: Wed, 24 Aug 2022 17:39:41 +0800
Message-Id: <20220824094029.1634519-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


