Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6632442E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:58:55 +0100 (CET)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzN7-0007DJ-Uy
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLm-00062R-Od
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLi-0002cd-AD
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id p3so2689958wmc.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ihrw4n8coHSILSNwOuGNRlM8eVaq4PF06jId6z5e0I0=;
 b=GQPTjEgeETk8ak3pcwWVpBeLHGJ9o0vA1hFOdEHEgrFPVt1fpA881wnsrIIOylH09Q
 2reoMMio3hbiBOotSTutmxQ1OcQLJMrwYS/wqgvHFdXMS/vswTECFgLe1GFABtNrqJIL
 maYv7eXitYqNcksDQttxbAn92jK1OKJWCtzkmFoQDupONKY0e92LevIEdpSw4J6Tz1Ac
 vWRkrJJhRmdd8TmAZZwXTPaVmJ0mH52BWihVmBm8HypKhdrECRG79otWNvQcdWrVdSpo
 wMkTKQSIVkoAjuHWKJoZPf/xmnWHd3EiREY+jl3BDRx5jBlgVWgsFP5THxFFWOGhZdDb
 lSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ihrw4n8coHSILSNwOuGNRlM8eVaq4PF06jId6z5e0I0=;
 b=bblwtr7y1wQfDt7puDRc3xcu8AQijE8crA/3MFsCMAcuw0sXwiEMZxGv+qUgi9ortg
 7Os1/EGRGIQYCEoGWZriGQBBR7qe5QIa0s4Ikp2sp5khe/4iIW3FhK6jzUaJH/iJ2Kk3
 7tAO91ukucMcJose1k0VUZBR4b+uX/4FyxacgFQPmqHq6oqS9T8Q8+a4iq4bBF8byp7Q
 jNcbbSM84XkBw9s0ZO6jF01YdtHLKIZzI8vYRb7TyJ1ucZGG8YeS8bjt/1gQmTFjc7ae
 /bFwLHX2cpexrCTiKs9xjSwopYa2+SEqa2P4edmfxHDGDUbKyjNU1haPbg9rWCp98sG/
 N4Ew==
X-Gm-Message-State: AOAM5336w0ZuH4Zewh/iqJMa8XKFFRxIHBKm1GSI4IPAYhUjnkw48Nzb
 RHeojDGCRwD1xOmefr6ISmO6/khktGM=
X-Google-Smtp-Source: ABdhPJwOPVO2lo4Nu2b5nqFMt9VorDg33vMXjuT20RbQ4VlNO3tnUtzkcMl0K85Gc9rHOK/ZxhFmTw==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr5115284wmb.98.1614193044658; 
 Wed, 24 Feb 2021 10:57:24 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s23sm4034585wmc.35.2021.02.24.10.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/12] target/mips/meson: Restrict mips-semi.c to TCG
Date: Wed, 24 Feb 2021 19:56:56 +0100
Message-Id: <20210224185706.3293058-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 75c16524606..53580633ce0 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -31,10 +31,10 @@
   'addr.c',
   'cp0_timer.c',
   'machine.c',
-  'mips-semi.c',
 ))
 mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cp0_helper.c',
+  'mips-semi.c',
 ))
 
 mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
-- 
2.26.2


