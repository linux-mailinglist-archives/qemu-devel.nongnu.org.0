Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1D343DF6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:33:01 +0100 (CET)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHro-0004tB-0Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHa1-0004wY-UV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHZy-0006GK-JS
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616408073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=madkqR1SUu9FpRlPihKR/kgkWcs21UiPtovKXinvy28=;
 b=OV4dCCtJPwFut9fSS4SI1CjQzOOwC0DByopNQTf/sHMKCl2j6olu+G5U7stTkV7SoxPVpk
 mOa9TOvIO28pP4rOasYS5VyJ6Ccs9bM12QkebpgKnRRkg832Lc7CaW90SDq8Jj/D3V+j2B
 a7kC1sLmukNcnzNMmf977+QsDQB2rI0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-5mgH6moENk-AO4MLqVNcUA-1; Mon, 22 Mar 2021 06:14:31 -0400
X-MC-Unique: 5mgH6moENk-AO4MLqVNcUA-1
Received: by mail-wm1-f69.google.com with SMTP id b20so9151106wmj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=madkqR1SUu9FpRlPihKR/kgkWcs21UiPtovKXinvy28=;
 b=TNu5f90LDHCvkUIiik7CDOWJxAoSIZXZ3NC86f0/fJUeRbgZM2mMkrNiI3K8877Jl3
 nLiwYmtFURrOL970y0mFWKUeaPhAHiMQJZAHFjTnT0Hieany1R8R6hFJo2mWQ741GZxy
 TA5U3ltfYAV4NloHIy5Oa+QT0OQbNHpoaTd2C5t9ehh8WZy37p9Ia8VEEXDmBvV2rTzc
 OaBtzVS7vzMFP5FvaWjPGLjG2qt2os7uj05S6m6cz8LqI/2refb3gf3L8jaN+gN7TJTT
 SAYnepKlhzHryUzmhCSn6AtL2eLWHfXdT2xQTMFfqG99+r7ST7Vz34085O8SHpJThkW4
 ux3Q==
X-Gm-Message-State: AOAM531QmSGFWsGY7yym0Tz0YrdsdoAv6KFR+I2AzRa3U3GTtmrBbkLL
 K3VrJ32LpiVVWcLH1KSKel9wu754vd+ws45wr7/NLfXYs3cnF3EffLAPkOGABvR1qSG+MGWAItP
 /UXv3LKMueU1m5CQ1+nceY+h2Nd3VXX54iJ9aFVnKsSdyOO+udlWuGQ9XJ/Uwvu9P
X-Received: by 2002:a5d:5250:: with SMTP id k16mr17587819wrc.309.1616408070126; 
 Mon, 22 Mar 2021 03:14:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK7TvPYQRyc2zvKwmKA5Y863+FrqmnkV4QPiq1OpNVCRl/JvEjPXvwsbcgiTEZNp4TXOTzkQ==
X-Received: by 2002:a5d:5250:: with SMTP id k16mr17587394wrc.309.1616408064913; 
 Mon, 22 Mar 2021 03:14:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm24732996wrd.9.2021.03.22.03.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:14:24 -0700 (PDT)
Subject: Re: check-unit: GLib-ERROR **: 20:40:27.-147: GLib requires working
 CLOCK_MONOTONIC
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <1428497d-5ee4-50c0-9f06-d490458338b4@redhat.com>
Message-ID: <042a65c0-6345-5a86-aac9-fac4d87ba789@redhat.com>
Date: Mon, 22 Mar 2021 11:14:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1428497d-5ee4-50c0-9f06-d490458338b4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Linaro folks

