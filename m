Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F122B41C1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:55:13 +0100 (CET)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecAC-0003UR-DQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kec1i-0004nn-9I
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:46:26 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kec1f-00020h-Gk
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:46:25 -0500
Received: by mail-wm1-x344.google.com with SMTP id c9so23261843wml.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 02:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hC4mZju6fiKVbmQVI3PVbZnvzhvghSpZgN5hDu6vns=;
 b=q55V/hWJmTBizSc43J6pExx0CmClcC5FXjUE5wITFScaIqyjdIUsZUTvnqZ1gOxXe0
 XWRc+B7dR0IijCC3Ks9qfQOnht/fy9eRiseASaeBK/iAYkTso3VFAYqwHwSzIj29f7hP
 AAFd/KYeTZ03wUXbDAE7ntRuH2ZiovRUqGSqW3tvDb/qVMhPGqCLbtFmwN9NHz1yYQLd
 lSIbMyMXh6KPioeZRbBQYxc1rfGJzLBeuNP+Wcz8NSJHtGROv2+HAG/12pIbi4T/TaZ6
 fVQuf7o0EqvmhAHW/Dz+UBmHeNbKI1SusaiZEMaDmcOg0Yo1EQR5kOF7mEJPOBZ5ADQB
 qZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hC4mZju6fiKVbmQVI3PVbZnvzhvghSpZgN5hDu6vns=;
 b=jDcpVU8ig0Wd5DMMuSXBiVmfl05UnzmXogZS+0fwSIld90DwHzsFLcccWTAfY6Gm86
 AXunnGmdmF+6Tm5JE1bBMR8MWMao67afesVCjHI5S0Y4UyiOiwHlP1xrUicsmejkUsGl
 oa+Abh1xNbUyW7Don2e+BHd44EftVEj5va1twUkvEfBpIx6XE71TPQ+qXVHjugwzHX29
 ebWVGBbblIIWYAZWQ5I1z4rlI/RrJUlq/P2DB61qL7jHoVoYebiFEd2I9Gj/4lfHCqxD
 MP31exSv3BdaznuPV7TMkOyG7+dq32slclrN7Kh8a5ba+g0XdFQFaRsZBcIeJEnSqgU4
 MgWw==
X-Gm-Message-State: AOAM532V6vI3VHNjkPp6vGOb7uTPtY6xJrFM5MeFYXhJma3cRrKcDL1+
 s0pi/sWExAm383E45wJgDLitMtU4WzyaXw==
X-Google-Smtp-Source: ABdhPJziu14j4NYxQav/L304LSdPvftAJcz9Cri9zBp0UjlREt09HX/235bFeefoiILK6BGdlHL6RA==
X-Received: by 2002:a1c:103:: with SMTP id 3mr14532568wmb.81.1605523580055;
 Mon, 16 Nov 2020 02:46:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f5sm22973617wrg.32.2020.11.16.02.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:46:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2] configure: Make "does libgio work" test pull in some
 actual functions
Date: Mon, 16 Nov 2020 10:46:17 +0000
Message-Id: <20201116104617.18333-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 76346b6264a9b01979 we tried to add a configure check that
the libgio pkg-config data was correct, which builds an executable
linked against it.  Unfortunately this doesn't catch the problem
(missing static library dependency info), because a "do nothing" test
source file doesn't have any symbol references that cause the linker
to pull in .o files from libgio.a, and so we don't see the "missing
symbols from libmount" error that a full QEMU link triggers.

(The ineffective test went unnoticed because of a typo that
effectively disabled libgio unconditionally, but after commit
3569a5dfc11f2 fixed that, a static link of the system emulator on
Ubuntu stopped working again.)

Improve the gio test by having the test source fragment reference a
g_dbus function (which is what is indirectly causing us to end up
wanting functions from libmount).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The ideal thing here might perhaps be to force the linker to
pull in everything in the library rather than trusting that
this particular function is sufficient to trigger the need
for libmount functions, but annoyingly gcc and clang
have different command line options to do that.

 configure | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 4cef321d9dc..2717cf1db0a 100755
--- a/configure
+++ b/configure
@@ -3512,8 +3512,15 @@ if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
     # Check that the libraries actually work -- Ubuntu 18.04 ships
     # with pkg-config --static --libs data for gio-2.0 that is missing
     # -lblkid and will give a link error.
-    write_c_skeleton
-    if compile_prog "" "$gio_libs" ; then
+    cat > $TMPC <<EOF
+#include <gio/gio.h>
+int main(void)
+{
+    g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
+    return 0;
+}
+EOF
+    if compile_prog "$gio_cflags" "$gio_libs" ; then
         gio=yes
     else
         gio=no
-- 
2.20.1


