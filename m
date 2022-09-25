Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29275E92F3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:07:34 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQQ1-0005tB-NA
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrK-0002m8-PU
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrD-0006Km-KI
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso4291911pjd.4
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nM74FruDmU4z4IA66IfyAjmi4E35/GiRsCvNkBTqFAc=;
 b=KCPNTydWPmJ5bBn1MGb6t5mz5qm7zt5MZ+/qPPFcPvsc9+cKfuFzWn4LstvqNxpFdo
 h6bJDnu6PwnFSCelrUjmiWA/L5fqrYvOZxKapd4jF1Mwz0CBPQxJBYmOZ40yjaf98a33
 9N0suiAtIsw67i8co48UxP/sBaaqUd83dMjqHM+myoiwnqQ20qACrNKbY3yE4qqj7TVR
 cB304e9y4pRAHe24hZWZcYCRrn0hzajUagff7c4Feg04KT23krYiz0d80NrzT5MCi8vC
 RTjxyUp0Suec+TgINcaXAtRZjBJYlQWmETFmFRsfkaiitM8jQEXdNkRkDZs9bxwetEX/
 ku6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nM74FruDmU4z4IA66IfyAjmi4E35/GiRsCvNkBTqFAc=;
 b=WU3VCYCnPD18EenOGCtdjSbWx6YQfR3DroKv//HQpibBd1UpAUkQjQUd7L+EqCVJRn
 LdRhX5w/WJSRvpt1e8khIdHnHTJvGebJjm31SeWvCM6z9BUlzPhJtEyiQxGvVX/Z72Dl
 Osu2sMeydlmTldwOHBtYKuj18pkj2ppEqiK2ONEH/+o6IkAZ/1YfcayhrJGGVKLqepf5
 Q4GhUIuitPjVHQdR+mEFNA8OQmWhpHYvZ+rgqr38wztIPMuwefUEUnjTxXp7DGSjlMXQ
 k+qKhEbDU649Zo27rZamkzDHeO+HJiIqyd83LRNbRuZcpyDBNe6RXbme9C9gFXbGsGNS
 LVUw==
X-Gm-Message-State: ACrzQf2MfZ47Mo2OyP4+93djZmWpQ3wKSPvnurX+brhLoJLqGIN6Ub9W
 bAVYot0m73agGY2/mZgBzjxaiw9qWpI=
X-Google-Smtp-Source: AMsMyM4qo0ajlMcNaTJH4aKQGZG/PYlVn5qBa1tBQuluWkvMV/S1mMaeX2DuOgGlVtvxKx1+ILygCQ==
X-Received: by 2002:a17:902:7c0d:b0:178:a6ca:1dbc with SMTP id
 x13-20020a1709027c0d00b00178a6ca1dbcmr17304140pll.115.1664105482181; 
 Sun, 25 Sep 2022 04:31:22 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 15/54] tests/qtest: pflash-cfi02-test: Avoid using
 hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:53 +0800
Message-Id: <20220925113032.1949844-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/qtest/pflash-cfi02-test.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index 7fce614b64..55890b7d95 100644
--- a/tests/qtest/pflash-cfi02-test.c
+++ b/tests/qtest/pflash-cfi02-test.c
@@ -56,7 +56,7 @@ typedef struct {
     QTestState *qtest;
 } FlashConfig;
 
-static char image_path[] = "/tmp/qtest.XXXXXX";
+static char *image_path;
 
 /*
  * The pflash implementation allows some parameters to be unspecified. We want
@@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque)
 static void cleanup(void *opaque)
 {
     unlink(image_path);
+    g_free(image_path);
 }
 
 /*
@@ -635,16 +636,17 @@ static const FlashConfig configuration[] = {
 
 int main(int argc, char **argv)
 {
-    int fd = mkstemp(image_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &image_path, NULL);
     if (fd == -1) {
         g_printerr("Failed to create temporary file %s: %s\n", image_path,
                    strerror(errno));
+        g_free(image_path);
         exit(EXIT_FAILURE);
     }
     if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
         int error_code = errno;
         close(fd);
-        unlink(image_path);
+        cleanup(NULL);
         g_printerr("Failed to truncate file %s to %u MB: %s\n", image_path,
                    UNIFORM_FLASH_SIZE, strerror(error_code));
         exit(EXIT_FAILURE);
-- 
2.34.1


