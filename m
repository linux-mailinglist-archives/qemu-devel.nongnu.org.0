Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3506CEF23
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:19:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYVn-0008GM-Ly; Wed, 29 Mar 2023 12:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYVl-0008Ft-Vc
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:18:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYVk-0008RH-E9
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:18:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so10081117wmq.3
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680106734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5lB4Rp5WTzNb0p6CwHhrEQVJ55MnHtlqKkVK6rXKMiU=;
 b=d+gaGyiuPrYvgMLG8jgG+tgZUubrWhEg8EqFY2MFTpkRbZZKY0eRg8DOuWZ/OOMOTg
 +OcbISBropoMmHe6wayBojCxXTxRm/gVVGOSxv304e72y8dn5GQS6BdNLW+79OPhb209
 nFTodls8lfzmEYukaVK5qsiir8JwRAo7TKmvKVGTJo22XHgv30go0IhZMnq0VPGi7MDL
 p4K2mu4AtgjmLaMrNweyM3B1CFDtYyU4amHjLWcGPAb9c4NlpLRSr4Ms7Gpalw54qKgP
 B3SYhYLBAYkwUXS5o9jJP0O0XrYLUDcI9QK/L4ZQCPmI4OVOVHebDW2S+a2/EBFvEX5Z
 RMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680106734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lB4Rp5WTzNb0p6CwHhrEQVJ55MnHtlqKkVK6rXKMiU=;
 b=H+D2/GgLZEjlOBcgNEfPtXjqLReIs6L+3KlouhRkxduucvhu5DewKoX82EOJBciHPr
 /zURffXXlfH4H28cckCOtOimGcBJSiecC3l/SKkTFYcdfZcVRPRVgPaqV9i6xQTlNETs
 jZvrsdFmJ1RVW82V4+z0RE8HOB7NZ9naUq2vMiOWiat1wd/KJMWY3swiLvjot01Fy0u2
 0vcWN/lnLq4e1/uW+7onsz7g9bSeY4b/EdfQkX/lojvLvk7ey131cRy/+EIxRgVrKbND
 /foYSdpYhtv+Jq7gY+zSkDJb6kaDwg7wrXbsfn2v23bsBDlcrnvh1XWT6LjBHHZkm0kx
 WWHg==
X-Gm-Message-State: AAQBX9eCUQm+yeowbvnqJV9i4p4Rptfw5kmLkX6e57+xOJkgDvH903cz
 xd1hdeNOosHfznJahXVSg/gBT1ai/I5L0mhSIEvNSg==
X-Google-Smtp-Source: AKy350aYIgbXPCwLl+OwL1H0P+NyXEMbY++3g8ygF4msufrVMGmQchvkPkcHQdzcNVvk8XWt7Icr9A==
X-Received: by 2002:a05:600c:35c5:b0:3ee:136f:bcf4 with SMTP id
 r5-20020a05600c35c500b003ee136fbcf4mr2191844wmq.5.1680106734173; 
 Wed, 29 Mar 2023 09:18:54 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c211000b003ed243222adsm2648155wml.42.2023.03.29.09.18.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Mar 2023 09:18:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa if
 necessary
Date: Wed, 29 Mar 2023 18:18:52 +0200
Message-Id: <20230329161852.84992-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is pointless to build libgdb_user.fa in a system-only build
(or libgdb_softmmu.fa in a user-only build). Besides, in some
restricted build configurations, some APIs might be restricted /
not available. Example in a KVM-only builds where TCG is disabled:

  $ ninja qemu-system-x86_64
  [99/2187] Compiling C object gdbstub/libgdb_user.fa.p/user.c.o
  FAILED: gdbstub/libgdb_user.fa.p/user.c.o
  ../../gdbstub/user.c: In function ‘gdb_breakpoint_insert’:
  ../../gdbstub/user.c:438:19: error: implicit declaration of function ‘cpu_breakpoint_insert’; did you mean ‘gdb_breakpoint_insert’? [-Werror=implicit-function-declaration]
    438 |             err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
        |                   ^~~~~~~~~~~~~~~~~~~~~
        |                   gdb_breakpoint_insert
  ../../gdbstub/user.c:438:19: error: nested extern declaration of ‘cpu_breakpoint_insert’ [-Werror=nested-externs]
  ../../gdbstub/user.c: In function ‘gdb_breakpoint_remove’:
  ../../gdbstub/user.c:459:19: error: implicit declaration of function ‘cpu_breakpoint_remove’; did you mean ‘gdb_breakpoint_remove’? [-Werror=implicit-function-declaration]
    459 |             err = cpu_breakpoint_remove(cpu, addr, BP_GDB);
        |                   ^~~~~~~~~~~~~~~~~~~~~
        |                   gdb_breakpoint_remove
  ../../gdbstub/user.c:459:19: error: nested extern declaration of ‘cpu_breakpoint_remove’ [-Werror=nested-externs]
  cc1: all warnings being treated as errors
  ninja: build stopped: subcommand failed.

Fixes: 61b2e136db ("gdbstub: only compile gdbstub twice for whole build")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 gdbstub/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index bd5c5cd67d..cdb4d28691 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -20,11 +20,13 @@ gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
 libgdb_user = static_library('gdb_user',
                              gdb_user_ss.sources() + genh,
                              name_suffix: 'fa',
-                             c_args: '-DCONFIG_USER_ONLY')
+                             c_args: '-DCONFIG_USER_ONLY',
+                             build_by_default: have_user)
 
 libgdb_softmmu = static_library('gdb_softmmu',
                                 gdb_softmmu_ss.sources() + genh,
-                                name_suffix: 'fa')
+                                name_suffix: 'fa',
+                                build_by_default: have_system)
 
 gdb_user = declare_dependency(link_whole: libgdb_user)
 user_ss.add(gdb_user)
-- 
2.38.1


