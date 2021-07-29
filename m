Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED23DA37D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:55:56 +0200 (CEST)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95Zr-0006Bf-61
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Rd-0003g5-4l
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:25 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Rb-0007Zf-Dl
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:24 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b7so8071054edu.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4My7fDRNl/n4YU7RcFSpoBqlYhQPCBDcmizGiZlhv0U=;
 b=icKmYtuX9raAfE0GDUXMSjC6kUB5ztOdA3i+qjbSlWs4TFPm+OTs5+7VCXECyc+KO/
 KU0Y0hLVUwBawxhTRTP2sq5q4qSHuM23HZtgSh6VLZSYCwDxg/HgL2wZ3fDs7yEMxa3X
 bjOsrsQy8Iz5+Gj6yvn0ZZv+n3dbRDvpQwXNEdR4EQXlY++v6ja7E0vWP3LeKamiDn4D
 6hPqHyNrSqz4Cq0xAG928/aaLkNrwoQYvIuFD6RRkSK/ZlHZRFVSNX5O0GEovaZI3s3Z
 z5o0gz6aV/m1oDV1tZJ4ZAqWHlTbT/nJmlVmFH4s1iP94O8D+f7kEXIjeTRfUqqtmyeB
 Va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4My7fDRNl/n4YU7RcFSpoBqlYhQPCBDcmizGiZlhv0U=;
 b=gpGP7DJtIwy+mA9XUABazelt0uUSw+9X7vUGPAZVU3Fv7JSM5Ny96vmKu3cayUCErz
 8o/3Bo6cOVnSdxXG+oAqIARnMR7wKSC3uRoWxH2zQASqnPhI9Vfqm0KwX0NEpMlM8Ols
 8Ke080zXsZQe63axu+NguFLt9Uspn4woPPEPVtQEAyozl9P1Z5uPJeRd6Axper0w9F4q
 bIEV2mAz9O2gKo/6fLU7nRpk/r/TFQ5YsbP321VUprd11g+6zRd6QsgOLQWI48O2aEFI
 N2Vo+ADrBrjdI376URqziqZhrAoXQsmximglW/BSLJ6kGmdekFeu82t1cqCFALLKcQ3e
 aDSw==
X-Gm-Message-State: AOAM530xGq4C8Bpyi4XawkoXHMFK9Yk03K9mOFOW8b9gE/i8Fl91YBow
 MWchBcw5pbyiEtCn90kFfibMF/b5FSWG6Q==
X-Google-Smtp-Source: ABdhPJzc3AOE15MeKhmEWwkW/lxlHY6L/H+XA9D8nzfmNZM8fOcXWomUwF7GMVC1paLbUZSYEBp2Kw==
X-Received: by 2002:a05:6402:1603:: with SMTP id
 f3mr5844483edv.274.1627562842225; 
 Thu, 29 Jul 2021 05:47:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user subproject
Date: Thu, 29 Jul 2021 14:47:12 +0200
Message-Id: <20210729124713.208422-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Meson now checks that subprojects do not access files from parent
project. While we all agree this is best practice, libvhost-user also
want to share a few headers with QEMU, and libvhost-user isn't really a
standalone project at this point (although this is making the dependency
a bit more explicit).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210505151313.203258-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/include/atomic.h       | 1 +
 subprojects/libvhost-user/libvhost-user.c        | 2 +-
 subprojects/libvhost-user/meson.build            | 6 +-----
 subprojects/libvhost-user/standard-headers/linux | 1 +
 4 files changed, 4 insertions(+), 6 deletions(-)
 create mode 120000 subprojects/libvhost-user/include/atomic.h
 create mode 120000 subprojects/libvhost-user/standard-headers/linux

diff --git a/subprojects/libvhost-user/include/atomic.h b/subprojects/libvhost-user/include/atomic.h
new file mode 120000
index 0000000000..8c2be64f7b
--- /dev/null
+++ b/subprojects/libvhost-user/include/atomic.h
@@ -0,0 +1 @@
+../../../include/qemu/atomic.h
\ No newline at end of file
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee..2971ba0112 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -40,7 +40,7 @@
 
 #endif
 
-#include "qemu/atomic.h"
+#include "include/atomic.h"
 
 #include "libvhost-user.h"
 
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index b03446e7cd..39825d9404 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -4,21 +4,17 @@ project('libvhost-user', 'c',
 
 threads = dependency('threads')
 glib = dependency('glib-2.0')
-inc = include_directories('../../include', '../../linux-headers')
 
 vhost_user = static_library('vhost-user',
                             files('libvhost-user.c'),
-                            include_directories: inc,
                             dependencies: threads,
                             c_args: '-D_GNU_SOURCE')
 
 executable('link-test', files('link-test.c'),
-           link_whole: vhost_user,
-           include_directories: inc)
+           link_whole: vhost_user)
 
 vhost_user_glib = static_library('vhost-user-glib',
                                  files('libvhost-user-glib.c'),
-                                 include_directories: inc,
                                  link_with: vhost_user,
                                  dependencies: glib)
 
diff --git a/subprojects/libvhost-user/standard-headers/linux b/subprojects/libvhost-user/standard-headers/linux
new file mode 120000
index 0000000000..15a2378139
--- /dev/null
+++ b/subprojects/libvhost-user/standard-headers/linux
@@ -0,0 +1 @@
+../../../include/standard-headers/linux
\ No newline at end of file
-- 
2.31.1



