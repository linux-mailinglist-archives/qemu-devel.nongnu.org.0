Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E3490304
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:42:59 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MfJ-0007fw-RA
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1n9MXW-00055U-2F
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:34:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1n9MXU-0002sS-15
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:34:53 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H6QSkK032064; 
 Mon, 17 Jan 2022 07:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9hcsWQECMLjkxQkpY0ZdGTeHngwslcpcVMAJxNqy0Vo=;
 b=h1t8kdMLay6rjPa1B0aJPdQm8GBfWSApJ33hrZSLaNQX79FOBqjdD695hzhPoZ/Vp9h1
 2Fp+cM+lZ/8JoJtE1PL2ojKdQBh1aAgLKaysGOlTb+assUr9uNb2X+QVsrciWWsi23CK
 g3GR2xCdOT87tkmoFxdMv4MCHzBX/CRewkKNMTWwwk96oZQqDRkPoHU1Hm7NjqtQ8QyT
 irR+ZS2kscslo8Io29Z3j8Jw5ykva1hSBh/AkTIWWnPdZtIeZojxW/XMQDNxTfnTf5rW
 PzdTkYsAqFe62XMCXuXj7VkZRzBUR7ul35ViUJ2GzfSfOzB9BooES3fI7U1+aKItP4cf fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn36mh6gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:34:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H7YaMD006221;
 Mon, 17 Jan 2022 07:34:36 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn36mh6fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:34:36 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H7MKCG030433;
 Mon, 17 Jan 2022 07:34:35 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 3dknwa6a3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:34:35 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H7YYmq23003590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 07:34:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC66112064;
 Mon, 17 Jan 2022 07:34:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88263112063;
 Mon, 17 Jan 2022 07:34:31 +0000 (GMT)
Received: from [9.160.102.180] (unknown [9.160.102.180])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 07:34:31 +0000 (GMT)
Message-ID: <59d81ace-8a66-4ab4-2768-a68d302e62d8@linux.ibm.com>
Date: Mon, 17 Jan 2022 09:34:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] Improved support for AMD SEV firmware loading
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220113165511.46098-1-berrange@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <20220113165511.46098-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5mGEiwy4jfhAv-FvX-r7XX4IAfOJYSLT
X-Proofpoint-GUID: vzwChD4fvX_N7qIPUG3ZJMJDz6OoAih4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170048
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <Ashish.Kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[+cc Tom, Brijesh, Ashish - see SEV-related changes in this series]


On 13/01/2022 18:55, Daniel P. Berrangé wrote:
> The AMD SEV build of EDK2 only emits a single file, intended to be
> 
> mapped readonly. There is explicitly no separate writable VARS
> 
> store for persisting non-volatile firmware variables.
> 
> 
> 
> This can be used with QEMU's traditional pflash configuration
> 
> mechanism by only populating pflash0, leaving pflash1 unconfigured.
> 
> Conceptually, however, it is odd to be using pflash at all when we
> 
> have no intention of supporting any writable variables. The -bios
> 
> option should be sufficient for any firmware that is exclusively
> 
> readonly code.
> 
> 
> 
> 
> 
> A second issue is that the firmware descriptor schema does not allow
> 
> for describing a firmware that uses pflash, without any associated
> 
> non-volatile storage.
> 
> 
> 
> In docs/interop/firmware.json
> 
> 
> 
>  'struct' : 'FirmwareMappingFlash',
> 
>   'data'   : { 'executable'     : 'FirmwareFlashFile',
> 
>                'nvram-template' : 'FirmwareFlashFile' } }
> 
> 
> 
> Notice that nvram-template is mandatory, and when consuming these
> 
> files libvirt will thus complain if the nvram-template field is
> 
> missing.
> 
> 
> 
> We could in theory make nvram-template optional in the schema and
> 
> then update libvirt to take account of it, but this feels dubious
> 
> when we have a perfectly good way of describing a firmware without
> 
> NVRAM, using 'FirmwareMappingMemory' which is intended to be used
> 
> with QEMU's -bios option.
> 
> 
> 
> 
> 
> A third issue is in libvirt, where again the code handling the
> 
> configuration of pflash supports two scenarios
> 
> 
> 
>  - A single pflash image, which is writable
> 
>  - A pair of pflash images, one writable one readonly
> 
> 
> 
> There is no support for a single read-only pflash image in libvirt
> 
> today.
> 
> 
> 
> 
> 
> This all points towards the fact that we should be using -bios
> 
> to load the AMD SEV firmware build of EDK.
> 
> 
> 
> The only thing preventing us doing that is that QEMU does not
> 
> initialize the SEV firmware when using -bios. That is fairly
> 
> easily solved, as done in this patch series.
> 
> 
> 
> For testing I've launched QEMU in in these scenarios
> 
> 
> 
>   - SEV guest using -bios and boot from HD
> 
>   - SEV guest using pflash and boot from HD
> 
>   - SEV-ES guest using -bios and direct kernel boot
> 
>   - SEV-ES guest using pflash and direct kernel boot
> 
> 
> 
> In all these cases I was able to validate the reported SEV
> 
> guest measurement.
> 
> 


