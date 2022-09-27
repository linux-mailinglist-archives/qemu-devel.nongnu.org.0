Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328825EC1AD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:39:51 +0200 (CEST)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8vw-0000Dp-9V
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qd-0002Sy-JF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qb-0004q1-Pl
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso15268900pjk.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QWOXKMHz0rXQ5dPdBLcePkLMQ3bbMjZW51rAm26MIow=;
 b=hizRdoxmoaGwHWJJDA0ZCotI0xKXEfEzQvaoz6uRmQ0w10buExYaBkiuIFgYpURFDl
 HqM9ZwtCifPf4sj9Do+DaEiNQwOeCFQ84MCHrpUbVrVVisVVBgnV5ExFTaRhB1MxHUFk
 zO0OQPTo7IXNvE7k4wf77V09ulSm9oNya+B54YX7NZMK0kmqohEfeeVLZJMriJ+XVMrt
 gNc5tTcMHwLKdWpEWWt8Nu4sqXNPFdJ9Vn1XJhlH9+G9vNzVhnNF3dFLsKyc+l3F4Yjd
 N/SvuM/4qWKgLszVsM4Xjn2NYWDRrEdMT/sTxmGZ9RDHihKbMrgIco4QkgAqrYCKMau3
 iBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QWOXKMHz0rXQ5dPdBLcePkLMQ3bbMjZW51rAm26MIow=;
 b=fBqrwawpw2yDYy5qTu/hbzngRCFjS6s2po2G/TgGA6m4uwF1l/hhr5gJlRbEH9lGdL
 EPOzLMGJ2NYDc3bo38y8vrLuf8PARkL89SnGrp6Ny0yaQJGM1e1pAEa9Zsp0fv65I3B+
 u4tFWzm5uO2ynEjP3op0a57xYcypK9F1Co94Y6PYrJw9te3nnIBXgsIqPhlY12qPkX3A
 6cHnW5HhnqbYKapob7oo9zOKhvM/aYYWppLz3xF20PfLN/5Tj1wd7MLl5pf1N01c96e+
 9CVY9EIa664SPihMN34JvTbUzn1VbUVNJ+mXWry33YvxZiWdEHCi11GnoSXkQS/Jl7jk
 n73Q==
X-Gm-Message-State: ACrzQf2cGptf3ICDO16uuFW7CmuoM7F5IurYhmhsr418MsiaxHqZLsDf
 Gl3oPMEl7iKjJ/lK7R/a+GsRaBK4IK0=
X-Google-Smtp-Source: AMsMyM7aHwZ/dXxbQtSDcko9DEqS3+4XHuCM95SIAt4eUTaRyibolagtjxnifvkfdsfApq5FGQkmLA==
X-Received: by 2002:a17:902:e749:b0:178:3980:45ad with SMTP id
 p9-20020a170902e74900b00178398045admr26702035plf.153.1664276824148; 
 Tue, 27 Sep 2022 04:07:04 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 08/54] tests/qtest: cxl-test: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:46 +0800
Message-Id: <20220927110632.1973965-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/cxl-test.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 2e14da7dee..cbe0fb549b 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -93,10 +93,9 @@ static void cxl_2root_port(void)
 static void cxl_t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
 
@@ -107,10 +106,9 @@ static void cxl_t3d(void)
 static void cxl_1pxb_2rp_2t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs);
@@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)
 static void cxl_2pxb_4rp_4t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
-- 
2.34.1


