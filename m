Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4EE690AE7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7Mp-000230-3J; Thu, 09 Feb 2023 08:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7Ml-00022m-Dh
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:53:35 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7Mj-0005gx-20
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:53:35 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95)
 for qemu-devel@nongnu.org with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7MN-001xP5-95; Thu, 09 Feb 2023 14:53:11 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 for qemu-devel@nongnu.org with esmtpsa (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pQ7MN-0021T2-1W; Thu, 09 Feb 2023 14:53:11 +0100
Message-ID: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
Subject: Linker failures trying to build static qemu-user binary
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: qemu-devel@nongnu.org
Date: Thu, 09 Feb 2023 14:53:10 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi!

I usually build a static qemu-user binary from the git source using the fol=
lowing
configure line:

export ARCH=3Dm68k && ./configure --target-list=3D$ARCH-linux-user --static=
 --disable-rdma \
                    --disable-pie --disable-system --disable-xen --disable-=
pvrdma \
                    --disable-libssh --disable-werror --disable-glusterfs

However, that stopped working some time ago with the linker error below.

Does anyone know how to fix this?

Adrian

PS: Please keep me CC'ed, I have disabled receiving any mails from the mail=
ing list.

[833/934] Compiling C object libqemu-m68k-linux-user.fa.p/linux-user_syscal=
l.c.o
[834/934] Linking target tests/unit/check-qstring
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/lib=
glib-2.0.a(gutils.c.o): in function `g_get_user_database_entry':
(.text+0x277): warning: Using 'getpwuid' in statically linked applications =
requires at runtime the shared libraries from the glibc version
used for linking
/usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically linked=
 applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically linke=
d applications requires at runtime the shared libraries from the
glibc version used for linking
[835/934] Compiling C object tests/fp/fp-test.p/fp-test.c.o
[836/934] Compiling C object tests/fp/fp-bench.p/fp-bench.c.o
[837/934] Compiling C object tests/fp/fp-test.p/berkeley-testfloat-3_source=
_slowfloat.c.o
[838/934] Compiling C object tests/unit/check-qnum.p/check-qnum.c.o
[839/934] Compiling C object tests/unit/check-qdict.p/check-qdict.c.o
[840/934] Linking target tests/unit/check-block-qdict
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/lib=
glib-2.0.a(gutils.c.o): in function `g_get_user_database_entry':
(.text+0x277): warning: Using 'getpwuid' in statically linked applications =
requires at runtime the shared libraries from the glibc version
used for linking
/usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically linked=
 applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically linke=
d applications requires at runtime the shared libraries from the
glibc version used for linking
[841/934] Linking static target tests/fp/libsoftfloat.a
[842/934] Linking target qemu-m68k
FAILED: qemu-m68k=20
c++ -m64 -mcx16  -o qemu-m68k libcommon.fa.p/hw_core_cpu-common.c.o libcomm=
on.fa.p/hw_core_machine-smp.c.o libcommon.fa.p/cpus-common.c.o
libcommon.fa.p/page-vary-common.c.o libcommon.fa.p/disas_m68k.c.o libcommon=
.fa.p/disas_capstone.c.o libcommon.fa.p/gdbstub_user.c.o
libcommon.fa.p/accel_accel-user.c.o libcommon.fa.p/common-user_safe-syscall=
.S.o libcommon.fa.p/common-user_safe-syscall-error.c.o libqemu-
m68k-linux-user.fa.p/linux-user_m68k_signal.c.o libqemu-m68k-linux-user.fa.=
p/linux-user_m68k_cpu_loop.c.o libqemu-m68k-linux-
user.fa.p/target_m68k_cpu.c.o libqemu-m68k-linux-user.fa.p/target_m68k_fpu_=
helper.c.o libqemu-m68k-linux-user.fa.p/target_m68k_gdbstub.c.o
libqemu-m68k-linux-user.fa.p/target_m68k_helper.c.o libqemu-m68k-linux-user=
.fa.p/target_m68k_op_helper.c.o libqemu-m68k-linux-
user.fa.p/target_m68k_softfloat.c.o libqemu-m68k-linux-user.fa.p/target_m68=
k_translate.c.o libqemu-m68k-linux-user.fa.p/trace_control-
target.c.o libqemu-m68k-linux-user.fa.p/gdbstub_gdbstub.c.o libqemu-m68k-li=
nux-user.fa.p/cpu.c.o libqemu-m68k-linux-user.fa.p/disas.c.o
libqemu-m68k-linux-user.fa.p/page-vary.c.o libqemu-m68k-linux-user.fa.p/tcg=
_optimize.c.o libqemu-m68k-linux-user.fa.p/tcg_region.c.o
libqemu-m68k-linux-user.fa.p/tcg_tcg.c.o libqemu-m68k-linux-user.fa.p/tcg_t=
cg-common.c.o libqemu-m68k-linux-user.fa.p/tcg_tcg-op.c.o
libqemu-m68k-linux-user.fa.p/tcg_tcg-op-gvec.c.o libqemu-m68k-linux-user.fa=
.p/tcg_tcg-op-vec.c.o libqemu-m68k-linux-
user.fa.p/fpu_softfloat.c.o libqemu-m68k-linux-user.fa.p/accel_accel-common=
.c.o libqemu-m68k-linux-user.fa.p/accel_accel-blocker.c.o
libqemu-m68k-linux-user.fa.p/accel_tcg_tcg-all.c.o libqemu-m68k-linux-user.=
fa.p/accel_tcg_cpu-exec-common.c.o libqemu-m68k-linux-
user.fa.p/accel_tcg_cpu-exec.c.o libqemu-m68k-linux-user.fa.p/accel_tcg_tb-=
maint.c.o libqemu-m68k-linux-user.fa.p/accel_tcg_tcg-runtime-
gvec.c.o libqemu-m68k-linux-user.fa.p/accel_tcg_tcg-runtime.c.o libqemu-m68=
k-linux-user.fa.p/accel_tcg_translate-all.c.o libqemu-m68k-linux-
user.fa.p/accel_tcg_translator.c.o libqemu-m68k-linux-user.fa.p/accel_tcg_u=
ser-exec.c.o libqemu-m68k-linux-user.fa.p/accel_tcg_user-exec-
stub.c.o libqemu-m68k-linux-user.fa.p/accel_tcg_debuginfo.c.o libqemu-m68k-=
linux-user.fa.p/accel_tcg_perf.c.o libqemu-m68k-linux-
user.fa.p/linux-user_elfload.c.o libqemu-m68k-linux-user.fa.p/linux-user_ex=
it.c.o libqemu-m68k-linux-user.fa.p/linux-user_fd-trans.c.o
libqemu-m68k-linux-user.fa.p/linux-user_linuxload.c.o libqemu-m68k-linux-us=
er.fa.p/linux-user_main.c.o libqemu-m68k-linux-user.fa.p/linux-
user_mmap.c.o libqemu-m68k-linux-user.fa.p/linux-user_signal.c.o libqemu-m6=
8k-linux-user.fa.p/linux-user_strace.c.o libqemu-m68k-linux-
user.fa.p/linux-user_syscall.c.o libqemu-m68k-linux-user.fa.p/linux-user_th=
unk.c.o libqemu-m68k-linux-user.fa.p/linux-user_uaccess.c.o
libqemu-m68k-linux-user.fa.p/linux-user_uname.c.o libqemu-m68k-linux-user.f=
a.p/linux-user_flatload.c.o libqemu-m68k-linux-user.fa.p/meson-
generated_.._m68k-linux-user-gdbstub-xml.c.o -Wl,--as-needed -Wl,--no-undef=
ined -Wl,--whole-archive libhwcore.fa libqom.fa -Wl,--start-group
libevent-loop-base.a -Wl,--no-whole-archive -fstack-protector-strong -stati=
c -Wl,-z,relro -Wl,-z,now -Wl,--warn-common libqemuutil.a
libhwcore.fa libqom.fa /usr/lib/x86_64-linux-gnu/libcapstone.a /usr/lib/x86=
_64-linux-gnu/libdw.a /usr/lib/x86_64-linux-gnu/libbz2.a
/usr/lib/x86_64-linux-gnu/liblzma.a -pthread -lpthread /usr/lib/x86_64-linu=
x-gnu/libelf.a /usr/lib/x86_64-linux-gnu/libz.a -lrt -lm -
lgthread-2.0 -lglib-2.0 -lpcre -lstdc++ -Wl,--end-group
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/lib=
glib-2.0.a(gutils.c.o): in function `g_get_user_database_entry':
(.text+0x277): warning: Using 'getpwuid' in statically linked applications =
requires at runtime the shared libraries from the glibc version
used for linking
/usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically linked=
 applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically linke=
d applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o): in fun=
ction `__libdwfl_debuginfod_init':
(.text.startup+0x17): undefined reference to `dlopen'
/usr/bin/ld: (.text.startup+0x32): undefined reference to `dlsym'
/usr/bin/ld: (.text.startup+0x4b): undefined reference to `dlsym'
/usr/bin/ld: (.text.startup+0x64): undefined reference to `dlsym'
/usr/bin/ld: (.text.startup+0x7d): undefined reference to `dlsym'
/usr/bin/ld: (.text.startup+0xdc): undefined reference to `dlclose'
collect2: error: ld returned 1 exit status
[843/934] Linking target tests/unit/check-qdict
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/lib=
glib-2.0.a(gutils.c.o): in function `g_get_user_database_entry':
(.text+0x277): warning: Using 'getpwuid' in statically linked applications =
requires at runtime the shared libraries from the glibc version
used for linking
/usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically linked=
 applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically linke=
d applications requires at runtime the shared libraries from the
glibc version used for linking
[844/934] Linking target tests/unit/check-qnum
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/lib=
glib-2.0.a(gutils.c.o): in function `g_get_user_database_entry':
(.text+0x277): warning: Using 'getpwuid' in statically linked applications =
requires at runtime the shared libraries from the glibc version
used for linking
/usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically linked=
 applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically linke=
d applications requires at runtime the shared libraries from the
glibc version used for linking
[845/934] Compiling C object tests/unit/check-qlist.p/check-qlist.c.o
[846/934] Compiling C object tests/fp/fp-test.p/.._.._fpu_softfloat.c.o
[847/934] Compiling C object tests/fp/fp-bench.p/.._.._fpu_softfloat.c.o
[848/934] Compiling C object tests/fp/fp-test-log2.p/.._.._fpu_softfloat.c.=
o
[849/934] Generating docs/QEMU manual with a custom command
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:165: run-ninja] Error 1
make[1]: Leaving directory '/root/qemu/build'
make: *** [GNUmakefile:11: all] Error 2q

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

