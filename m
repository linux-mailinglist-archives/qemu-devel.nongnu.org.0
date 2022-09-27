Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D77B5EC1E9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:56:03 +0200 (CEST)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9By-0002ya-DY
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qy-0002m0-62; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qr-0004tx-TI; Tue, 27 Sep 2022 07:07:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t3so8779777ply.2;
 Tue, 27 Sep 2022 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2ES1bdpC44vvo250IA1QHz3fUVBs2IlMW4SYoXdEXRo=;
 b=ir1Pc4xhWUs0IweHL9jcOvQjM+rseMn6YA+fHJUrt/MVSjsaVqo2MyxnV1FsBja8Bo
 kjNF7k1Wioj8vW6E1lx4DgkVFL/yKMaPrx6FxqcVsyohVVNmWbIX04dPN/qC58RZ/3MY
 si6T4fBbxZSaOVVWRzLL+rqNNR3i4VaGW7sSIldTZXEe1LAiaVT3GQmOoxd5a9Vbh3sP
 rsf3f6W4VSA8YQcURhWQaRvQibAYrYaFCtn62xv5j+xZfvm6l1tFm0tE5ZM2hrob7gA4
 Z4KuujSX857E63QO/b63/P9/tOSjg4A8gm/q2jeoqazVaEmZSHgAValILw4dy03f5z6l
 b1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2ES1bdpC44vvo250IA1QHz3fUVBs2IlMW4SYoXdEXRo=;
 b=OJiSufMG9vp4Evy5hmSxUCPmUO2mBuMkyfxZfrMpqrmJNGaFRO17Zur/crVkTz/Y1z
 tL4g2/+rOJ1io4zbaWJCTkt81UJyt7Tddu/ef5ym5vZ/EoLTOhkumSbsN9YRWYgWoXPa
 JICUfGUH5sEt2OcdDrSddiM8UM2tuJGgy0woUWZJmUjZxDgbdRDsdEQuW7W5/E27v2fB
 Ai7AJA62PljYVu3zpvBET8vRsVj4yixTwgmWNm+BQaS6/kenp4kjxxebEzFFoMBApqI0
 yNEBoFX6eF2vDCzMqbdiPKUAEjWI8uPbZ3iGMUKog1rE/I+57WWnKm+GwM59AbHk+8ij
 rdDQ==
X-Gm-Message-State: ACrzQf2diRvxkbg0EJh0B5qc4qPmwNvWAzkMxf35r4++5X0hqoFh4zHm
 Zm3rqbrgsMZPRlgwQQc5Jp3DAyyiVus=
X-Google-Smtp-Source: AMsMyM70WKbPkXbhOBCTl1sV6x4XNxR9KgSXiaWrHaEzvB06B3i95WG8pWqaVAlN+Jm07OrxdblWSg==
X-Received: by 2002:a17:90b:4fc8:b0:202:a340:3594 with SMTP id
 qa8-20020a17090b4fc800b00202a3403594mr4053145pjb.149.1664276838902; 
 Tue, 27 Sep 2022 04:07:18 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 13/54] tests/qtest: ide-test: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:51 +0800
Message-Id: <20220927110632.1973965-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
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
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch

 tests/qtest/ide-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..25302be6dc 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -121,8 +121,8 @@ enum {
 static QPCIBus *pcibus = NULL;
 static QGuestAllocator guest_malloc;
 
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
 
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
@@ -1015,12 +1015,12 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -1049,7 +1049,9 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
 
     return ret;
 }
-- 
2.34.1


