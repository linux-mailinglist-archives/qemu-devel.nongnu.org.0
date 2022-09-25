Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CBE5E9307
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:21:38 +0200 (CEST)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQdZ-0002Hh-7p
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrz-0003Ju-GE
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:28 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrw-0006RL-QQ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 78so4188343pgb.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tuLrhiLQdAPzFXDphS6mjumk8PaBwG5Yc1g/mTPgSBs=;
 b=dJIRoFIJ4EOGsN8OWRhXMf99HMJ2b9qhCkeGNFtAkN9K/uNsWEPY0cquyHqCVi1fA0
 wH0F4R8Kl/pcGK6eYCNbDsWnshcW/BqO2mpII52ZoBnANMizapJR1J8EHTVNI50zW1NH
 XcDxaolap9pyjBlUcX8+PLYm20M8rhQymWrT/C6WaCC/YFF5aqfX/O/3oOn3PL03m40T
 1guY1lPgna9haGI9OxQvAFjW9Z63IQd0XpB3y1Yfb/HW9N8Aa7g5O4L+plxCpzLqf7lV
 qtfSF6VK528QOkP5NVXLSNHPwNCvxj0VuXW+klkIV9gI1p49Q0DMwn4osUPvEXjf4rkI
 lFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tuLrhiLQdAPzFXDphS6mjumk8PaBwG5Yc1g/mTPgSBs=;
 b=nL7EmtIL0WdUG7RVzDzLbm7nsP3BysHbrW4sdYJ85k4OO1wG5AZhiq556PERWN/4vJ
 cSXxkRZsYV1ebz5zoDB9zcz34HgMt0SAM83ae4sOk0FjAfGbsGlU4SuQ4nLWzjTb0tK2
 yEFh4KAZ6J+1FR9Sm9OFT1KpOq6fGE4h9tYR9v+yn+O6w1lAzxQxgypqi+60I7zAQeZI
 zDzGVdffNcFz3Ylar7WMnAa+JEnwwKZBk3ypmFh37I//jjYmE8H+t+qWPihywz1W0Tvs
 jBw1tOqAGlwKQlYZJpqjkm1bjNqaUsce4RjmG6M/5YhQX7ZIMrSmnDGJd10rJr4xy5hQ
 B4vg==
X-Gm-Message-State: ACrzQf1l23PFNG/i8qZvQVuDlzWkAhrn8B0DEjWSdl+82Eb83LagLUyG
 DXGUI9WnIGiJdSrXU5+1Z/CViA/nhLw=
X-Google-Smtp-Source: AMsMyM6uFxo35m8NUr6OcY63TgxDBpyqTKGMpHivCNvX/Brdnl2e55f9l1vVZ7ckt68xpvo9/wQhEg==
X-Received: by 2002:a63:9141:0:b0:43b:d645:e057 with SMTP id
 l62-20020a639141000000b0043bd645e057mr15243846pge.225.1664105539148; 
 Sun, 25 Sep 2022 04:32:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 38/54] tests/qtest: bios-tables-test: Adapt the case for
 win32
Date: Sun, 25 Sep 2022 19:30:16 +0800
Message-Id: <20220925113032.1949844-39-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
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


