Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46A67C9F8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UF-000589-8D; Thu, 26 Jan 2023 06:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U8-0004dt-Hc
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U6-0007oN-0J
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:03 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso905085wmq.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNzmMM0/3BQDahEZFPzAsDhN6zKpXbSxcLNK930hAI4=;
 b=prSANjbgBfQCY52O/+e13tQUPttSm96susxd9wAfyNTzQ8As5ZaaKPWMQY1ovHB1i+
 U50R7MG4R5+p5MAXWSm4x2yAQqidq+l/T0rdut52Y9g1WTluKPCFrVqQTykQrXLklXbB
 yssdPak2r3yQmbYIKGP/NTnidMpPrd+9mbpAt6ju1uZWeYFxpdrQioe0oc/fTRStW3Mn
 eMq2nfpg4uqS5eV1DVi4O6EhbPgTy+OXlzIkbLIX6WMfsxEF+A6igEPfR7pRXEFe0LC9
 TNGHlBC71g23eyIfNfPiHGZqva8dyxBmX78yQ7yiSS4nE2g1vvBrTPnJIxSQ6eeq5YlR
 eFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNzmMM0/3BQDahEZFPzAsDhN6zKpXbSxcLNK930hAI4=;
 b=tgq2OTKLkPWtlzZv7cjqLJnoZTs5elimd4yO4JjWm5V4ZbD7K2AM99oXycHORtxiCk
 Suow/E9LmL7Rvusc5ueYgQTpPAtbfgUsoeKJfc1sziHXcvSQmwn7dLd+Wr0MfHRKRJBH
 DMBRMjVQhJC6fOXF98oBuSshJGgHisNrF4453p30Vm/hKeI9moh2jht1czjRpA+n8KF/
 H33gPn/RArFkCg1cor3q3oEygV/zp8dxfxaEAvrz2yUIlYI5ocDvN5xlIcWpqnYUuFYb
 IUEehMhRn0jMIkwsC5ypWcBoo0YHA2gx/FQ4GSpM9CsNr3Fja50dv07+qvkZ7IR0QG5N
 1C3w==
X-Gm-Message-State: AO0yUKVqqqTomXgG6oCjq1Ludyx8K+pRUDx5UNf+P6R+YyO73w+i83A7
 p1FwCJLdqyK3jtTa1l9kOEXilA==
X-Google-Smtp-Source: AK7set+K4ow++v9TEv3NzI7DG503Z1/gEby5nW1U+m0OiBMItwaE12XshI/1bNgW4yOPOy7zLmQJJg==
X-Received: by 2002:a05:600c:310c:b0:3dc:18de:b20d with SMTP id
 g12-20020a05600c310c00b003dc18deb20dmr7311976wmo.33.1674732719895; 
 Thu, 26 Jan 2023 03:31:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c415100b003da2932bde0sm1483128wmm.23.2023.01.26.03.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 090091FFC5;
 Thu, 26 Jan 2023 11:22:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/35] semihosting: add semihosting section to the docs
Date: Thu, 26 Jan 2023 11:22:36 +0000
Message-Id: <20230126112250.2584701-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

The main reason to do this is to document our O_BINARY implementation
decision somewhere. However I've also moved some of the implementation
details out of qemu-options and added links between the two. As a
bonus I've highlighted the scary warnings about host access with the
appropriate RST tags.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-22-alex.bennee@linaro.org>

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index 7ec7e09381..635b085732 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -101,3 +101,92 @@ depending on the guest architecture.
 
 A number of features are are only available when running under
 emulation including :ref:`Record/Replay<replay>` and :ref:`TCG Plugins`.
