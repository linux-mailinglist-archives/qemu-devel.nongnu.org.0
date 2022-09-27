Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C096F5EC2CA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:34:20 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9n1-00011L-On
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rv-0003Hx-AI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:27 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rs-0005GZ-IA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:25 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f23so8758663plr.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DqdUa4ktVoNWFMpBiRKryhldwdqBntUYFZpWemso0qs=;
 b=C14AyI8HmvE0YgObz2Zw62T9HjGzs3zZUP6EXhhNWG8ZeJbre3AVwQV0OxlVqueXO1
 csP4dLBWN6ewNz3RfXzv+ouMXjq+NcR99YrdzipYG2sOGZbglppCkSn1zfPpaAKQWto2
 h1HGhkWaFp7kOh4PkD7B6hwGPalhlWztIpjIX0Y6/2Pq9Jew1jEcpFHgl85AZnwXPlho
 HSw3hogtfQzFxAQKRYu9LHF73FzjbLv7dVr+UdF+CS4lrXL+ezU0ujSspy2iqlYakUbL
 6L+U3ih7MmW6wqQjP3l0JFe5GYdM9pZ4Yf2HWNpFjwEdTN+TR/dqMJNkAmxbOeLMVlZq
 HhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DqdUa4ktVoNWFMpBiRKryhldwdqBntUYFZpWemso0qs=;
 b=uEdDW8ddvvuGqBvvX6mqqHMNOOP1DgPKX0vSYN9sPe0dMR+eLQ+gFnmrqff4ncNCmc
 n9HA4XQ7Sjul/286al5/p62l7lAdbDvJ/6VE7MGqeWK5R3dEGRLVVdOLTDyiWtrdjbdS
 Yx+I7WwRldQ6nLQCph1PlhiE5hSMkgrEGlsMX6MzSXaGFMq+P0Ge7bYl21KLN8vx+r6R
 r4p4vrMuD03iKh/Lg94ilKsvUUwoyCFcr5xTd+yH4NIXRyZdIdhvo7rpZJdTOzSj+OcH
 yZFdJzCUt7prlDypUU+K0xL470WV7ImdVsg4aMGk8wedq9UPNIxJj1l544i0cPDzNb9N
 Gu9Q==
X-Gm-Message-State: ACrzQf2eQkCYvllhg/aJYtGmY6hhpkrKKm07giz31FYrgd+SuHFHontX
 ee97ofTw+zmf34kT9h9SibVh0A6wPVw=
X-Google-Smtp-Source: AMsMyM5DRkhHFJOoGcYXs6+DTPBwdbpG4JnLbkthCwpx4UA4VQoyp0NuqtEgyBDWHXqZ4aVVqlZ5ow==
X-Received: by 2002:a17:90a:d14a:b0:203:7b4b:6010 with SMTP id
 t10-20020a17090ad14a00b002037b4b6010mr3972462pjw.237.1664276903261; 
 Tue, 27 Sep 2022 04:08:23 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v4 38/54] tests/qtest: bios-tables-test: Adapt the case for
 win32
Date: Tue, 27 Sep 2022 19:06:16 +0800
Message-Id: <20220927110632.1973965-39-bmeng.cn@gmail.com>
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

Single quotes in the arguments (oem_id='CRASH ') are not removed in
the Windows environment before it is passed to the QEMU executable.
The space in the argument causes the "-acpitable" option parser to
think that all of its parameters are done, hence it complains:

  '-acpitable' requires one of 'data' or 'file'

Change to use double quotes which works fine on all platforms.

Also /dev/null does not work on win32, and nul should be used.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---

(no changes since v1)

 tests/qtest/bios-tables-test.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 46a46fe0aa..2ebeb530b2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)
     free_test_data(&data);
 }
 
+#ifndef _WIN32
+# define DEV_NULL "/dev/null"
+#else
+# define DEV_NULL "nul"
+#endif
+
 static void test_acpi_q35_slic(void)
 {
     test_data data = {
@@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)
         .variant = ".slic",
     };
 
-    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
-                  "oem_rev=00002210,asl_compiler_id='qemu',"
-                  "asl_compiler_rev=00000000,data=/dev/null",
+    test_acpi_one("-acpitable sig=SLIC,oem_id=\"CRASH \",oem_table_id=ME,"
+                  "oem_rev=00002210,asl_compiler_id=qemu,"
+                  "asl_compiler_rev=00000000,data=" DEV_NULL,
                   &data);
     free_test_data(&data);
 }
-- 
2.34.1


