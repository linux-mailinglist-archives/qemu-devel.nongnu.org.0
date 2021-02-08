Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C2314274
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:59:36 +0100 (CET)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EZD-0005f1-JL
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCM-00030H-GH
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:46 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCK-00065I-VN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id i9so69258wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m9+H1ATH2dCIeCzK/A3SmO1reDOgs5mxyLkmqSTIPAs=;
 b=Iy9p7ZnjQbPB9vzFsfjxrjzVsugphMDlhEj8SHKAPY19oCCObSYixweP5YNNCnCPSj
 8yuZ9Q8FU0NxDuK7bJb0x5nI3DWdoRekF7JQVUYi45xYreNbzqT2tRL8eN08xqiPBVqa
 lMq4dV8Qz47nI8KD3zUPPm0aA1j9Fz+oQpqjTBhopkz0C+Q3CF8lg5ujbvP7+YEOXyzF
 qNtTzaDGyrx78Omioxffn/6g1/BI4OFdH0szkJKRXF8pT7eX2/F0TquEivTepS4S2Y+a
 DxxJqoZvPn1vcV1iJo+FAkKE7i7AG7aWYUG1kyBX80Ogew5WlvQdEfbp81+aK3k0shb2
 Ksbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m9+H1ATH2dCIeCzK/A3SmO1reDOgs5mxyLkmqSTIPAs=;
 b=BYeVW6ofxSZcRgx5F6GXXaMpXlLF2aRXD7OYPioCcurHOhzK0tL++S9ubYXfB+H4ZY
 ZzwURJ4qpzcPymzPMyYfRZgfRSwsnu8V3g3gULw8AL3EecQaWOwOXfv6nl0J7RrKYkGa
 aPJWM6yqgynvwOVIvzefmkNEQPAuxQ0omUE5/KKnfDr2erlnzkHx5Hsuy+rHjeRR6LKC
 mC8x3hAI+5glTPTBOu2ItBhnwuC+8p0XETONJ3tAgK+hx9VK8gNTy74QgQW6XrdUtujr
 8WQIdSMi0hGTSaEwR+ibU+5KuCWGOudatbSwuUzxwCTBMvR0m2tmRQrZeZ7wfIcZnKTg
 G7VA==
X-Gm-Message-State: AOAM532I0HsIYDev56YOku6jKqDMVIE7sfZCdL5I1GmCX7jdqFHXncXB
 Kdo/5sVJTfe6aRYLx3YVEbkhlk/RStp5cQ==
X-Google-Smtp-Source: ABdhPJyzz7qTmyEbVPxIFFHKUc30busAR2sQ3ua6FtwPcDqdW+bqmpI3FX44lUxToPjC4PjKZXw8Cg==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr58715wmk.41.1612808623752;
 Mon, 08 Feb 2021 10:23:43 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.42 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/46] meson: honor --enable-rbd if cc.links test fails
Date: Mon,  8 Feb 2021 19:22:56 +0100
Message-Id: <20210208182331.58897-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the link test failed, compilation proceeded with RBD disabled,
even if --enable-rbd was used on the configure command line.
Fix that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 6d6537d74a..5bd22f431a 100644
--- a/meson.build
+++ b/meson.build
@@ -690,15 +690,21 @@ if not get_option('rbd').auto() or have_block
   librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
                            required: get_option('rbd'),
                            kwargs: static_kwargs)
-  if librados.found() and librbd.found() and cc.links('''
-    #include <stdio.h>
-    #include <rbd/librbd.h>
-    int main(void) {
-      rados_t cluster;
-      rados_create(&cluster, NULL);
-      return 0;
-    }''', dependencies: [librbd, librados])
-    rbd = declare_dependency(dependencies: [librbd, librados])
+  if librados.found() and librbd.found()
+    if cc.links('''
+      #include <stdio.h>
+      #include <rbd/librbd.h>
+      int main(void) {
+        rados_t cluster;
+        rados_create(&cluster, NULL);
+        return 0;
+      }''', dependencies: [librbd, librados])
+      rbd = declare_dependency(dependencies: [librbd, librados])
+    elif get_option('rbd').enabled()
+      error('could not link librados')
+    else
+      warning('could not link librados, disabling')
+    endif
   endif
 endif
 
-- 
2.29.2



