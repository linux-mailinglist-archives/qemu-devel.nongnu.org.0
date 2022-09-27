Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC45EC221
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:11:48 +0200 (CEST)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9RD-0001uG-Ge
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R4-0002nV-4n
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R0-0004vZ-Qw
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id cp18so216830pjb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gEf1DxePwM+B9CFwwtM7eL8lXoHycHH4Piyf2mfnp6E=;
 b=fWJTRy3nWJQZOeCqpoUcXY+4hA2HYm63oQPigj9zucsPqyGiWM9D/pkkhNW6zpJS3s
 /ldqzn8RVcb1uFGUjgaxu7+R2Ip+P1P/JVKeuChK10O10Dh4VWFYMED5Ci3DXR3ddwrq
 qKuPQOM2rF2L6kKk6Zd4OpmEfByOCAaraQFy5YcqpElOF2Fee7KO1uNmQH7jtHsiuTbd
 R7JpX9Mc78vw71K1Ky5k7b8lLITTU2NfwjmX2C2cU3UwitXkOSUTYD3XvmKV0bsKNofM
 I0f6Vd6RuqVaoVt5z8Vk9EADWV8Zh8BNoIKOyhS/edTPrPyxij8lWPhN0S1y8Oeq0q4b
 lpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gEf1DxePwM+B9CFwwtM7eL8lXoHycHH4Piyf2mfnp6E=;
 b=uU3QyrMxZlmWC+ssAZp1IqlvqH7rpsXyWeJ7K6Jok9hiRK7c6jMEwHIptdMQ5BxKmu
 J5CCEt8Kf/MzCsuyWZ59eZoe2UMS8vhI2ReNZvatiLXy05zP3kdJPOTxxTd8ozr3R3sG
 2u00qbEcjKTQZ7cZWEKcd1KGo8QZrOUCz8RZmjECNmOxZl8YotPD1MpIcZJ7yZxuvs8L
 XTSNob9PzvmMp/JYvyfwqwEQBVCTC3QAjkZVE3/9HKCjOsWo2e5JMmZEMF6hBy31ilS3
 ap3ma3nF3y0ZbWJtdhHJ5BuJyWAeBtXyZZSoa87W3Q0el76nAe3gxnh0sVUUoH1iY63V
 Fc3w==
X-Gm-Message-State: ACrzQf3D/3IAWXMT4feaUWaZmGo5CBwm2yjoglEvu0KVb2XPn1Ib+Iwh
 buA5aC39HbMLOOrE6AHc65Z9imSJi5Q=
X-Google-Smtp-Source: AMsMyM4CPfbFG5GtpOl2dILO6gcEOIl4WvWKXAqqNcIxkYzkpdV9rGJKZjBoQkvMBcEgdtEUwiflpQ==
X-Received: by 2002:a17:90a:d14a:b0:203:7b4b:6010 with SMTP id
 t10-20020a17090ad14a00b002037b4b6010mr3968021pjw.237.1664276846773; 
 Tue, 27 Sep 2022 04:07:26 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 16/54] tests/qtest: qmp-test: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:54 +0800
Message-Id: <20220927110632.1973965-17-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- Replace the error reporting with g_assert_no_error()

Changes in v3:
- Split to a separate patch

 tests/qtest/qmp-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index bf7304c7dc..d2070cb683 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -161,14 +161,15 @@ static void test_qmp_protocol(void)
 
 /* Out-of-band tests */
 
-char tmpdir[] = "/tmp/qmp-test-XXXXXX";
+char *tmpdir;
 char *fifo_name;
 
 static void setup_blocking_cmd(void)
 {
-    if (!g_mkdtemp(tmpdir)) {
-        g_error("g_mkdtemp: %s", strerror(errno));
-    }
+    GError *err = NULL;
+    tmpdir = g_dir_make_tmp("qmp-test-XXXXXX", &err);
+    g_assert_no_error(err);
+
     fifo_name = g_strdup_printf("%s/fifo", tmpdir);
     if (mkfifo(fifo_name, 0666)) {
         g_error("mkfifo: %s", strerror(errno));
@@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
 {
     unlink(fifo_name);
     rmdir(tmpdir);
+    g_free(tmpdir);
 }
 
 static void send_cmd_that_blocks(QTestState *s, const char *id)
-- 
2.34.1


