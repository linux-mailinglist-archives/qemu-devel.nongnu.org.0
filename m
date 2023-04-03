Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBE6D4A92
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSS-0003sg-Ox; Mon, 03 Apr 2023 10:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSN-0003rI-O6
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSJ-0001AO-P8
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id s13so17256048wmr.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOMQqYczbQzJT4cpOfgtd59pSmpxm7+Vtg1FH5cDagc=;
 b=N/GkXXgLNwP1pVBVS4lLVbtrzB3qKXJ0Ql8zn67MdylWVnGz2Up8fKOPaydMeWux2U
 Tr9xWJqm3sR4bQzqIMSwWWBg5elzwh6RTNgZ8GJXFjQN2zrfAK9QY9lX1624GYVwonEt
 awHsBD014OZuYKebcjT8x0YvRqGOH59FqGOq4SyoP3oj8dEMVx2y8qPSG83qzR99tcEw
 Q9j42B3NHYpvnk7yzMHw/6MevBNjsg4NESSjZBniSHBMP7Ctx5dwXoyQvukf9Xskm/AT
 Y3z+2byUfAnRq8U6SrWlAqDfiDRteu5c2HIfGaJfnFLN0UJC9CYq9dHth980c8erYD7j
 fyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOMQqYczbQzJT4cpOfgtd59pSmpxm7+Vtg1FH5cDagc=;
 b=M8fOAYhAD0rGOdELVpP1JmHR+ZzhhWNpVfPUxeYSITskURt3qqDHwkPUjHq3YQvE3n
 dy6vLbI6A5APQCtcZNmO/ZXvs6SkTH9HKpihHLFD5EjAzSsu8FYqtk/YPZxk23gqbOzj
 GFflFqu6WtX9oiXCKUC3yy/r752/VmDDWmJf0RQBkwlGddAM1sTQIQe/sC90ygO6mW9o
 iEFfxZZIgmZDtKNZMH+iikCuRgvcDXItO6LUyY+3vnYC0rlWDDNy4xPJ2dIdcEDUH3WP
 E8pd8LWpOY97FRDGTvkm7+ob0FHjIhYJdHTLicGD91mUzORC/S1tJa4f8IYgNHgb9hAj
 /JJA==
X-Gm-Message-State: AO0yUKVJ95VJ5K9U/bHGRaBNb/ZEX2ec4Mebi1L1KkjenQC9UNLC7E+c
 +8q6aamLKbypk8oC0crx48MNNhqTRyp6Ht+YSo4=
X-Google-Smtp-Source: AK7set8NcGIJAUD5f36RHhgV7Ky9UxQeFrXMEE5BLtDHABZNNw+mNXeZQbTiZWacVrj4KtJvhLpS5A==
X-Received: by 2002:a7b:ce16:0:b0:3ed:9b20:c7c1 with SMTP id
 m22-20020a7bce16000000b003ed9b20c7c1mr24843697wmc.20.1680533202768; 
 Mon, 03 Apr 2023 07:46:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 06/10] Document that -singlestep command line option is
 deprecated
Date: Mon,  3 Apr 2023 15:46:33 +0100
Message-Id: <20230403144637.2949366-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Document that the -singlestep command line option is now
deprecated, as it is replaced by either the TCG accelerator
property 'one-insn-per-tb' for system emulation or the new
'-one-insn-per-tb' option for usermode emulation, and remove
the only use of the deprecated syntax from a README.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst | 16 ++++++++++++++++
 qemu-options.hx           |  5 +++--
 tcg/tci/README            |  2 +-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d61..3c62671dac1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -111,6 +111,22 @@ Use ``-machine acpi=off`` instead.
 The HAXM project has been retired (see https://github.com/intel/haxm#status).
 Use "whpx" (on Windows) or "hvf" (on macOS) instead.
 
+``-singlestep`` (since 8.1)
+'''''''''''''''''''''''''''
+
+The ``-singlestep`` option has been turned into an accelerator property,
+and given a name that better reflects what it actually does.
+Use ``-accel tcg,one-insn-per-tb=on`` instead.
+
+User-mode emulator command line arguments
+-----------------------------------------
+
+``-singlestep`` (since 8.1)
+'''''''''''''''''''''''''''
+
+The ``-singlestep`` option has been given a name that better reflects
+what it actually does. For both linux-user and bsd-user, use the
+new ``-one-insn-per-tb`` option instead.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 1dffd36884e..6a59e997497 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4159,10 +4159,11 @@ SRST
 ERST
 
 DEF("singlestep", 0, QEMU_OPTION_singlestep, \
-    "-singlestep     always run in singlestep mode\n", QEMU_ARCH_ALL)
+    "-singlestep     deprecated synonym for -accel tcg,one-insn-per-tb=on\n", QEMU_ARCH_ALL)
 SRST
 ``-singlestep``
-    Run the emulation in single step mode.
+    This is a deprecated synonym for the TCG accelerator property
+    ``one-insn-per-tb``.
 ERST
 
 DEF("preconfig", 0, QEMU_OPTION_preconfig, \
diff --git a/tcg/tci/README b/tcg/tci/README
index f72a40a395a..4a8b5b54018 100644
--- a/tcg/tci/README
+++ b/tcg/tci/README
@@ -49,7 +49,7 @@ The only difference from running QEMU with TCI to running without TCI
 should be speed. Especially during development of TCI, it was very
 useful to compare runs with and without TCI. Create /tmp/qemu.log by
 
-        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -singlestep
+        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -accel tcg,one-insn-per-tb=on
 
 once with interpreter and once without interpreter and compare the resulting
 qemu.log files. This is also useful to see the effects of additional
-- 
2.34.1


