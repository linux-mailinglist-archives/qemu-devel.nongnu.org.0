Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F559F857
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:06:25 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoDI-0007oI-E0
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmui-0004OX-Jj
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuf-0001fP-TA
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:08 -0400
Received: by mail-pl1-x633.google.com with SMTP id io24so1899648plb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4Ic8Dewm4aoDrdRLw64oIo7eHOUzBmGaQZ6sE0IwdOY=;
 b=jG/wQsD1ovlMBd/EBk/jX9hepGicoP4nWz+DY6uHIk1H44ND8LxPeRRcSBvbd8VoZb
 X6Qonji6B7yGhM4DcVSQypJ9f2bwgS2LJhL0DGjYNjXDv6KxlcGB26PjZeWgabgSnmeD
 oiflKc3H3KSyhKidgrfV13HlO+bNaT0ar2iCNtgdPWwSMf9xUnubmQtrNmSykMobKotY
 NVYA9iP3kcldspF2PKe5wFrhJFI+YMYJn2WF7gZj6WAkZe2LIjyda98m4smUFrYPkbJA
 H0OzxreYNl4/5uDmrEeJUKpFFQRlAIN3mfn8kZVrWZBDwkhBfPtC2zZzmxuLfxgkH5sU
 d+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4Ic8Dewm4aoDrdRLw64oIo7eHOUzBmGaQZ6sE0IwdOY=;
 b=ql2yJ5qeukelJbai+TAFY+W/sHkuvrAXqvG/4nh8hAM5PrVCgqpC1mpe1Nvq8uU/e7
 RrsIXAt95lThv04VFgP+KgTuzX3F6NaqbU96mM67g+By7zZv9QxqCeCA846zNQqpAUa4
 ut7r5UJtJ+ZSiwhYVhX5aTYXNXRAJkJgcq7Xon28A/KXMk+WIkk5+cY4E+2aL9PkLsKG
 uvczecK5tbrJG0Pu8vlnwkXPXUONeQuIAEs6y9iasjxuo7ZxGgEHUstw5Ar7pOUycrD3
 6rFXl8Ns+BG45ICTebWQpFLwEw5We3DB/rbgjT0Yqq4qmi2rjoTsXT2nD91oOvW5yto4
 V/ZA==
X-Gm-Message-State: ACgBeo1WLlGpKkr5trATPIY+i9dCVu5Rgk17b/ps1cFemBjvTyPAU0TT
 dvUzbtVv8hxvewR0mHzJaRYOiD/UNeU=
X-Google-Smtp-Source: AA6agR50nKWKX3hEzItpGrCI8zzpBfI0Wn0y2+eoW4OOUGLgaDo9no/QXSzsdSc4wF6KhP2bapc59w==
X-Received: by 2002:a17:902:bd49:b0:172:df88:8981 with SMTP id
 b9-20020a170902bd4900b00172df888981mr15553890plx.120.1661334183799; 
 Wed, 24 Aug 2022 02:43:03 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 34/51] tests/qtest: bios-tables-test: Adapt the case for win32
Date: Wed, 24 Aug 2022 17:40:12 +0800
Message-Id: <20220824094029.1634519-35-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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

Single quotes in the arguments (oem_id='CRASH ') are not removed in
the Windows environment before it is passed to the QEMU executable.
The space in the argument causes the "-acpitable" option parser to
think that all of its parameters are done, hence it complains:

  '-acpitable' requires one of 'data' or 'file'

Change to use double quotes which works fine on all platforms.

Also /dev/null does not work on win32, and nul should be used.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

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


