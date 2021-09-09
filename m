Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07577404886
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:34:18 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHNo-0002fp-Md
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOHL1-0000H9-0c
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOHKv-0000lV-Pg
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyYGlIkPj+9Yqbev1ndfEoGs6sTfcl/y2zdByF42xgM=;
 b=KXquqiJsi2lFu88PvbMC1jquJOs1lHuqMNpUEuf7uJRnxjH9nCVt6Atk8JDOgF1ov9gwpM
 4tZp4yWauodEfMTY9jrbIjcaQa512LuofKqAAlfshc24m3Iik75zjBGqRhZVEpXGMHwGdz
 u/ZPoV+/23tUrC9K1CytRHwpoEBtx3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Avoi4WPuOGGPUQOB7D0vGw-1; Thu, 09 Sep 2021 06:31:12 -0400
X-MC-Unique: Avoi4WPuOGGPUQOB7D0vGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD1D801A92;
 Thu,  9 Sep 2021 10:31:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DCD10013D7;
 Thu,  9 Sep 2021 10:31:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 165531138606; Thu,  9 Sep 2021 12:31:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC v3 00/32] Rust binding for QAPI and qemu-ga QMP handler
 examples
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <871r5zurqm.fsf@dusky.pond.sub.org>
 <CAJ+F1CKDieE9jb0eMYErV5HzM_XDURqr5V90PZHH3Amo97u6hA@mail.gmail.com>
Date: Thu, 09 Sep 2021 12:31:06 +0200
In-Reply-To: <CAJ+F1CKDieE9jb0eMYErV5HzM_XDURqr5V90PZHH3Amo97u6hA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 8 Sep 2021
 17:55:59 +0400")
Message-ID: <87ee9ykplh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Wed, Sep 8, 2021 at 5:23 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> Build fails for me:
>>
>> make: Entering directory '/work/armbru/qemu/bld'
>> config-host.mak is out-of-date, running configure
>>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp
>> fatal: remote error: upload-pack: not our ref
>> 7077bbbd11a67d60062a9483f996113a349a4ca1
>>
>
> Looks like I didn't update the repository on github. done
>
> I will update .gitmodule to use the repo on gitlab instead (gitlab.com:
> marcandre.lureau/qemu-rust-vendored.git)

Next error:

make -k -C ~/work/qemu/bld-x86=20
make: Entering directory '/work/armbru/qemu/bld-x86'
  GIT     ui/keycodemapdb rust/vendored tests/fp/berkeley-testfloat-3 tests=
/fp/berkeley-softfloat-3 dtc capstone slirp
[1/71] Generating qemu-version.h with a custom command (wrapped by meson to=
 capture output)
[2/55] Generating cargo-qga with a custom command
FAILED: qga/libqga.args qga/libqga.a=20
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/qga /work/armb=
ru/qemu/qga /work/armbru/qemu/bld-x86 debug '' build-lib
Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/qga MESON_=
BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/qga/rs-target -=
-manifest-path /work/armbru/qemu/qga/Cargo.toml --offline --lib -- --cfg CO=
NFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg CONFIG_ATTR =
--cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2_OPT --cfg CO=
NFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCHS --=
cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg CONFI=
G_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG_COR=
OUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES --cf=
g CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg CONFIG_D=
UP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREATE1 --cfg C=
ONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCATE_PUNCH_HOLE --cf=
g CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg CONFIG_FDT --cfg=
 CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --cfg CONFIG_GETRAND=
OM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CONFIG=
_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTERFS_=
FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GLUSTE=
RFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cfg CO=
NFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONFIG_H=
AS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT128 -=
-cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONFIG_L=
IBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE --cf=
g CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg CONFIG_LINUX_=
AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIGRATION --cfg CONF=
IG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD --c=
fg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONFIG_O=
PENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_PIPE2=
 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --cfg =
CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --cfg C=
ONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CONFIG_PTHREAD_SETN=
AME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg CONFIG_QED --cfg =
CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA --cfg CONFIG_REPLI=
CATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFIG_SDL_IMAGE --cfg=
 CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT --cf=
g CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG_SLI=
RP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg CON=
FIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg CONFIG_SYNC=
FS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg CONFIG_TCG --c=
fg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cfg CONFIG_TOOLS -=
-cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS --cfg CONFIG_USB_=
LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONFIG_VHOST_CRYPTO -=
-cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONFIG_VHOST_NET_USER=
 --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg CONFIG_VHOST_USE=
