Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3430880A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:05:09 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RaP-0001Gj-0D
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW3-0004Pc-Un
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:39 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVp-0006wr-KE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z6so8339079wrq.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iW8Ts76zOzAuSJ0IzcTQOSJYua+KNxe9xoQ6aMzjrVY=;
 b=KT5BrKcpDPmtWwQ/4kxdCsBhjTFwYfwOtl+N3Xax/It+IYSnTLT0AZU/W2Zr6StYdI
 j8UGai7pw4veE8eJgftB4Xbr3tWujxzvfDCAXaFG9mXQm0Jc2YdVi9zVAn5iJvJD8OWS
 FiS+HGeeMf2iiW6EfmfwdwHkoasozq5aFDBVC7mcDc+Yxs4Aqcw+3IwI+6FPdotJtjxS
 8EPup0VekGQQYpceSQP/krTfBwl0Zqrm90RBoLayeGQZCU1hOuBi5hcU8IocXDk8ND7D
 hMNl5/Y16L3K5tYrFRmx+iA7IeKMSG3M1j+y3pys00CNw4GAD40hEaezWnwNaUcrrSnG
 frtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iW8Ts76zOzAuSJ0IzcTQOSJYua+KNxe9xoQ6aMzjrVY=;
 b=dpnYV55CtSjL8bz3CgKlnYcY8mzYYTU3FVKu4lmTJJ1XmN6lI+42ySbl7okz58w+Vw
 GffpxCU1nxPhiyRAPu/TQVoPILJBbTuL39J1FPRCAPRh5xxQCN3RrkYCjpps3uzIejEE
 Zde2y8JlcNdeIx+6Xwqnq1Y6D+5HfjmN82BTFWu0fhcy1jOSH3DV4ZQhWcaAPYI/cP9x
 HsUu7fYQRunGScMnwlaUFFV4hm+PtxEB14zyRxF7EaYJni3ZKa9tcAtqdpC+MFWmCCeA
 8T3LyVr+JCV6PPpHXTpTDZsydPQGCtilK2j8lRTgTaz5iPrJ9Co56Ajp1qGhATGvWq8A
 ljbA==
X-Gm-Message-State: AOAM530gVMCPDesYAwJlIYnIxt5nEb8didcGdkIgRb1HF5lAYuzbkewl
 kRuddxScTmr4vH2lPuv2kYjQ1xXALBz2KQ==
X-Google-Smtp-Source: ABdhPJw7e35JalF6YccQ9bWlfqwJn4g/zFlmXRRzg4n2HPSCS5Y5+Sm9+7MnrP+fj18m79g0ss81FQ==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr3852673wru.256.1611918023539; 
 Fri, 29 Jan 2021 03:00:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/46] configure: Move preadv check to meson.build
Date: Fri, 29 Jan 2021 10:59:35 +0000
Message-Id: <20210129110012.8660-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the preadv availability check to meson.build.  This is what we
want to be doing for host-OS-feature-checks anyway, but it also fixes
a problem with building for macOS with the most recent XCode SDK on a
Catalina host.

On that configuration, 'preadv()' is provided as a weak symbol, so
that programs can be built with optional support for it and make a
runtime availability check to see whether the preadv() they have is a
working one or one which they must not call because it will
runtime-assert.  QEMU's configure test passes (unless you're building
with --enable-werror) because the test program using preadv()
compiles, but then QEMU crashes at runtime when preadv() is called,
with errors like:

  dyld: lazy symbol binding failed: Symbol not found: _preadv
    Referenced from: /Users/pm215/src/qemu/./build/x86/tests/test-replication
    Expected in: /usr/lib/libSystem.B.dylib

  dyld: Symbol not found: _preadv
    Referenced from: /Users/pm215/src/qemu/./build/x86/tests/test-replication
    Expected in: /usr/lib/libSystem.B.dylib

Meson's own function availability check has a special case for macOS
which adds '-Wl,-no_weak_imports' to the compiler flags, which forces
the test to require the real function, not the macOS-version-too-old
stub.

So this commit fixes the bug where macOS builds on Catalina currently
require --disable-werror.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210126155846.17109-1-peter.maydell@linaro.org
---
 configure   | 16 ----------------
 meson.build |  4 +++-
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 87de49e2c21..8549c7b5ebe 100755
--- a/configure
+++ b/configure
@@ -3531,19 +3531,6 @@ if compile_prog "" "" ; then
   iovec=yes
 fi
 
-##########################################
-# preadv probe
-cat > $TMPC <<EOF
-#include <sys/types.h>
-#include <sys/uio.h>
-#include <unistd.h>
-int main(void) { return preadv(0, 0, 0, 0); }
-EOF
-preadv=no
-if compile_prog "" "" ; then
-  preadv=yes
-fi
-
 ##########################################
 # fdt probe
 
@@ -5748,9 +5735,6 @@ fi
 if test "$iovec" = "yes" ; then
   echo "CONFIG_IOVEC=y" >> $config_host_mak
 fi
-if test "$preadv" = "yes" ; then
-  echo "CONFIG_PREADV=y" >> $config_host_mak
-fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index a58c6f67854..27c31caa2d1 100644
--- a/meson.build
+++ b/meson.build
@@ -1128,6 +1128,8 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 
+config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['HOST_DSOSUF', 'CONFIG_IASL']
@@ -2414,7 +2416,7 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
-summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
+summary_info += {'preadv support':    config_host_data.get('CONFIG_PREADV')}
 summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
 summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
 summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
-- 
2.20.1