On 3/19/21 2:12 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I'm seeing an odd "GLib-FATAL-ERROR: GLib requires working
> CLOCK_MONOTONIC" error in the cross-i386-user job...
> 
> The runner console output is:
> 
> Running with gitlab-runner 13.9.0 (2ebc4dc4)
> Using Docker executor with image
> registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross:latest ...
> Authenticating with credentials from job payload (GitLab Registry)
> Pulling docker image
> registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross:latest ...
> Using docker image
> sha256:b835431485e9c7a1522d04a653f4ca068fcc53af73f997d6aab9b9bfaf4a252a
> for registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross:latest with
> digest
> registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross@sha256:9e5c3c5c352bb83d89858991855115542d47fa091f9895755471ea7d122b2555
> ...
> $ mkdir build
> $ cd build
> $ PKG_CONFIG_PATH=$PKG_CONFIG_PATH ../configure --enable-werror
> $QEMU_CONFIGURE_OPTS --disable-system
> No C++ compiler available; disabling C++ specific optional code
> The Meson build system
> Version: 0.55.3
> Source dir: /builds/philmd/qemu2
> Build dir: /builds/philmd/qemu2/build
> Build type: native build
> Using 'PKG_CONFIG_PATH' from environment with value: '/usr/lib/pkgconfig'
> Using 'PKG_CONFIG_PATH' from environment with value: '/usr/lib/pkgconfig'
> Project name: qemu
> Project version: 5.2.50
> C compiler for the host machine: cc (gcc 10.2.1 "cc (GCC) 10.2.1
> 20201125 (Red Hat 10.2.1-9)")
> C linker for the host machine: cc ld.bfd 2.35-18
> Host machine cpu family: x86_64
> Host machine cpu: x86_64
> ../meson.build:10: WARNING: Module unstable-keyval has no backwards or
> forwards compatibility and might not exist in future releases.
> Program sh found: YES
> Program python3 found: YES (/usr/bin/python3)
> Program bzip2 found: YES
> Program cgcc found: NO
> Library m found: YES
> Library util found: YES
> Run-time dependency appleframeworks found: NO (tried framework)
> Library aio found: NO
> Found pkg-config: /usr/bin/pkg-config (1.7.3)
> Using 'PKG_CONFIG_PATH' from environment with value: '/usr/lib/pkgconfig'
> Run-time dependency zlib found: YES 1.2.11
> Run-time dependency appleframeworks found: NO (tried framework)
> Library rt found: YES
> Run-time dependency libpng found: NO (tried pkgconfig)
> Run-time dependency libjpeg found: NO (tried pkgconfig)
> Has header "sasl/sasl.h" : NO
> Run-time dependency libkeyutils found: NO (tried pkgconfig)
> Checking for function "gettid" : YES
> Run-time dependency fuse3 found: NO (tried pkgconfig)
> Has header "linux/btrfs.h" : YES
> Has header "libdrm/drm.h" : NO
> Has header "pty.h" : YES
> Has header "sys/ioccom.h" : NO
> Has header "sys/kcov.h" : NO
> Checking for function "system" : YES
> Checking for function "preadv" : YES
> Program scripts/minikconf.py found: YES
> Configuring aarch64-linux-user-config-target.h using configuration
> Configuring aarch64_be-linux-user-config-target.h using configuration
> Configuring alpha-linux-user-config-target.h using configuration
> Configuring arm-linux-user-config-target.h using configuration
> Configuring armeb-linux-user-config-target.h using configuration
> Configuring cris-linux-user-config-target.h using configuration
> Configuring hexagon-linux-user-config-target.h using configuration
> Configuring hppa-linux-user-config-target.h using configuration
> Configuring i386-linux-user-config-target.h using configuration
> Configuring m68k-linux-user-config-target.h using configuration
> Configuring microblaze-linux-user-config-target.h using configuration
> Configuring microblazeel-linux-user-config-target.h using configuration
> Configuring mips-linux-user-config-target.h using configuration
> Configuring mips64-linux-user-config-target.h using configuration
> Configuring mips64el-linux-user-config-target.h using configuration
> Configuring mipsel-linux-user-config-target.h using configuration
> Configuring mipsn32-linux-user-config-target.h using configuration
> Configuring mipsn32el-linux-user-config-target.h using configuration
> Configuring nios2-linux-user-config-target.h using configuration
> Configuring or1k-linux-user-config-target.h using configuration
> Configuring ppc-linux-user-config-target.h using configuration
> Configuring ppc64-linux-user-config-target.h using configuration
> Configuring ppc64le-linux-user-config-target.h using configuration
> Configuring riscv32-linux-user-config-target.h using configuration
> Configuring riscv64-linux-user-config-target.h using configuration
> Configuring s390x-linux-user-config-target.h using configuration
> Configuring sh4-linux-user-config-target.h using configuration
> Configuring sh4eb-linux-user-config-target.h using configuration
> Configuring sparc-linux-user-config-target.h using configuration
> Configuring sparc32plus-linux-user-config-target.h using configuration
> Configuring sparc64-linux-user-config-target.h using configuration
> Configuring x86_64-linux-user-config-target.h using configuration
> Configuring xtensa-linux-user-config-target.h using configuration
> Configuring xtensaeb-linux-user-config-target.h using configuration
> Run-time dependency capstone found: NO (tried pkgconfig)
> Configuring capstone-defs.h using configuration
> Configuring config-host.h using configuration
> Program scripts/hxtool found: YES
> Program scripts/shaderinclude.pl found: YES
> Program scripts/qapi-gen.py found: YES
> Program scripts/qemu-version.sh found: YES
> Run-time dependency threads found: YES
> Program keycodemapdb/tools/keymap-gen found: YES
> Program scripts/decodetree.py found: YES
> Program nm found: YES
> Program scripts/undefsym.py found: YES
> Program scripts/feature_to_c.sh found: YES
> Program qemu-keymap found: NO
> Program sphinx-build-3 sphinx-build found: NO
> Program python3 found: YES (/usr/bin/python3)
> Program diff found: YES
> Program dbus-daemon found: NO
> Program initrd-stress.sh found: YES
> Build targets in project: 246
> qemu 5.2.50
>   Directories
>                    Install prefix: /usr/local
>                    BIOS directory: share/qemu
>                     firmware path: /usr/local/share/qemu-firmware
>                  binary directory: bin
>                 library directory: lib
>                  module directory: lib/qemu
>                 libexec directory: libexec
>                 include directory: include
>                  config directory: /usr/local/etc
>             local state directory: /usr/local/var
>                  Manual directory: share/man
>                     Doc directory: /usr/local/share/doc
>                   Build directory: /builds/philmd/qemu2/build
>                       Source path: /builds/philmd/qemu2
>                    GIT submodules: ui/keycodemapdb
> tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone
> slirp
>   Host binaries
>                               git: git
>                              make: make
>                            python: /usr/bin/python3 (version: 3.9)
>                      sphinx-build: NO
>                       genisoimage:
>   Configurable features
>                     Documentation: NO
>             system-mode emulation: NO
>               user-mode emulation: YES
>                       block layer: NO
>                     Install blobs: YES
>                    module support: NO
>                    plugin support: NO
>                   fuzzing support: NO
>                    Trace backends: log
>                     QOM debugging: YES
>              vhost-kernel support: YES
>                 vhost-net support: YES
>              vhost-crypto support: NO
>                vhost-scsi support: YES
>               vhost-vsock support: YES
>                vhost-user support: NO
>     vhost-user-blk server support: NO
>             vhost-user-fs support: NO
>                vhost-vdpa support: YES
>                 build guest agent: NO
>   Compilation
>                          host CPU: x86_64
>                   host endianness: little
>                        C compiler: cc
>                   Host C compiler: cc
>                      C++ compiler: NO
>                           ARFLAGS: rv
>                            CFLAGS: -O2 -g
>                       QEMU_CFLAGS: -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
> -m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
> -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv  -m32
> -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
>                      QEMU_LDFLAGS: -Wl,--warn-common -Wl,-z,relro
> -Wl,-z,now -m32  -m32 -fstack-protector-strong
>                          profiler: NO
>      link-time optimization (LTO): NO
>                               PIE: YES
>                      static build: NO
>               malloc trim support: YES
>                        membarrier: NO
>                    preadv support: YES
>                         fdatasync: YES
>                           madvise: YES
>                     posix_madvise: YES
>                    posix_memalign: YES
>                 debug stack usage: NO
>                   mutex debugging: NO
>                  memory allocator: system
>                 avx2 optimization: YES
>              avx512f optimization: NO
>                     gprof enabled: NO
>                              gcov: NO
>                  thread sanitizer: NO
>                       CFI support: NO
>                    strip binaries: YES
>                            sparse: NO
>                   mingw32 support: NO
>                        i386 tests: cc
>                      x86_64 tests: cc
>   Targets and accelerators
>                       TCG support: YES
>                       TCG backend: native (x86_64)
>                 TCG debug enabled: NO
>                       target list: aarch64-linux-user
> aarch64_be-linux-user alpha-linux-user arm-linux-user armeb-linux-user
> cris-linux-user hexagon-linux-user hppa-linux-user i386-linux-user
> m68k-linux-user microblaze-linux-user microblazeel-linux-user
> mips-linux-user mips64-linux-user mips64el-linux-user mipsel-linux-user
> mipsn32-linux-user mipsn32el-linux-user nios2-linux-user or1k-linux-user
> ppc-linux-user ppc64-linux-user ppc64le-linux-user riscv32-linux-user
> riscv64-linux-user s390x-linux-user sh4-linux-user sh4eb-linux-user
> sparc-linux-user sparc32plus-linux-user sparc64-linux-user
> x86_64-linux-user xtensa-linux-user xtensaeb-linux-user
>   Block layer support
>                 coroutine backend: ucontext
>                    coroutine pool: YES
>   Crypto
>                      TLS priority: "NORMAL"
>                    GNUTLS support: YES
>                         libgcrypt: NO
>                            nettle: YES
>                               XTS: YES
>                      crypto afalg: NO
>                          rng-none: NO
>                     Linux keyring: YES
>   Dependencies
>                       SDL support: NO
>                 SDL image support: NO
>                       GTK support: NO
>                            pixman: NO
>                       VTE support: NO
>                     slirp support: NO
>                          libtasn1: YES
>                               PAM: NO
>                     iconv support: NO
>                    curses support: NO
>                     virgl support: NO
>                      curl support: NO
>                 Multipath support: NO
>                       VNC support: YES
>                  VNC SASL support: NO
>                  VNC JPEG support: NO
>                   VNC PNG support: NO
>                    brlapi support: NO
>                       vde support: NO
>                    netmap support: NO
>                 Linux AIO support: NO
>            Linux io_uring support: NO
>                ATTR/XATTR support: YES
>                      RDMA support: NO
>                    PVRDMA support: NO
>                       fdt support: auto
>                 libcap-ng support: NO
>                     spice support: NO
>                       rbd support: NO
>                    xfsctl support: NO
>                 smartcard support: NO
>                       U2F support: NO
>                            libusb: NO
>                     usb net redir: NO
>                    OpenGL support: NO
>                               GBM: NO
>                  libiscsi support: NO
>                    libnfs support: NO
>                   seccomp support: NO
>                 GlusterFS support: NO
>                       TPM support: YES
>                    libssh support: NO
>                       lzo support: NO
>                    snappy support: NO
>                     bzip2 support: NO
>                     lzfse support: NO
>                      zstd support: NO
>                 NUMA host support: NO
>                           libxml2: NO
>                          capstone: internal
>                   libpmem support: NO
>                 libdaxctl support: NO
>                           libudev: NO
>                        FUSE lseek: NO
> Found ninja-1.10.2 at /usr/bin/ninja
> $ make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> /usr/bin/ninja  build.ninja && touch build.ninja.stamp
> ninja: no work to do.
> /usr/bin/meson introspect --targets --tests --benchmarks |
> /usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> [1/2962] Compiling C object libcapstone.a.p/capstone_MCInstrDesc.c.o
> [2/2962] Compiling C object libcapstone.a.p/capstone_MCRegisterInfo.c.o
> [3/2962] Compiling C object libcapstone.a.p/capstone_MCInst.c.o
> [4/2962] Compiling C object libcapstone.a.p/capstone_SStream.c.o
> [5/2962] Compiling C object libcapstone.a.p/capstone_utils.c.o
> ...
> [2959/2962] Compiling C object
> tests/unit/ptimer-test.p/_builds_philmd_qemu2_hw_core_ptimer.c.o
> [2960/2962] Linking target tests/fp/fp-bench
> [2961/2962] Linking target tests/unit/ptimer-test
> [2962/2962] Linking target tests/fp/fp-test
> make: Nothing to be done for 'check-build'.
> Running test check-block-qdict
> (tests/unit/check-block-qdict:12531): GLib-ERROR **: 08:30:50.-401: GLib
> requires working CLOCK_MONOTONIC

Could that error come from a missing runner capability?
Or something odd on the host kernel?

If so, should we add a check in ./configure to warn about this
problem when building? (We can build but we can not run QEMU).


