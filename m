Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0658E323
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 00:22:33 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLXcL-000587-Cs
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 18:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLXar-0003kZ-RX
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 18:20:57 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLXaq-0000vJ-0v
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 18:20:57 -0400
Received: by mail-pf1-x430.google.com with SMTP id q19so12039715pfg.8
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=v1t96hUp+hjIrU6E8stbDE6UPh0bHdntT82267VmyIc=;
 b=hTWmtBGdMl87sUl0vpKMKyK9r8zFK8Hu7JINujIhsXfIeUpHAfvf9qZqzYl7pqUjlt
 t3270m4NLeAreTwdeBlhDABXsremIACKP5kjGPwAgT0OM0n1a5py5JgPocuQDSvxX4J0
 annVg24sCQZfi+6iQu47OZw9JLGxaoU1dNz+nRjuRYPoSZJrALeJo2WZoh248GHoj9wF
 A66APQdALMauamTRymLuzpj1oUo82bGmisPsCPV72h82LNYBqa7q8x4yi78W92jeeaC3
 r0yRg/eVrwwnmifkzg5bAMmumITF8zOXrEjATn1rfm108jS7YpyhfZ1G6GnXPMF+Mtt/
 oRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=v1t96hUp+hjIrU6E8stbDE6UPh0bHdntT82267VmyIc=;
 b=wVjGSiTLVCuq2QZ0A0JoKEW/cgViPC72uAzQkfAJpsKERkKMDZxu6vRvlxRE+trp3J
 XSDm9M+PsNc9GSXzW6oC8DIRU9+C4XeioYyI7M3TxxcSV6zVW/hI2pHabIndkGruUL1I
 c0yVg6fWL1A+Q8sJiOilY14if+Pf63RgtNoEyEvZLa8HVnObtox8SDtGdBK7WHg+BqQb
 ZCcQZIqdhxTNeywOa8jNsRiBlRvTpt6Ivuc6FR67sLK3KsEjENp49/7t4+e1uW4xNFcn
 48WEkf/l3Hj4xcPme+RM5+IFQ+GSKhk9FmkiX88+AJBBTL/lD6ohARwS5j/fquQrlNIc
 rdMw==
X-Gm-Message-State: ACgBeo3g82KI2cTxiOS0bqNhwyScfJRQQo6//PtGPhni3pXXAh7F/p9V
 uFaa7UaVFrkJr4u1Uz2fgDY9q5DCo4Y=
X-Google-Smtp-Source: AA6agR6PseHhezrx5A3TcGjCVUcHx4ib3l7JWOTL8T8hBiZJ9BB1CPy3dPdcZYplcqH7ykNqh9tFgw==
X-Received: by 2002:a62:5293:0:b0:52f:aacc:156c with SMTP id
 g141-20020a625293000000b0052faacc156cmr4968458pfb.50.1660083654151; 
 Tue, 09 Aug 2022 15:20:54 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g4-20020aa796a4000000b0052e67e9402dsm392738pfk.106.2022.08.09.15.20.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Aug 2022 15:20:53 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH for-7.1] cutils: Add missing dyld(3) include on macOS
Date: Wed, 10 Aug 2022 00:20:46 +0200
Message-Id: <20220809222046.30812-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Commit 06680b15b4 moved qemu_*_exec_dir() to cutils but forgot
to move the macOS dyld(3) include, resulting in the following
error (when building with Homebrew GCC on macOS Monterey 12.4):

  [313/1197] Compiling C object libqemuutil.a.p/util_cutils.c.o
  FAILED: libqemuutil.a.p/util_cutils.c.o
  ../../util/cutils.c:1039:13: error: implicit declaration of function '_NSGetExecutablePath' [-Werror=implicit-function-declaration]
   1039 |         if (_NSGetExecutablePath(fpath, &len) == 0) {
        |             ^~~~~~~~~~~~~~~~~~~~
  ../../util/cutils.c:1039:13: error: nested extern declaration of '_NSGetExecutablePath' [-Werror=nested-externs]

Fix by moving the include line to cutils.

Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 util/cutils.c      | 4 ++++
 util/oslib-posix.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index cb43dda213..def9c746ce 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -39,6 +39,10 @@
 #include <kernel/image.h>
 #endif
 
+#ifdef __APPLE__
+#include <mach-o/dyld.h>
+#endif
+
 #ifdef G_OS_WIN32
 #include <pathcch.h>
 #include <wchar.h>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index bffec18869..d55af69c11 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -58,10 +58,6 @@
 #include <lwp.h>
 #endif
 
-#ifdef __APPLE__
-#include <mach-o/dyld.h>
-#endif
-
 #include "qemu/mmap-alloc.h"
 
 #ifdef CONFIG_DEBUG_STACK_USAGE
-- 
2.36.1


