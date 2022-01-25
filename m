Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6571A49A5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:12:46 +0100 (CET)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBK9-0007rA-1l
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfG-0002Hq-P9
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::129] (port=36678
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf3-0001bW-W4
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:26 -0500
Received: by mail-il1-x129.google.com with SMTP id x3so825928ilm.3
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FSWCgQKiyULwg5VoJlgEfHBBGDIs0nJGXZTOGloR69s=;
 b=0sXDRlAXso5kllQhkF+6OgfayCl7YYCk1KRm5RQh+287v/OUylJux4HZhtD2YxVm3q
 O59jky4Ayzdur5giEAUFEGDTkJEpd8esmOtRUXUrvwObxoOQBzP1Q6XoaiKDKKt+OfOI
 B8c28dBs/KvsVVzC1k9flwYj6Jwb/Zz79B9plfQq7WAQ9PS5fvKIBIQM0PSUV2P0/lGE
 FXQW92ZUgmJmp8uMCvvJ7jxlLOVwwL6loQynR+myIg+SnqooIxV8/sl/F0hilXSR3rjM
 RYTbXziRraik+oWmwUSJRISpHRVO89F2womWJnDboCIatHqB0yakauLPEmL6BabzKfYs
 Gu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FSWCgQKiyULwg5VoJlgEfHBBGDIs0nJGXZTOGloR69s=;
 b=ukaa1IjB2Kl5KJUscYf7mp6cOQUz7YNDPAOEhCacxUD/waaIa89cUXxUZaOl3pJtvo
 bfDaqPFqhPLv36Mo3sD0qKzIJjI8wkx4/i0wdEpF3OAoInHTUyfDSF0/HHaK+tiwXIFx
 BOy42HpA7zd9rnLnWlSL1aivygjxwp1ozfP5/Q8jpO63o6IhFlKlLuvfgQoe1ew0DzHr
 ur0zTGl3mJrHnXG0l8qQ0MqyKVy2ulJViKr5VBbWhjtFNsvqlVPQKzCr10H7EwfRsyB3
 8eYdMixcREi5xihkfVpkQ1pXxhI16yCSR/eMvN+un1NfN1FJjIOaE/kfE7i0sanEpDPN
 Wmmg==
X-Gm-Message-State: AOAM5335/sOggOk9IQBK9OsxPzuCW4jPmHcqhG9pWEAiCzISJDZL7WAr
 bMu16owxSZIpogZBR0QG6jdxpEf3e2U9hw==
X-Google-Smtp-Source: ABdhPJysrsEKtCivfo+uG97WGYev297evqZIZF3nP7/RT820pMQp9ZgNJ984+xxUco6HDs5yI7E1IA==
X-Received: by 2002:a05:6e02:1305:: with SMTP id
 g5mr2760199ilr.322.1643074214830; 
 Mon, 24 Jan 2022 17:30:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/40] bsd-user: Add host signals to the build
Date: Mon, 24 Jan 2022 18:29:29 -0700
Message-Id: <20220125012947.14974-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start to add the host signal functionality to the build.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index ad8437a8bfb..f3e020e004a 100644
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


