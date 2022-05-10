Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6B52113A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:43:06 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMOX-0003p0-Q4
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1noLrr-0006NE-UT; Tue, 10 May 2022 05:09:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1noLrW-0005e0-QZ; Tue, 10 May 2022 05:09:15 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A8xP7O030026;
 Tue, 10 May 2022 09:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n/8ynRy/H3d89EI+khOzrE0T7mfQnjFWRaeJPQCKPsk=;
 b=ocialjEECe94m04/s4nDvgYziZaS7yXMW5RHmyG/deQ8+dFmNrt1RQ2Iz4aPwCXp/is2
 uvCGyqaUNLfdhjiZm91NW+XfMIbtNLM8E/wb5wgsAPlz65YPHbj1JJEHppIQy/vkJze8
 tZtB4q6TpDI3uAg7fo0eWjjLSng24V2BUe+KN/OcYY7RStsMn7/FvOerehc+CrnKXxLD
 VRB2RgAKVS2PXmH5PioGF0DSA4+mw/olG+Chnvs2MkrJ4Yd6Xirk8+29NYKAywkoWBVj
 4Fr9i8dXxyauJDA+TIEt7bpCNMy4yr39RfPW2k8tI60ISE85JBIPuP4OsudhIcLesc7K 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyn1005ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:07:27 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24A8xQob030060;
 Tue, 10 May 2022 09:07:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyn1005bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:07:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24A93AXO009273;
 Tue, 10 May 2022 09:07:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fwg1j3rxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:07:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24A975vm28967184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 09:07:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2F00AE053;
 Tue, 10 May 2022 09:07:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ED17AE055;
 Tue, 10 May 2022 09:07:21 +0000 (GMT)