+
+.. _Semihosting:
+
+Semihosting
+-----------
+
+Semihosting is a feature defined by the owner of the architecture to
+allow programs to interact with a debugging host system. On real
+hardware this is usually provided by an In-circuit emulator (ICE)
+hooked directly to the board. QEMU's implementation allows for
+semihosting calls to be passed to the host system or via the
+``gdbstub``.
+
+Generally semihosting makes it easier to bring up low level code before a
+more fully functional operating system has been enabled. On QEMU it
+also allows for embedded micro-controller code which typically doesn't
+have a full libc to be run as "bare-metal" code under QEMU's user-mode
+emulation. It is also useful for writing test cases and indeed a
+number of compiler suites as well as QEMU itself use semihosting calls
+to exit test code while reporting the success state.
+
+Semihosting is only available using TCG emulation. This is because the
+instructions to trigger a semihosting call are typically reserved
+causing most hypervisors to trap and fault on them.
+
+.. warning::
+   Semihosting inherently bypasses any isolation there may be between
+   the guest and the host. As a result a program using semihosting can
+   happily trash your host system. You should only ever run trusted
+   code with semihosting enabled.
+
+Redirection
+~~~~~~~~~~~
+
+Semihosting calls can be re-directed to a (potentially remote) gdb
+during debugging via the :ref:`gdbstub<GDB usage>`. Output to the
+semihosting console is configured as a ``chardev`` so can be
+redirected to a file, pipe or socket like any other ``chardev``
+device.
+
+See :ref:`Semihosting Options<Semihosting Options>` for details.
+
+Supported Targets
+~~~~~~~~~~~~~~~~~
+
+Most targets offer similar semihosting implementations with some
+minor changes to define the appropriate instruction to encode the
+semihosting call and which registers hold the parameters. They tend to
+presents a simple POSIX-like API which allows your program to read and
+write files, access the console and some other basic interactions.
+
+For full details of the ABI for a particular target, and the set of
+calls it provides, you should consult the semihosting specification
+for that architecture.
+
+.. note::
+   QEMU makes an implementation decision to implement all file
+   access in ``O_BINARY`` mode. The user-visible effect of this is
+   regardless of the text/binary mode the program sets QEMU will
+   always select a binary mode ensuring no line-terminator conversion
+   is performed on input or output. This is because gdb semihosting
+   support doesn't make the distinction between the modes and
+   magically processing line endings can be confusing.
+
+.. list-table:: Guest Architectures supporting Semihosting
+  :widths: 10 10 80
+  :header-rows: 1
+
+  * - Architecture
+    - Modes
+    - Specification
+  * - Arm
+    - System and User-mode
+    - https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst
+  * - m68k
+    - System
+    - https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=libgloss/m68k/m68k-semi.txt;hb=HEAD
+  * - MIPS
+    - System
+    - Unified Hosting Interface (MD01069)
+  * - Nios II
+    - System
+    - https://sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=blob;f=libgloss/nios2/nios2-semi.txt;hb=HEAD
+  * - RISC-V
+    - System and User-mode
+    - https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
+  * - Xtensa
+    - System
+    - Tensilica ISS SIMCALL
diff --git a/qemu-options.hx b/qemu-options.hx
index d59d19704b..4508a00c59 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4633,10 +4633,13 @@ DEF("semihosting", 0, QEMU_OPTION_semihosting,
     QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
+    Enable :ref:`Semihosting` mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
 
-    Note that this allows guest direct access to the host filesystem, so
-    should only be used with a trusted guest OS.
+    .. warning::
+      Note that this allows guest direct access to the host filesystem, so
+      should only be used with a trusted guest OS.
+
+    .. _Semihosting Options:
 
     See the -semihosting-config option documentation for further
     information about the facilities this enables.
@@ -4648,22 +4651,12 @@ QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
 QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,userspace=on|off][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
+    Enable and configure :ref:`Semihosting` (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
     only).
 
-    Note that this allows guest direct access to the host filesystem, so
-    should only be used with a trusted guest OS.
-
-    On Arm this implements the standard semihosting API, version 2.0.
-
-    On M68K this implements the "ColdFire GDB" interface used by
-    libgloss.
-
-    Xtensa semihosting provides basic file IO calls, such as
-    open/read/write/seek/select. Tensilica baremetal libc for ISS and
-    linux platform "sim" use this interface.
-
-    On RISC-V this implements the standard semihosting API, version 0.2.
+    .. warning::
+      Note that this allows guest direct access to the host filesystem, so
+      should only be used with a trusted guest OS.
 
     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
-- 
2.34.1


