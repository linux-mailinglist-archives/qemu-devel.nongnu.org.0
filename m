Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B050A48A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:43:28 +0200 (CEST)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYxr-0005bP-HB
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZC-000798-Ij
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:58 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZB-0006F9-19
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:58 -0400
Received: by mail-pg1-x535.google.com with SMTP id x191so4908997pgd.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OYBMuRkIUE7W+zN2kmbgmQVz6iC93i9iGuaGDgWuMWE=;
 b=nkZ1QB8abgilY+DqoJmHo6lCH/HjvLuvLxjEiQWm+zy2StKRGsOC28OYyTyGjUDdni
 wNnPedlKtl1O2LJOwKhKr99VqtTvvaZE1QOu6Vjg019neBeCNO6WQJ0zN+BHhDAZOBZT
 5n2M3G/JnTqHbFVwsqpf9iqq6l6sF5FP2FnEqlC7pGFQ5O4ndjIGlpBlbj2iZrl8t88y
 svHX6rgkt3XmBatw6M1tYb+BZUTznzheymtfZRKozZJ6V6OgdcbrpSbd6eBYwRXJNKAs
 Xl9URw7zRc4DwC3fR0yqb/lHcpGr7g92jtEYEpOPE1nPRON57Lo4hkQLMQOD6PC6NGe/
 pxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYBMuRkIUE7W+zN2kmbgmQVz6iC93i9iGuaGDgWuMWE=;
 b=4X+Y36o+i5UeJHFw56myJ8xqCj2FloyOg3zGBkLSfrO+uiZt9qiV7V1k6x06kgMhP2
 T9gTSdas+oGJKQ787TFFabcbDDfF1oEpiK0PERhbRL48P8PE/4Oeg4zJCh7a0y+5dh45
 buHXmWO3Zsqmj4b4bcMuSXlNxlUMVnUBVO4h3EuXfj36kEr15Mi2vTazRRlh+l9S1JjX
 FfWVkyarFlGogP1HKpCPJbJHK+vpn357hJbgHBdmWlLyjYIOPfPouFYlFC6Dc0u3a44s
 oGXInUtNzG/2IlqvH3jcheCQQ0ICNSoNS72nxr35+qMDEF4y9uHJ2zQ2ftbXJQua9eaB
 dl+g==
X-Gm-Message-State: AOAM533hNlUKGIoLKOlkmVpXKdSOgDcJTKoQ++YjB5XoAWnfHEZA/pCP
 Go61PnWaEnMV0owh6jAHjyRfgzZ2bCgqxA==
X-Google-Smtp-Source: ABdhPJxoHqfwinRWhVgZ3qEXEEyd8JN1ABdvwHglX8j/gh2lMyKh6O9ZGhxL8GvgEsi549JlX8wrWA==
X-Received: by 2002:a05:6a00:b87:b0:50a:5ff2:bb2d with SMTP id
 g7-20020a056a000b8700b0050a5ff2bb2dmr155863pfj.68.1650554275627; 
 Thu, 21 Apr 2022 08:17:55 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/64] target/nios2: Build helper.c for system only
Date: Thu, 21 Apr 2022 08:16:42 -0700
Message-Id: <20220421151735.31996-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the #ifdef !defined(CONFIG_USER_ONLY) that surrounds
the whole file, and move helper.c to nios2_softmmu_ss.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c    | 3 +--
 target/nios2/meson.build | 7 +++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 55b8fb0bcb..04a8831443 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -28,7 +28,7 @@
 #include "exec/helper-proto.h"
 #include "semihosting/semihost.h"
 
-#if !defined(CONFIG_USER_ONLY)
+
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -292,4 +292,3 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     env->regs[CR_BADADDR] = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 62b384702d..2bd60ba306 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -1,14 +1,17 @@
 nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
-  'helper.c',
   'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
 
 nios2_softmmu_ss = ss.source_set()
-nios2_softmmu_ss.add(files('monitor.c', 'mmu.c'))
+nios2_softmmu_ss.add(files(
+  'helper.c',
+  'monitor.c',
+  'mmu.c'
+))
 
 target_arch += {'nios2': nios2_ss}
 target_softmmu_arch += {'nios2': nios2_softmmu_ss}
-- 
2.34.1


