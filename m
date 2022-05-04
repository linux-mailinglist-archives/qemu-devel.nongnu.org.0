Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B02151A25E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:37:59 +0200 (CEST)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG8c-0005uf-6t
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nmFxo-0002N1-Lv; Wed, 04 May 2022 10:26:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nmFxm-0007kD-Hu; Wed, 04 May 2022 10:26:48 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244E63D7003391;
 Wed, 4 May 2022 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=wxWdJs3y737cncjU/lcDV+0YHbjVkz5cYRE7XM+z4iE=;
 b=acPxwEjhpMKTOfGYtzmIjzhLOGRM8ZQ0sjWyIrsFtfaoS2gb9TWADdpafqRLp2KBL1nV
 +6zLjH5MDneQQY0NVUhOaRJVAwxdoNCH1+PZsmW4H0PyGunJmNX0B1Srnj1YGoIrMw9j
 4sNM33AjkHCVj+DX+FOE5M7j9nNjZlhvIR1Tlua75DuGJOmNGu9eu3szIEyjOkLdYme9
 O/3DJ8F7T41gQX4IjIIiK16ljOaH38mXi8fW2vJwsYjZPkYg42Rk9qRoyG4MkG98AXiu
 9el/sCX/1fKgiXkYegpYS1Ep+Axdtu7w1rMAqC1d2ZSMZu9qT1W+DyQ07ppQLUfFjyiq ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3futa6h53q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 14:26:34 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 244E8POb011790;
 Wed, 4 May 2022 14:26:34 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3futa6h539-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 14:26:34 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 244EIDIG024663;
 Wed, 4 May 2022 14:26:33 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3frvr9u3ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 14:26:33 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 244EQWwq27656630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 14:26:32 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9F83AE064;
 Wed,  4 May 2022 14:26:32 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B9D0AE05C;
 Wed,  4 May 2022 14:26:30 +0000 (GMT)
