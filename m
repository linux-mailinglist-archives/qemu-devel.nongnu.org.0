Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0C175929
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:06:49 +0100 (CET)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8iuO-0001N0-JI
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j8itM-0000b6-0g
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j8itI-00054Y-Nb
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:05:43 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j8itI-00053H-AX
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:05:40 -0500
Received: by mail-wr1-x444.google.com with SMTP id y17so12028200wrn.6
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 03:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=BBC5uSYXgkQcTMcFeLDM05udMpu0qBtR5B2zW7WRJK0=;
 b=X13ZpIthbQM2yj5Wrxt6Nn6kMKYpLg7O+jA9URKxV6PONcA45bTvoaHSHtFuw0JnM9
 rExL9kr0cSQRYpKMUCmpS6/2Pkho/+dwDc6FxP6nkazPn8IX6rw4GzgxoyCN7cY3X6zX
 Z4E/W6sxJXdAuyGRjRtkVwZCN7Nl8muALMV35WE3tRiS9TjO1UrBcULW7Mb9U+Yh73t/
 camNALU/y54Kq+tpxu3vC9+6rf1e4plaac3x6732IOYwr6zXN4+VL+OTf1Wy5GnFpQic
 3tBOc4D3YPIKVH6H4p/DHqAropn9QfVBT7SRjwyFZo//hCc3dInUvLDqbU0DWZuR1vr4
 HsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=BBC5uSYXgkQcTMcFeLDM05udMpu0qBtR5B2zW7WRJK0=;
 b=S4aeZzoOpz9yiI8u8fOUYOlKZcuju6mZzbZaIyydahoEdpcZSvAAWmDyR6jreHu9e5
 KfXLeX73G1USNNdoFwHWAig+xHSajTagsdO1sQ6wPaXeuOayqFOM+sO8IViASOeaHvLV
 rGLXXXOnEzzcQrlDMGx5JVbKmNVnNQAUpkHg7qCGrQRJo0lK02H7Cf5dwp8GPYLGFdun
 LRPEwbhwQdXd3GeZ9xzLveURe1zGt4dDGFoSo8qh5HjT61ghbbyfNXb9kZ1gF8ARgUsW
 3Pe3Hpn0dj7IO5w+SUCwnRvIGKZZIupMTI/N9xHiO4e+LEYFvRzP0DOuEuqSLO/T/V2/
 wuuw==
X-Gm-Message-State: ANhLgQ0aeG9DJIC/K9CCa4opRYRv3lTjhTUuzCzkOioPTofWalCQGqky
 5Q/5t+6SbjUA3uQHkx463FOkDg==
X-Google-Smtp-Source: ADFU+vsaUWOzGQ+ddM/orO6Otj1myJy6KtUxvgSls1475Gs17ZTKicJCNDNSAaLcBXXJCAZ4RNxrkw==
X-Received: by 2002:adf:ea87:: with SMTP id s7mr13188160wrm.12.1583147138222; 
 Mon, 02 Mar 2020 03:05:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m22sm15384980wmc.41.2020.03.02.03.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 03:05:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09D0F1FF87;
 Mon,  2 Mar 2020 11:05:36 +0000 (GMT)
References: <20200228153619.9906-1-peter.maydell@linaro.org>
 <20200228153619.9906-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 01/33] qemu-doc: convert user-mode emulation to a
 separate Sphinx manual
