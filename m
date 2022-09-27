Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBA5EC18B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:36:07 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8sf-0006iJ-Hx
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qb-0002Om-En
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:05 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QZ-0004pX-Ew
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:04 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b21so8755378plz.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nYT5Ib6w3wC5eXhDEWVPn1yI3eXtWTmEMRT0Iv/KX3M=;
 b=CuJX9oWHsSCd5PaVzvfY0DvF20SaZMpxRU/HSfvv0If2UQlqmX1WW3IkzrpH3FYsYd
 fNJf9szMS60R3ia0guZqjbtHSuj9pqQFF1rhP2eGqQCKttN7jMqmQqvj6HU3R+5oNd/5
 9KEaLZEEN1p/GCMUKsdWp5eTgMYxasFaWEKJFcfRqXANLp6IrzhrJHmcvOTxlZ7OiSLf
 TXcvmVDLQlpsLJjIm99bpypmqELx3kR0UC1t9TAFcrUdwvmM5rwPfx759qeKJAA5FeBW
 xndOOcT5Ms5QIFz4BwrR8FL8WoBY/sXyV+gi8pUC6SUqnb21wFuiho1FhGtHJUIJ/eej
 GTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nYT5Ib6w3wC5eXhDEWVPn1yI3eXtWTmEMRT0Iv/KX3M=;
 b=dYsAoPH3Ey5c+GU1Ooo8am/wL3QTv8z4g/J17YSkO2LYrrfCt0zCeZa382CQA8qwJP
 8ABcNIOoTJmRkl0JV6HMRJ+LrVjL/kaM9wo8zzCFjwwsPAn/7diWSBRx07OH1mOqzjRV
 b0LgQQtMkZ9iaVr32T6+WcdP4LdkoO3QsKE/DcGwKgP0LtSoEPxnLXkpbK+8RkqyRLuS
 cB+PfJK7MfmTijoE4zs5/kr7eVMUA3/nasG0wyhPD72oOgT3TA2y16orkM/v7PxMfIb6
 TmQeGgnr8iG1oyb9U/Kgb2V2LlQh0XnNXgigwFIpw6yCPkYy4tTQcv23eILHQ/yEhjNW
 Xs6A==
X-Gm-Message-State: ACrzQf20Et3pfKGPZJwSw9gdQw7br1IEq4dkxPnjUsYrwel1GK7gFFAE
 NcKAizRbGDrgtOghOjcpq851R7Fhq3I=
X-Google-Smtp-Source: AMsMyM7ieFJoP7Xg0RQ8Xk09osRShMuZGoR9r9j/5GD7+4eSmbCoamDu+ZBlsIBe0N+eVu9/s7bHfA==
X-Received: by 2002:a17:903:2593:b0:179:efd1:bc4b with SMTP id
 jb19-20020a170903259300b00179efd1bc4bmr1561786plb.35.1664276821716; 
 Tue, 27 Sep 2022 04:07:01 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:01 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 07/54] tests/qtest: boot-serial-test: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:45 +0800
Message-Id: <20220927110632.1973965-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/boot-serial-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 2f99d71cab..72310ba30e 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -224,14 +224,14 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
 static void test_machine(const void *data)
 {
     const testdef_t *test = data;
-    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
-    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
+    g_autofree char *serialtmp = NULL;
+    g_autofree char *codetmp = NULL;
     const char *codeparam = "";
     const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
 
-    ser_fd = mkstemp(serialtmp);
+    ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
 
     if (test->kernel) {
@@ -246,7 +246,7 @@ static void test_machine(const void *data)
         ssize_t wlen;
         int code_fd;
 
-        code_fd = mkstemp(codetmp);
+        code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
         g_assert(code_fd != -1);
         wlen = write(code_fd, code, test->codesize);
         g_assert(wlen == test->codesize);
-- 
2.34.1


