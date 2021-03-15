Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13533C5F4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:44:09 +0100 (CET)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsCG-0002Qh-RC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZF-0002bJ-Rl; Mon, 15 Mar 2021 14:03:50 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZE-0000r0-5I; Mon, 15 Mar 2021 14:03:49 -0400
Received: by mail-pl1-f170.google.com with SMTP id 30so11138994ple.4;
 Mon, 15 Mar 2021 11:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mxj+g6b6U5ElCsYWP8nPrTN3O8eushUcHmHZFOrnJuo=;
 b=TCUZctHZVQZnjqvcCrST69hhASN48l2Rk79HJRZ2h/WhX7HjaUzDlFOWYT2EzmSU0m
 v6xhwxD7KL4bo/Z3G5EqnApi5KfukcPlk+repkRFv0dAeev0Gwq44lf8KkCi/79I0xaZ
 Mbf7QoTqvaFaEP6R4Fg5RMbO4xfpMj1PzuhI7f/5TXkcZXv3E5FGOLlFQ6mBq+nUCG9g
 mWiNqbE94t8hGgsdGvXtO+R/G5uid+t6tEuoWlWp+4TmDhzoEMgSkVuV2dYeuovGDTbK
 BGE6nBUa2KZzyoag59VPbbb81Y9JhXKQy6QbQOPVlsrCqjVUCsYmbB5Q66C76E4N+y/g
 +JfA==
X-Gm-Message-State: AOAM530JPev5uwRHrxQ3JDmFBeAKEbo3MfHgb6OV8vVnNbpN+XwmE5cU
 0Xw2s3PcqT+CeAlVhH0yiCYqhEaLGCg=
X-Google-Smtp-Source: ABdhPJwHb1bjLHsnGffyzH0BVf16Tlw4a8u1VPvtfEWZSaRUHs6ZxNktU7s2TZB4UyA51JWJZbgZvA==
X-Received: by 2002:a17:903:3053:b029:e6:5cde:bef with SMTP id
 u19-20020a1709033053b02900e65cde0befmr12525324pla.81.1615831426502; 
 Mon, 15 Mar 2021 11:03:46 -0700 (PDT)
Received: from localhost.localdomain ([73.93.153.95])
 by smtp.gmail.com with ESMTPSA id y194sm14267842pfb.21.2021.03.15.11.03.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:03:46 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] block: check for sys/disk.h
Date: Mon, 15 Mar 2021 11:03:39 -0700
Message-Id: <20210315180341.31638-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210315180341.31638-1-j@getutm.app>
References: <20210315180341.31638-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.170;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some BSD platforms do not have this header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 meson.build | 1 +
 block.c     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 59c7c56366..2c01e2494c 100644
--- a/meson.build
+++ b/meson.build
@@ -1153,6 +1153,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
diff --git a/block.c b/block.c
index f377158c42..c9729bdf21 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
-- 
2.28.0