I'm having trouble testing this series (applied on top of master commit 69353c332c):
it hangs with -bios but works OK with pflash:

Here's with -bios:

$ sudo /home/dmurik/git/qemu/build/qemu-system-x86_64 -enable-kvm \
       -cpu host -machine q35 -smp 4 -m 2G \
       -machine confidential-guest-support=sev0 \
       -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x0 \
       -bios /home/dmurik/git/edk2/Build/AmdSev/DEBUG_GCC5/FV/OVMF.fd \
       -nographic \
       -global isa-debugcon.iobase=0x402 -debugcon file:ovmf-1.log \
       -monitor pty -trace 'enable=kvm_sev_*'

char device redirected to /dev/pts/14 (label compat_monitor0)
kvm_sev_init
kvm_sev_launch_start policy 0x0 session (nil) pdh (nil)
kvm_sev_change_state uninit -> launch-update
kvm_sev_launch_update_data addr 0x7f42e9bff010 len 0x400000
kvm_sev_change_state launch-update -> launch-secret
kvm_sev_launch_measurement data PF6n7+Vujx5sW8PC6iMRtHXfpXdJ4osbcfYvoknu7gg4ypMqs727NTzG86Ft8Llu
kvm_sev_launch_finish
kvm_sev_change_state launch-secret -> running


Here it hangs. The ovmf-1.log file is empty.

Notice that kvm_sev_launch_update_data is called, so the new
-bios behaviour is triggered correctly.  But the guest doesn't
start running.

Here is the guest's state:

(qemu) info registers
EAX=0000606b EBX=00001268 ECX=0000440c EDX=008328d2
ESI=000091e2 EDI=0000e9e3 EBP=0000a451 ESP=00009af0
EIP=00003612 EFL=00000082 [--S----] CPL=0 II=0 A20=1 SMM=0 HLT=0
ES =0000 00000000 0000ffff 00009300
CS =a76e 000a76e0 0000ffff 00009b00
SS =0000 00000000 0000ffff 00009300
DS =0000 00000000 0000ffff 00009300
FS =0000 00000000 0000ffff 00009300
GS =0000 00000000 0000ffff 00009300
LDT=0000 00000000 0000ffff 00008200
TR =0000 00000000 0000ffff 00008b00
GDT=     00000000 0000ffff
IDT=     00000000 0000ffff
CR0=60000010 CR2=00000000 CR3=00000000 CR4=00000000
DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 DR3=0000000000000000
DR6=00000000ffff0ff0 DR7=0000000000000400
EFER=0000000000000000
FCW=037f FSW=0000 [ST=0] FTW=00 MXCSR=00001f80
...

(qemu) info sev
handle: 1
state: running
build: 10
api version: 0.23
debug: on
key-sharing: on



If I try the same with pflash (instead of -bios), I get:

# sudo /home/dmurik/git/qemu/build/qemu-system-x86_64 -enable-kvm \
       -cpu host -machine q35 -smp 4 -m 2G \
       -machine confidential-guest-support=sev0 \
       -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x0 \
       -drive if=pflash,format=raw,unit=0,file=/home/dmurik/git/edk2/Build/AmdSev/DEBUG_GCC5/FV/OVMF.fd,readonly=on \
       -nographic \
       -global isa-debugcon.iobase=0x402 -debugcon file:ovmf-1.log \
       -monitor pty -trace 'enable=kvm_sev_*'

char device redirected to /dev/pts/14 (label compat_monitor0)
kvm_sev_init
kvm_sev_launch_start policy 0x0 session (nil) pdh (nil)
kvm_sev_change_state uninit -> launch-update
kvm_sev_launch_update_data addr 0x7f0343000000 len 0x400000
kvm_sev_change_state launch-update -> launch-secret
kvm_sev_launch_measurement data esqzlr4xX2eEY92xsKEKL7FyKRDW7VYiyIb+aXS4S/ctON2s1xxwFjAKU7ImfULJ
kvm_sev_launch_finish
kvm_sev_change_state launch-secret -> running
BdsDxe: failed to load Boot0003 "Grub Bootloader" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(B5AE312C-BC8A-43B1-9C62-EBB826DD5D07): Not
 Found


The "failed to load Grub" is what I expected. So this works OK. 
The ovmf-1.log file shows normal sequence of AmdSev boot. 


I tried the two options with the standard OvmfX64 package as well - same behaviour.


Do I need to build the OVMF file differently to use with -bios ?


-Dov


> 
> Daniel P. Berrangé (2):
> 
>   hw/i386: refactor logic for setting up SEV firmware
> 
>   hw/i386: support loading OVMF using -bios too
> 
> 
> 
>  hw/i386/pc_sysfw.c            | 24 +++---------------------
> 
>  hw/i386/pc_sysfw_ovmf-stubs.c | 10 ++++++++++
> 
>  hw/i386/pc_sysfw_ovmf.c       | 27 +++++++++++++++++++++++++++
> 
>  hw/i386/x86.c                 |  5 +++++
> 
>  include/hw/i386/pc.h          |  1 +
> 
>  5 files changed, 46 insertions(+), 21 deletions(-)
> 
> 
> 

