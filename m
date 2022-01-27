Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE249E094
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:20:17 +0100 (CET)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2p6-0007om-GU
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:20:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fw-0006mg-NI
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:51 -0500
Received: from [2a00:1450:4864:20::336] (port=55176
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-00068t-QC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:48 -0500
Received: by mail-wm1-x336.google.com with SMTP id c192so1621632wma.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=COj2CSQH2YQg2JpQfJANqj/+hFRZ0YGw/IVDcI2ycQI=;
 b=KLHAnX8Zsr6Uz4X0uPrN0DspQBvlcXtwm0DkILSjDWYwDfA+a/5YM9keVGrs5pXOnO
 W2aNteRPemmWcNxJgTaLT3nXLh5WPnpsgtmG9HcmSklUuAZLFQFGkDt4qUjAi/YSFMW1
 lLkMPhT+oKiOyJL/tX+IFEBbCLJcrrKeZ4V1Gda7o4Pj+6EXjaUzl5EQcGMfVOmtrZrU
 ZLUDVIiglz4CWx+n4YKBXszPE4llTfDGmG0GKraC0BBeDnldBwffBQpaongsO9NOayiN
 38exRiXKfDdoB8nWZX9q5QH7+z4beQ/hYxdUEbnR6sg+i3mD30zT37iYKPjrr1DCyKTL
 nYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=COj2CSQH2YQg2JpQfJANqj/+hFRZ0YGw/IVDcI2ycQI=;
 b=4l1GkhocYqxxvafzQkHklU+et7xb83BIkQMWb7M7icAk9EdF0Wp6HVypzfvHTmBbV3
 iiEJQg7V4Y+lvMWAbb/6R9Arqf7S2xl8KOFD7QxtBRBAIWxB8l1kTycngGAzneG1ai8v
 2uOwjg5W6Q/UrimXYHgPPhj1lhclDf+Q6AjBM/35GevmPh4vZ8cqlfL080jnhQYJuzI9
 4cxqUMbOQ7jXRN61sjB90koqmYWVTxUhn1aHP36Zt4GXre+WjmZVY7FYEAtoTgFKljvv
 GKqYiSksZuy/wMzm3kWjq5ggSXw4e1B0RuOqCFL3/4UEoLtw+ANFsvk8Hv3bL598xNXq
 4PEw==
X-Gm-Message-State: AOAM531l2y5h4mStyTh/xWp6g6S5n6JSAj8gQ//n9DRUAcJnIzHbGzFe
 iHTvfdAuQEtOiEobEXBxe0yv2FTZ7U0=
X-Google-Smtp-Source: ABdhPJzDG8q97TaeVpWg01ou99MesMAltMMd5HtfDL8SXbruf7LNPAUQ4BNw7/tjBhLvgzHve6m5Cw==
X-Received: by 2002:a05:600c:2650:: with SMTP id
 16mr2805819wmy.52.1643281844987; 
 Thu, 27 Jan 2022 03:10:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] meson: Use find_program() to resolve the entitlement.sh
 script
Date: Thu, 27 Jan 2022 12:10:30 +0100
Message-Id: <20220127111037.457901-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé via <qemu-devel@nongnu.org>

Using ../configure without any particular option generates 31 targets
on Darwin, and meson search for the entitlement.sh script 31 times:

  Program nm found: YES
  Program scripts/undefsym.py found: YES (/opt/homebrew/opt/python@3.9/bin/python3.9 /Code/qemu/scripts/undefsym.py)
  Program scripts/feature_to_c.sh found: YES (/bin/sh /Code/qemu/scripts/feature_to_c.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Configuring 50-edk2-i386-secure.json using configuration
  Configuring 50-edk2-x86_64-secure.json using configuration

Use find_program() which seems to cache the script path once found.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220122002052.83745-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 4429fd2041..c69fbbd0cb 100644
--- a/meson.build
+++ b/meson.build
@@ -3052,17 +3052,14 @@ foreach target : target_dirs
         install_input += meson.current_source_dir() / entitlements
       endif
 
+      entitlement = find_program('scripts/entitlement.sh')
       emulators += {exe['name'] : custom_target(exe['name'],
                    input: build_input,
                    output: exe['name'],
-                   command: [
-                     files('scripts/entitlement.sh'),
-                     '@OUTPUT@',
-                     '@INPUT@'
-                   ])
+                   command: [entitlement, '@OUTPUT@', '@INPUT@'])
       }
 
-      meson.add_install_script('scripts/entitlement.sh', '--install',
+      meson.add_install_script(entitlement, '--install',
                                get_option('bindir') / exe['name'],
                                install_input)
     else
-- 
2.34.1



