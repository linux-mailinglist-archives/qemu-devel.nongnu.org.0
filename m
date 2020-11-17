Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754AB2B651E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:54:54 +0100 (CET)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Rd-0002gb-Gc
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Ln-0003Uu-FX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Li-0001ws-0I
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id m6so6056585wrg.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WIwwMdEY5387t3nDgbRHskTkVvKEvXfLu8ZPGnOtUxY=;
 b=xfY0UgcjKcButQjNTurQwHAJdg6jpbZvH05Sf49iKNGgZsX+sh6SROA6Zv9sjDTT5U
 NIjPmsJ6GjNdjo5BwiNniq+ZWfIY2PnhBzTqZplIAIu98Rui+87QNEsIHsPEjDh/idod
 48E9K7HGsWd3p3UCULlhkwEYCfxKo2Qzqjr5nYCjotcslEFmDbaKVo/RRAf38NJY+5CD
 ydKruyL0y/BW6NLVes2m/ake425Gf6Ror6A+qv0abuvY3NGQtcKPwx456fHxnOqFDXlE
 GXR7xCNUJYiJbmqT9B6dpG6vuO+Rpgda6CgDQpNokLLZbjs8crsObK2nn669RxB5CeQj
 QjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIwwMdEY5387t3nDgbRHskTkVvKEvXfLu8ZPGnOtUxY=;
 b=oqADNlbHJPCD+OvlOq4NSIdYkJGNfhBMr5Mz9SMtlYlzAc+/60OgTPxKMonv9FtB5R
 g82wXBfTiZaD7AHCA1P7Bc1fT3v25vd6Su7nWze6lWTRwnneRAvwqG9W2B11OzRhIkKP
 e3cTYL7fT5khDwi60NdemNPz1Y8ouxncwZQ2A/QvSnhCv5G9mGHGaHTqKcSaNMIiWJX8
 S649MV37jEgzW2OQTYNa4EzwUDYqnIPzHt/hi5cmr2ARYYYfc+hIqnqn5lDkFcQU4RjS
 iMrSpLcJ+Uh87S8II0Q94znotfSi6GJc/m8QzQCNh8vZBfLPGPaLMY6JI3FfT6tzNHJ2
 1SwQ==
X-Gm-Message-State: AOAM531XtYJjuT7CxhjWl2Pd8xFRIfKaj9IFfXc/B6q6r2MLz3ZHwq5k
 IfBrN/FXwZrV/lzTkUQ2ZtNmg+50mxEYSw==
X-Google-Smtp-Source: ABdhPJzmrX4/ebdGkeqQHzFYbmqTXAHTtTn8vsGODGlpqztXCuo53bPzFRx/uXS4RUR6R+8IaWlvmA==
X-Received: by 2002:adf:e789:: with SMTP id n9mr24905264wrm.211.1605620924265; 
 Tue, 17 Nov 2020 05:48:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] configure: Make "does libgio work" test pull in some
 actual functions
Date: Tue, 17 Nov 2020 13:48:32 +0000
Message-Id: <20201117134834.31731-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20201116104617.18333-1-peter.maydell@linaro.org
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