In-reply-to: <20200228153619.9906-2-peter.maydell@linaro.org>
Date: Mon, 02 Mar 2020 11:05:35 +0000
Message-ID: <878skjc8zk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Paolo Bonzini <pbonzini@redhat.com>
>
> The final addition to the set of QEMU manuals is the user-mode emulation
> manual, which right now is included in qemu-doc.texi.  Extract it and
> convert it to rST, so that qemu-doc.texi covers only full system emulatio=
n.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-id: 20200226113034.6741-2-pbonzini@redhat.com
> [PMM: Fix makefile conflicts; add user manual to
>  index.rst and index.html.in; don't specify empty man_pages
>  list; fixed a few comments to say 'user' rather than 'system']
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  Makefile            |   8 +-
>  docs/index.html.in  |   1 +
>  docs/index.rst      |   1 +
>  docs/user/conf.py   |  15 ++
>  docs/user/index.rst |  16 +++
>  docs/user/main.rst  | 295 ++++++++++++++++++++++++++++++++++++++
>  qemu-doc.texi       | 337 --------------------------------------------
>  7 files changed, 335 insertions(+), 338 deletions(-)
>  create mode 100644 docs/user/conf.py
>  create mode 100644 docs/user/index.rst
>  create mode 100644 docs/user/main.rst
>
> diff --git a/Makefile b/Makefile
> index aa9cc0b5847..faa0ffa05b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -787,6 +787,7 @@ distclean: clean
>  	$(call clean-manual,specs)
>  	$(call clean-manual,system)
>  	$(call clean-manual,tools)
> +	$(call clean-manual,user)
>  	for d in $(TARGET_DIRS); do \
>  	rm -rf $$d || exit 1 ; \
>          done
> @@ -845,6 +846,7 @@ install-sphinxdocs: sphinxdocs
>  	$(call install-manual,specs)
>  	$(call install-manual,system)
>  	$(call install-manual,tools)
> +	$(call install-manual,user)
>=20=20
>  install-doc: $(DOCS) install-sphinxdocs
>  	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)"
> @@ -1039,7 +1041,8 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
>              $(MANUAL_BUILDDIR)/interop/index.html \
>              $(MANUAL_BUILDDIR)/specs/index.html \
>              $(MANUAL_BUILDDIR)/system/index.html \
> -            $(MANUAL_BUILDDIR)/tools/index.html
> +            $(MANUAL_BUILDDIR)/tools/index.html \
> +            $(MANUAL_BUILDDIR)/user/index.html
>=20=20
>  # Canned command to build a single manual
>  # Arguments: $1 =3D manual name, $2 =3D Sphinx builder ('html' or 'man')
> @@ -1074,6 +1077,9 @@ $(MANUAL_BUILDDIR)/system/index.html: $(call manual=
-deps,system)
>  $(MANUAL_BUILDDIR)/tools/index.html: $(call manual-deps,tools) $(SRC_PAT=
H)/qemu-img-cmds.hx $(SRC_PATH)/docs/qemu-option-trace.rst.inc
>  	$(call build-manual,tools,html)
>=20=20
> +$(MANUAL_BUILDDIR)/user/index.html: $(call manual-deps,user)
> +	$(call build-manual,user,html)
> +
>  $(call define-manpage-rule,interop,qemu-ga.8)
>=20=20
>  $(call define-manpage-rule,system,qemu-block-drivers.7)
> diff --git a/docs/index.html.in b/docs/index.html.in
> index cf61b1cf448..a576ace8a27 100644
> --- a/docs/index.html.in
> +++ b/docs/index.html.in
> @@ -14,6 +14,7 @@
>              <li><a href=3D"specs/index.html">System Emulation Guest Hard=
ware Specifications</a></li>
>              <li><a href=3D"system/index.html">System Emulation User's Gu=
ide</a></li>
>              <li><a href=3D"tools/index.html">Tools Guide</a></li>
> +            <li><a href=3D"user/index.html">User Mode Emulation User's G=
uide</a></li>
>          </ul>
>      </body>
>  </html>
> diff --git a/docs/index.rst b/docs/index.rst
> index acd604fa8a9..376dab28850 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -15,3 +15,4 @@ Welcome to QEMU's documentation!
>     specs/index
>     system/index
>     tools/index
> +   user/index
> diff --git a/docs/user/conf.py b/docs/user/conf.py
> new file mode 100644
> index 00000000000..4b09aedd454
> --- /dev/null
> +++ b/docs/user/conf.py
> @@ -0,0 +1,15 @@
> +# -*- coding: utf-8 -*-
> +#
> +# QEMU documentation build configuration file for the 'user' manual.
> +#
> +# This includes the top level conf file and then makes any necessary twe=
aks.
> +import sys
> +import os
> +
> +qemu_docdir =3D os.path.abspath("..")
> +parent_config =3D os.path.join(qemu_docdir, "conf.py")
> +exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
> +
> +# This slightly misuses the 'description', but is the best way to get
> +# the manual title to appear in the sidebar.
> +html_theme_options['description'] =3D u'User Mode Emulation User''s Guid=
e'
> diff --git a/docs/user/index.rst b/docs/user/index.rst
> new file mode 100644
> index 00000000000..e030dadf652
> --- /dev/null
> +++ b/docs/user/index.rst
> @@ -0,0 +1,16 @@
> +.. This is the top level page for the 'user' manual.
> +
> +
> +QEMU User Mode Emulation User's Guide
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This manual is the overall guide for users using QEMU
> +for user-mode emulation.  In this mode, QEMU can launch
> +processes compiled for one CPU on another CPU.
> +
> +Contents:
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   main
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> new file mode 100644
> index 00000000000..ca69f7727d5
> --- /dev/null
> +++ b/docs/user/main.rst
> @@ -0,0 +1,295 @@
> +QEMU User space emulator
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported Operating Systems
> +---------------------------
> +
> +The following OS are supported in user space emulation:
> +
> +-  Linux (referred as qemu-linux-user)
> +
> +-  BSD (referred as qemu-bsd-user)
> +
> +Features
> +--------
> +
> +QEMU user space emulation has the following notable features:
> +
> +**System call translation:**
> +   QEMU includes a generic system call translator. This means that the
> +   parameters of the system calls can be converted to fix endianness and
> +   32/64-bit mismatches between hosts and targets. IOCTLs can be
> +   converted too.
> +
> +**POSIX signal handling:**
> +   QEMU can redirect to the running program all signals coming from the
> +   host (such as ``SIGALRM``), as well as synthesize signals from
> +   virtual CPU exceptions (for example ``SIGFPE`` when the program
> +   executes a division by zero).
> +
> +   QEMU relies on the host kernel to emulate most signal system calls,
> +   for example to emulate the signal mask. On Linux, QEMU supports both
> +   normal and real-time signals.
> +
> +**Threading:**
> +   On Linux, QEMU can emulate the ``clone`` syscall and create a real
> +   host thread (with a separate virtual CPU) for each emulated thread.
> +   Note that not all targets currently emulate atomic operations
> +   correctly. x86 and ARM use a global lock in order to preserve their
> +   semantics.
> +
> +QEMU was conceived so that ultimately it can emulate itself. Although it
> +is not very useful, it is an important test to show the power of the
> +emulator.
> +
> +Linux User space emulator
> +-------------------------
> +
> +Quick Start
> +~~~~~~~~~~~
> +
> +In order to launch a Linux process, QEMU needs the process executable
> +itself and all the target (x86) dynamic libraries used by it.
> +
> +-  On x86, you can just try to launch any process by using the native
> +   libraries::
> +
> +      qemu-i386 -L / /bin/ls
> +
> +   ``-L /`` tells that the x86 dynamic linker must be searched with a
> +   ``/`` prefix.
> +
> +-  Since QEMU is also a linux process, you can launch QEMU with QEMU
> +   (NOTE: you can only do that if you compiled QEMU from the sources)::
> +
> +      qemu-i386 -L / qemu-i386 -L / /bin/ls
> +
> +-  On non x86 CPUs, you need first to download at least an x86 glibc
> +   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
> +   ``LD_LIBRARY_PATH`` is not set::
> +
> +      unset LD_LIBRARY_PATH
> +
> +   Then you can launch the precompiled ``ls`` x86 executable::
> +
> +      qemu-i386 tests/i386/ls
> +
> +   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
> +   automatically launched by the Linux kernel when you try to launch x86
> +   executables. It requires the ``binfmt_misc`` module in the Linux
> +   kernel.
> +
> +-  The x86 version of QEMU is also included. You can try weird things
> +   such as::
> +
> +      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
> +                /usr/local/qemu-i386/bin/ls-i386
> +
> +Wine launch
> +~~~~~~~~~~~
> +
> +-  Ensure that you have a working QEMU with the x86 glibc distribution
> +   (see previous section). In order to verify it, you must be able to
> +   do::
> +
> +      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
> +
> +-  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
> +   on the QEMU web page).
> +
> +-  Configure Wine on your account. Look at the provided script
> +   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
> +   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
> +
> +-  Then you can try the example ``putty.exe``::
> +
> +      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
> +                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
> +
> +Command line options
> +~~~~~~~~~~~~~~~~~~~~
> +
> +::
> +
> +   qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B of=
fset] [-R size] program [arguments...]
> +
> +``-h``
> +   Print the help
> +
> +``-L path``
> +   Set the x86 elf interpreter prefix (default=3D/usr/local/qemu-i386)
> +
> +``-s size``
> +   Set the x86 stack size in bytes (default=3D524288)
> +
> +``-cpu model``
> +   Select CPU model (-cpu help for list and additional feature
> +   selection)
> +
> +``-E var=3Dvalue``
> +   Set environment var to value.
> +
> +``-U var``
> +   Remove var from the environment.
> +
> +``-B offset``
> +   Offset guest address by the specified number of bytes. This is useful
> +   when the address region required by guest applications is reserved on
> +   the host. This option is currently only supported on some hosts.
> +
> +``-R size``
> +   Pre-allocate a guest virtual address space of the given size (in
> +   bytes). \"G\", \"M\", and \"k\" suffixes may be used when specifying
> +   the size.
> +
> +Debug options:
> +
> +``-d item1,...``
> +   Activate logging of the specified items (use '-d help' for a list of
> +   log items)
> +
> +``-p pagesize``
> +   Act as if the host page size was 'pagesize' bytes
> +
> +``-g port``
> +   Wait gdb connection to port
> +
> +``-singlestep``
> +   Run the emulation in single step mode.
> +
> +Environment variables:
> +
> +QEMU_STRACE
> +   Print system calls and arguments similar to the 'strace' program
> +   (NOTE: the actual 'strace' program will not work because the user
> +   space emulator hasn't implemented ptrace). At the moment this is
> +   incomplete. All system calls that don't have a specific argument
> +   format are printed with information for six arguments. Many
> +   flag-style arguments don't have decoders and will show up as numbers.
> +
> +Other binaries
> +~~~~~~~~~~~~~~
> +
> +user mode (Alpha)
> +``qemu-alpha`` TODO.
> +
> +user mode (ARM)
> +``qemu-armeb`` TODO.
> +
> +user mode (ARM)
> +``qemu-arm`` is also capable of running ARM \"Angel\" semihosted ELF
> +binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
> +configurations), and arm-uclinux bFLT format binaries.
> +
> +user mode (ColdFire)
> +user mode (M68K)
> +``qemu-m68k`` is capable of running semihosted binaries using the BDM
> +(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
> +coldfire uClinux bFLT format binaries.
> +
> +The binary format is detected automatically.
> +
> +user mode (Cris)
> +``qemu-cris`` TODO.
> +
> +user mode (i386)
> +``qemu-i386`` TODO. ``qemu-x86_64`` TODO.
> +
> +user mode (Microblaze)
> +``qemu-microblaze`` TODO.
> +
> +user mode (MIPS)
> +``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
> +
> +``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32
> +ABI).
> +
> +``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
> +
> +``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
> +ABI).
> +
> +``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32
> +ABI).
> +
> +``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
> +ABI).
> +
> +user mode (NiosII)
> +``qemu-nios2`` TODO.
> +
> +user mode (PowerPC)
> +``qemu-ppc64abi32`` TODO. ``qemu-ppc64`` TODO. ``qemu-ppc`` TODO.
> +
> +user mode (SH4)
> +``qemu-sh4eb`` TODO. ``qemu-sh4`` TODO.
> +
> +user mode (SPARC)
> +``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
> +
> +``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
> +(Sparc64 CPU, 32 bit ABI).
> +
> +``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
> +SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
> +
> +BSD User space emulator
> +-----------------------
> +
> +BSD Status
> +~~~~~~~~~~
> +
> +-  target Sparc64 on Sparc64: Some trivial programs work.
> +
> +Quick Start
> +~~~~~~~~~~~
> +
> +In order to launch a BSD process, QEMU needs the process executable
> +itself and all the target dynamic libraries used by it.
> +
> +-  On Sparc64, you can just try to launch any process by using the
> +   native libraries::
> +
> +      qemu-sparc64 /bin/ls
> +
> +Command line options
> +~~~~~~~~~~~~~~~~~~~~
> +
> +::
> +
> +   qemu-sparc64 [-h] [-d] [-L path] [-s size] [-bsd type] program [argum=
ents...]
> +
> +``-h``
> +   Print the help
> +
> +``-L path``
> +   Set the library root path (default=3D/)
> +
> +``-s size``
> +   Set the stack size in bytes (default=3D524288)
> +
> +``-ignore-environment``
> +   Start with an empty environment. Without this option, the initial
> +   environment is a copy of the caller's environment.
> +
> +``-E var=3Dvalue``
> +   Set environment var to value.
> +
> +``-U var``
> +   Remove var from the environment.
> +
> +``-bsd type``
> +   Set the type of the emulated BSD Operating system. Valid values are
> +   FreeBSD, NetBSD and OpenBSD (default).
> +
> +Debug options:
> +
> +``-d item1,...``
> +   Activate logging of the specified items (use '-d help' for a list of
> +   log items)
> +
> +``-p pagesize``
> +   Act as if the host page size was 'pagesize' bytes
> +
> +``-singlestep``
> +   Run the emulation in single step mode.
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 33b9597b1dc..6636816b85f 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -38,7 +38,6 @@
>  * Introduction::
>  * QEMU PC System emulator::
>  * QEMU System emulator for non PC targets::
> -* QEMU User space emulator::
>  * System requirements::
>  * Security::
>  * Implementation notes::
> @@ -2487,342 +2486,6 @@ so should only be used with trusted guest OS.
>=20=20
>  @c man end
>=20=20
> -@node QEMU User space emulator
> -@chapter QEMU User space emulator
> -
> -@menu
> -* Supported Operating Systems ::
> -* Features::
> -* Linux User space emulator::
> -* BSD User space emulator ::
> -@end menu
> -
> -@node Supported Operating Systems
> -@section Supported Operating Systems
> -
> -The following OS are supported in user space emulation:
> -
> -@itemize @minus
> -@item
> -Linux (referred as qemu-linux-user)
> -@item
> -BSD (referred as qemu-bsd-user)
> -@end itemize
> -
> -@node Features
> -@section Features
> -
> -QEMU user space emulation has the following notable features:
> -
> -@table @strong
> -@item System call translation:
> -QEMU includes a generic system call translator.  This means that
> -the parameters of the system calls can be converted to fix
> -endianness and 32/64-bit mismatches between hosts and targets.
> -IOCTLs can be converted too.
> -
> -@item POSIX signal handling:
> -QEMU can redirect to the running program all signals coming from
> -the host (such as @code{SIGALRM}), as well as synthesize signals from
> -virtual CPU exceptions (for example @code{SIGFPE} when the program
> -executes a division by zero).
> -
> -QEMU relies on the host kernel to emulate most signal system
> -calls, for example to emulate the signal mask.  On Linux, QEMU
> -supports both normal and real-time signals.
> -
> -@item Threading:
> -On Linux, QEMU can emulate the @code{clone} syscall and create a real
> -host thread (with a separate virtual CPU) for each emulated thread.
> -Note that not all targets currently emulate atomic operations correctly.
> -x86 and ARM use a global lock in order to preserve their semantics.
> -@end table
> -
> -QEMU was conceived so that ultimately it can emulate itself. Although
> -it is not very useful, it is an important test to show the power of the
> -emulator.
> -
> -@node Linux User space emulator
> -@section Linux User space emulator
> -
> -@menu
> -* Quick Start::
> -* Wine launch::
> -* Command line options::
> -* Other binaries::
> -@end menu
> -
> -@node Quick Start
> -@subsection Quick Start
> -
> -In order to launch a Linux process, QEMU needs the process executable
> -itself and all the target (x86) dynamic libraries used by it.
> -
> -@itemize
> -
> -@item On x86, you can just try to launch any process by using the native
> -libraries:
> -
> -@example
> -qemu-i386 -L / /bin/ls
> -@end example
> -
> -@code{-L /} tells that the x86 dynamic linker must be searched with a
> -@file{/} prefix.
> -
> -@item Since QEMU is also a linux process, you can launch QEMU with
> -QEMU (NOTE: you can only do that if you compiled QEMU from the sources):
> -
> -@example
> -qemu-i386 -L / qemu-i386 -L / /bin/ls
> -@end example
> -
> -@item On non x86 CPUs, you need first to download at least an x86 glibc
> -(@file{qemu-runtime-i386-XXX-.tar.gz} on the QEMU web page). Ensure that
> -@code{LD_LIBRARY_PATH} is not set:
> -
> -@example
> -unset LD_LIBRARY_PATH
> -@end example
> -
> -Then you can launch the precompiled @file{ls} x86 executable:
> -
> -@example
> -qemu-i386 tests/i386/ls
> -@end example
> -You can look at @file{scripts/qemu-binfmt-conf.sh} so that
> -QEMU is automatically launched by the Linux kernel when you try to
> -launch x86 executables. It requires the @code{binfmt_misc} module in the
> -Linux kernel.
> -
> -@item The x86 version of QEMU is also included. You can try weird things=
 such as:
