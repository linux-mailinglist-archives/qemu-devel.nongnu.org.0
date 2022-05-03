Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30844518629
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:08:01 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltC3-0003Kj-P3
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nltAZ-0002eN-VE; Tue, 03 May 2022 10:06:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24782
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nltAY-00087J-7O; Tue, 03 May 2022 10:06:27 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243DOs3x000787;
 Tue, 3 May 2022 14:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=2SZwaatqeIxjP9qqUvzkM/JXdOIJwNh8nBrBn9L4qgg=;
 b=WW04NPXuxBnfqcOs14P2DT2Iam3g0TzeNBVLR1aLLcOuSxuzAihJiC5VoskwE2jUSWi/
 okUvza9RAw4DnbNgR96mzOgf6gdFGF6QEZDtlQP50IG1eVazM4H0J+of7G7Nm817/DET
 DPtbJowKOUMrG6zqYMssiOLWXs3JD122YxqWhHXZ1skjyz3mvkHsZzPSHsIaHzoEX3PC
 DTSH2KMKLbndtUdm37i6b4YtcfNMxLk8IzUA2fIIcWjZw4/hyq9KKmdcJ4bdY01vODav
 3ZwNO1RjKLUj/qe8CvPDIxwRHuz6EeK3eRU/zM0y0V3eme14X9VpWvXcK5kb0YK7ugJX fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu58s0ua3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 14:06:13 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243Du66m017083;
 Tue, 3 May 2022 14:06:13 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu58s0u9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 14:06:13 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243E20pl008096;
 Tue, 3 May 2022 14:06:12 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3frvr9hbjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 14:06:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 243E6Cik4326136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 14:06:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBF16AE062;
 Tue,  3 May 2022 14:06:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0BE8AE066;
 Tue,  3 May 2022 14:06:10 +0000 (GMT)
Received: from localhost (unknown [9.160.48.141])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  3 May 2022 14:06:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: muriloo@linux.ibm.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
In-Reply-To: <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
Date: Tue, 03 May 2022 11:06:08 -0300
Message-ID: <87sfpqaey7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s55X_aNjQmcgqrWT3abZKhvceImS4R2Q
X-Proofpoint-ORIG-GUID: YiHpYXVF69lWoY6CBu5Z5Y4bBoFa5c23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_05,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030102
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> writes:

> $ cat > configs/devices/rh-virtio.mak <<"EOF"
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_BLK=3Dy
> CONFIG_VIRTIO_GPU=3Dy
> CONFIG_VIRTIO_INPUT=3Dy
> CONFIG_VIRTIO_INPUT_HOST=3Dy
> CONFIG_VIRTIO_NET=3Dy
> CONFIG_VIRTIO_RNG=3Dy
> CONFIG_VIRTIO_SCSI=3Dy
> CONFIG_VIRTIO_SERIAL=3Dy
> EOF
>
> $ cat > configs/devices/ppc64-softmmu/ppc64-rh-devices.mak <<"EOF"
> include ../rh-virtio.mak
> CONFIG_DIMM=3Dy
> CONFIG_MEM_DEVICE=3Dy
> CONFIG_NVDIMM=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DEVICES=3Dy
> CONFIG_PCI_TESTDEV=3Dy
> CONFIG_PCI_EXPRESS=3Dy
> CONFIG_PSERIES=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SPAPR_VSCSI=3Dy
> CONFIG_TEST_DEVICES=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_OHCI=3Dy
> CONFIG_USB_OHCI_PCI=3Dy
> CONFIG_USB_SMARTCARD=3Dy
> CONFIG_USB_STORAGE_CORE=3Dy
> CONFIG_USB_STORAGE_CLASSIC=3Dy
> CONFIG_USB_XHCI=3Dy
> CONFIG_USB_XHCI_NEC=3Dy
> CONFIG_USB_XHCI_PCI=3Dy
> CONFIG_VFIO=3Dy
> CONFIG_VFIO_PCI=3Dy
> CONFIG_VGA=3Dy
> CONFIG_VGA_PCI=3Dy
> CONFIG_VHOST_USER=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_VGA=3Dy
> CONFIG_WDT_IB6300ESB=3Dy
> CONFIG_XICS=3Dy
> CONFIG_XIVE=3Dy
> CONFIG_TPM=3Dy
> CONFIG_TPM_SPAPR=3Dy
> CONFIG_TPM_EMULATOR=3Dy
> EOF
>
> $ mkdir build
> $ cd build
>

<snip>

> $ ../configure --without-default-devices --with-devices-ppc64=3Dppc64-rh-=
devices --target-list=3Dppc64-softmmu
> $ make -j
> ...
> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data.rel+0x322=
8): undefined reference to `hmp_info_via'
> collect2: error: ld returned 1 exit status
>
> Since TARGET_PPC is defined when building target ppc64-softmmu, the hmp_i=
nfo_via will be referenced when processing the hmp-commands-info.hx.
> However, hmp_info_via implementation resides on hw/misc/mos6522.c, which =
is built only if CONFIG_MOS6522 is defined, as per hw/misc/meson.build.

I think this particular problem you hit is due to the 64 bit devices
file including 32 bit as well:

$ cat configs/devices/ppc64-softmmu/default.mak=20
# Default configuration for ppc64-softmmu

# Include all 32-bit boards
include ../ppc-softmmu/default.mak <----- here

# For PowerNV
CONFIG_POWERNV=3Dy

# For pSeries
CONFIG_PSERIES=3Dy
---

So ppc64-softmmu doesn't quite do what it says on the tin. I think in
the long run we need to revisit the conversation about whether to keep
the 32 & 64 bit builds separate. It is misleading that you're explicitly
excluding ppc-softmmu from the `--target-list`, but a some 32 bit stuff
still comes along implicitly.

> If hmp_info_via is generic enough and not device-specific, it could be mo=
ved out of mos6522.c to somewhere else.

Perhaps it would be easier to just have a stub for the 64 bits build? Do
HMP commands get in any way enabled/disabled depending on the emulated
hw that is available? It might be ok to have a hmp_info_via that is a
noop in 64bit.

