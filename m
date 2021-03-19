Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2E341EB5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:48:49 +0100 (CET)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFUe-0002TP-Jp
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFDu-00079w-89
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFDq-0006gT-Ix
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616160685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GJ8OV8jlKMHR8D6XOd//6ohJxf5DzE4gwWmucr87128=;
 b=Xl5hSMMRfhqCjqC3RvsiJ50Pv0SYY+44cHaAuQq77S5fjwse9P8kmIBXYz3xq6v/UCuAh4
 6Q/3gRAFy80vDvip09gDQSgQ7JKENLu8UdohyC1jsvnjueHY9Mu8rRYYIIlrpCpGnLyTt/
 3niv2VDyc3Bx1RXOcSYUcYGTCy3/M5Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-Ye_Dvr0OMwG07rlP7Ge-Iw-1; Fri, 19 Mar 2021 09:31:24 -0400
X-MC-Unique: Ye_Dvr0OMwG07rlP7Ge-Iw-1
Received: by mail-wm1-f71.google.com with SMTP id w10so8292962wmk.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=GJ8OV8jlKMHR8D6XOd//6ohJxf5DzE4gwWmucr87128=;
 b=UYPOIwME30Nx5yzJ9KsN3T5CR4nw++yNhKEqNi+MsW+kP2jj1MdfzCoJ1xTzkOPWd/
 S7VCQmG86TWAusBEj0DagYiy9YD0LVHb1iDbNGmE2Ox2DEqHNP4I03purOH3YVTbDHYb
 ZQOMF+z9Z0y+QEfjbOottHLIAkJh6cg/2PgnC8yENna0Xn5CWChI7mZUh1K5xlDuQBrQ
 cykp6NuNCzVyptWwAlPJpSdF4jbgBt/x+xCeKykOnjDANuQXH/ldYNKJwma7/JRSBvNh
 j3Z0fpt3UGDHoCoIvYzzDqgGwAAlQIVgIBHTJM9AY8Xxxu4cns3BCO70JJxn7k+X8ziT
 9f9Q==
X-Gm-Message-State: AOAM533hO2+dzOZdXafCmsIMJfIsiD3JtzMBiH0Au1ISySEXbSAH1Otz
 PqZUlABqKLeNgDeNyTpaastN36kClp5e4AK4FiZ8IkKgOAoZSD4Z/fQRaYRFgnX2L378QUJZgxK
 SJbO9tSjh6QiYEKg=
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3873250wmg.171.1616160682925; 
 Fri, 19 Mar 2021 06:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyYi1bTGuu9CPkyB+qV7pOnwHYcPRcumsW00KzIDYzohTS7wM98QLSqUp2Gz4GHxjjLVtkiQ==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3873218wmg.171.1616160682636; 
 Fri, 19 Mar 2021 06:31:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r11sm8056476wrm.26.2021.03.19.06.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:31:22 -0700 (PDT)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: make: /usr/bin/env: Operation not permitted on Alpine container
Message-ID: <08d872e9-841b-5880-1a38-e6088cce69db@redhat.com>
Date: Fri, 19 Mar 2021 14:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yet another odd error, this time on the build-system-alpine job:

$ make -j"$JOBS"
make: /usr/bin/env: Operation not permitted
make: *** [Makefile:51: git-submodule-update] Error 127

Runner console output:

