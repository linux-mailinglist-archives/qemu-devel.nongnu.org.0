Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E45BE696
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:01:34 +0200 (CEST)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacs8-00028K-8a
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYz-0001Fd-9U
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:14 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYx-0004vn-Nk
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id d82so2302946pfd.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9tH0XQelG4h53nQLUxLgD/rlhScUl0glQjhN+BQBZaE=;
 b=may/k8VT5aBSFNfh67EyWDnZwzgnB1td1Ar8yB26DGXiPmtDrAZNSaO5dDl9QWfsos
 oMX1nexrH9zoUeQkYQIuK7ZBitIB71YO3YN9xR5M99tYa3P2tee1GEb8T/PQ51Vejzyo
 yX0Sl7ZhSu0vCS0i0IfIOPuisRHAGZf0pOUk7MYOO01EYHm00wiPeQ8Ct3mz/050ujq+
 6P9qnwnTGH0ShK8EGI1PxMPT8RmZAfx99Ug/kFK18jjSIboj2GCqlKCbhZ1TjgfZUl6h
 IzEBG4AU9ZBuo43NakBFNUg+Rl9aWy6Wf9CPw4uwfB6PhnCLiye+Ng+CHmA/gFnVVW/j
 Cfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9tH0XQelG4h53nQLUxLgD/rlhScUl0glQjhN+BQBZaE=;
 b=hreY2ayKo8KBqp2AeN4OP25IBKYVGE/QhrPR1NmRr9/K+7seG3p7gO5J8zqNjC1yx/
 naeA9HEGACWWJOUO1zAC8nDKh4TOgFJz/XW9GWs3dN1JYAI5p8DgFdkR7wrKgaR0d9b4
 e2WvVd6TEd/D/twck0eZyhkTS1VwfRp9UuM8LgogAQQfxrvVWn/l9xWcMduv8UgKQR8k
 vb0rFV/OKaDeYIA3DCcUtIDNXO+TSDoVSz1wgvf6JApp9OPhxk9xLeb0BppIbtm7fUK2
 RHg4w7XSHgk4AtfBBDJAlj7cVMoCYDkQuXU/n9R+aen/fCBfDt8yADtjtkpy2rRiCFl/
 W5Xg==
X-Gm-Message-State: ACrzQf2zpdJQ50H1xcTyLDoARBQfkQy86wejlpiV1tzq8YpQlWpmDKVT
 mDDUfv5quoVsnnuojsIEdfkIbDsRhHM=
X-Google-Smtp-Source: AMsMyM4Mzda9R1mKBREDPqLQu4ZEU0ih/QKcxvJ9cHfZj0PsqWgpKMqviNwx252QeHjDSY0kbHOh0Q==
X-Received: by 2002:a63:67c1:0:b0:42c:366f:e8fe with SMTP id
 b184-20020a6367c1000000b0042c366fe8femr20029441pgc.198.1663669990460; 
 Tue, 20 Sep 2022 03:33:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 21/39] tests/qtest: bios-tables-test: Adapt the case for
 win32
Date: Tue, 20 Sep 2022 18:31:41 +0800
Message-Id: <20220920103159.1865256-22-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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
index 36783966b0..0148ce388c 100644
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


