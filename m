Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E530889F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:54:11 +0100 (CET)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SLq-0004tJ-Fi
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnF-0004K7-TT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:29 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnE-0005wI-HG
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:25 -0500
Received: by mail-ej1-x635.google.com with SMTP id bl23so12448953ejb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BO9Qi6gsd1HjJky0aDF1av5K+7FDTCunwCjMyFDDpdU=;
 b=Ag0t55sD8demCjIJEqXY+7Oq2HRnhxaCFnFBpkKJANYlHKBlVfUUOjjZnRCzUJrlzo
 n9BKQQS/PmiJJ4dow275/WEODUzDkMQ7LsmaR1Cef9iTw2Z6kJFNiA6oLb8D/Z6jcWZQ
 YAkuRGD2I6YPb4YTK8hc3X8TVEHWTd8it49ZLpr8UTQjRayqwnKj3ZdrdODJUrp0fDGQ
 qvPFy8K+JQgJ9P60sbSk8Xb360+DQj6QKRllYeQrpiNcnCJXUFA1o6dgKfVvjPRKwGOW
 x8akbODRnUonzhL9TOQb0jRNfxgoHjwjx5c7c9T2rEe5XBHalMx3MsOnPhmxH5zv+iFi
 GWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BO9Qi6gsd1HjJky0aDF1av5K+7FDTCunwCjMyFDDpdU=;
 b=Y0KN0aWHnJPg10S1WqJns3dNn+rKINv2+/QHuhheD63CMiG4bSDWA/bB4eWAxm+Vrl
 G1ft33JPaWfeoqYqtQQQd/gm/kq1FIRH3XyGaPfhsdcdSxzTIB4gUatTDQ/TWdMcsoYs
 4zSoU1dT1aG5EnF3sygZJ4j3N0p/zDKtwuzOAD3cT3nzgW5/FxktOgaI8NBNpAzzb0Du
 ug+9eVl9bmroqI8Xirjyd30dYQuV+AAWBJ4QjwwzOk2WDSWyHBShvp8zKypBbb9/wpRZ
 Sg7BDJ/jLYN9byt4Z3Xgce1erdiLMGsacV7NIkqLBqhRerEd8+533mdnUloWho+mtwZY
 oFPA==
X-Gm-Message-State: AOAM532JVL4k8a8GCLCqwS6kj7nRmGlyzKCNz10WL0M0x6WqLSHPI0T/
 NT9PJxIwLTA3TSCRBnR4GSfNhIYaS/Rn9A==
X-Google-Smtp-Source: ABdhPJwNg01Hq8X7HhQRn1XY8GSXdNg9hvbaz+iJlHYfcoboTevzZCeWoDuHS6hpavERUtx3W70GuA==
X-Received: by 2002:a17:906:ff43:: with SMTP id
 zo3mr4019647ejb.542.1611919103230; 
 Fri, 29 Jan 2021 03:18:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/36] target/i386: do not set LM for 32-bit emulation "-cpu
 host/max"
Date: Fri, 29 Jan 2021 12:17:46 +0100
Message-Id: <20210129111814.566629-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Nathan Chancellor <natechancellor@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

32-bit targets by definition do not support long mode; therefore, the
bit must be masked in the features supported by the accelerator.

As a side effect, this avoids setting up the 0x80000008 CPUID leaf
for

   qemu-system-i386 -cpu host

which since commit 5a140b255d ("x86/cpu: Use max host physical address
if -cpu max option is applied") would have printed this error:

  qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)

Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 72a79e6019..2b2c1c5389 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5081,6 +5081,11 @@ static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     } else {
         return ~0;
     }
+#ifndef TARGET_X86_64
+    if (w == FEAT_8000_0001_EDX) {
+        r &= ~CPUID_EXT2_LM;
+    }
+#endif
     if (migratable_only) {
         r &= x86_cpu_get_migratable_flags(w);
     }
-- 
2.29.2



