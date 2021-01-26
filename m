Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EC304352
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:02:26 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QnQ-0003RP-Ia
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4Qk0-0000VZ-1Y
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:58:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4Qjx-0006AI-PD
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:58:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id u14so3210797wmq.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BQaxOlQW+aQqNIrIZ509yi72c0upxizseNav4SBSmqY=;
 b=oiM5KFDVTDi/Du2ny8/Fc/2uY1kf6/8RnW+ySOa9jntKTeENr5Ijuxs3DT59c7lSIg
 efs+2ejlJdDnbold9ywvW0Be6NHe12vRNSWzTdmdVRyXO9OArjAptlVu1bWxF4zmjz4y
 h9IU5Oo7G+dlcmZkxzn8ymWGDbb2umbDgd/FwkZrIgj6GYes1XF27DIUTxWAx6psLpI+
 IaAYiDiCqDCio71KGn5pQSQBb7pImD2eO1HCjR4Ew6pNFZLcZkZMY6JXWHLvzld/S3Ys
 efY95koIriE2VlSLJEFrzdt7HMHNixSjzpgKN8xe6tyjBRFfHsaVN2bPyssJ7alEDUSE
 NOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BQaxOlQW+aQqNIrIZ509yi72c0upxizseNav4SBSmqY=;
 b=kbKZnuLhGdu1BszUUzhF3Th7k2gvSsF9ugi1D/KMqOLSZbxRBaz5YEb1OAbU8UAWl8
 adx9CEuxSm5qXcYVxpADCzOEhiRYWq1tVaUrn3TVz7SP8oIJdSvtQoBrgITVHS/e3CKm
 pHFZ/bO2qx+HowQ2AfW/dYOzeiuf6gLTdA7s6z50G8xqlrtvMh8LqHVb8WbAUzt1DiKZ
 Lh/bKyjRvu+qOW6G3AJSC9Fm7lMPuLKMM08gfB+wpBjCS+6UZfpMOdqBvcEvsOO63WKF
 i//3Kmzxt9aMbpzRoFcALkMJQfBHsDsLpwQ4UaH5/MGEhtybOGRjnuN/Vw5yQQFXB+Xt
 RhkQ==
X-Gm-Message-State: AOAM533L/WQVgdp2b6I7SC+bGxRbvP5Nst+TUaDDcgr0ySRbC6QVru6L
 JF+d/yMvqC3QgaAJhtc/fWKke+vIwaaB1g==
X-Google-Smtp-Source: ABdhPJza7hCUtP5HCTLUDzNqtmGYTMASwpnjSNqE07tO1QRZC4wPa5dBhs6VIdpsw33yr0edEKJJ9Q==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr388187wml.110.1611676728333;
 Tue, 26 Jan 2021 07:58:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm3936243wmm.12.2021.01.26.07.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 07:58:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Move preadv check to meson.build
Date: Tue, 26 Jan 2021 15:58:46 +0000
Message-Id: <20210126155846.17109-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>
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
---
 configure   | 16 ----------------
 meson.build |  4 +++-
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index dcc5ea7d630..0e672c3e291 100755
--- a/configure
+++ b/configure
@@ -3525,19 +3525,6 @@ if compile_prog "" "" ; then
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
 
@@ -5742,9 +5729,6 @@ fi
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
index 35a9eddf5cf..c4a66d87793 100644
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
@@ -2411,7 +2413,7 @@ summary_info += {'PIE':               get_option('b_pie')}
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