> -@example
> -qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
> -          /usr/local/qemu-i386/bin/ls-i386
> -@end example
> -
> -@end itemize
> -
> -@node Wine launch
> -@subsection Wine launch
> -
> -@itemize
> -
> -@item Ensure that you have a working QEMU with the x86 glibc
> -distribution (see previous section). In order to verify it, you must be
> -able to do:
> -
> -@example
> -qemu-i386 /usr/local/qemu-i386/bin/ls-i386
> -@end example
> -
> -@item Download the binary x86 Wine install
> -(@file{qemu-XXX-i386-wine.tar.gz} on the QEMU web page).
> -
> -@item Configure Wine on your account. Look at the provided script
> -@file{/usr/local/qemu-i386/@/bin/wine-conf.sh}. Your previous
> -@code{$@{HOME@}/.wine} directory is saved to @code{$@{HOME@}/.wine.org}.
> -
> -@item Then you can try the example @file{putty.exe}:
> -
> -@example
> -qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
> -          /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
> -@end example
> -
> -@end itemize
> -
> -@node Command line options
> -@subsection Command line options
> -
> -@example
> -@command{qemu-i386} [@option{-h]} [@option{-d]} [@option{-L} @var{path}]=
 [@option{-s} @var{size}] [@option{-cpu} @var{model}] [@option{-g} @var{por=
t}] [@option{-B} @var{offset}] [@option{-R} @var{size}] @var{program} [@var=
{arguments}...]
> -@end example
> -
> -@table @option
> -@item -h
> -Print the help
> -@item -L path
> -Set the x86 elf interpreter prefix (default=3D/usr/local/qemu-i386)
> -@item -s size
> -Set the x86 stack size in bytes (default=3D524288)
> -@item -cpu model
> -Select CPU model (-cpu help for list and additional feature selection)
> -@item -E @var{var}=3D@var{value}
> -Set environment @var{var} to @var{value}.
> -@item -U @var{var}
> -Remove @var{var} from the environment.
> -@item -B offset
> -Offset guest address by the specified number of bytes.  This is useful w=
hen
> -the address region required by guest applications is reserved on the hos=
t.
> -This option is currently only supported on some hosts.
> -@item -R size
> -Pre-allocate a guest virtual address space of the given size (in bytes).
> -"G", "M", and "k" suffixes may be used when specifying the size.
> -@end table
> -
> -Debug options:
> -
> -@table @option
> -@item -d item1,...
> -Activate logging of the specified items (use '-d help' for a list of log=
 items)
