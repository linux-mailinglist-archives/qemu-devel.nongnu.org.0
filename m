Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FBB6D00D9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG6-0007Wh-U4; Thu, 30 Mar 2023 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG0-0007Te-8B
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFx-0000H6-K5
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ef90adc168so3626697wmb.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EeSooF4vWtasfO3UieZQyg/ZkCQICRVf9Cy1Gc/nIM=;
 b=L3uS5WouIDODBXjnB4XpitUQTTWK8HPvEU6wSV1m9m4gKlzgSzERTQkqFVDl4aHuRd
 gvogsYDpjMEaWgfXj9g1t4lODyvJmotdAAGc5ZCER0sB5WSv/W86qWDWE9oRHAaP6d+l
 zC+/H+AQbmvGgG7efISh3wQCnJqh5G02x0YLRBxfpCahREyXEkGsDDDKLf5jeQgU4Y6R
 diwcoZVgumIoZzYZtz2oHNjSsGIu/7S7T/WaWgbFMcp15xbmY9YsPRN4FZ7bN6unsSS1
 1rObsC4IzCKmO1lF8rSdpNhVRAwUtsbdArWRDGg6r+Y9eZdPQ5URBB3WpRKASU+wrcdc
 Cmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EeSooF4vWtasfO3UieZQyg/ZkCQICRVf9Cy1Gc/nIM=;
 b=bvkzFEswkXNQU8QnK72aJhzrwrkFgxpwB67cvU0mNrFd6brCnFx4S/n6/SykbDsoS2
 qVzFCXTsRb124hwDiWP+S9HW3jeCekMR8BFI4Z5Iy9K+6Px5DGcn1ZLV4sZD1Tv9gGjt
 1N2pV3yiP+zigO6KDoQtRGjKSUv7yTkHBaJ7EP9/5OoQ3zVqq+dUY/wWOYCRY8XQTG2N
 Muu3T/36zDyDy7y3F+y7IPAefUHY5U3OK2VNKJzcFcbzMmha4+Su51o2NfCyqpfdSbgN
 xd0SerZ6psXsa+uanqffUpdV13iPtAC5k99MM2xfaLuo1mfphPVxRzgHnJnOwbzfDJtM
 XqBg==
X-Gm-Message-State: AAQBX9eSL3iqHl26I9f7AylMj1h/eNKA8mHolqB0n7m2rzesPW5wDeHG
 wlslOzHxnRr/b8VNmBY43cDEBQ==
X-Google-Smtp-Source: AKy350brEm7m6PlAZSuAuZ6XT+RCzsjgO7wKapvro4iHfiTx/JRDTV8Y8Nk0icQ6t5z+/bE4D5kVoA==
X-Received: by 2002:a1c:cc1a:0:b0:3ef:622c:26d3 with SMTP id
 h26-20020a1ccc1a000000b003ef622c26d3mr13900587wmb.35.1680171103174; 
 Thu, 30 Mar 2023 03:11:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003eda46d6792sm5679332wmo.32.2023.03.30.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50ED01FFBA;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/11] gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa
 if necessary
Date: Thu, 30 Mar 2023 11:11:32 +0100
Message-Id: <20230330101141.30199-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230329161852.84992-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.39.2


