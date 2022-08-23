Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533359EDFA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:06:53 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQb6q-0003Y5-4n
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQb3f-0001fu-4t
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:03:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQb3c-0001Ab-Ln
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:03:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id f21so15116577pjt.2
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=55aeJIb44l0wkuGM2pXiKXOTrTvHRXGyv/4q572RJR4=;
 b=jHpq0yMvZCNee9P4VzyDY6mZBD3LQshypRjnmfq6sgpAL/1XcpzyDNEabCPpwORjEr
 GiFdLd9kqtr3aHG7gcJsSixWmWmNnRJkykP53znw4SeZuRfKOlTrLkaxQ/vCFROx0gQt
 V4xHYfSwEr6OzGD+NF/kD6n1+i8+85RW/HvrSKvscECvdSqXX1fxQDTu7Sa3elzWD/jQ
 QNSrq20sPTnmFPJA6K38ae3Vp/3T0IM/PyjK2dCdssYA7lDXeoG00ki/cD4Ew+kHK/pN
 S58OX2eEi3++W14H4Y5bcb1srqGrQk8U2T3DuzFf8CDTeJZQY4iHU5NaCB5BAkB/lLpR
 ++kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=55aeJIb44l0wkuGM2pXiKXOTrTvHRXGyv/4q572RJR4=;
 b=N81bMagQFxZf6ihGAPfvJwKPUJCnh4++5mAuq2Ggq8DDSJfx4GNfJ3ugAy8WViGGiJ
 DHvuurPAboEBpEyg9HQnlYVDQa/ZZkXYkzRzP6RdKOacq92bpoCzcjpV/vmk8TMvZWsW
 uscXdjAzvQWcmeKF0hADZ1x/4lRFwwXJcuokXDFxC7Anfb0IvkDXxZuN4nzAG+a+0OJT
 rXlWImUhVmUzflKbznwMWrpSfPNxIWFC1btfhq/EbVUm+ymZMHNRO21sGzNkxs+6WJMH
 nt0w0IAm650K5BBZ3Ps7ajTqhYbTanWo9XAiCldlWdgaUboirymLa422aZw8otZG/bf2
 AcVg==
X-Gm-Message-State: ACgBeo0eRPnIEcVYI9/3wz4D4XcBUq51MAep+0MKr9Fc0/3Cgilrcq+A
 v3m5Zjfw93DzUGL0+NAKC2ta32jxuFCAow==
X-Google-Smtp-Source: AA6agR5P/dv+VqDF9pgftm12w8M80NxeoHuJegNRusTA1FevLkeo342DOZcgFueoc7HpJsvZZfRuFw==
X-Received: by 2002:a17:90a:9309:b0:1fa:d28b:3751 with SMTP id
 p9-20020a17090a930900b001fad28b3751mr4839059pjo.189.1661288611113; 
 Tue, 23 Aug 2022 14:03:31 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 s6-20020aa78bc6000000b005366dbc4cf4sm6146640pfd.216.2022.08.23.14.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:03:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] gitlab-ci/custom-runners: Disable -static-pie for
 ubuntu-20.04-aarch64
Date: Tue, 23 Aug 2022 14:03:29 -0700
Message-Id: <20220823210329.1969895-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The project has reached the magic size at which we see

/usr/aarch64-linux-gnu/lib/libc.a(init-first.o): in function `__libc_init_first':
(.text+0x10): relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 against \
symbol `__environ' defined in .bss section in /usr/aarch64-linux-gnu/lib/libc.a(environ.o)
/usr/bin/ld: (.text+0x10): warning: too many GOT entries for -fpic, please recompile with -fPIC

The bug has been reported upstream, but in the meantime there is
nothing we can do except build a non-pie executable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Irritatingly, once this is fixed, we're still in a broken state because
we're now picking up an x86_64 cross-compiler, without all of the
required static libraries:

  https://gitlab.com/qemu-project/qemu/-/jobs/2923714301#L3028

    Cross compilers
    aarch64                      : cc
    arm                          : arm-linux-gnueabihf-gcc
    i386                         : i686-linux-gnu-gcc
    mips64el                     : mips64el-linux-gnuabi64-gcc
    mipsel                       : mipsel-linux-gnu-gcc
    riscv64                      : riscv64-linux-gnu-gcc
    s390x                        : s390x-linux-gnu-gcc
    x86_64                       : x86_64-linux-gnu-gcc

where we hadn't done so just 4 days ago:

  https://gitlab.com/qemu-project/qemu/-/jobs/2908305198

    Cross compilers
    aarch64                      : cc
    arm                          : arm-linux-gnueabihf-gcc
    i386                         : i686-linux-gnu-gcc
    riscv64                      : riscv64-linux-gnu-gcc
    s390x                        : s390x-linux-gnu-gcc

Alex? I think you're the only one who would know how this host
is supposed to be configured for gitlab...

I guess I'm not going to let this affect the release, but we
do have quite a number of annoyingly consistent failures now.
We should either fix them or disable them.


r~

---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 3d878914e7..85a234801a 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -16,7 +16,9 @@ ubuntu-20.04-aarch64-all-linux-static:
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
  - mkdir build
  - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ # Disable -static-pie due to build error with system libc:
+ # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie --extra-cflags='-fno-pie -no-pie'
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
-- 
2.34.1


