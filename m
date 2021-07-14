Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E1B3C7E4D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:58:47 +0200 (CEST)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Xuw-0007Df-LL
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m3Xtw-0005wh-1X
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:57:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m3Xtt-0006CH-Go
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:57:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id cu14so929870pjb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 22:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3kxQt5hc18HfS2svD8c3yB7tmQ3wPjUahxRVkwl6E0=;
 b=adTCpxhxIYKpVL185Gbb5SaVu3Wf+LFEhGDV76FZ32zUn/wZy8E+C+qwp/Wb1HCVd7
 kdpHjpBQK6aR+hiWjz9Yd6qTJzKPVxvhHAVYYWoQH83IXyfdwUG9OrVIHpsGr5SHdlyg
 GqeND8RA7h5brxnC2WsGDpu5R3oxYPR6yaUGhG+uRoLkHXjVsC5/Dhuco2qQdKK17Npx
 idWP161Z09tfAW4mSYe9UoVV0koeM2qpI+D3gQJYQCQ694tP6U5KLpPwzeAc3P14qM30
 d7SEUSjUjwLsKY82RpCxhI5EDzRD783OPfBcL209EHZMBas/Zep2GIEuSi8gCqRlOWoF
 nNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3kxQt5hc18HfS2svD8c3yB7tmQ3wPjUahxRVkwl6E0=;
 b=oRuqBkbkFsLdbaEEfh00g0x2AyeDFMvFpwpBAHs3SWC55ge0wn2o5wR267zQC7Wm62
 S9k0EN1RAN/WJjwsdIyEdu0DriZrMLy2Pvy7VL29vdOi5IX2bVgYxMS9NIG2X0wWU878
 Pjyza/CdKgRojTfi/5lXOBnrkiDfRhrtVbQDwAx+ejvISg2wr3eeS8R0IdyJW7m/If2c
 ziAjeMThkqLU5osM98XUx8r35LaFmjZluZukkURgVymK8x7G/tZQTydCpzYbH20tyynl
 TdtWZeI5KCMkTyA/EWzU260N3Z/nc+pgghuzrMEDyTwShYfXO/k2Z0laxSbAqvyLBr7g
 fiQw==
X-Gm-Message-State: AOAM531oDAXLRiGVwEe/KC19sQbEJp1fg1fRgExhpYeYkMgasQJ6y4jt
 FrKf18H6uUr1sT/Ir14IGBZdoY6oxfpAFg==
X-Google-Smtp-Source: ABdhPJwtIyGBXZyLkGxwYzEsCLjzrwj9Q9yb+1i9Hec5vADuAxejjfABGu562FguskxZY39HLri+rA==
X-Received: by 2002:a17:90a:e612:: with SMTP id
 j18mr2224218pjy.196.1626242259962; 
 Tue, 13 Jul 2021 22:57:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:580a:d13f:a86e:77e4])
 by smtp.gmail.com with ESMTPSA id b33sm1174716pgb.92.2021.07.13.22.57.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 22:57:39 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/spice: Use HAVE_SPICE_GL for OpenGL checks
Date: Wed, 14 Jul 2021 14:57:35 +0900
Message-Id: <20210714055735.86050-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some code in ui/spice used CONFIG_OPENGL for OpenGL conditionals, but
SPICE also depends on CONFIG_GBM and SPICE server whose version is
0.13.1 or later for OpenGL. Always use HAVE_SPICE_GL, which defines the
precise condition.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/spice-app.c  | 3 ++-
 ui/spice-core.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/spice-app.c b/ui/spice-app.c
index 641f4a9d53e..7e71e18da9a 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -27,6 +27,7 @@
 #include <gio/gio.h>
 
 #include "ui/console.h"
+#include "ui/spice-display.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/cutils.h"
@@ -175,7 +176,7 @@ static void spice_app_display_early_init(DisplayOptions *opts)
     qemu_opt_set(qopts, "addr", sock_path, &error_abort);
     qemu_opt_set(qopts, "image-compression", "off", &error_abort);
     qemu_opt_set(qopts, "streaming-video", "off", &error_abort);
-#ifdef CONFIG_OPENGL
+#ifdef HAVE_SPICE_GL
     qemu_opt_set(qopts, "gl", opts->has_gl ? "on" : "off", &error_abort);
     display_opengl = opts->has_gl;
 #endif
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 86d43783aca..0371055e6c1 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -1039,6 +1039,6 @@ static void spice_register_config(void)
 opts_init(spice_register_config);
 module_opts("spice");
 
-#ifdef CONFIG_OPENGL
+#ifdef HAVE_SPICE_GL
 module_dep("ui-opengl");
 #endif
-- 
2.30.1 (Apple Git-130)