R --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_USER_FS --cfg CONFI=
G_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VHOST_VSOCK --cfg C=
ONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg CONFIG_VNC_PNG --=
cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CONFIG_=
X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --cfg =
CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DRM_H =
--cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTCP --=
cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg HAVE_STRCHRNUL =
--cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION --cfg HAVE_UTMPX =
--print native-static-libs
error: failed to select a version for the requirement `cc =3D "=3D1.0.70"`
candidate versions found which didn't match: 1.0.69
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `https://github.com/rust-lang/crates.io-index`)
required by package `nix v0.20.1`
    ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
perhaps a crate was updated and forgotten to be re-vendored?
As a reminder, you're using offline mode (--offline) which can sometimes ca=
use surprising resolution failures, if this error is too confusing you may =
wish to retry without the offline flag.

[3/55] Generating qga-qapi-cabi-rs with a custom command
FAILED: qga/qapi-cabi-rs=20
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/qga /work/armb=
ru/qemu/qga /work/armbru/qemu/bld-x86 debug '' build-bin qapi-cabi-rs -- --=
cfg QAPI_CABI
error: the option `Z` is only accepted on the nightly compiler

Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/qga MESON_=
BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/qga/rs-target -=
-manifest-path /work/armbru/qemu/qga/Cargo.toml --offline --bin qapi-cabi-r=
s -- --cfg CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg=
 CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2=
_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CO=
NFIG_BOCHS --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTON=
E --cfg CONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --c=
fg CONFIG_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFI=
G_CURSES --cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG -=
-cfg CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CR=
EATE1 --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCATE_PU=
NCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg CON=
FIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --cfg C=
ONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUSTERFS=
 --cfg CONFIG_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg CONF=
IG_GLUSTERFS_FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg =
CONFIG_GLUSTERFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GN=
UTLS --cfg CONFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT -=
-cfg CONFIG_HAS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CO=
NFIG_INT128 --cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG -=
-cfg CONFIG_LIBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_=
LIBPULSE --cfg CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg =
CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIGRATI=
ON --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg CON=
FIG_MEMFD --cfg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA -=
-cfg CONFIG_OPENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg=
 CONFIG_PIPE2 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FAL=
LOCATE --cfg CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_=
PPOLL --cfg CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CONFIG=
_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg CONF=
IG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA --cfg=
 CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFIG_SD=
L_IMAGE --cfg CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_T=
IMEDWAIT --cfg CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --c=
fg CONFIG_SLIRP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SP=
ICE --cfg CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cf=
g CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg C=
ONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cfg C=
ONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS --cf=
g CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONFIG_V=
HOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONFIG_V=
HOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg CON=
FIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_USER_F=
S --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VHOST_=
VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg CONF=
IG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_RUST =
--cfg CONFIG_X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKB=
COMMON --cfg CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cf=
g HAVE_DRM_H --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPP=
ROTO_MPTCP --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg HA=
VE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION --cf=
g HAVE_UTMPX --cfg QAPI_CABI
error: failed to select a version for the requirement `cc =3D "=3D1.0.70"`
candidate versions found which didn't match: 1.0.69
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `https://github.com/rust-lang/crates.io-index`)
required by package `nix v0.20.1`
    ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
perhaps a crate was updated and forgotten to be re-vendored?
As a reminder, you're using offline mode (--offline) which can sometimes ca=
use surprising resolution failures, if this error is too confusing you may =
wish to retry without the offline flag.

[4/55] Generating Test Rust library with a custom command
FAILED: tests/libqemu_tests.args tests/libqemu_tests.a=20
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/tests /work/ar=
mbru/qemu/tests /work/armbru/qemu/bld-x86 debug '' build-lib
Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/tests MESO=
N_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/tests/rs-target=
 --manifest-path /work/armbru/qemu/tests/Cargo.toml --offline --lib -- --cf=
g CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg CONFIG_A=
TTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2_OPT --cf=
g CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCH=
S --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg C=
ONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG=
_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES =
--cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg CONF=
IG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREATE1 --c=
fg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCATE_PUNCH_HOLE =
--cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg CONFIG_FDT -=
-cfg CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --cfg CONFIG_GET=
RANDOM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CO=
NFIG_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTE=
RFS_FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GL=
USTERFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cf=
g CONFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONF=
IG_HAS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT1=
28 --cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONF=
IG_LIBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE =
--cfg CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg CONFIG_LI=
NUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIGRATION --cfg =
CONFIG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD=
 --cfg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONF=
