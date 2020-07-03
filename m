Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADF1213C3A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 17:01:29 +0200 (CEST)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrNBw-0000dm-1M
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 11:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrN70-0003fp-G6
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:56:22 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrN6y-0006ib-Lq
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:56:22 -0400
Received: by mail-wr1-x441.google.com with SMTP id z2so10754799wrp.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pTkmSlbOfuTPhMuEdajkOu0uB2oGQShiEgcGQkMuHKs=;
 b=LZ7AoHVCsQPNasBYn0ShGPO+4UEJmYlV4arLMrZec3Z0AI3FTt9Ole8f3B4SFSUUsj
 j2kbzq0GHVhduevJCm2Z9Khgpo4A09/1l7kCONDZ5z/HmPk0GootXEc8Yv1ceCXJZ28G
 xsCx38LxMX4tlUSccQYW9sLEysmCSBdDUdEEBro1Idnk+SFt1h5eee8UugFscKZtqQ2Y
 Uw6X6+JiPDErvTVC2Cx2uBccIylaeFC626gOt46oR0zFuonqDFNeIdh8Jyc2694lYFN8
 XKco9Qrt4TjVvUWnWWv9DIqnO/T8ndWFQxtP7EKVf3iXSFl8d1gCH9SWqXUwUGMzwZMR
 mZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pTkmSlbOfuTPhMuEdajkOu0uB2oGQShiEgcGQkMuHKs=;
 b=La/pTn77CnDv2RcvT2kPOCCPINbjOueRAArnUTHJ0FoWV7oDpzFJJrJrpo3xHh8g5C
 CzO0U2N9VPfWlyMvXF8/8Xqf3Kw99d037rTJB8ndjNzDzlstHGpkVQs6+3d2L8PLQ1S5
 B9veuIkYg64rpm+VLn05XDDcxFLhHUD4cQva7agAYV30MH6Xq6/ZvByBFfj2iC48iry2
 f2j+XPrtANrSdN/AnKvqyh9n7e1drVt8KKCUB4LZ0CiQhdWabaFSaPF8Wtx5yTYib2jC
 z6IYrMYctQ+PJ43+7f/BA29jyVHEBxh3P0ZU+QgORn28hD1NfCNiR3Cds3HpjpBOJKjU
 1NLw==
X-Gm-Message-State: AOAM532LAB3jsrZapavxu2Cz1iLWimRR1rRgiP8KqdEaCu2tP9XFcghG
 2rBH+KkoMWj/5tiWpAc93nVHE6ENF6o4ig==
X-Google-Smtp-Source: ABdhPJw9v6DPoqmTOa2hgPCg9FgRZjD7Gow8VNxlGk3A+LWEX+uihYxafpsoCaTKsr3k2RrU2rSj+g==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr37110886wrw.300.1593788178940; 
 Fri, 03 Jul 2020 07:56:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm14078347wme.31.2020.07.03.07.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 07:56:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] util/qemu-openpty.c: Don't assume pty.h is glibc-only
Date: Fri,  3 Jul 2020 15:56:07 +0100
Message-Id: <20200703145614.16684-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200703145614.16684-1-peter.maydell@linaro.org>
References: <20200703145614.16684-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Carlier <devnexen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David CARLIER <devnexen@gmail.com>

Instead of using an OS-specific ifdef test to select the "openpty()
is in pty.h" codepath, make configure check for the existence of
the header and use the new CONFIG_PTY instead.

This is necessary to build on Haiku, which also provides openpty()
via pty.h.

Signed-off-by: David Carlier <devnexen@gmail.com>
[PMM: Expanded commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure           | 9 +++++++++
 util/qemu-openpty.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index c9c135b70bc..5455ae10d05 100755
--- a/configure
+++ b/configure
@@ -2386,6 +2386,12 @@ else
   l2tpv3=no
 fi
 
+if check_include "pty.h" ; then
+  pty_h=yes
+else
+  pty_h=no
+fi
+
 #########################################
 # vhost interdependencies and host support
 
@@ -7856,6 +7862,9 @@ fi
 if test "$sheepdog" = "yes" ; then
   echo "CONFIG_SHEEPDOG=y" >> $config_host_mak
 fi
+if test "$pty_h" = "yes" ; then
+  echo "CONFIG_PTY=y" >> $config_host_mak
+fi
 if test "$fuzzing" = "yes" ; then
   if test "$have_fuzzer" = "yes"; then
     FUZZ_LDFLAGS=" -fsanitize=address,fuzzer"
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index 2e8b43bdf57..9d8ad6905e0 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -35,7 +35,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 
-#if defined(__GLIBC__)
+#if defined CONFIG_PTY
 # include <pty.h>
 #elif defined CONFIG_BSD
 # include <termios.h>
-- 
2.20.1


