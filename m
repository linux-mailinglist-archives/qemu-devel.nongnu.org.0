Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EA67A0E3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNiV-0006c5-Q2; Tue, 24 Jan 2023 13:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhO-0005BL-Tf
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:13 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhI-00075b-Er
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:10 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so13413371wml.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VtC2HtpKin4UrNqNqeKJgg5NfJ+lmXNI0G+VdILgJfA=;
 b=MjO19im85MdlWJG4f5j296Q95BNFHQlTBBit/k7q2bcwfJxNwq7EmpRo5lgAXtXA9/
 5ZyphAD7f/acxB4qcTkdfTuyBehDpqv0HrTMqpDIDhlpZJwo8h+N4mvX3bgf09VQInzZ
 elFGHTdfDctDcnVK8HAhIyHCwt4cu23ITumP5tySqRzromLDwPozrfMwyJPoEBjfCSRg
 aS9l1nAENDdtVE8kXcXm/mlHXEy3R11Vuipgiv01m0JnlrK9BqrafFXpiXfy8vZNep3J
 2OGaOzA6nVldk1v9ptw5LFD0pj0M0B0yCcmnXJmp+IjUgFEV7S82ohj1amL+QIFhnNao
 9oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VtC2HtpKin4UrNqNqeKJgg5NfJ+lmXNI0G+VdILgJfA=;
 b=oxAQZ4Mp0cSJjH/gOys0bftuhLkL58iez2U6MtIRkJJxuKWPntvXtzU7AWBnihHE76
 f/NUhqTuIQAdBYt1t3A2uV/wOqyYjaYfJNhQq4Lr0nAaSJmfmyBcCSz+e4qtHC57bqv+
 qtB5qix0Sb5IZjmXXB5EY2Hx6gDRYqiINRVs40MpVaRcAqr500npK+wDIXP+unmpd7uN
 9S1DFF+CNZfyYEHcJg37eu6Yht1yd5IoI2bc7ba44oDFRnSGlPxhZD5vFZyJrbwUWuY0
 fwNzpOWMQBgoBrbKOU4Krg6k3S4k9cIJV8hjqQaipQWxDKwCwTdu9RL2jA7za1/Mmo93
 lU3w==
X-Gm-Message-State: AFqh2koF85KzRB4pZsMQbwowopDYHYAtl3vISXRq+S3EqTe3K5Q6Nyvv
 S3fXnvQDjviStiJFUqxWpptSnw==
X-Google-Smtp-Source: AMrXdXtI05INx5aGuWkrVXgfI+KkXA0jQCOKlQODMMN/+7UDRDmkbj4Prw0GuNhrSFXOoYlU5q4FRg==
X-Received: by 2002:a05:600c:4f96:b0:3db:2df0:f2b8 with SMTP id
 n22-20020a05600c4f9600b003db2df0f2b8mr18118781wmq.36.1674583622546; 
 Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c435200b003db06224953sm2888995wme.41.2023.01.24.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3ED521FFCA;
 Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 21/35] semihosting: add semihosting section to the docs
Date: Tue, 24 Jan 2023 18:01:13 +0000
Message-Id: <20230124180127.1881110-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

---
v2
  - moved inside the generic emulation section
  - make it clearer semihosting is specified by the architecture
  - more expansive description for O_BINARY
  - s/mips/MIPS/
---
 docs/about/emulation.rst | 89 ++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx          | 27 +++++-------
 2 files changed, 99 insertions(+), 17 deletions(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index bdc0630b35..dde892a226 100644
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