Running with gitlab-runner 13.9.0 (2ebc4dc4)
Pulling docker image registry.gitlab.com/philmd/qemu2/qemu/alpine:latest ...
Using docker image
sha256:d0f33e2a360a469a221882d0044f587494d103674ea6ab68599b0e4976d17aa7
for registry.gitlab.com/philmd/qemu2/qemu/alpine:latest with digest
registry.gitlab.com/philmd/qemu2/qemu/alpine@sha256:e6a4f0faf241c25b5e1fd1bda7965777a44cead851e4cb7af028327bcff6e6dc
...
$ JOBS=$(expr $(nproc) + 1)
$ mkdir build
$ cd build
$ if test -n "$TARGETS"; then ../configure --enable-werror
$CONFIGURE_ARGS --target-list="$TARGETS" ; else ../configure
--enable-werror $CONFIGURE_ARGS ; fi || { cat config.log
meson-logs/meson-log.txt && exit 1; }
The Meson build system
Version: 0.57.1
Source dir: /builds/philmd/qemu2
Build dir: /builds/philmd/qemu2/build
Build type: native build
Project name: qemu
Project version: 5.2.50
C compiler for the host machine: cc (gcc 10.2.1 "cc (Alpine 10.2.1_pre2)
10.2.1 20210313")
C linker for the host machine: cc ld.bfd 2.35.2
Host machine cpu family: x86_64
Host machine cpu: x86_64
Program sh found: YES (/bin/sh)
Program python3 found: YES (/usr/bin/python3)
Program bzip2 found: YES (/usr/bin/bzip2)
C++ compiler for the host machine: c++ (gcc 10.2.1 "c++ (Alpine
10.2.1_pre2) 10.2.1 20210313")
C++ linker for the host machine: c++ ld.bfd 2.35.2
Program cgcc found: NO
Library m found: YES
Library util found: YES
Run-time dependency appleframeworks found: NO (tried framework)
Found pkg-config: /usr/bin/pkg-config (1.7.3)
Run-time dependency pixman-1 found: YES 0.40.0
Library aio found: YES
Run-time dependency zlib found: YES 1.2.11
Run-time dependency libnfs found: YES 4.0.0
Run-time dependency appleframeworks found: NO (tried framework)
Run-time dependency libseccomp found: YES 2.5.1
Has header "cap-ng.h" : YES
Library cap-ng found: YES
Run-time dependency xkbcommon found: YES 1.1.0
Library rt found: YES
Run-time dependency libiscsi found: NO (tried pkgconfig)
Run-time dependency libzstd found: NO (tried pkgconfig)
Run-time dependency libcurl found: YES 7.75.0
Run-time dependency libudev found: NO (tried pkgconfig)
Library mpathpersist found: NO
Run-time dependency ncursesw found: YES 6.2.20210313
Has header "brlapi.h" : NO
sdl2-config found: NO
Run-time dependency sdl2 found: NO (tried pkgconfig and config-tool)
Library rados found: NO
Has header "rbd/librbd.h" : NO
Run-time dependency glusterfs-api found: NO (tried pkgconfig)
Has header "bzlib.h" : YES
Library bz2 found: YES
Has header "lzfse.h" : NO
Run-time dependency gtk+-3.0 found: YES 3.24.23
Run-time dependency gtk+-x11-3.0 found: YES 3.24.23
Run-time dependency x11 found: YES 1.7.0
Run-time dependency libpng found: YES 1.6.37
Run-time dependency libjpeg found: YES 2.0.6
Has header "sasl/sasl.h" : NO
Has header "snappy-c.h" : YES
Library snappy found: YES
Has header "lzo/lzo1x.h" : YES
Library lzo2 found: YES
Run-time dependency u2f-emu found: NO (tried pkgconfig)
Run-time dependency libkeyutils found: NO (tried pkgconfig)
Checking for function "gettid" : YES
Run-time dependency fuse3 found: NO (tried pkgconfig)
Has header "linux/btrfs.h" : YES
Has header "libdrm/drm.h" : YES
Has header "pty.h" : YES
Has header "sys/ioccom.h" : NO
Has header "sys/kcov.h" : NO
Checking for function "system" : YES
Checking for function "preadv" : YES
Program scripts/minikconf.py found: YES (/usr/bin/python3
/builds/philmd/qemu2/scripts/minikconf.py)
Configuring aarch64-softmmu-config-target.h using configuration
Configuring aarch64-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/aarch64-softmmu-config-devices.mak.d
Configuring aarch64-softmmu-config-devices.h using configuration
Configuring alpha-softmmu-config-target.h using configuration
Configuring alpha-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/alpha-softmmu-config-devices.mak.d
Configuring alpha-softmmu-config-devices.h using configuration
Configuring cris-softmmu-config-target.h using configuration
Configuring cris-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/cris-softmmu-config-devices.mak.d
Configuring cris-softmmu-config-devices.h using configuration
Configuring hppa-softmmu-config-target.h using configuration
Configuring hppa-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/hppa-softmmu-config-devices.mak.d
Configuring hppa-softmmu-config-devices.h using configuration
Configuring moxie-softmmu-config-target.h using configuration
Configuring moxie-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/moxie-softmmu-config-devices.mak.d
Configuring moxie-softmmu-config-devices.h using configuration
Configuring microblazeel-softmmu-config-target.h using configuration
Configuring microblazeel-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/microblazeel-softmmu-config-devices.mak.d
Configuring microblazeel-softmmu-config-devices.h using configuration
Configuring mips64el-softmmu-config-target.h using configuration
Configuring mips64el-softmmu-config-devices.mak with command
Reading depfile:
/builds/philmd/qemu2/build/meson-private/mips64el-softmmu-config-devices.mak.d
Configuring mips64el-softmmu-config-devices.h using configuration
Run-time dependency capstone found: NO (tried pkgconfig)
Configuring capstone-defs.h using configuration
Run-time dependency slirp found: NO (tried pkgconfig)
Configuring libslirp-version.h using configuration
Library fdt found: NO
Configuring config-host.h using configuration
Program scripts/hxtool found: YES (/builds/philmd/qemu2/scripts/hxtool)
Program scripts/shaderinclude.pl found: YES (/usr/bin/env perl
/builds/philmd/qemu2/scripts/shaderinclude.pl)
Program scripts/qapi-gen.py found: YES (/usr/bin/python3
/builds/philmd/qemu2/scripts/qapi-gen.py)
Program scripts/qemu-version.sh found: YES
(/builds/philmd/qemu2/scripts/qemu-version.sh)
|Executing subproject libvhost-user method meson
|
|Project name: libvhost-user
|Project version: undefined
|C compiler for the host machine: cc (gcc 10.2.1 "cc (Alpine
10.2.1_pre2) 10.2.1 20210313")
|C linker for the host machine: cc ld.bfd 2.35.2
|Run-time dependency threads found: YES
|Dependency glib-2.0 found: YES 5.2.50 (overridden)
|Build targets in project: 11
|Subproject libvhost-user finished.
Dependency threads found: YES unknown (cached)
Program keycodemapdb/tools/keymap-gen found: YES
(/builds/philmd/qemu2/ui/keycodemapdb/tools/keymap-gen)
Program scripts/decodetree.py found: YES (/usr/bin/python3
/builds/philmd/qemu2/scripts/decodetree.py)
Program ../scripts/modules/module_block.py found: YES (/usr/bin/python3
/builds/philmd/qemu2/block/../scripts/modules/module_block.py)
Program ../scripts/block-coroutine-wrapper.py found: YES
(/usr/bin/python3
/builds/philmd/qemu2/block/../scripts/block-coroutine-wrapper.py)
Program nm found: YES
Program scripts/undefsym.py found: YES (/usr/bin/python3
/builds/philmd/qemu2/scripts/undefsym.py)
Program scripts/feature_to_c.sh found: YES (/bin/sh
/builds/philmd/qemu2/scripts/feature_to_c.sh)
Configuring 50-qemu-gpu.json using configuration
Configuring 50-qemu-virtiofsd.json using configuration
Configuring 50-edk2-i386-secure.json using configuration
Configuring 50-edk2-x86_64-secure.json using configuration
Configuring 60-edk2-aarch64.json using configuration
Configuring 60-edk2-arm.json using configuration
Configuring 60-edk2-i386.json using configuration
Configuring 60-edk2-x86_64.json using configuration
Program qemu-keymap found: NO
Program sphinx-build-3 found: YES (/usr/bin/sphinx-build-3)
Program python3 found: YES (/usr/bin/python3)
WARNING: Project targeting '>=0.55.0' but tried to use feature
introduced in '0.57.0': test() timeout <= 0.
Program diff found: YES (/usr/bin/diff)
Program dbus-daemon found: NO
Program initrd-stress.sh found: YES
(/builds/philmd/qemu2/tests/migration/initrd-stress.sh)
Program xgettext found: YES (/usr/bin/xgettext)
Build targets in project: 439
WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
features which were added in newer versions:
 * 0.57.0: {'test() timeout <= 0'}
qemu 5.2.50
  Directories
    Install prefix               : /usr/local
    BIOS directory               : share/qemu
    firmware path                : /usr/local/share/qemu-firmware
    binary directory             : bin
    library directory            : lib
    module directory             : lib/qemu
    libexec directory            : libexec
    include directory            : include
    config directory             : /usr/local/etc
    local state directory        : /usr/local/var
    Manual directory             : share/man
    Doc directory                : /usr/local/share/doc
    Build directory              : /builds/philmd/qemu2/build
    Source path                  : /builds/philmd/qemu2
    GIT submodules               : ui/keycodemapdb
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone
slirp
  Host binaries
    git                          : git
    make                         : make
    python                       : /usr/bin/python3 (version: 3.8)
    sphinx-build                 : YES
    genisoimage                  :
    smbd                         : "/usr/sbin/smbd"
  Configurable features
    Documentation                : YES
    system-mode emulation        : YES
    user-mode emulation          : NO
    block layer                  : YES
    Install blobs                : YES
    module support               : NO
    plugin support               : NO
    fuzzing support              : NO
    Audio drivers                : pa oss
    Trace backends               : log
    QOM debugging                : YES
    vhost-kernel support         : YES
    vhost-net support            : YES
    vhost-crypto support         : YES
    vhost-scsi support           : YES
    vhost-vsock support          : YES
    vhost-user support           : YES
    vhost-user-blk server support: YES
    vhost-user-fs support        : YES
    vhost-vdpa support           : YES
    build guest agent            : YES
  Compilation
    host CPU                     : x86_64
    host endianness              : little
    C compiler                   : cc
    Host C compiler              : cc
    C++ compiler                 : c++
    ARFLAGS                      : rv
    CFLAGS                       : -O2 -g
    CXXFLAGS                     : -O2 -g
    QEMU_CFLAGS                  : -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
    QEMU_LDFLAGS                 : -Wl,--warn-common -Wl,-z,relro
-Wl,-z,now -m64  -fstack-protector-strong
    profiler                     : NO
    link-time optimization (LTO) : NO
    PIE                          : YES
    static build                 : NO
    malloc trim support          : NO
    membarrier                   : NO
    preadv support               : YES
    fdatasync                    : NO
    madvise                      : YES
    posix_madvise                : YES
    posix_memalign               : YES
    debug stack usage            : NO
    mutex debugging              : NO
    memory allocator             : system
    avx2 optimization            : YES
    avx512f optimization         : NO
    gprof enabled                : NO
    gcov                         : NO
    thread sanitizer             : NO
    CFI support                  : NO
    strip binaries               : YES
    sparse                       : NO
    mingw32 support              : NO
  Targets and accelerators
    KVM support                  : NO
    HAX support                  : NO
    HVF support                  : NO
    WHPX support                 : NO
    Xen support                  : NO
    TCG support                  : YES
    TCG backend                  : native (x86_64)
    TCG debug enabled            : NO
    target list                  : aarch64-softmmu alpha-softmmu
cris-softmmu hppa-softmmu moxie-softmmu microblazeel-softmmu
mips64el-softmmu
    default devices              : YES
    out of process emulation     : YES
  Block layer support
    coroutine backend            : sigaltstack
    coroutine pool               : YES
    Block whitelist (rw)         :
    Block whitelist (ro)         :
    VirtFS support               : YES
    build virtiofs daemon        : YES
    Live block migration         : YES
    replication support          : YES
    bochs support                : YES
    cloop support                : YES
    dmg support                  : YES
    qcow v1 support              : YES
    vdi support                  : YES
    vvfat support                : YES
    qed support                  : YES
    parallels support            : YES
    sheepdog support             : NO
    FUSE exports                 : NO
  Crypto
    TLS priority                 : "NORMAL"
    GNUTLS support               : YES
    libgcrypt                    : NO
    nettle                       : YES
      XTS                        : YES
    crypto afalg                 : NO
    rng-none                     : NO
    Linux keyring                : YES
  Dependencies
    SDL support                  : NO
    SDL image support            : NO
    GTK support                  : YES
    pixman                       : YES
    VTE support                  : YES
    slirp support                : internal
    libtasn1                     : YES
    PAM                          : NO
    iconv support                : YES
    curses support               : YES
    virgl support                : YES
    curl support                 : YES
    Multipath support            : NO
    VNC support                  : YES
    VNC SASL support             : NO
    VNC JPEG support             : YES
    VNC PNG support              : YES
    brlapi support               : NO
    vde support                  : YES
    netmap support               : NO
    Linux AIO support            : YES
    Linux io_uring support       : NO
    ATTR/XATTR support           : YES
    RDMA support                 : NO
    PVRDMA support               : NO
    fdt support                  : internal
    libcap-ng support            : YES
    spice support                : YES
    rbd support                  : NO
    xfsctl support               : YES
    smartcard support            : NO
    U2F support                  : NO
    libusb                       : YES
    usb net redir                : YES
    OpenGL support               : YES
    GBM                          : YES
    libiscsi support             : NO
    libnfs support               : YES
    seccomp support              : YES
    GlusterFS support            : NO
    TPM support                  : YES
    libssh support               : YES
    lzo support                  : YES
    snappy support               : YES
    bzip2 support                : YES
    lzfse support                : NO
    zstd support                 : NO
    NUMA host support            : NO
    libxml2                      : YES
    capstone                     : internal
    libpmem support              : NO
    libdaxctl support            : NO
    libudev                      : NO
    FUSE lseek                   : NO
  Subprojects
    libvhost-user                : YES
Option b_staticpic is: false [default: false]
Found ninja-1.9 at /usr/bin/ninja
$ if test -n "$LD_JOBS"; then meson configure .
-Dbackend_max_links="$LD_JOBS" ; fi || exit 1;
$ make -j"$JOBS"
make: /usr/bin/env: Operation not permitted
make: /usr/bin/env: Operation not permitted
make: /usr/bin/env: Operation not permitted
make: /usr/bin/env: Operation not permitted
make: /usr/bin/env: Operation not permitted
make: /usr/bin/env: Operation not permitted
make: *** [Makefile:51: git-submodule-update] Error 127
ERROR: Job failed: exit code 1