IG_OPENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_P=
IPE2 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --=
cfg CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --c=
fg CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CONFIG_PTHREAD_=
SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg CONFIG_QED --=
cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA --cfg CONFIG_R=
EPLICATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFIG_SDL_IMAGE -=
-cfg CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT =
--cfg CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG=
_SLIRP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg=
 CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg CONFIG_=
SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg CONFIG_TCG=
 --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cfg CONFIG_TOO=
LS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS --cfg CONFIG_=
USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONFIG_VHOST_CRYP=
TO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONFIG_VHOST_NET_=
USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg CONFIG_VHOST=
_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_USER_FS --cfg C=
ONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VHOST_VSOCK --c=
fg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg CONFIG_VNC_PN=
G --cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CON=
FIG_X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --=
cfg CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DR=
M_H --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTC=
P --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg HAVE_STRCHR=
NUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION --cfg HAVE_UT=
MPX --print native-static-libs
error: failed to select a version for the requirement `cc =3D "=3D1.0.70"`
candidate versions found which didn't match: 1.0.69
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `https://github.com/rust-lang/crates.io-index`)
required by package `nix v0.20.1`
    ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
perhaps a crate was updated and forgotten to be re-vendored?
As a reminder, you're using offline mode (--offline) which can sometimes ca=
use surprising resolution failures, if this error is too confusing you may =
wish to retry without the offline flag.

[5/55] Generating QAPI test (include) with a custom command
[6/20] Generating qapi-cabi-rs with a custom command
FAILED: tests/qapi-cabi-rs=20
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/tests /work/ar=
mbru/qemu/tests /work/armbru/qemu/bld-x86 debug '' build-bin qapi-cabi-rs -=
- --cfg QAPI_CABI
error: the option `Z` is only accepted on the nightly compiler

Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/tests MESO=
N_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/tests/rs-target=
 --manifest-path /work/armbru/qemu/tests/Cargo.toml --offline --bin qapi-ca=
bi-rs -- --cfg CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 -=
-cfg CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_=
AVX2_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cf=
g CONFIG_BOCHS --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAP=
STONE --cfg CONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128=
 --cfg CONFIG_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg C=
ONFIG_CURSES --cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_D=
MG --cfg CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOL=
L_CREATE1 --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCAT=
E_PUNCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg=
 CONFIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --c=
fg CONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUST=
ERFS --cfg CONFIG_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg =
CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --=
cfg CONFIG_GLUSTERFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFI=
G_GNUTLS --cfg CONFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGE=
NT --cfg CONFIG_HAS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cf=
g CONFIG_INT128 --cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_=
NG --cfg CONFIG_LIBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CON=
FIG_LIBPULSE --cfg CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --=
cfg CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIG=
RATION --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg=
 CONFIG_MEMFD --cfg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NU=
MA --cfg CONFIG_OPENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS -=
-cfg CONFIG_PIPE2 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX=
_FALLOCATE --cfg CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CON=
FIG_PPOLL --cfg CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CO=
NFIG_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg =
CONFIG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA -=
-cfg CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFI=
G_SDL_IMAGE --cfg CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_S=
EM_TIMEDWAIT --cfg CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD=
 --cfg CONFIG_SLIRP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFI=
G_SPICE --cfg CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX =
--cfg CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --c=
fg CONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --c=
fg CONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS =
--cfg CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONF=
IG_VHOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONF=
IG_VHOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg=
 CONFIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_US=
ER_FS --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VH=
OST_VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg =
CONFIG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_R=
UST --cfg CONFIG_X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG=
_XKBCOMMON --cfg CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE =
--cfg HAVE_DRM_H --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE=
_IPPROTO_MPTCP --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cf=
g HAVE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION =
--cfg HAVE_UTMPX --cfg QAPI_CABI
error: failed to select a version for the requirement `cc =3D "=3D1.0.70"`
candidate versions found which didn't match: 1.0.69
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `https://github.com/rust-lang/crates.io-index`)
required by package `nix v0.20.1`
    ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
perhaps a crate was updated and forgotten to be re-vendored?
As a reminder, you're using offline mode (--offline) which can sometimes ca=
use surprising resolution failures, if this error is too confusing you may =
wish to retry without the offline flag.

ninja: build stopped: cannot make progress due to previous errors.
make: *** [Makefile:156: run-ninja] Error 1
make: Target 'all' not remade because of errors.
make: Leaving directory '/work/armbru/qemu/bld-x86'


