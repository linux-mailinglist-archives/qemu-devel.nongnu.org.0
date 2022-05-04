Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6B5197E9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:16:29 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9FM-0007Bj-EM
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nm99t-0004Q7-9X; Wed, 04 May 2022 03:10:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nm99q-000779-QY; Wed, 04 May 2022 03:10:48 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nm98q-0001Sa-37; Wed, 04 May 2022 08:09:48 +0100
Message-ID: <0cc7cfdb-db80-f05b-49d8-d5db8baa6bfd@ilande.co.uk>
Date: Wed, 4 May 2022 08:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: muriloo@linux.ibm.com, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/05/2022 14:36, Murilo Opsfelder Araújo wrote:

> Hi, Mark.
> 
> Thanks for reviewing.  Comments below.
> 
> On 5/2/22 06:43, Mark Cave-Ayland wrote:
>> On 30/04/2022 00:31, Murilo Opsfelder Araujo wrote:
>>
>>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>>
>>>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): 
>>> undefined reference to `hmp_info_via'
>>>      clang-13: error: linker command failed with exit code 1 (use -v to see 
>>> invocation)
>>>
>>> Add CONFIG_MOS6522 check for hmp_info_via in hmp-commands-info.hx to fix
>>> such linking error.
>>>
>>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>>> ---
>>>   hmp-commands-info.hx | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>> index adfa085a9b..9ad784dd9f 100644
>>> --- a/hmp-commands-info.hx
>>> +++ b/hmp-commands-info.hx
>>> @@ -881,6 +881,7 @@ SRST
>>>   ERST
>>>   #if defined(TARGET_M68K) || defined(TARGET_PPC)
>>> +#if defined(CONFIG_MOS6522)
>>>       {
>>>           .name         = "via",
>>>           .args_type    = "",
>>> @@ -889,6 +890,7 @@ ERST
>>>           .cmd          = hmp_info_via,
>>>       },
>>>   #endif
>>> +#endif
>>>   SRST
>>>     ``info via``
>>
>> Hmmm. The patch in its proposed form isn't correct, since device CONFIG_* defines 
>> aren't declared when processing hmp-commands-info.hx. This was something that was 
>> discovered and discussed in the original thread for which the current workaround is 
>> to use the per-target TARGET_* defines instead.
> 
> So my proposed fix worked just by coincidence.  Thanks for providing the background.
> 
>>
>> Given that the g3beige and mac99 machines are included by default in 
>> qemu-system-ppc64 which both contain the MOS6522 device, I can't quite understand 
>> how CONFIG_MOS6522 isn't being selected.
>>
>> Can you give more information about how you are building QEMU including your 
>> configure command line?
> 
> Here is a reproducer adapted from CentOS 9 Stream qemu-kvm[0] package
> (build failed on c9s ppc64le with QEMU at commit 
> f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65):
> 
> $ cat > configs/devices/rh-virtio.mak <<"EOF"
> CONFIG_VIRTIO=y
> CONFIG_VIRTIO_BALLOON=y
> CONFIG_VIRTIO_BLK=y
> CONFIG_VIRTIO_GPU=y
> CONFIG_VIRTIO_INPUT=y
> CONFIG_VIRTIO_INPUT_HOST=y
> CONFIG_VIRTIO_NET=y
> CONFIG_VIRTIO_RNG=y
> CONFIG_VIRTIO_SCSI=y
> CONFIG_VIRTIO_SERIAL=y
> EOF
> 
> $ cat > configs/devices/ppc64-softmmu/ppc64-rh-devices.mak <<"EOF"
> include ../rh-virtio.mak
> CONFIG_DIMM=y
> CONFIG_MEM_DEVICE=y
> CONFIG_NVDIMM=y
> CONFIG_PCI=y
> CONFIG_PCI_DEVICES=y
> CONFIG_PCI_TESTDEV=y
> CONFIG_PCI_EXPRESS=y
> CONFIG_PSERIES=y
> CONFIG_SCSI=y
> CONFIG_SPAPR_VSCSI=y
> CONFIG_TEST_DEVICES=y
> CONFIG_USB=y
> CONFIG_USB_OHCI=y
> CONFIG_USB_OHCI_PCI=y
> CONFIG_USB_SMARTCARD=y
> CONFIG_USB_STORAGE_CORE=y
> CONFIG_USB_STORAGE_CLASSIC=y
> CONFIG_USB_XHCI=y
> CONFIG_USB_XHCI_NEC=y
> CONFIG_USB_XHCI_PCI=y
> CONFIG_VFIO=y
> CONFIG_VFIO_PCI=y
> CONFIG_VGA=y
> CONFIG_VGA_PCI=y
> CONFIG_VHOST_USER=y
> CONFIG_VIRTIO_PCI=y
> CONFIG_VIRTIO_VGA=y
> CONFIG_WDT_IB6300ESB=y
> CONFIG_XICS=y
> CONFIG_XIVE=y
> CONFIG_TPM=y
> CONFIG_TPM_SPAPR=y
> CONFIG_TPM_EMULATOR=y
> EOF
> 
> $ mkdir build
> $ cd build
> 
> $ ../configure --cc=clang --cxx=/bin/false --prefix=/usr --libdir=/usr/lib64 
> --datadir=/usr/share --sysconfdir=/etc --interp-prefix=/usr/qemu-%M 
> --localstatedir=/var --docdir=/usr/share/doc --libexecdir=/usr/libexec 
> '--extra-ldflags=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,now   ' '--extra-cflags=-O2  
> -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security 
> -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS --config 
> /usr/lib/rpm/redhat/redhat-hardened-clang.cfg -fstack-protector-strong   -m64 
> -mcpu=power9 -mtune=power9 -fasynchronous-unwind-tables -fstack-clash-protection 
> -Wno-string-plus-int' --with-pkgversion=qemu-kvm-7.0.0-1.el9 --with-suffix=qemu-kvm 
> --firmwarepath=/usr/share/qemu-firmware:/usr/share/ipxe/qemu:/usr/share/seavgabios:/usr/share/seabios 
> --meson=internal --enable-trace-backend=dtrace --with-coroutine=ucontext 
> --with-git=git --tls-priority=@QEMU,SYSTEM --audio-drv-list= --disable-alsa 
> --disable-attr --disable-auth-pam --disable-avx2 --disable-avx512f 
> --disable-block-drv-whitelist-in-tools --disable-bochs --disable-bpf --disable-brlapi 
> --disable-bsd-user --disable-bzip2 --disable-cap-ng --disable-capstone --disable-cfi 
> --disable-cfi-debug --disable-cloop --disable-cocoa --disable-coreaudio 
> --disable-coroutine-pool --disable-crypto-afalg --disable-curl --disable-curses 
> --disable-dbus-display --disable-debug-info --disable-debug-mutex --disable-debug-tcg 
> --disable-dmg --disable-docs --disable-dsound --disable-fdt --disable-fuse 
> --disable-fuse-lseek --disable-gcrypt --disable-gettext --disable-gio 
> --disable-glusterfs --disable-gnutls --disable-gtk --disable-guest-agent 
> --disable-guest-agent-msi --disable-hax --disable-hvf --disable-iconv --disable-jack 
> --disable-kvm --disable-l2tpv3 --disable-libdaxctl --disable-libiscsi 
> --disable-libnfs --disable-libpmem --disable-libssh --disable-libudev 
> --disable-libusb --disable-linux-aio --disable-linux-io-uring --disable-linux-user 
> --disable-live-block-migration --disable-lto --disable-lzfse --disable-lzo 
> --disable-malloc-trim --disable-membarrier --disable-modules 
> --disable-module-upgrades --disable-mpath --disable-multiprocess --disable-netmap 
> --disable-nettle --disable-numa --disable-nvmm --disable-opengl --disable-oss 
> --disable-pa --disable-parallels --disable-pie --disable-pvrdma --disable-qcow1 
> --disable-qed --disable-qga-vss --disable-qom-cast-debug --disable-rbd --disable-rdma 
> --disable-replication --disable-rng-none --disable-safe-stack --disable-sanitizers 
> --disable-sdl --disable-sdl-image --disable-seccomp --disable-selinux --disable-slirp 
> --disable-slirp-smbd --disable-smartcard --disable-snappy --disable-sparse 
> --disable-spice --disable-spice-protocol --disable-strip --disable-system 
> --disable-tcg --disable-tools --disable-tpm --disable-u2f --disable-usb-redir 
> --disable-user --disable-vde --disable-vdi --disable-vhost-crypto 
> --disable-vhost-kernel --disable-vhost-net --disable-vhost-scsi --disable-vhost-user 
> --disable-vhost-user-blk-server --disable-vhost-vdpa --disable-vhost-vsock 
> --disable-virglrenderer --disable-virtfs --disable-virtiofsd --disable-vnc 
> --disable-vnc-jpeg --disable-vnc-sasl --disable-vte --disable-vvfat --disable-werror 
> --disable-whpx --disable-xen --disable-xen-pci-passthrough --disable-xkbcommon 
> --disable-zstd --with-git-submodules=ignore --without-default-devices 
> --with-devices-ppc64=ppc64-rh-devices --target-list=ppc64-softmmu 
> --block-drv-rw-whitelist=qcow2,raw,file,host_device,nbd,iscsi,rbd,blkdebug,luks,null-co,nvme,copy-on-read,throttle,compress 
> --block-drv-ro-whitelist=vdi,vmdk,vhdx,vpc,https --enable-attr --enable-cap-ng 
> --enable-capstone=internal --enable-coroutine-pool --enable-curl --enable-debug-info 
> --enable-docs --enable-fdt=system --enable-gnutls --enable-guest-agent --enable-iconv 
> --enable-kvm --enable-libusb --enable-libudev --enable-linux-aio --enable-lzo 
> --enable-malloc-trim --enable-modules --enable-mpath --enable-numa --enable-pa 
> --enable-pie --enable-rbd --enable-rdma --enable-seccomp --enable-selinux 
> --enable-slirp=system --enable-snappy --enable-spice-protocol --enable-system 
> --enable-tcg --enable-tools --enable-tpm --enable-vdi --enable-virtiofsd 
> --enable-vhost-kernel --enable-vhost-net --enable-vhost-user 
> --enable-vhost-user-blk-server --enable-vhost-vdpa --enable-vhost-vsock --enable-vnc 
> --enable-vnc-sasl --enable-werror --enable-xkbcommon
> 
> $ make -O -j$(nproc) V=1 VERBOSE=1
> ...
> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined 
> reference to `hmp_info_via'
> clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
> 
> I have figured that it also fails with this minimal set of configure options
> (in addition to the devices CONFIG_* options above):
> 
> $ ../configure --without-default-devices --with-devices-ppc64=ppc64-rh-devices 
> --target-list=ppc64-softmmu
> $ make -j
> ...
> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data.rel+0x3228): 
> undefined reference to `hmp_info_via'
> collect2: error: ld returned 1 exit status
> 
> Since TARGET_PPC is defined when building target ppc64-softmmu, the hmp_info_via will 
> be referenced when processing the hmp-commands-info.hx.
> However, hmp_info_via implementation resides on hw/misc/mos6522.c, which is built 
> only if CONFIG_MOS6522 is defined, as per hw/misc/meson.build.
> 
> If hmp_info_via is generic enough and not device-specific, it could be moved out of 
> mos6522.c to somewhere else.
> 
> What do you think?
> 
> [0] https://gitlab.com/redhat/centos-stream/rpms/qemu-kvm/-/blob/c9s/qemu-kvm.spec#L686

It's probably easier if I post a link to the original thread at 
https://lore.kernel.org/all/20220127205405.23499-9-mark.cave-ayland@ilande.co.uk/ for 
reference but the main takeaway is:

- Device CONFIG_* defines aren't present when building hmp-commands-info.hx

- The TARGET_* defines are poisoned in qapi/qapi-commands-misc-target.h

- The long-term solution is to implement a DeviceClass function callback that allows
   "info debug <foo>" QMP-wrapped monitor commands to be registered dynamically by
   devices. But that needs someone with the time and ability to implement it.

The compromise was to accept the command wrapped by TARGET_ defines where it is used, 
but of course that won't work in this case where you're generating a custom 
configuration as above.

Certainly QEMU could do better here, but then if you are already patching the build 
to generate a custom configuration as above, you might as well just patch out the 
relevant part of hmp-commands-info.hx at the same time until proper per-device 
HMP/QMP support is added.


ATB,

Mark.