Received: from localhost (unknown [9.160.62.101])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  4 May 2022 14:26:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, muriloo@linux.ibm.com,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
In-Reply-To: <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
Date: Wed, 04 May 2022 11:26:23 -0300
Message-ID: <87ilql9xww.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -vGUO5dgrZS6MK7Juz5tLdP2T5B-wmTw
X-Proofpoint-GUID: aaJU0DOTiEiKpOTD799RI_nFtP-tI9FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040090
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 03/05/2022 15:06, Fabiano Rosas wrote:
>
>> Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> writes:
>>=20
>>> $ cat > configs/devices/rh-virtio.mak <<"EOF"
>>> CONFIG_VIRTIO=3Dy
>>> CONFIG_VIRTIO_BALLOON=3Dy
>>> CONFIG_VIRTIO_BLK=3Dy
>>> CONFIG_VIRTIO_GPU=3Dy
>>> CONFIG_VIRTIO_INPUT=3Dy
>>> CONFIG_VIRTIO_INPUT_HOST=3Dy
>>> CONFIG_VIRTIO_NET=3Dy
>>> CONFIG_VIRTIO_RNG=3Dy
>>> CONFIG_VIRTIO_SCSI=3Dy
>>> CONFIG_VIRTIO_SERIAL=3Dy
>>> EOF
>>>
>>> $ cat > configs/devices/ppc64-softmmu/ppc64-rh-devices.mak <<"EOF"
>>> include ../rh-virtio.mak
>>> CONFIG_DIMM=3Dy
>>> CONFIG_MEM_DEVICE=3Dy
>>> CONFIG_NVDIMM=3Dy
>>> CONFIG_PCI=3Dy
>>> CONFIG_PCI_DEVICES=3Dy
>>> CONFIG_PCI_TESTDEV=3Dy
>>> CONFIG_PCI_EXPRESS=3Dy
>>> CONFIG_PSERIES=3Dy
>>> CONFIG_SCSI=3Dy
>>> CONFIG_SPAPR_VSCSI=3Dy
>>> CONFIG_TEST_DEVICES=3Dy
>>> CONFIG_USB=3Dy
>>> CONFIG_USB_OHCI=3Dy
>>> CONFIG_USB_OHCI_PCI=3Dy
>>> CONFIG_USB_SMARTCARD=3Dy
>>> CONFIG_USB_STORAGE_CORE=3Dy
>>> CONFIG_USB_STORAGE_CLASSIC=3Dy
>>> CONFIG_USB_XHCI=3Dy
>>> CONFIG_USB_XHCI_NEC=3Dy
>>> CONFIG_USB_XHCI_PCI=3Dy
>>> CONFIG_VFIO=3Dy
>>> CONFIG_VFIO_PCI=3Dy
>>> CONFIG_VGA=3Dy
>>> CONFIG_VGA_PCI=3Dy
>>> CONFIG_VHOST_USER=3Dy
>>> CONFIG_VIRTIO_PCI=3Dy
>>> CONFIG_VIRTIO_VGA=3Dy
>>> CONFIG_WDT_IB6300ESB=3Dy
>>> CONFIG_XICS=3Dy
>>> CONFIG_XIVE=3Dy
>>> CONFIG_TPM=3Dy
>>> CONFIG_TPM_SPAPR=3Dy
>>> CONFIG_TPM_EMULATOR=3Dy
>>> EOF
>>>
>>> $ mkdir build
>>> $ cd build
>>>
>>=20
>> <snip>
>>=20
>>> $ ../configure --without-default-devices --with-devices-ppc64=3Dppc64-r=
h-devices --target-list=3Dppc64-softmmu
>>> $ make -j
>>> ...
>>> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data.rel+0x3=
228): undefined reference to `hmp_info_via'
>>> collect2: error: ld returned 1 exit status
>>>
>>> Since TARGET_PPC is defined when building target ppc64-softmmu, the hmp=
_info_via will be referenced when processing the hmp-commands-info.hx.
>>> However, hmp_info_via implementation resides on hw/misc/mos6522.c, whic=
h is built only if CONFIG_MOS6522 is defined, as per hw/misc/meson.build.
>>=20
>> I think this particular problem you hit is due to the 64 bit devices
>> file including 32 bit as well:
>>=20
>> $ cat configs/devices/ppc64-softmmu/default.mak
>> # Default configuration for ppc64-softmmu
>>=20
>> # Include all 32-bit boards
>> include ../ppc-softmmu/default.mak <----- here
>>=20
>> # For PowerNV
>> CONFIG_POWERNV=3Dy
>>=20
>> # For pSeries
>> CONFIG_PSERIES=3Dy
>> ---
>>=20
>> So ppc64-softmmu doesn't quite do what it says on the tin. I think in
>> the long run we need to revisit the conversation about whether to keep
>> the 32 & 64 bit builds separate. It is misleading that you're explicitly
>> excluding ppc-softmmu from the `--target-list`, but a some 32 bit stuff
>> still comes along implicitly.
>
> Unfortunately for historical reasons it isn't quite that simple: the mac9=
9 machine in=20
> hw/ppc/mac_newworld.c is both a 32-bit and a 64-bit machine, but with a d=
ifferent PCI=20
> host bridge and a 970 CPU if run from qemu-system-ppc64. Unfortunately it=
 pre-dates=20
> my time working on QEMU's PPC Mac machines but I believe it was (is?) cap=
able of=20
> booting Linux, even though I doubt it accurately represents a real machin=
e.

Well, what you describe is fine in my view, the 64-bit machine uses
qemu-system-ppc64. If there is shared code with 32-bit, that is ok.

What I would like to understand is what is the community's direction
with this, do we want:

1) the 64-bit build to include all of the code and have it run all
   machines, or;

2) the 64-bit build to run only 64-bit machines and the 32-bit build to
   run only 32-bit machines.

There are things such as 'target_ulong' that go against #1, and this
thread shows that we're not doing #2 as well.

I know there have been discussions about this in the past but I couldn't
find them in the archives.

