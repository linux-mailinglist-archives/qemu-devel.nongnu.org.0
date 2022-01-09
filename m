Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F0488A91
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:31:43 +0100 (CET)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b6b-0000R9-Tb
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:31:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av6-0005pE-GS
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:48 -0500
Received: from [2607:f8b0:4864:20::d35] (port=37679
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av5-00077Q-1t
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:48 -0500
Received: by mail-io1-xd35.google.com with SMTP id 19so14370998ioz.4
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNsF0kPrBvF91LIoX0lOquy9muwxYzG8QlRG6UOuR70=;
 b=bHQg8cAN+sBDTCDn1ObIOVwCCtG+lpJ5W9C7fcpZ1X9CqM9mqBEuNg+5E3avNWyXXJ
 K4wdfvCGU3uw9OuxfNAeVA8fESVTHXIscyuAGFhYFfPhonS4E3WleJX797vdOQ2ZeuLf
 Xef1o5/tPwn9nkHTXicR4GNTJns0pUc8vQEzMZI10LJcEAV1x2euCN4Uwus52MmHQxaJ
 U+ma629sylo7X0sZy5N6Wx9wh7rbCQl+kFKr6ADWywhU6uKebjfBmCQAYCst1CKUYSKD
 Qrr0d76HVL4GIIbY61VhM8+PEJ2k+ULX90jFs01aMqiir3oFLzYca+owynLlDnk/3r1/
 YhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNsF0kPrBvF91LIoX0lOquy9muwxYzG8QlRG6UOuR70=;
 b=EnXibFjoVhMyKb9dptZaqalcKRHw2MJqVg6Kv3HRlDmEpjuudkTf+r3oKO/t+qnJTt
 rzC+zpGIIkAXbwVF74YlDxyWVkiaT5QNxqoYWHmOrQeyh5SrDQEnI5Sqmb87ULWNovTB
 67/IPu5PYmEqbjrN3VTaWsJPWErSns2uaaas7SDKGDJ3bYt3TXuPQIgu0VtjQpZBi5Sp
 U5QlvzBsQUHCGgVOdQ/XYn0iySSaQweuHszXrLMLipbJQLQQ/Rsa7WNQC/YqJ7SIcQxH
 cSLgldEwf8snT2RrriYMkBrNiNukvkTN5SjJQnK1bcvzhxKWXmi+/TmCNbjEdqYrTahH
 ma0w==
X-Gm-Message-State: AOAM532XzoWIDrsg/sjZnij+g18UKhKatmOkOaAWeWVZOkUD5PTES47X
 bOdY+mrhnCNPYcIgxFVJskKMvEJVolnujtyY
X-Google-Smtp-Source: ABdhPJx4g9Ar4G2WQfDJy+TnBhoHZoxiieaNTmzsvFpjr3jNAVYtGW5zFkIIeQaI3xNQNWarsyHx8A==
X-Received: by 2002:a02:a413:: with SMTP id c19mr32077515jal.202.1641745185829; 
 Sun, 09 Jan 2022 08:19:45 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:45 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/30] bsd-user: Add host signals to the build
Date: Sun,  9 Jan 2022 09:19:07 -0700
Message-Id: <20220109161923.85683-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start to add the host signal functionality to the build.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/meson.build | 1 +
 bsd-user/signal.c    | 1 +
 meson.build          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 9fcb80c3fa8..a768e65d35e 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -4,6 +4,7 @@ endif
 
 bsd_user_ss = ss.source_set()
 
+common_user_inc += include_directories('host/' / host_arch)
 common_user_inc += include_directories('.')
 
 bsd_user_ss.add(files(
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index b2c91c39379..bf5c7eb0c02 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "signal-common.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "host-signal.h"
 
 /*
  * Stubbed out routines until we merge signal support from bsd-user
diff --git a/meson.build b/meson.build
index c1b1db1e28c..99bb7ba3a57 100644
--- a/meson.build
+++ b/meson.build
@@ -2932,6 +2932,7 @@ foreach target : target_dirs
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
+      target_inc += include_directories('bsd-user/host/' / host_arch)
       dir = base_dir / abi
       arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
     endif
-- 
2.33.1


