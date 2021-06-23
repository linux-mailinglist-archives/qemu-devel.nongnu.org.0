Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A43B200A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:09:51 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7Ju-0002qs-LT
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BM-00068q-Cs; Wed, 23 Jun 2021 14:01:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BJ-0003EH-E9; Wed, 23 Jun 2021 14:01:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso1936102wms.1; 
 Wed, 23 Jun 2021 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6nQT9ZXaE8QBzwa83S4fSNZTOmVm2N+l1RBokgU5+w=;
 b=URMnbtlPkCXdiTkKMxT9XRK9Z4706ukP/a8SkegekhaOaYuvNiu5atR2tJwqOZpAWm
 NT6P7dDSBe4T+4WJk3/Gqj8IclTxQhcJkpr55IbxRJc4cEE3hvzm0Q5rUt7FlpiRkeQ4
 WPjQDDJfRLx/O2Dv9EToqLBmYsCM9+gV8kA3CKrviazqafelLhSisrbDpo0s6Tf3R7fI
 +KRBzcjQcarlwcSIqgTVRkgxpGiUuNZX8iPiappWdGFgHhRn9u9ky3lXqLAkpyQ66kXO
 hI9xU9vDZG3HTOZ0uoUeIp27a0c2anrumda/3c+1B0sJU73C91qYn5PFltJYZL+Jmuts
 egFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N6nQT9ZXaE8QBzwa83S4fSNZTOmVm2N+l1RBokgU5+w=;
 b=l3gbIPGiuSff7vib4s5nfwDTs/PJF4nrwUhOoyzmC04pu4wBE1Sd0K6boWQgHnDV1V
 KSJpaIDV9ftNY2WOqaUM/2ww/OEhAPx8gXaAakbyhnqeJLymJ9gGARiSTyVB7sWlq6Zn
 A8eDet48CDh5xI9B9jHokS6nUdkxr7fgFzHOKr/wzv6wcEd0HyTOg1FNmgSpslOK41NQ
 h8KTBFUC5+GEtK4nasObttzVEpMdSMTw5z0iTMj92skkTEzKnr47MYKb1iJF5DW8uO+E
 u3qoIOJXYeCXVosV8tiZicjEC0+aUSp5A08WhfQ+2Dwrz96UEUgP6/65zJ+8UTf0Prm7
 PPXw==
X-Gm-Message-State: AOAM530sSC7LJIKgrs7PHmI+fxGFCuj+Pj/PY2NojLHkYEFF4dv7sGmZ
 oCmLeJdJXEjVyItfBOu160gKTwvJJI7coA==
X-Google-Smtp-Source: ABdhPJyWpQpUQXXUDv9/pxyH2vzJsSz9AFFrJv1SGS2Y0e7EhHNzRyijlwm3uVVvKaXYCAYgLwwtsQ==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr12390826wmc.23.1624471254789; 
 Wed, 23 Jun 2021 11:00:54 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e2sm746113wrt.29.2021.06.23.11.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_bionic_20_08
Date: Wed, 23 Jun 2021 20:00:18 +0200
Message-Id: <20210623180021.898286-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U-Boot expects the SD card size to be at least 2GiB, so
expand the SD card image to this size before using it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
TODO: U-Boot reference?
---
 tests/acceptance/boot_linux_console.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index b10f7257503..c4c0f0b393d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -820,11 +820,13 @@ def test_arm_orangepi_bionic_20_08(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
+        :avocado: tags=u-boot
         """
 
-        # This test download a 275 MiB compressed image and expand it
-        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
-        # As we expand it to 2 GiB we are safe.
+        # This test download a 275 MiB compressed image and inflate it
+        # to 1036 MiB, but 1/ the underlying filesystem is 1552 MiB,
+        # 2/ U-Boot loads TFTP filenames from the last sector below
+        # 2 GiB, so we need to expand the image further more to 2 GiB.
 
         image_url = ('https://archive.armbian.com/orangepipc/archive/'
                      'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
@@ -833,7 +835,7 @@ def test_arm_orangepi_bionic_20_08(self):
         image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
                                          algorithm='sha256')
         image_path = archive.extract(image_path_xz, self.workdir)
-        image_pow2ceil_expand(image_path)
+        image_expand(image_path, 2 * 1024 * 1024 * 1024)
 
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
-- 
2.31.1


