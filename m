Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94253F34D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 03:22:42 +0200 (CEST)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyNvd-0005NM-37
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 21:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyNt1-0004VU-1s
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 21:19:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyNsy-0004Ca-Ro
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 21:19:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id cx11so14295354pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 18:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8Avh6bRRf4QK04/PFym22JRfd9vcbxJfkUN14AiyD4=;
 b=PDtSfshXRmZ+4Omx6r80CBMWE3bZTff+Ezry3xq4svyFm9N3cLyWx44awqQXhrTu37
 yXH42Al5ehf9kCskcCQbZho/8gQXe4CJxxsL4MPrBlwd39KEWE1r7xjLCnVDS6dCl6m1
 ElG0hXPQH9fXq2TrVz4UaspkveZZu+U44Omq1qr75ZX9++sDELXVmHz2JCb+I3995lQ+
 jLzexBZR9o1knDyf8zAsvAXuAuwdlvxPukXOomJylMFA2sShJNBHy+BQcLbu2UqH0Uyy
 seu1TNDRaI/Ruuq3qCGGSmNZgJ/72TdgrEuoc+spk3F7YjsXcAX9MUHbl6iiUzApmjTz
 1kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=J8Avh6bRRf4QK04/PFym22JRfd9vcbxJfkUN14AiyD4=;
 b=5KxRi3oSZmOuIA84gxmTChQ/FoGjhCMXqHE+7jAHLW3T5qPZA4all3qsHWMK6AjYes
 1vb1+QecZf2wddQQj9IJqnCtNiq0aOQ+RcTLbcwHZSmy/l2QTeiv8V+aRF7S+x/ZJCUb
 IcK1kigPzwtKWOAF47coRv93Fh6v4JA+M/uNOPrU0TdVFXukiuDZR6B0TmJ7yziqrLRO
 CgKjDQ59a4p3Wd59iYxWfkdYkoVrG9MpDI2Y3IGRGSTuL+C9xuznu3ZugqOBeIIGodKz
 SV5gvwLT+yUuGkeHmhyRa83LaJSOA96K3z3CoPKVGdaGtohtbYIRc26IHDxx4n13T3C1
 sCjg==
X-Gm-Message-State: AOAM532V43GnH6n4m31woyoTU9jv9+unxnfhYyYxwR21J9bnNOchqqBb
 RjsTA+xW4kRucTF1I4ErxfblhImJBMc=
X-Google-Smtp-Source: ABdhPJz+nvHcPiH1U+GnB49YJh28+AtbaE6ayog+7rbXqKzZQmZoTHI9GPuFXWcTu0oYZ0ty9ObVHA==
X-Received: by 2002:a17:902:e889:b0:167:523c:6011 with SMTP id
 w9-20020a170902e88900b00167523c6011mr17964617plg.114.1654564794584; 
 Mon, 06 Jun 2022 18:19:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a655844000000b003fc8ce7e30csm11204064pgr.68.2022.06.06.18.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 18:19:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] avocado/boot_linux_console.py: Update ast2600 test
Date: Tue,  7 Jun 2022 10:49:38 +0930
Message-Id: <20220607011938.1676459-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Update the test_arm_ast2600_debian test to

 - the latest Debian kernel
 - use the Rainier machine instead of Tacoma

Both of which contains support for more hardware and thus exercises more
of the hardware Qemu models.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/avocado/boot_linux_console.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6b1533c17c8b..477b9b887754 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1046,18 +1046,18 @@ def test_arm_vexpressa9(self):
     def test_arm_ast2600_debian(self):
         """
         :avocado: tags=arch:arm
-        :avocado: tags=machine:tacoma-bmc
+        :avocado: tags=machine:rainier-bmc
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
-                   '20210302T203551Z/'
+                   '20220606T211338Z/'
                    'pool/main/l/linux/'
-                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
-        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
+                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
+        deb_hash = '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
                                     algorithm='sha256')
-        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
+        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
         dtb_path = self.extract_from_deb(deb_path,
-                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
+                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
 
         self.vm.set_console()
         self.vm.add_args('-kernel', kernel_path,
-- 
2.35.1


