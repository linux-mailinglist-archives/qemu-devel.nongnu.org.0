Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E5309CE4
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:36:09 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Dpg-0007FI-3a
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1l6DoS-0006gg-6N
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:34:52 -0500
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:42235
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1l6DoO-00061x-O0
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:34:51 -0500
Received: by sf.home (Postfix, from userid 1000)
 id C6D6C5A220DD; Sun, 31 Jan 2021 14:34:39 +0000 (GMT)
From: Sergei Trofimovich <slyfox@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] pc-bios/descriptors: fix paths in json files
Date: Sun, 31 Jan 2021 14:34:34 +0000
Message-Id: <20210131143434.2513363-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=slyfox@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Sergei Trofimovich <slyfox@gentoo.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before the change /usr/share/qemu/firmware/50-edk2-x86_64-secure.json
contained the relative path:
            "filename": "share/qemu/edk2-x86_64-secure-code.fd",
            "filename": "share/qemu/edk2-i386-vars.fd",

After then change the paths are absolute:
            "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",
            "filename": "/usr/share/qemu/edk2-i386-vars.fd",

The regression appeared in qemu-5.2.0 (seems to be related
to meson port).

CC: Paolo Bonzini <pbonzini@redhat.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Bug: https://bugs.gentoo.org/766743
Bug: https://bugs.launchpad.net/qemu/+bug/1913012
Patch-by: Jannik Glückert
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 pc-bios/descriptors/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index ac6ec66b00..29efa16d99 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -9,7 +9,7 @@ if install_edk2_blobs
   ]
     configure_file(input: files(f),
                    output: f,
-                   configuration: {'DATADIR': qemu_datadir},
+                   configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
                    install: get_option('install_blobs'),
                    install_dir: qemu_datadir / 'firmware')
   endforeach
-- 
2.30.0