Received: from [9.145.178.29] (unknown [9.145.178.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 May 2022 09:07:21 +0000 (GMT)
Message-ID: <e953d8a6-e6e2-d124-c8f8-d2974b7a0e37@linux.ibm.com>
Date: Tue, 10 May 2022 11:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/17] powernv: introduce pnv-phb unified devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220507190624.507419-1-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8yPGC0BTPSfyin-EdV_7jTjvPDSL4xNZ
X-Proofpoint-GUID: I9EZP5UmfWbzjtbxmvzKc_6xYqn_U6e2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100039
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/05/2022 21:06, Daniel Henrique Barboza wrote:
> Hi,
> 
> Since the 7.0.0 release cycle we have a desire to use the powernv
> emulation with libvirt. To do that we need to enable user creatable
> pnv-phb devices to allow more user customization an to avoid spamming
> multiple default devices in the domain XML. In the middle of the
> previous cycle we experimented with user created
> pnv-phb3/pnv-phb3-root-port/pnv-phb4/pnv-phb4-root-port/pnv-phb5. The
> end result, although functional, is that the user needs to deal with a
> lot of versioned devices that, from the user perspective, does the same
> thing. In a way we outsourced the implementation details of the PHBs
> (e.g. pnv8 uses phb3, pnv9 uses phb4) to the command line. Having more
> devices also puts an extra burden in the libvirt support we want to
> have.
> 
> To solve this, Cedric and Frederic gave the idea of adding a common
> virtual pnv-phb device that the user can add in the command line, and
> QEMU handles the details internally. Unfortunatelly this idea turned out
> to be way harder than anticipated. Between creating a device that would
> just forward the callbacks to the existing devices internally, creating
> a PnvPHB device with the minimal attributes and making the other devices
> inherit from it, and making an 'abstract' device that could be casted
> for both phb3 and phb4 PHBs, all sorts of very obscure problems occured:
> PHBs not being detected, interrupts not being delivered and memory
> regions not being able to read/write registers. My initial impression is
> that there are assumptions made both in ppc/pnv and hw/pci-host that
> requires the memory region and the bus being in the same device. Even
> if we somehow figure all this out, the resulting code is hacky and
> annoying to maitain.
> 
> This brings us to this series. The cleaner way I found to accomplish
> what we want to do is to create real, unified pnv-phb/phb-phb-root-port
> devices, and get rid of all the versioned ones. This is done by
> merging all the PHB3/PHB4 attributes in unified devices. pnv_phb3* and pnv_phb4*
> files end up using the same pnv-phb and phb-phb-root-port unified devices,
> with the difference that pnv_phb3* only cares about version 3 attributes
> and pnv_phb4* only cares about PHB4 attributes. Introducing new PHB
> versions in the future will be a matter of adding any non-existent
> attributes in the unified pnv-phb* devices and using them in separated
> pnv_phbN* files.
> 
> The pnv-phb implementation per se is just a router for either phb3 or
> phb4 logic, done in init() and realize() time, after we check which powernv
> machine we're running. If running with powernv8 we redirect control to
> pnv_phb3_realize(), otherwise we redirect to pnv_phb4_realize(). The
> unified device does not do anything per se other than handling control
> to the right version.
> 
> After this series, this same powernv8 command line that boots a powernv8
> machine with some phbs and root ports and with network:
> 
> ./qemu-system-ppc64 -m 4G \
> -machine powernv8 -smp 2,sockets=2,cores=1,threads=1  \
> -accel tcg,thread=multi -bios skiboot.lid  \
> -kernel vmlinux -initrd buildroot.rootfs.cpio -append 'console=hvc0 ro xmon=on'  \
> -nodefaults  -serial mon:stdio -nographic  \
> -device pnv-phb,chip-id=0,index=0,id=pcie.0 \
> -device pnv-phb,chip-id=0,index=1,id=pcie.1 \
> -device pnv-phb,chip-id=1,index=2,id=pcie.2 \
> -device pnv-phb-root-port,id=root0,bus=pcie.2 \
> -device pnv-phb-root-port,id=root1,bus=pcie.1 \
> -device pcie-pci-bridge,id=bridge1,bus=root0,addr=0x0  \
> -device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234  \
> -drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none  \
> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
> -device nec-usb-xhci,bus=bridge1,addr=0x2
> 
> 
> Can be used to boot powernv9 and powernv10 machines with the same attributes
> just by changing the machine type.
> 


Hello Daniel,

Thanks for trying to cleanup the phb3 and phb4 implementations!
Like you I'm sure, I'm not fond of that big struct PnvPHB, which is 
accumulating all the states of all the PHB versions. It's likely going 
to grow, with most of it being unused. I was about to suggest if it was 
possible to at least have a union for the phb3- or phb4-specific 
attributes, but I'm glad to see that Mark is helping and hasn't given up 
trying to fix it by using a parent object. Hopefully we can make it work.

Some random comments, which may or may not hold depending on how it is 
reworked:
- IODA2 is the I/O Design Architecture used by phb3 and IODA3 is used by 
phb4. So while it makes sense to use the "ioda2_" prefix for phb3, it is 
counter-intuitive to use the "ioda_" prefix for attributes related to phb4.

- the struct PnvPhb3DMASpace and struct PnvPhb4DMASpace are almost 
identical, save for the type of the backpointer to the PHB. It would be 
nice if we could merge them.

   Fred


> Daniel Henrique Barboza (17):
>    ppc/pnv: rename PnvPHB3.ioda* to PnvPHB3.ioda2*
>    ppc/pnv: rename PnvPHB3.regs[] to PnvPHB3.regs3[]
>    ppc/pnv: rename PnvPHB3.dma_spaces to PnvPHB3.v3_dma_spaces
>    ppc/pnv: add unified pnv-phb header
>    ppc/pnv: add pnv-phb device
>    ppc/pnv: remove PnvPHB3
>    ppc/pnv: user created pnv-phb for powernv8
>    ppc/pnv: remove PnvPHB4
>    ppc/pnv: user creatable pnv-phb for powernv9
>    ppc/pnv: use PnvPHB.version
>    ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>    ppc/pnv: user creatable pnv-phb for powernv10
>    ppc/pnv: add pnv_phb_get_current_machine()
>    ppc/pnv: add pnv-phb-root-port device
>    ppc/pnv: remove pnv-phb3-root-port
>    ppc/pnv: remove pnv-phb4-root-port
>    ppc/pnv: remove pecc->rp_model
> 
>   hw/pci-host/meson.build        |   3 +-
>   hw/pci-host/pnv_phb.c          | 258 ++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb3.c         | 256 +++++++++++-----------------
>   hw/pci-host/pnv_phb3_msi.c     |  12 +-
>   hw/pci-host/pnv_phb3_pbcq.c    |   8 +-
>   hw/pci-host/pnv_phb4.c         | 298 ++++++++++++---------------------
>   hw/pci-host/pnv_phb4_pec.c     |  14 +-
>   hw/ppc/pnv.c                   |  41 ++++-
>   include/hw/pci-host/pnv_phb.h  | 224 +++++++++++++++++++++++++
>   include/hw/pci-host/pnv_phb3.h | 118 +------------
>   include/hw/pci-host/pnv_phb4.h | 108 ++----------
>   include/hw/ppc/pnv.h           |   3 +-
>   12 files changed, 757 insertions(+), 586 deletions(-)
>   create mode 100644 hw/pci-host/pnv_phb.c
>   create mode 100644 include/hw/pci-host/pnv_phb.h
> 

