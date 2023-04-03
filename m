Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3046D462D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYr-0002vs-Te; Mon, 03 Apr 2023 09:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYq-0002u2-0G
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYm-0004tH-Ad
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so240154wmb.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mN816sNtX5Vdj2G92pvv8I3i5QnGeNTrX25n5LbvU4I=;
 b=O5sLqRX3o8wg3JSEuHWQfk7e53SjZslyalKpbNubzgxabPQbImJEAab9cWKIwTylAL
 WgcyZqFlockFyY+eZ0Bf7vXgYjz2ZTwNjuS2v73b4lgsIVnXRvHaM3qr2WnHPKUdJAQI
 5B7WEues0f+SO+CL77LGCSGQrN7h0W/Tk+GIroANmG1yd2r3D4iFC3sC8EHZrTpiedQM
 sCILzvAqFtezCm6x72Z0UwzZmMlakI+VNU2GyYzB0Ne1NYLNF4GJQVY+tueL2OS5ZQkU
 bx43IXHTD/y2FJ9UOtFFsIU3eYKPZNE6kaHy0DTyMLxFc6WvKs0qn0lonWM8EUzREfvE
 2wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mN816sNtX5Vdj2G92pvv8I3i5QnGeNTrX25n5LbvU4I=;
 b=0OiRLCRsYem6KPfZy2SlMw8t3M2fukc49xL8UcOX685K8dIBavZfBGA/61m7il2ztW
 4YbjIqRX9UrQ29jJJYYJXLAiIWs5x9gtx7siUKJvWmpxtRSjzMLZVAdeuBkSYJ5CM46y
 RiWO7/XfkA/YbCi+gG3REaIYhtMJD4ga2bygtMpANLXZ1JW+ZFFh75zXqpldDb7TPO8g
 fUKQY2yuMmSqHOfhbpW2uLN6L/Vxg6OxefjqaJXiuebWrJ2wd2GRYxL/47ADdz1ZoMwb
 5HVPTG8J7Tu/OUMp07TuYNaaCjj9hi0PjBGS58Bj/NwGmAsE6p1t20U5o+BAQ4/Vhzdn
 lSiw==
X-Gm-Message-State: AAQBX9d88S9o/uG0L9N3wNxjMmjTCClMNxpmxOPzI8heVB42fOTp4+/a
 D8ERIVLQH2Ra0T6BKjH1u1AKjcZ5aDojsUpDnMk=
X-Google-Smtp-Source: AKy350ZwFB2r0eAYmFp0426BeiHDQwJvp+zag6ay5Q14nm/hpxxlQCHq0zP0DbsDmaKOiNfdE1IMxQ==
X-Received: by 2002:a7b:c045:0:b0:3ef:6fee:8057 with SMTP id
 u5-20020a7bc045000000b003ef6fee8057mr19211144wmc.25.1680529761833; 
 Mon, 03 Apr 2023 06:49:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003ef5deb4188sm19526828wmq.17.2023.04.03.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E356F1FFBA;
 Mon,  3 Apr 2023 14:49:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 02/11] gdbstub: Only build libgdb_user.fa /
 libgdb_softmmu.fa if necessary
Date: Mon,  3 Apr 2023 14:49:11 +0100
Message-Id: <20230403134920.2132362-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20230330101141.30199-3-alex.bennee@linaro.org>
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


