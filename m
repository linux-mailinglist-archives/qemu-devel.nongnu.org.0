Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCF381A91
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 20:37:36 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhzAN-0006FM-Fk
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 14:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhz8U-0004VY-69; Sat, 15 May 2021 14:35:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhz8S-0008NW-BP; Sat, 15 May 2021 14:35:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id x8so2266085wrq.9;
 Sat, 15 May 2021 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdQcq09KgwY4TnbErmZp9oWE2lOVdlGyle/pfMR4QNc=;
 b=t9+u7V2NR1fHPaPITXErxnhyAGiVWxrVCNuTtSoz/pB/l6V/IvwkDFpWXDGoQJuDOy
 KlQbGBqbLP8oeEq5FGx+piUEzT7znY3COzMdN5K3602KIqjjqiDdjLDhbOLDXdx2hAHf
 k6xpZ6RBjPWGSMMpw2N02PqY0pnrg16LgFVHtdx0hFM28JmryTDtd4inOqNFMVT0qQsV
 9xMbfNM4Ual6xC/M+z2/MfXWTkPfAFW383t0s9qZjHt+2gM+ZCkfflPkZQN2dThF76ND
 uIjJJKvKUHPAntsNZ8LjY1TEo0vr+cTDqAG54+YsmRfSTMWr4BazdgQ9YbwtBjUbTzVk
 ULAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fdQcq09KgwY4TnbErmZp9oWE2lOVdlGyle/pfMR4QNc=;
 b=WfpI3YsOJxpiyZP01bU15U+I7IKY0aM6QsJhFgSD8aLYVwemZxxvK/aWAzOzO/KkPO
 QWi8E0cqZ/XBiODdtaW2zCvaqrTfrnBbq2czdTYXgRO6cqDfsD9HYmPiDpAgz952QQ3O
 7SZe57vW2uyvTadbvfuVFza5rXUb5wJC9Q/1Z4j9Ut06DhgAL/ElbFOUPiDbnd7Nvl4R
 TcCRVz8PpKhhCYs7yiwKHsgJDO9nvY8rUHaA9aXHKa4/uS6Ek8QmtisMRDZ94InFnRpS
 RZx8xgT8A9rO/yEEgARRfFlsFw8919qD864BHgOXvg08X2HGy4NeSh0exmdVuRD7XI6k
 UxkA==
X-Gm-Message-State: AOAM530wwx3u2DydyJhuIMIwfpgmb0JtbUvV+XziWcsp56JF85qWRd3O
 K1WWWmWOxibH0bp4VxU7M9fdCfzGCQOVNw==
X-Google-Smtp-Source: ABdhPJzHJT7frSrFAlsS3feiwMfPaROdVxQ2bWti+dyw7vbnLZPIT0fMw/Lmm8xU3Vm/w+ZbUPr4rA==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr65341357wre.183.1621103733945; 
 Sat, 15 May 2021 11:35:33 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t16sm624940wrb.66.2021.05.15.11.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 11:35:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] disas/libvixl: Protect C system header for C++ compiler
Date: Sat, 15 May 2021 20:35:30 +0200
Message-Id: <20210515183531.372925-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When selecting an ARM target on Debian unstable, we get:

  Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  c++ -Ilibcommon.fa.p -I. -I.. [...] -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/vixl/utils.cc
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:36:43: error: missing binary operator before token "("
     36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
        |                                           ^
  /usr/include/string.h:53:62: error: missing binary operator before token "("
     53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2X)
        |                                                              ^
  /usr/include/string.h:165:21: error: missing binary operator before token "("
    165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
        |                     ^
  /usr/include/string.h:174:43: error: missing binary operator before token "("
    174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X)
        |                                           ^
  /usr/include/string.h:492:19: error: missing binary operator before token "("
    492 | #if __GNUC_PREREQ (3,4)
        |                   ^

Similarly to commit 875df03b221 ('osdep: protect qemu/osdep.h with
extern "C"'), guard the <string.h> system header with 'extern "C"'.

Relevant information from the host:

  $ lsb_release -d
  Description:    Debian GNU/Linux 11 (bullseye)
  $ gcc --version
  gcc (Debian 10.2.1-6) 10.2.1 20210110
  $ dpkg -S /usr/include/string.h
  libc6-dev: /usr/include/string.h
  $ apt-cache show libc6-dev
  Package: libc6-dev
  Version: 2.31-11

Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because I've no idea about C++, but this fixes the build for me.

Quick reproducer:

  $ ../configure --disable-tools --target-list=aarch64-linux-user

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eric Blake <eblake@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 disas/libvixl/vixl/utils.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
index 5ab134e240a..fc28d7456c1 100644
--- a/disas/libvixl/vixl/utils.h
+++ b/disas/libvixl/vixl/utils.h
@@ -27,8 +27,10 @@
 #ifndef VIXL_UTILS_H
 #define VIXL_UTILS_H
 
-#include <string.h>
 #include <cmath>
+extern "C" {
+#include <string.h>
+}
 #include "vixl/globals.h"
 #include "vixl/compiler-intrinsics.h"
 
-- 
2.26.3


