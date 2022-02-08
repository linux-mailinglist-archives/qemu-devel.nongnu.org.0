Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9534ADFB4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:34:25 +0100 (CET)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUNk-0000qN-OK
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKb-0007tL-AL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:01 -0500
Received: from [2607:f8b0:4864:20::42f] (port=38676
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKZ-0000GI-NQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:00 -0500
Received: by mail-pf1-x42f.google.com with SMTP id e28so19424141pfj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qmrpYy0HXOTyQgHJzOuN7VqtGNgJBH5lxPAjxJsNimQ=;
 b=EmxN3aS0guCZW0FgOAmTimdjmsb2flq6H6s5LqfPZkdZMdFOuGXMZKCrYVT23AREPY
 jYfZff9M1tbFlfNkmRZN7Tj9Ws8mSlgwEsABDNsjLXb+34bgUc3K3QnPlwIC0/l1Q0Si
 L0fwWCb4ioZlZUPotJVH270alRsIU45zGOZb4qxBMG4L9WbYk3H0rNHS7xIjPzdtfDUI
 R4kmFgQ89Pn1CcFZ0XauvawoVNhzY6OraJ66ENmCDzEpqBQrZTYnjeHBGkVX9eOWyTYL
 Ir6TnIBhUFs3Gb5BERa42Yubv7W+WIxo9qepGy+ii/RxqKhrkTmlD7E23up1eCDPtx/E
 l8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qmrpYy0HXOTyQgHJzOuN7VqtGNgJBH5lxPAjxJsNimQ=;
 b=OuNEaawUMjkJweoUrlROVl8y8EQbkz4QGaZi14/rP8Z67+6UMmNRIaRSyXTQKeLiVj
 eK7WGF9aZsnaV6yNTRTscFtTEoH1tT9oyUpV1jR6Y0Nt+tkpdsxYcHx+h1Rpi4hsSohC
 2/I/pEoTn2On+lKvOV8oA8QEsIjX2LCi/FnVTgDkNGr2XdgV9u+OiobWbVMx0++JD63u
 jAdzbF0yXesFgllM01wcXIpwZAMJsb3sszouuNuMV6qFnh4FBvRW+LG1CPQz4RZKmUHo
 gKENUECAu4PZWpIXCNpK5M1iMju0rBxllKrvgBcdrTdsoj7VeDmk0jPdlzHGJzG7/7A+
 m7Hg==
X-Gm-Message-State: AOAM530HM5RS1ldslUz7hNRCtXOtkCVvVzBz1vTnqJeq2zZDNTtjV6pd
 RM4/H7ueUyZN+aQf8VLuaH+1iSxzqsU=
X-Google-Smtp-Source: ABdhPJyr6bIKCL3cVQkxzQijNw+reA21uBYiCkEXNO9FZHDMkOTgnnoH2Op+PI8unHUx3XM65eWD2g==
X-Received: by 2002:a63:b25a:: with SMTP id t26mr3883640pgo.144.1644333778144; 
 Tue, 08 Feb 2022 07:22:58 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z22sm16319919pfe.42.2022.02.08.07.22.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:22:57 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 01/13] meson: Display libfdt as disabled when system emulation
 is disabled
Date: Tue,  8 Feb 2022 16:22:31 +0100
Message-Id: <20220208152243.16452-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When configuring QEMU with --disable-system, meson keeps showing
libfdt as "auto". Mark it as disabled instead.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 571af34b7d..3c274386bb 100644
--- a/meson.build
+++ b/meson.build
@@ -2271,8 +2271,8 @@ if get_option('cfi') and slirp_opt == 'system'
 endif
 
 fdt = not_found
-fdt_opt = get_option('fdt')
 if have_system
+  fdt_opt = get_option('fdt')
   if fdt_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
     fdt = cc.find_library('fdt', kwargs: static_kwargs,
@@ -2315,6 +2315,8 @@ if have_system
     fdt = declare_dependency(link_with: libfdt,
                              include_directories: fdt_inc)
   endif
+else
+  fdt_opt = 'disabled'
 endif
 if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
-- 
2.34.1


