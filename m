Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3069555C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB1-0007NN-Va; Mon, 13 Feb 2023 19:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB0-0007MV-5m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:06 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjAx-0005ye-TW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:05 -0500
Received: by mail-io1-xd29.google.com with SMTP id y69so1871950iof.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/ho+o97t3oUvsCX6/tWPXAhBUu89VuwLZO+3r6EySU=;
 b=vOgRgkplx1/kNidtcE/bUUWayRPabmhs2XiKD5JZVtSOm8lWGpwtxtHhRChMSXfMCg
 fGZpMe0xo6MMVvqgnbhLpsB6iNzf35SuLPn1la8yILRJtNemaPMYUBt1FhcZuq4Jacj8
 1aoncb71Xi1nqU3uN25yWTXPTUGUtgUBFNeMX4qdoiKd0wg5po/mKoV3W8S1HD7cHJIh
 FCbE5X83G8nWy/Djra1yQtKMonbQ94+XTFDodvWUiyGUHzHYI7EO7sPhtUMUJDT+jfTL
 EVXeyC8U2+UIjNPkS+Q75oBXkdeY6lnM0UwhU9cwxpkKJCUQRhI7AM4puBAoE7lA5QBb
 3vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/ho+o97t3oUvsCX6/tWPXAhBUu89VuwLZO+3r6EySU=;
 b=OCAk1p/u0dsgbGLaEgklYBcTnE3umQ1R4ISqV235ReCz61wBEFrPfLT3V3Eq/Vly1N
 1gCikBq4HL5qsqto3i7ZI4tLbM6pio6ZZt3bvGFngzEwiy4uCDkOmjjBoddV2g3cSnvl
 g/Hhlg0lBay0kEQBounruFYKTxzKtv2FGQR9z3czIyjkgNMxT4XjLmNxBgHuO+q2vDO8
 rUKmzBG39vz1wNHXYlD1Oh8f+7BhPGmSDGrkK8gelokLLMRZx5KDqLlg6RYn3HgnbT5x
 EQYVXMmMXEbf+uSW6a0VJ8Z4R/yQfpTOI2nn39/7C4e9UZcSwmIs2TrfzaCUB7W/6Xj8
 Xjyw==
X-Gm-Message-State: AO0yUKUASYB1X5XB7n60gQ4hh82wq/zei57+r7B+ynMM2/yU9q7Xt+/D
 dPJkY069JDJ2WrKAJYE0jZbT0GEGhRO1jLzM
X-Google-Smtp-Source: AK7set8oZvbj/RPCA0O6mXMFYkdWlSAumpKuaf8UHaGgBrO8mBdpROo2zoDuKxihBygb774fWxs4Qw==
X-Received: by 2002:a05:6602:11:b0:73a:4169:1178 with SMTP id
 b17-20020a056602001100b0073a41691178mr285667ioa.14.1676334482512; 
 Mon, 13 Feb 2023 16:28:02 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:02 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 02/12] build: Don't specify -no-pie for --static user-mode
 programs
Date: Mon, 13 Feb 2023 17:27:47 -0700
Message-Id: <20230214002757.99240-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

When building with clang, -no-pie gives a warning on every single build,
so remove it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 64960c6000f..eb284ccf308 100755
--- a/configure
+++ b/configure
@@ -1313,7 +1313,7 @@ if test "$static" = "yes"; then
     error_exit "-static-pie not available due to missing toolchain support"
   else
     pie="no"
-    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
+    QEMU_CFLAGS="-fno-pie $QEMU_CFLAGS"
   fi
 elif test "$pie" = "no"; then
   if compile_prog "-Werror -fno-pie" "-no-pie"; then
-- 
2.39.1


