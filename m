Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A949B66608F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:33:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe20-0001dY-Nd; Wed, 11 Jan 2023 11:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1Y-0001R1-Hf
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1W-0006FQ-LN
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso8310183wms.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v80+rMsZqzMpEgzB1XIdOA1qaUJSrJqpOPE+0MZTyas=;
 b=MyHtzkjyygiTCAVcn3ep3+8nAvsBulZumExrDF907CTi2vaY1xO+shI+Yk9K2yVV8c
 mHeUSPZ/jJt++BFhcl9Q/1tGRC/Xi2D5FLeekf5g/OGMle01D5BwphGfCdM8OgCWwwYE
 imlGElgWpm+mPOWoEfzDIr2swi3F99CvfLAB1imM5/BcRNnOq3srZq9SseFHIdnig8ow
 Cx/turtlMNkIMyn3jCK4opXREwctewZpevXJJiNuTOOitXyfrTT2f1dUU6qBt0WEASD7
 jTTsKyOReRefshGcXBFT+bpgMmspko5gNAFTMEVEy76wAIvCDwel/QMDRK2gRuUScRmB
 JUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v80+rMsZqzMpEgzB1XIdOA1qaUJSrJqpOPE+0MZTyas=;
 b=VI3VwuX4p8NlZhxEgWce6+JMvo4zO3lqQVK6n1NakNCYmmrJM3acpBZ8sUJYdvy9fl
 HoWXvymE1tjrop3dZ8K+SX/jPuF3AvrkqnTOFos35c98hI1IYFqRIaBTcCIt9dXX774x
 dj9fcEaO4byfuTpBXaYJTg8+B4dBTcO+U3/XkFWnLjjuDanNY3PKJAUsZP9xyICOtqfX
 hPqNGfA7wil2/X9nbgxr3yZCWUBGsVydfBtzWM6zdGH4tZXvvSMlWP2MkPzbIswkGjmI
 FwEf9OUf1QFarEGlt4O29KI7UpF4Zpuk3aF0loVWWm/ePlnzq/yLnLmTzoHaReotCGzn
 gvQg==
X-Gm-Message-State: AFqh2krwUST1ukA/hzXVMI6UKYvVOnbnr/K7McadNbhYlcB4l6S4EqDh
 H9vHRl9doOjEIxxyMcitNTrRw5pghqb2Ymbw
X-Google-Smtp-Source: AMrXdXtr3VJCW/uvsr3K4TWxbo/nIhjr9HDiab2xmU2BFfc9Yn9mf3sa+D2FEbF81Px1WmXSNVhH+g==
X-Received: by 2002:a05:600c:1e24:b0:3d0:8643:caf1 with SMTP id
 ay36-20020a05600c1e2400b003d08643caf1mr53781460wmb.16.1673454740806; 
 Wed, 11 Jan 2023 08:32:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c0a0c00b003cfa81e2eb4sm18720569wmp.38.2023.01.11.08.32.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:32:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 6/6] qemu/bswap: Use compiler __builtin_bswap() on NetBSD
Date: Wed, 11 Jan 2023 17:31:47 +0100
Message-Id: <20230111163147.71761-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
References: <20230111163147.71761-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the minimum
compiler version") the minimum compiler version required for GCC
is 4.8, which supports __builtin_bswap().
Remove the NetBSD specific ifdef'ry.

This reverts commit 1360677cfe3ca8f945fa1de77823df21a77e4500
("makes NetBSD use the native bswap functions").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 11 -----------
 meson.build          |  4 ----
 2 files changed, 15 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 32d5cdec27..3cbe52246b 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,27 +1,16 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
-#ifdef CONFIG_MACHINE_BSWAP_H
-# include <sys/endian.h>
-# include <machine/bswap.h>
-# else
-#define BSWAP_FROM_FALLBACKS
-#endif /* ! CONFIG_MACHINE_BSWAP_H */
-
 #ifdef __cplusplus
 extern "C" {
 #endif
 
-#ifdef BSWAP_FROM_FALLBACKS
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
 #undef  bswap32
 #define bswap32(_x) __builtin_bswap32(_x)
 #undef  bswap64
 #define bswap64(_x) __builtin_bswap64(_x)
-#endif
-
-#undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
 {
diff --git a/meson.build b/meson.build
index 697059d2c8..f2663cfc32 100644
--- a/meson.build
+++ b/meson.build
@@ -2023,10 +2023,6 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
-config_host_data.set('CONFIG_MACHINE_BSWAP_H',
-                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
-                                          prefix: '''#include <sys/endian.h>
-                                                     #include <sys/types.h>'''))
 config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
                      cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
 config_host_data.set('CONFIG_RTNETLINK',
-- 
2.38.1


