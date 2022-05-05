Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2808651B53B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 03:27:21 +0200 (CEST)
Received: from localhost ([::1]:50650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmQH2-0006nI-3n
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 21:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nmQEs-0004p0-Ns; Wed, 04 May 2022 21:25:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nmQEp-0000zc-RG; Wed, 04 May 2022 21:25:06 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2450Tugs016745;
 Thu, 5 May 2022 01:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=OoDlV/Ya+TI6E1SL4EJqNS01kwXOy+PKqE9jGKzbepw=;
 b=BWpAyf7FBhPzL6hJ1AdEpzYuQO9IsEqkWWdCxZ+SLrm2FLOa5HJRHn0elPs9XH+EeeYH
 wrOMNJ5angmX+2FYx5jb0NOeOIYYQ8+9g6E3x2ErkHML6MRlwPDK9dQXIX8e3OrR0YOY
 7/5q/OT1LvPvxZSRLY28A0o/IoGkfUi3rifb0zngNFJmnlOFG7iYHForXffNxHLMcQnp
 UtuubEFyezALkvFwM9z7Y0BF3LG0uz0RsCZ/QyEJU20zfIm51L5IBf6K1QNr4u7kNBPy
 20oPtBNRnlAQ7GkB1MwfmQDq8w+mOKNXv47kWPf5qCWO59uqUBz7tH5PXvtT4VWdyFV+ GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv43f8ngk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 01:24:50 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2451Kbk7016210;
 Thu, 5 May 2022 01:24:49 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv43f8nga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 01:24:49 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2451M3PH025342;
 Thu, 5 May 2022 01:24:48 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3frvr9pfk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 01:24:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2451OlcG34996666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 01:24:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 554C178067;
 Thu,  5 May 2022 01:24:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32FF778064;
 Thu,  5 May 2022 01:24:45 +0000 (GMT)
Received: from [9.65.252.158] (unknown [9.65.252.158])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  5 May 2022 01:24:44 +0000 (GMT)
Message-ID: <aefec76d-a3a7-0312-6925-a35d9b2cec18@linux.ibm.com>
Date: Wed, 4 May 2022 22:24:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.0
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <0cc7cfdb-db80-f05b-49d8-d5db8baa6bfd@ilande.co.uk>
 <6b41eea4-687e-11cf-392f-75fa6f5d2e34@linux.ibm.com>
 <9f68b28d-62e8-2a96-4f92-cc8f5bfd473f@ilande.co.uk>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <9f68b28d-62e8-2a96-4f92-cc8f5bfd473f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3VQrmbtCcuLgDlU9l6J12rzW_DNHOPnq
X-Proofpoint-GUID: tNKaPUyqI_OPnjSih-n2E7f6tKmjXUXS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_06,2022-05-04_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050006
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: muriloo@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Mark.

On 5/4/22 11:32, Mark Cave-Ayland wrote:
> On 04/05/2022 14:16, Murilo Opsfelder Araújo wrote:
>> Hi, Mark.
>>
>> On 5/4/22 04:10, Mark Cave-Ayland wrote:
>>> On 02/05/2022 14:36, Murilo Opsfelder Araújo wrote:
>>>
>>>> Hi, Mark.
>>>>
>>>> Thanks for reviewing.  Comments below.
>>>>
>>>> On 5/2/22 06:43, Mark Cave-Ayland wrote:
>>>>> On 30/04/2022 00:31, Murilo Opsfelder Araujo wrote:
>>>>>
>>>>>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>>>>>
>>>>>>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
>>>>>>      clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
>>>>>>
>>>>>> Add CONFIG_MOS6522 check for hmp_info_via in hmp-commands-info.hx to fix
>>>>>> such linking error.
>>>>>>
>>>>>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>>>>>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>>>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>>>>>> ---
>>>>>>   hmp-commands-info.hx | 2 ++
>>>>>>   1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>>>>> index adfa085a9b..9ad784dd9f 100644
>>>>>> --- a/hmp-commands-info.hx
>>>>>> +++ b/hmp-commands-info.hx
>>>>>> @@ -881,6 +881,7 @@ SRST
>>>>>>   ERST
>>>>>>   #if defined(TARGET_M68K) || defined(TARGET_PPC)
>>>>>> +#if defined(CONFIG_MOS6522)
>>>>>>       {
>>>>>>           .name         = "via",
>>>>>>           .args_type    = "",
>>>>>> @@ -889,6 +890,7 @@ ERST
>>>>>>           .cmd          = hmp_info_via,
>>>>>>       },
>>>>>>   #endif
>>>>>> +#endif
>>>>>>   SRST
>>>>>>     ``info via``
>>>>>
>>>>> Hmmm. The patch in its proposed form isn't correct, since device CONFIG_* defines aren't declared when processing hmp-commands-info.hx. This was something that was discovered and discussed in the original thread for which the current workaround is to use the per-target TARGET_* defines instead.
>>>>
>>>> So my proposed fix worked just by coincidence.  Thanks for providing the background.
>>>>
>>>>>
>>>>> Given that the g3beige and mac99 machines are included by default in qemu-system-ppc64 which both contain the MOS6522 device, I can't quite understand how CONFIG_MOS6522 isn't being selected.
>>>>>
>>>>> Can you give more information about how you are building QEMU including your configure command line?
>>>>
>>>> Here is a reproducer adapted from CentOS 9 Stream qemu-kvm[0] package
>>>> (build failed on c9s ppc64le with QEMU at commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65):
>>>>
>>>> $ cat > configs/devices/rh-virtio.mak <<"EOF"
>>>> CONFIG_VIRTIO=y
>>>> CONFIG_VIRTIO_BALLOON=y
>>>> CONFIG_VIRTIO_BLK=y
>>>> CONFIG_VIRTIO_GPU=y
>>>> CONFIG_VIRTIO_INPUT=y
>>>> CONFIG_VIRTIO_INPUT_HOST=y
>>>> CONFIG_VIRTIO_NET=y
>>>> CONFIG_VIRTIO_RNG=y
>>>> CONFIG_VIRTIO_SCSI=y
>>>> CONFIG_VIRTIO_SERIAL=y
>>>> EOF
>>>>
>>>> $ cat > configs/devices/ppc64-softmmu/ppc64-rh-devices.mak <<"EOF"
>>>> include ../rh-virtio.mak
>>>> CONFIG_DIMM=y
>>>> CONFIG_MEM_DEVICE=y
>>>> CONFIG_NVDIMM=y
>>>> CONFIG_PCI=y
>>>> CONFIG_PCI_DEVICES=y
>>>> CONFIG_PCI_TESTDEV=y
>>>> CONFIG_PCI_EXPRESS=y
>>>> CONFIG_PSERIES=y
>>>> CONFIG_SCSI=y
>>>> CONFIG_SPAPR_VSCSI=y
>>>> CONFIG_TEST_DEVICES=y
>>>> CONFIG_USB=y
>>>> CONFIG_USB_OHCI=y
>>>> CONFIG_USB_OHCI_PCI=y
>>>> CONFIG_USB_SMARTCARD=y
>>>> CONFIG_USB_STORAGE_CORE=y
>>>> CONFIG_USB_STORAGE_CLASSIC=y
>>>> CONFIG_USB_XHCI=y
>>>> CONFIG_USB_XHCI_NEC=y
>>>> CONFIG_USB_XHCI_PCI=y
>>>> CONFIG_VFIO=y
>>>> CONFIG_VFIO_PCI=y
>>>> CONFIG_VGA=y
>>>> CONFIG_VGA_PCI=y
>>>> CONFIG_VHOST_USER=y
>>>> CONFIG_VIRTIO_PCI=y
>>>> CONFIG_VIRTIO_VGA=y
>>>> CONFIG_WDT_IB6300ESB=y
>>>> CONFIG_XICS=y
>>>> CONFIG_XIVE=y
>>>> CONFIG_TPM=y
>>>> CONFIG_TPM_SPAPR=y
>>>> CONFIG_TPM_EMULATOR=y
>>>> EOF
>>>>
>>>> $ mkdir build
>>>> $ cd build
>>>>
>>>> $ ../configure --cc=clang --cxx=/bin/false --prefix=/usr --libdir=/usr/lib64 --datadir=/usr/share --sysconfdir=/etc --interp-prefix=/usr/qemu-%M --localstatedir=/var --docdir=/usr/share/doc --libexecdir=/usr/libexec '--extra-ldflags=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,now   ' '--extra-cflags=-O2 -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS --config /usr/lib/rpm/redhat/redhat-hardened-clang.cfg -fstack-protector-strong   -m64 -mcpu=power9 -mtune=power9 -fasynchronous-unwind-tables -fstack-clash-protection -Wno-string-plus-int' --with-pkgversion=qemu-kvm-7.0.0-1.el9 --with-suffix=qemu-kvm --firmwarepath=/usr/share/qemu-firmware:/usr/share/ipxe/qemu:/usr/share/seavgabios:/usr/share/seabios --meson=internal --enable-trace-backend=dtrace --with-coroutine=ucontext --with-git=git --tls-priority=@QEMU,SYSTEM --audio-drv-list= --disable-alsa --disable-attr --disable-auth-pam --disable-avx2 
>>>> --disable-avx512f --disable-block-drv-whitelist-in-tools --disable-bochs --disable-bpf --disable-brlapi --disable-bsd-user --disable-bzip2 --disable-cap-ng --disable-capstone --disable-cfi --disable-cfi-debug --disable-cloop --disable-cocoa --disable-coreaudio --disable-coroutine-pool --disable-crypto-afalg --disable-curl --disable-curses --disable-dbus-display --disable-debug-info --disable-debug-mutex --disable-debug-tcg --disable-dmg --disable-docs --disable-dsound --disable-fdt --disable-fuse --disable-fuse-lseek --disable-gcrypt --disable-gettext --disable-gio --disable-glusterfs --disable-gnutls --disable-gtk --disable-guest-agent --disable-guest-agent-msi --disable-hax --disable-hvf --disable-iconv --disable-jack --disable-kvm --disable-l2tpv3 --disable-libdaxctl --disable-libiscsi --disable-libnfs --disable-libpmem --disable-libssh --disable-libudev --disable-libusb --disable-linux-aio --disable-linux-io-uring --disable-linux-user --disable-live-block-migration 
>>>> --disable-lto --disable-lzfse --disable-lzo --disable-malloc-trim --disable-membarrier --disable-modules --disable-module-upgrades --disable-mpath --disable-multiprocess --disable-netmap --disable-nettle --disable-numa --disable-nvmm --disable-opengl --disable-oss --disable-pa --disable-parallels --disable-pie --disable-pvrdma --disable-qcow1 --disable-qed --disable-qga-vss --disable-qom-cast-debug --disable-rbd --disable-rdma --disable-replication --disable-rng-none --disable-safe-stack --disable-sanitizers --disable-sdl --disable-sdl-image --disable-seccomp --disable-selinux --disable-slirp --disable-slirp-smbd --disable-smartcard --disable-snappy --disable-sparse --disable-spice --disable-spice-protocol --disable-strip --disable-system --disable-tcg --disable-tools --disable-tpm --disable-u2f --disable-usb-redir --disable-user --disable-vde --disable-vdi --disable-vhost-crypto --disable-vhost-kernel --disable-vhost-net --disable-vhost-scsi --disable-vhost-user 
>>>> --disable-vhost-user-blk-server --disable-vhost-vdpa --disable-vhost-vsock --disable-virglrenderer --disable-virtfs --disable-virtiofsd --disable-vnc --disable-vnc-jpeg --disable-vnc-sasl --disable-vte --disable-vvfat --disable-werror --disable-whpx --disable-xen --disable-xen-pci-passthrough --disable-xkbcommon --disable-zstd --with-git-submodules=ignore --without-default-devices --with-devices-ppc64=ppc64-rh-devices --target-list=ppc64-softmmu --block-drv-rw-whitelist=qcow2,raw,file,host_device,nbd,iscsi,rbd,blkdebug,luks,null-co,nvme,copy-on-read,throttle,compress --block-drv-ro-whitelist=vdi,vmdk,vhdx,vpc,https --enable-attr --enable-cap-ng --enable-capstone=internal --enable-coroutine-pool --enable-curl --enable-debug-info --enable-docs --enable-fdt=system --enable-gnutls --enable-guest-agent --enable-iconv --enable-kvm --enable-libusb --enable-libudev --enable-linux-aio --enable-lzo --enable-malloc-trim --enable-modules --enable-mpath --enable-numa --enable-pa 
>>>> --enable-pie --enable-rbd --enable-rdma --enable-seccomp --enable-selinux --enable-slirp=system --enable-snappy --enable-spice-protocol --enable-system --enable-tcg --enable-tools --enable-tpm --enable-vdi --enable-virtiofsd --enable-vhost-kernel --enable-vhost-net --enable-vhost-user --enable-vhost-user-blk-server --enable-vhost-vdpa --enable-vhost-vsock --enable-vnc --enable-vnc-sasl --enable-werror --enable-xkbcommon
>>>>
>>>> $ make -O -j$(nproc) V=1 VERBOSE=1
>>>> ...
>>>> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
>>>> clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
>>>>
>>>> I have figured that it also fails with this minimal set of configure options
>>>> (in addition to the devices CONFIG_* options above):
>>>>
>>>> $ ../configure --without-default-devices --with-devices-ppc64=ppc64-rh-devices --target-list=ppc64-softmmu
>>>> $ make -j
>>>> ...
>>>> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data.rel+0x3228): undefined reference to `hmp_info_via'
>>>> collect2: error: ld returned 1 exit status
>>>>
>>>> Since TARGET_PPC is defined when building target ppc64-softmmu, the hmp_info_via will be referenced when processing the hmp-commands-info.hx.
>>>> However, hmp_info_via implementation resides on hw/misc/mos6522.c, which is built only if CONFIG_MOS6522 is defined, as per hw/misc/meson.build.
>>>>
>>>> If hmp_info_via is generic enough and not device-specific, it could be moved out of mos6522.c to somewhere else.
>>>>
>>>> What do you think?
>>>>
>>>> [0] https://gitlab.com/redhat/centos-stream/rpms/qemu-kvm/-/blob/c9s/qemu-kvm.spec#L686
>>>
>>> It's probably easier if I post a link to the original thread at https://lore.kernel.org/all/20220127205405.23499-9-mark.cave-ayland@ilande.co.uk/ for reference but the main takeaway is:
>>>
>>> - Device CONFIG_* defines aren't present when building hmp-commands-info.hx
>>>
>>> - The TARGET_* defines are poisoned in qapi/qapi-commands-misc-target.h
>>>
>>> - The long-term solution is to implement a DeviceClass function callback that allows
>>>    "info debug <foo>" QMP-wrapped monitor commands to be registered dynamically by
>>>    devices. But that needs someone with the time and ability to implement it.
>>>
>>> The compromise was to accept the command wrapped by TARGET_ defines where it is used, but of course that won't work in this case where you're generating a custom configuration as above.
>>>
>>> Certainly QEMU could do better here, but then if you are already patching the build to generate a custom configuration as above, you might as well just patch out the relevant part of hmp-commands-info.hx at the same time until proper per-device HMP/QMP support is added.
>>
>> We are not patching the build.  We are just configuring it.
> 
> That's not true though: the spec file linked above contains 20 patches to the vanilla QEMU source, including feeding custom device lists into the build system via https://gitlab.com/redhat/centos-stream/rpms/qemu-kvm/-/blob/c9s/0005-Enable-disable-devices-for-RHEL.patch.

I'm sorry.  I think I wasn't clear enough.

The reproducer I sent in the email was *adapted* from CentOS/RHEL qemu-kvm.spec.
Meaning that we configured the devices in the same way that the CentOS/RHEL package is configuring but used the unmodified QEMU source tree from upstream.

I did that because I wanted to mimic its configuration (devices and configure options) against the upstream code to determine if the failure was a downstream or upstream issue.
It turns out it's an upstream regression.

> Perhaps CONFIG_MOS6522 is missing from ppc64-rh-devices?

I don't think so.  Since the CONFIG_MOS6522 is available, one can build without it and code should cope with that.

> If you need to generate a build within a short timeframe then patching out the part of the build that fails for you is going to be the quickest solution.
> 
>> QEMU at tag v6.2.0 works with the exact same configuration.
>> QEMU 7.0.0 does not.
>> This is a regression in QEMU source code.
> 
> I've just tried a plain "./configure --target-list=ppc64-softmmu" build here on my x86_64 host using git master and everything builds fine, and of course it passes gitlab-CI since that is a pre-requisite for merging. The only thing I can think is that your RHEL ppc64 build is being patched to remove the Mac machines which is why you see the failure, in which case you should also update the patch to remove the part referencing hmp_info_via.

You need to configure the devices in order to reproduce the build issue.

Let me paste again the commands here in case you want to give them a try:

cat > configs/devices/rh-virtio.mak <<"EOF"
CONFIG_VIRTIO=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_BLK=y
CONFIG_VIRTIO_GPU=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_INPUT_HOST=y
CONFIG_VIRTIO_NET=y
CONFIG_VIRTIO_RNG=y
CONFIG_VIRTIO_SCSI=y
CONFIG_VIRTIO_SERIAL=y
EOF

cat > configs/devices/ppc64-softmmu/ppc64-rh-devices.mak <<"EOF"
include ../rh-virtio.mak
CONFIG_DIMM=y
CONFIG_MEM_DEVICE=y
CONFIG_NVDIMM=y
CONFIG_PCI=y
CONFIG_PCI_DEVICES=y
CONFIG_PCI_TESTDEV=y
CONFIG_PCI_EXPRESS=y
CONFIG_PSERIES=y
CONFIG_SCSI=y
CONFIG_SPAPR_VSCSI=y
CONFIG_TEST_DEVICES=y
CONFIG_USB=y
CONFIG_USB_OHCI=y
CONFIG_USB_OHCI_PCI=y
CONFIG_USB_SMARTCARD=y
CONFIG_USB_STORAGE_CORE=y
CONFIG_USB_STORAGE_CLASSIC=y
CONFIG_USB_XHCI=y
CONFIG_USB_XHCI_NEC=y
CONFIG_USB_XHCI_PCI=y
CONFIG_VFIO=y
CONFIG_VFIO_PCI=y
CONFIG_VGA=y
CONFIG_VGA_PCI=y
CONFIG_VHOST_USER=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_VGA=y
CONFIG_WDT_IB6300ESB=y
CONFIG_XICS=y
CONFIG_XIVE=y
CONFIG_TPM=y
CONFIG_TPM_SPAPR=y
CONFIG_TPM_EMULATOR=y
EOF

mkdir build && cd build

../configure --without-default-devices --with-devices-ppc64=ppc64-rh-devices --target-list=ppc64-softmmu
make -j

> 
>> Is my ideia of moving the hmp_info_via implementation out of mos6522.c an acceptable way to have this fixed in the short-term?
> 
> The current solution was agreed after discussions with David and Daniel (the HMP and QMP maintainers) so they are the people who can advise you as to the best approach here.

David, Daniel - any recommendation to fix this regression?

> Unfortunately QEMU changes can involve testing an N x M matrix which gets even bigger when different accelerators are involved, so occassionally issues like this can still occur.

Indeed.  We can't predict what downstream or users will specify for device and configure options.

> 
> If you feel strongly that upstream should support this particular RHEL configuration then please consider adding it to gitlab-CI so that build issues like this can be detected before merge.

That's certainly a good idea.

-- 
Murilo

