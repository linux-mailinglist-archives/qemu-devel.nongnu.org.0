Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7826EE83D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:30:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOL0-0006S2-3h; Tue, 25 Apr 2023 15:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOKy-0006Rq-CV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:28:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOKw-0003Kz-FT
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:28:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso3749530f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682450904; x=1685042904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NSc9X1oR12vCZM0FAvYS0DJlx6du/B2jonIkyp6DQQk=;
 b=SYwpDtCXoiHCx6ADVN19C32qv+dPFOc3xm+vDxNh/aG8gpQ4M3uzkPt3nivGp7RLze
 0BtTd5s06o/ayCdrztcG3fh1aOS4GXO2FRjGMlsoSBI5p8NR2OjD7Q7ubrWQIl2Nm5Ei
 3fApHPbIWJ0+IG+bzIakA/ru0qaWaAnsH2hscMMOX/GwxMRMXRIOa/qxzKu9nsZ2a/US
 Weqvz06d6abAkbw32A3yIT/X8Ps20LZrTjdhbNog9HHyx9k50Uyzpe1RkCZS2ckx6BZX
 I+ik2AuNi5xPE1StNY+HT/MVqxzjUc2pZpuG3dnu/hyvzhSqiW2cr1R35HVnZoexWsUS
 NsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682450904; x=1685042904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSc9X1oR12vCZM0FAvYS0DJlx6du/B2jonIkyp6DQQk=;
 b=luY1Yv6O3p5y84fzSsRC6/e0ERkFALvcQMEPqC7rNGmmrMu61r2uyi9AFQPkWA+kLV
 Iu6bCzLI8f3hgaicQHo7nYQKWhlBXcG9VLV1LjAYVubD3jfSJZSUtzCekigOen5OTjm6
 J/fEmzD27XlDA/PKevYK1nsR2repHEINfcfeLz4Vst2ZCwhxV3Ld13C+3JWJ/Ybs2zaE
 wPFrhsMJm/XzmR4hZMx+ekOc/1Ce6m4rwzEelDqIUNrUgnVh9RlmjWu9QQgF3KE54vnf
 S+93lVOcqPneVXoobXUaOj+VLvm7MhnKeyevhSlgOBCEMlWbE01ighCQi4MUCCBUgKBb
 OSWw==
X-Gm-Message-State: AAQBX9cXFHkZuIzxaaZZMb6+QpNIMEGpaNRQqfFgezZD0AJGjPKh+6Aq
 M+CFXTrAeM88g32u0fiETDGR4R1amNVDbsgCQk0uEw==
X-Google-Smtp-Source: AKy350ZBWuBmbsbYhByPdipFiaSVzIe+YRJt1wxAAFXekAqHvI63sA5R6r+xUHA3fRkCCQXn1dZO4Q==
X-Received: by 2002:adf:ef0d:0:b0:2fc:ec82:4dbf with SMTP id
 e13-20020adfef0d000000b002fcec824dbfmr11746509wro.1.1682450904290; 
 Tue, 25 Apr 2023 12:28:24 -0700 (PDT)
Received: from localhost.localdomain
 (153.red-88-29-176.dynamicip.rima-tde.net. [88.29.176.153])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b002fa6929eb83sm13746222wrv.21.2023.04.25.12.28.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Apr 2023 12:28:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] cocoa: Fix warnings about invalid prototype declarations
Date: Tue, 25 Apr 2023 20:28:20 +0100
Message-Id: <20230425192820.34063-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix the following Cocoa trivial warnings:

  C compiler for the host machine: cc (clang 14.0.0 "Apple clang version 14.0.0 (clang-1400.0.29.202)")
  Objective-C compiler for the host machine: clang (clang 14.0.0)

  [100/334] Compiling Objective-C object libcommon.fa.p/net_vmnet-bridged.m.o
  net/vmnet-bridged.m:40:31: warning: a function declaration without a prototype is deprecated in all versions of C [-Wstrict-prototypes]
  static char* get_valid_ifnames()
                                ^
                                 void
  [742/1436] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
  ui/cocoa.m:1937:22: warning: a function declaration without a prototype is deprecated in all versions of C [-Wstrict-prototypes]
  static int cocoa_main()
                       ^
                        void

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 net/vmnet-bridged.m | 2 +-
 ui/cocoa.m          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 46d2282863..76a28abe79 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -37,7 +37,7 @@ static bool validate_ifname(const char *ifname)
 }
 
 
-static char* get_valid_ifnames()
+static char* get_valid_ifnames(void)
 {
     xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
     __block char *if_list = NULL;
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 168170a8a6..0c2153d17c 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1934,7 +1934,7 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     exit(status);
 }
 
-static int cocoa_main()
+static int cocoa_main(void)
 {
     QemuThread thread;
 
-- 
2.38.1


