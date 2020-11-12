Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F62B0AC0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 17:53:22 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdFqb-0000ea-7c
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 11:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdFpq-0000BS-0u
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:52:34 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdFpo-0002LA-3O
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:52:33 -0500
Received: by mail-wm1-x343.google.com with SMTP id p22so5879726wmg.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 08:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GijP0ZZL8hVUa5F3hxqrJ/JB1IdpnIIV2hKab6hRTK0=;
 b=SH9DLcQYf+NY2xqM413QR0rB0z1cWYroPOTTJb/Hz3m5flfCRc5eT4JpPsQZ422L9n
 aoKynwMNh3aaHdBN/bIqHqA3pdl9h8c6r64H0Udd5MCEYnyx1IecSXIgzCZ2i1zIZVSE
 pFfwTaPVSVuGa/vQHUGgV1hmdYBE3z0EwiNgiPUw29oeD7wrpczQVTyhd/4yyjJiHuu/
 q2o3lrnI7O+I6NBj6DoEIzqmk4z+NB89FhKmRsIUjKtYgI2S75oL/v1/SGhzEBF3z7q5
 e8yXi+HaMHa/QJijejQSrmt6HZDEKXIm2NFfIQoRb7aOd6k3ZX17/rW5pBNIWaDV0sFA
 sJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GijP0ZZL8hVUa5F3hxqrJ/JB1IdpnIIV2hKab6hRTK0=;
 b=o8ulACYd+IYyuhBc7qMMy4strSB8+SLnpB1vH9wZgqjobL9nv4emNL7cJoJDmF+qnZ
 7IckbXJbuKLFfa4aHuGPKN291uSBGi8PqrBJnZP5OSeHW81mbOpUqh3eVm+2X7ca/QI4
 pYUm8kvGAuMdL3kWkSJRYCUgxPNPqtViQbMPXQojacI9dMbAKEuxV5SP0mR+4h+QLIWN
 Co3gjlKCoMXGVpDaUjWaMiw4wcsrAdKyIzWWvLuKv+CHFZuoEdCTBV3/nzdFO3bR8d33
 Xd7TLNWpluGhr1SleFeNK+JhSMyHjh87hMuRrUUHByPFbzM+w9YmoFSrcw9y2Gy1y/H7
 m5oA==
X-Gm-Message-State: AOAM530g+Xqe/SGeo9BSdCULvXuC3zfrE8H2p/iesOKqTrsi3WwLUM55
 1kIHTQ7GPB8WU47D30JAu8w1xG5xClR0ZA==
X-Google-Smtp-Source: ABdhPJw/FD5NBBU5376kKc/B2dwlSkhCU0rNO4Kig2hOZCrpASsE9oWsym4JTkRM0L1y/B8O7dTYBA==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr516445wmj.97.1605199950085;
 Thu, 12 Nov 2020 08:52:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b63sm7689120wme.9.2020.11.12.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 08:52:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2?] configure: Make "does libgio work" test pull in some
 actual functions
Date: Thu, 12 Nov 2020 16:52:28 +0000
Message-Id: <20201112165228.22903-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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


