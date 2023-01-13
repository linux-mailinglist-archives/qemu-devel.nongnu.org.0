Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE516698DC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHN-0007rh-U4; Fri, 13 Jan 2023 08:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHK-0007pa-FM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHI-000539-75
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id m3so15308489wmq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iH1g5BvDblNdu81W4rW5xEHawJ+gs3U9vzCLE7pUyII=;
 b=M61bcgJsCdi69o8BCb38mAr787MzdVz3EH30l4UmtN05bnkSiIxVuraCAoECjg5Azn
 gRHe7iGABN1SwUPnIqOfOnciQprWL0wzEagylDWxDHEvpzvLF/yASoIt02fR+nM39/Aq
 OEyuuyFEoPo/CXnknWL6qvjyH9NfcoQCjYogPLpElnJDhv6coTgs1wrKcfqZ0DGK55SR
 ZCtv3WsiBFLOpQ4mRrLmR26ZfziBJ11dQCd4pZ2JKCLr7JPnxQYi66O5xMYA3J2k7ne1
 hRI3yacC/Ol+TS/cMOiPrUfvSxiUT6Qw2qO9Mg7ZPqZnrMFpN+U4MMLf5km0ZRfuSijS
 ok3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iH1g5BvDblNdu81W4rW5xEHawJ+gs3U9vzCLE7pUyII=;
 b=KhyuOPfxlwmg4tJDJ2Zc4vrF5n9ojubFwPWezao/0LfAeCDH/RePtOj82ty27mMM2b
 dinGmpemu2f6AxLdxnf1nrkzVNP+7FFmUQtS8hJodLeZLpNyiPhpA0NSOiaHFhcwgQcu
 JQB8lJYxXQB1vEj14c4813hHmZH9OQUvZ4e7VzyYD2R0t2kdcsHMNNVJjqxFvj0pALJU
 4Q/e4DUswmqnvERwci1TFivUtJtHaFeUN0JEM8cE+uYweiIZMmcJLwAQoq2nAB8fuyy+
 2Mbp9RJjMXgHcYynzXWe388RhJK4e8BucpB2H3pozcEiuCwbX+Rts5wuM3794zOSMBXw
 beMA==
X-Gm-Message-State: AFqh2kpF1YdH89tPd7M/1Y1SM9wXSxmH5zQb0RHA8RZpMLf/EAmoyVfj
 VY2KYSmTh7yqNYLWFqh9+GWEIg==
X-Google-Smtp-Source: AMrXdXtfVRDz0Tv8Wh8D8E7pS7uGNHwDgaiR57/qn2ugOIHHQsiwO+h/tbcgTZ9pG9X4gRR+GzOttA==
X-Received: by 2002:a05:600c:358a:b0:3cf:8d51:1622 with SMTP id
 p10-20020a05600c358a00b003cf8d511622mr59469648wmq.1.1673617166853; 
 Fri, 13 Jan 2023 05:39:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm33546346wms.15.2023.01.13.05.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 05:39:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B78621FFBB;
 Fri, 13 Jan 2023 13:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, peter.maydell@linaro.org,
 Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PATCH 3/4] semihosting: add semihosting section to the docs
Date: Fri, 13 Jan 2023 13:39:22 +0000
Message-Id: <20230113133923.1642627-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113133923.1642627-1-alex.bennee@linaro.org>
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - moved inside the generic emulation section
---
 docs/about/emulation.rst | 80 ++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx          | 27 +++++---------
 2 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index d919175b5e..4d978e697b 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -101,3 +101,83 @@ depending on the guest architecture.
 
 A number of features are are only available when running under
 emulation including :ref:`Record/Replay<replay>` and :ref:`TCG Plugins`.
+
+.. _Semihosting:
+
+Semihosting
+-----------
+
+Semihosting is a feature provided by a number of guests that allow the
+program running on the target to interact with the host system. On
+real hardware this is usually provided by a debugger hooked directly
+to the system.
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
+Most targets offer a similar semihosting implementations with some
+minor changes to define the appropriate instruction to encode the
+semihosting call and which registers hold the parameters. They tend to
+presents a simple POSIX-like API which allows your program to read and
+write files, access the console and some other basic interactions.
+
+.. note::
+   QEMU makes an implementation decision to implement all file access
+   in ``O_BINARY`` mode regardless of the host operating system. This
+   is because gdb semihosting support doesn't make the distinction
+   between the modes and magically processing line endings can be confusing.
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
+  * - mips
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
index 3aa3a2f5a3..de3a368f58 100644
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