> -@item -p pagesize
> -Act as if the host page size was 'pagesize' bytes
> -@item -g port
> -Wait gdb connection to port
> -@item -singlestep
> -Run the emulation in single step mode.
> -@end table
> -
> -Environment variables:
> -
> -@table @env
> -@item QEMU_STRACE
> -Print system calls and arguments similar to the 'strace' program
> -(NOTE: the actual 'strace' program will not work because the user
> -space emulator hasn't implemented ptrace).  At the moment this is
> -incomplete.  All system calls that don't have a specific argument
> -format are printed with information for six arguments.  Many
> -flag-style arguments don't have decoders and will show up as numbers.
> -@end table
> -
> -@node Other binaries
> -@subsection Other binaries
> -
> -@cindex user mode (Alpha)
> -@command{qemu-alpha} TODO.
> -
> -@cindex user mode (ARM)
> -@command{qemu-armeb} TODO.
> -
> -@cindex user mode (ARM)
> -@command{qemu-arm} is also capable of running ARM "Angel" semihosted ELF
> -binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
> -configurations), and arm-uclinux bFLT format binaries.
> -
> -@cindex user mode (ColdFire)
> -@cindex user mode (M68K)
> -@command{qemu-m68k} is capable of running semihosted binaries using the =
BDM
> -(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
> -coldfire uClinux bFLT format binaries.
> -
> -The binary format is detected automatically.
> -
> -@cindex user mode (Cris)
> -@command{qemu-cris} TODO.
> -
> -@cindex user mode (i386)
> -@command{qemu-i386} TODO.
> -@command{qemu-x86_64} TODO.
> -
> -@cindex user mode (Microblaze)
> -@command{qemu-microblaze} TODO.
> -
> -@cindex user mode (MIPS)
> -@command{qemu-mips} executes 32-bit big endian MIPS binaries (MIPS O32 A=
BI).
> -
> -@command{qemu-mipsel} executes 32-bit little endian MIPS binaries (MIPS =
O32 ABI).
> -
> -@command{qemu-mips64} executes 64-bit big endian MIPS binaries (MIPS N64=
 ABI).
> -
> -@command{qemu-mips64el} executes 64-bit little endian MIPS binaries (MIP=
S N64 ABI).
> -
> -@command{qemu-mipsn32} executes 32-bit big endian MIPS binaries (MIPS N3=
2 ABI).
> -
> -@command{qemu-mipsn32el} executes 32-bit little endian MIPS binaries (MI=
PS N32 ABI).
> -
> -@cindex user mode (NiosII)
> -@command{qemu-nios2} TODO.
> -
> -@cindex user mode (PowerPC)
> -@command{qemu-ppc64abi32} TODO.
> -@command{qemu-ppc64} TODO.
> -@command{qemu-ppc} TODO.
> -
> -@cindex user mode (SH4)
> -@command{qemu-sh4eb} TODO.
> -@command{qemu-sh4} TODO.
> -
> -@cindex user mode (SPARC)
> -@command{qemu-sparc} can execute Sparc32 binaries (Sparc32 CPU, 32 bit A=
BI).
> -
> -@command{qemu-sparc32plus} can execute Sparc32 and SPARC32PLUS binaries
> -(Sparc64 CPU, 32 bit ABI).
> -
> -@command{qemu-sparc64} can execute some Sparc64 (Sparc64 CPU, 64 bit ABI=
) and
> -SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
> -
> -@node BSD User space emulator
> -@section BSD User space emulator
> -
> -@menu
> -* BSD Status::
> -* BSD Quick Start::
> -* BSD Command line options::
> -@end menu
> -
> -@node BSD Status
> -@subsection BSD Status
> -
> -@itemize @minus
> -@item
> -target Sparc64 on Sparc64: Some trivial programs work.
> -@end itemize
> -
> -@node BSD Quick Start
> -@subsection Quick Start
> -
> -In order to launch a BSD process, QEMU needs the process executable
> -itself and all the target dynamic libraries used by it.
> -
> -@itemize
> -
> -@item On Sparc64, you can just try to launch any process by using the na=
tive
> -libraries:
> -
> -@example
> -qemu-sparc64 /bin/ls
> -@end example
> -
> -@end itemize
> -
> -@node BSD Command line options
> -@subsection Command line options
> -
> -@example
> -@command{qemu-sparc64} [@option{-h]} [@option{-d]} [@option{-L} @var{pat=
h}] [@option{-s} @var{size}] [@option{-bsd} @var{type}] @var{program} [@var=
{arguments}...]
> -@end example
> -
> -@table @option
> -@item -h
> -Print the help
> -@item -L path
> -Set the library root path (default=3D/)
> -@item -s size
> -Set the stack size in bytes (default=3D524288)
> -@item -ignore-environment
> -Start with an empty environment. Without this option,
> -the initial environment is a copy of the caller's environment.
> -@item -E @var{var}=3D@var{value}
> -Set environment @var{var} to @var{value}.
> -@item -U @var{var}
> -Remove @var{var} from the environment.
> -@item -bsd type
> -Set the type of the emulated BSD Operating system. Valid values are
> -FreeBSD, NetBSD and OpenBSD (default).
> -@end table
> -
> -Debug options:
> -
> -@table @option
> -@item -d item1,...
> -Activate logging of the specified items (use '-d help' for a list of log=
 items)
> -@item -p pagesize
> -Act as if the host page size was 'pagesize' bytes
> -@item -singlestep
> -Run the emulation in single step mode.
> -@end table
> -
>  @node System requirements
>  @chapter System requirements


--=20
Alex Benn=C3=A9e

