Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D715EC1F8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:58:42 +0200 (CEST)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9EX-0004d0-8u
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R2-0002nS-U4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qx-0004up-R1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:29 -0400
Received: by mail-pg1-x534.google.com with SMTP id e129so3019276pgc.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9mqqdIfbR4VfPukRzl3JcnaSTQBvLdc6WQpYQIrxNWc=;
 b=Z4At2N8OPHxqgqyWKrHdzcwcllsFOQvxZwidCkFzDiDK9TEwYl47avpjzqSyLhse4o
 W4GGPPhhN6aQGmPrRe4AhN80LWq62I5BfqpyYlWi52HI88NWdI6THYADT/HBhKFnrBoX
 oMeVm7iZ3dRFlslKdx1aruA3KfzcfLmSBF3H2J9+gH4INsqmC+cJJi/TRZu713rqixvt
 J5FFMoai7CqAwURPLqJoGut9lNYBqc0wU/Kb9WoM6fUnak/J71lMT6lEMxAqqqjY7Kfy
 bPRHp9jUTT1w/H4q+AWORI8nuy6jnZ17lNeQGxnSLVYkysVnsOcrYjLs50MMjJ3oEzAF
 9mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9mqqdIfbR4VfPukRzl3JcnaSTQBvLdc6WQpYQIrxNWc=;
 b=NQL2KeS1qncgcseUCnMjlX2/gKvgwyAsB6sMsJ6YJhGh3d9qjvDtzSyv8I/HA7HEdp
 e07J/GMYJx2ytFVL28Lcw4+fghWUCsS3QjRYzHby9ewrkCkg88sEvqeYfDcG59Cpk9p/
 FZoj4C5cy1Bh9Lwqmur0yDi8fdx4hgt0xdBwtGubKtqDHlIs5/TxOCaUCWT0JCzZMhcg
 2GVBb5qaJxy+f9pnF05XvNHtCJvntebmDTNJEfBv2i+4CNjQ/V5LKDTTMdp+bkM3cCyb
 1/6ph4MeRZJTMiytHXAg5oCpA9jBfPyGLjfyuj6mqlF2nI44XpEVXDGSxe6h+fOEhO/Q
 nQUA==
X-Gm-Message-State: ACrzQf3QLLLunay0zARX/p7RLhACz3kQwYpJedn3OQjE+4QN6EgyS15l
 Zv9+11baycSP0s2hkh+VfFCCLVLM79w=
X-Google-Smtp-Source: AMsMyM6EDKJ3Y0lvnHDSAIfpIFI11q0Blyaxc7X1ya1Y1bfSgzxQr4Y36ZnlQuu+Eof8wDj1IEBqAA==
X-Received: by 2002:a63:e64f:0:b0:43c:9db1:8096 with SMTP id
 p15-20020a63e64f000000b0043c9db18096mr11608421pgj.567.1664276844121; 
 Tue, 27 Sep 2022 04:07:24 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 15/54] tests/qtest: pflash-cfi02-test: Avoid using
 hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:53 +0800
Message-Id: <20220927110632.1973965-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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
---

Changes in v4:
- Replace the whole block with a g_assert_no_error()

Changes in v3:
- Split to a separate patch

 tests/qtest/pflash-cfi02-test.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index 7fce614b64..0b52c2ca5c 100644
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
@@ -635,16 +636,14 @@ static const FlashConfig configuration[] = {
 
 int main(int argc, char **argv)
 {
-    int fd = mkstemp(image_path);
-    if (fd == -1) {
-        g_printerr("Failed to create temporary file %s: %s\n", image_path,
-                   strerror(errno));
-        exit(EXIT_FAILURE);
-    }
+    GError *err = NULL;
+    int fd = g_file_open_tmp("qtest.XXXXXX", &image_path, &err);
+    g_assert_no_error(err);
+
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


