Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB20484BE2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 01:53:50 +0100 (CET)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4uYn-0003nW-7d
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 19:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMP-0005Cw-OQ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:02 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42561
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMN-0005fI-7f
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:00 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso4793152pjb.1
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 16:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nhccvc7jO1lfQcqH/y9qaOyEsCQIn9/GtRZwxj3VwPc=;
 b=DFqByQYViWahJCUHFKCiNgbawmqnRTKsEOmnZ8v9Op2TPOzrOUE3Ow8KOlmbk8gRvG
 jsMbnmeDhWgoKHiWbhQu6BVuGT9r/JyXFZKzPuH2TAHeg/dJc/ow9+QZSdnDW0YXkhDr
 wa78WxQ0pcAkMOCwVPtGQTj+xFhghK1EagThE6Xco3R1JDLJZ1/u1TRY4RBtP4U/fxuk
 gOF32cXGPEUkGcJDGONGdQ2miZtdv2yQho2ERWWi9db0Eu/2iQ0W70mLPGhk2tB3ax0+
 MZV6TtV3Sl7r8pbbo4Q9FqiYi2NkDZydO1i3XBFIVcc7TNiiOJsLQbO1Zh2tM0CZU2Cn
 XQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nhccvc7jO1lfQcqH/y9qaOyEsCQIn9/GtRZwxj3VwPc=;
 b=NVpwA0sYI5b+B4WuSZpw7LH2NcFMUOjetmMkLRyVyOic8QH08qGAUOIYiD1zQg9X0D
 wBL9E2fm1TOvQCG5G3ufpqyPVXH3dGinnbRS5pzfbc0yxp1iqliG3dcl7sOq/t1Zu7jb
 bP9mYiCb1D9TwTU+hOaYIgp2FctvgoVA3attucjfJKIbgPRQoG26OFN281F3HHfEJsBn
 GUF+mmOmwxQjo65SFO3fLCLhLVzqBhmmcqGX+tnxWDdK4s7f0tspOrEEdqc8Wzew9jaF
 20v+x9Xc4OFYLBepSMNcNjapEdTdVH8WkdEG71Ad6nPVuTSLBrzWI4isiPBISrs4SnXx
 tRiQ==
X-Gm-Message-State: AOAM532pUkjdztzYg0dJrJRZQL40n+edCVsLIPsH4CT6aX9+YMbXh2Jj
 KTko25/HMt7VA/2oBI9LH6nhnnwyl8juqw==
X-Google-Smtp-Source: ABdhPJy1f4yWF/vHX3LD++WpvkaVofTpXWr9rDR7WVNVYdHUmfEQox8QbZumQLv947kQqRLS8WFcfw==
X-Received: by 2002:a17:90a:e603:: with SMTP id
 j3mr1145313pjy.166.1641343257944; 
 Tue, 04 Jan 2022 16:40:57 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k3sm35312356pgq.54.2022.01.04.16.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 16:40:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] common-user: Fix tail calls to safe_syscall_set_errno_tail
Date: Tue,  4 Jan 2022 16:40:54 -0800
Message-Id: <20220105004054.587588-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105004054.587588-1-richard.henderson@linaro.org>
References: <20220105004054.587588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the ABIs in which the syscall return register is not
also the first function argument register, move the errno
value into the correct place.

Fixes: a3310c0397e2 ("linux-user: Move syscall error detection into safe_syscall_base")
Reported-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220104190454.542225-1-richard.henderson@linaro.org>
---
 common-user/host/i386/safe-syscall.inc.S   | 1 +
 common-user/host/mips/safe-syscall.inc.S   | 1 +
 common-user/host/x86_64/safe-syscall.inc.S | 1 +
 3 files changed, 3 insertions(+)

diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index baf5400a29..9c45e56e48 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -120,6 +120,7 @@ safe_syscall_end:
         pop     %ebp
         .cfi_adjust_cfa_offset -4
         .cfi_restore ebp
+        mov     %eax, (%esp)
         jmp     safe_syscall_set_errno_tail
 
         .cfi_endproc
diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
index fc75a337d1..6a44614970 100644
--- a/common-user/host/mips/safe-syscall.inc.S
+++ b/common-user/host/mips/safe-syscall.inc.S
@@ -141,6 +141,7 @@ safe_syscall_end:
 1:      USE_ALT_CP(t0)
         SETUP_GPX(t1)
         SETUP_GPX64(t0, t1)
+        move    a0, v0
         PTR_LA  t9, safe_syscall_set_errno_tail
         jr      t9
 
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index a20927a783..d1a67a303a 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -99,6 +99,7 @@ safe_syscall_end:
 1:      pop     %rbp
         .cfi_def_cfa_offset 8
         .cfi_restore rbp
+        mov     %eax, %edi
         jmp     safe_syscall_set_errno_tail
         .cfi_endproc
 
-- 
2.25.1


