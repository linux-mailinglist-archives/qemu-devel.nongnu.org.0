Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1476D66A6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:01:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8f-0004LN-I7; Tue, 04 Apr 2023 11:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8L-0004Iu-AC
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:41 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8F-0005Ar-7I
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n19so19229356wms.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Us25J4D0Q5rwDN9Lk3sXEJe0MV4QRphddeq5Ff9CS5Q=;
 b=tXPmyD414X79euJLAyvbW02rHCCa9Uzx6UPH+FLxBBBu/UNoVpGe2DKWikHEoJm9O7
 XvQepEu9voA9rX341kng1CwN6HlHsGS9kPU7llU2Xd2CUIRzRjEd1FUZAbNHHUb3X/f4
 KqAKrR62/JUkoNrm2h6Uq4yBGplywdsriBXsX33UdD58dWqvCqcL/talbu+NhYNtQaA0
 VQGmV42HOJWrvHlpQjKTgpJHXUEhV7yus6j+f66SecHXmZfQsUj8eINty4/YBO9KLP8b
 2tT89rIfTXlHFknrDFuGELuAzyJ9UiwTzW1zm7H3gM8vHm+wd36OVWELcqyFgkWQdwEY
 N37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Us25J4D0Q5rwDN9Lk3sXEJe0MV4QRphddeq5Ff9CS5Q=;
 b=68qsw6PThJMbMYoK3BYwh6Rt1ZWRa96WNbl0l3tljxMMcCIBOJLfIOT+UY9qrwefAd
 Ns35A6P3u+BXuseMVitgnTjYnNCypltqfqWOuUuJrcsbg4TDR5sbXB8OT//iY9Aq/J90
 OOieaoXDZZqGVA6xrMVkLJzS7xu5kX7Rc1h5dzVAIc0njfoTD6wwnFFw7laUom4rficf
 8He9PArpPE8zVNgja1KbcGA8wKolYqohTGTK7ZNFsJmbTI3KyZOIz8kV5/yvBAr3cXfn
 dZgwdY6DEch53bZ3vjhLmtwUZSxgroqDhR98Mus9zboZ6oAfLEOvz3UIGid53YD+r1a1
 iHWA==
X-Gm-Message-State: AAQBX9fpY0wW0DNYYpS0LUqe4+csgoph0KoyUP/zjNxiCmZ0Q1AohdoH
 UCSPrssgzXkx5qks9NVngFF5KA==
X-Google-Smtp-Source: AKy350aPVe2fwDIsSz9BsMBqTNnEI9J9VcsNjzefkFR1VY0s2+7zTZXWhD3o2Sp8XW3nBFg4wHO0Zg==
X-Received: by 2002:a1c:7505:0:b0:3ef:6aa1:9284 with SMTP id
 o5-20020a1c7505000000b003ef6aa19284mr2478440wmc.29.1680620366956; 
 Tue, 04 Apr 2023 07:59:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 5-20020a05600c228500b003e91b9a92c9sm15393696wmf.24.2023.04.04.07.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5200B1FFBA;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 02/10] gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa
 if necessary
Date: Tue,  4 Apr 2023 15:59:17 +0100
Message-Id: <20230404145925.2638152-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Message-Id: <20230403134920.2132362-3-alex.bennee@linaro.org>

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


