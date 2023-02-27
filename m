Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407D6A43C7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe76-0001uQ-Em; Mon, 27 Feb 2023 09:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe71-0001ho-KK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:21 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe70-0007yy-2f
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k37so4348479wms.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GNz/wLv9q/CfxjcpxtTBilmbJ9v6EOOZzvA1J/LwMtM=;
 b=Odx3syVmuCGIBKq3/o7UAqCa8u0n6jaxtSaiLwKlGtkKDGtqaAC20iFglLpKIH8Ra2
 068kxEDwfa5kWKbHr1wK3F7CVbBcaflV3XGDblUarDmnN5sBlsbSGmCKuTkGA4QARPkY
 YiqStzcOXP3U5MLVl2xh4HskR1VufteKPA4rAf7AHdZs4hpQsmLQxs0rw7xz/fZaV3b/
 3az7BBJx8XNHv2xl2FP+qHdhhpCZI+H6nPKWnLYtrJVgaHkELROLY+DyLwCcEjiTS9c4
 0UKBeqtYkOUAiZ0DsXM1J5qC0gNLMSx8rO5Sof5/vD5PeGWMBJl5Mma4pf9n4kg+dXoC
 SYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNz/wLv9q/CfxjcpxtTBilmbJ9v6EOOZzvA1J/LwMtM=;
 b=WGLVu7rMUZ0+iq6MKnKdqsPnE1JHk+Pm8/AxLj4EWVRB6oksj8wKRLJUiJz6WhMUKS
 6XAowhQR/WzPFXuGYPayR6rPoyymJPW11fO1yCbUuUO9gF6w+sj2BQ/sgB2q5AiTPVzE
 LkkjwYmdpr404k6Wv6uoJ2QTb3TMu8zY7O6yeKe0JH9sM5G21+BG2Lx2a8ghFKjGYkgQ
 /kUhqPqcHQ+S/xPpNNKjOa1+dWZ3X2SFJZafqyYq4Jnwu6quWvV2TSx6PfQpuw/gbc04
 mri/7mFGY+p9W6hCEiRRrebz1AhMbfYZduw2SZESiClA5y7KH+n81lhR/j0WHfy2RBAS
 CpTQ==
X-Gm-Message-State: AO0yUKW9EyUSYzV9buZnV/+vSleWhefGQSp/E0feYBAaXUo1K80X3JlL
 8vDvoSB2LcHJV6kJHANlNP6XvyDGpl7Qfbqq
X-Google-Smtp-Source: AK7set9FwuprcO5ybqYwQXy0UuU5cqbJ34BR1SBqrY+JtpJFTqoLLBz54RqbUq03BGkYkNRBCB1rdg==
X-Received: by 2002:a05:600c:251:b0:3ea:f73e:9d8a with SMTP id
 17-20020a05600c025100b003eaf73e9d8amr11387470wmj.30.1677506656572; 
 Mon, 27 Feb 2023 06:04:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a5d6a82000000b002c53cc7504csm7396758wru.78.2023.02.27.06.04.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 032/126] tests/unit: Restrict machine-smp.c test to system
 emulation
Date: Mon, 27 Feb 2023 15:00:39 +0100
Message-Id: <20230227140213.35084-23-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221219170806.60580-6-philmd@linaro.org>
---
 tests/unit/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f432..51f453e6c4 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -46,7 +46,6 @@ tests = {
   'test-uuid': [],
   'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
-  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
   'test-interval-tree': [],
 }
 
@@ -134,6 +133,7 @@ if have_system
     'test-util-sockets': ['socket-helpers.c'],
     'test-base64': [],
     'test-bufferiszero': [],
+    'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
     'test-vmstate': [migration, io],
     'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
-- 
2.38.1


