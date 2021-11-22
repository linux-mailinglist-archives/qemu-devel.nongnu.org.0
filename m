Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CE459104
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:10:38 +0100 (CET)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAxo-000745-V0
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mpAv1-0004Ok-A7; Mon, 22 Nov 2021 10:07:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10928
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mpAuv-00013a-QC; Mon, 22 Nov 2021 10:07:43 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMDC3C2003008; 
 Mon, 22 Nov 2021 15:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=DZbVtHSHHSVcbuuFyjP5xwCXw3W8783RYovhsRTCU6s=;
 b=S2skZtYUtFncHaxQdUN1t2DSRxAeB36mBfwH/ELxaZYmhgwNBdxxMNiQu/SBBBmC+iBp
 tiL4ARd0ENuYLOSsup/4Slr1RKUpK04N0ri5vCLk4Ly4k4JIn7d9Hnw/8kO66X6/+viq
 Y6dJSC32B5pT7uI9o0toIOBGeTqgYm/hZKU44trA2qeBVuHU99fwtlVVqA7mqHg0wddG
 l3+TlNZqSguBW93qDPAYtAuUlhjDhLeI+uAyj18b1gIzq0ikJguubQlD9vORmVsdNZbs
 BcYslZIIpT+fuvACgKtzcHnGdyXmFW632i/ItD3WCm8tl3MZn7Z19TU6GgIkFmFU2R2M ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgbvf2q8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 15:07:32 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AMEvJLc019187;
 Mon, 22 Nov 2021 15:07:32 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgbvf2q7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 15:07:32 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AMF7LTa003327;
 Mon, 22 Nov 2021 15:07:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3cer9jf029-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 15:07:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AMF0KJI60621266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 15:00:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EDD942049;
 Mon, 22 Nov 2021 15:07:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B770942042;
 Mon, 22 Nov 2021 15:07:26 +0000 (GMT)
Received: from marcibm.linux.ibm.com (unknown [9.171.54.169])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 22 Nov 2021 15:07:26 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] s390x/ipl: support extended kernel command line size
In-Reply-To: <c44561b3-abdb-dcc8-bef0-fb546dc957a3@redhat.com>
References: <20211122112909.18138-1-mhartmay@linux.ibm.com>
 <c44561b3-abdb-dcc8-bef0-fb546dc957a3@redhat.com>
Date: Mon, 22 Nov 2021 16:07:26 +0100
Message-ID: <87lf1g44b5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y_vRdIV9EsVUPHHbwXimn8-6heYwlQA7
X-Proofpoint-GUID: LeryaucSJGYBIJQGW-KnbMKvE9DxYee8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_07,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111220077
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> On 22.11.21 12:29, Marc Hartmayer wrote:
>> In the past s390 used a fixed command line length of 896 bytes. This has=
 changed
>> with the Linux commit 5ecb2da660ab ("s390: support command lines longer =
than 896
>> bytes"). There is now a parm area indicating the maximum command line si=
ze. This
>> parm area has always been initialized to zero, so with older kernels thi=
s field
>> would read zero and we must then assume that only 896 bytes are availabl=
e.
>>=20
>> Acked-by: Viktor Mihajlovski <mihajlov@de.ibm.com>
>> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>> ---
>>  hw/s390x/ipl.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>> index 7ddca0127fc2..092c66b3f9f1 100644
>> --- a/hw/s390x/ipl.c
>> +++ b/hw/s390x/ipl.c
>> @@ -37,8 +37,9 @@
>>=20=20
>>  #define KERN_IMAGE_START                0x010000UL
>>  #define LINUX_MAGIC_ADDR                0x010008UL
>> +#define KERN_PARM_AREA_SIZE_ADDR        0x010430UL
>>  #define KERN_PARM_AREA                  0x010480UL
>> -#define KERN_PARM_AREA_SIZE             0x000380UL
>> +#define LEGACY_KERN_PARM_AREA_SIZE      0x000380UL
>>  #define INITRD_START                    0x800000UL
>>  #define INITRD_PARM_START               0x010408UL
>>  #define PARMFILE_START                  0x001000UL
>> @@ -110,6 +111,21 @@ static uint64_t bios_translate_addr(void *opaque, u=
int64_t srcaddr)
>>      return srcaddr + dstaddr;
>>  }
>>=20=20
>> +static uint64_t get_max_kernel_cmdline_size(void)
>> +{
>> +    uint64_t *size_ptr =3D rom_ptr(KERN_PARM_AREA_SIZE_ADDR, sizeof(*si=
ze_ptr));
>> +
>> +    if (size_ptr) {
>> +        uint64_t size;
>> +
>> +        size =3D be64_to_cpu(*size_ptr);
>> +        if (size !=3D 0) {
>
> Could do "if (size) {"

Ok.

>
>> +            return size;
>> +        }
>> +    }
>> +    return LEGACY_KERN_PARM_AREA_SIZE;
>> +}
>> +
>>  static void s390_ipl_realize(DeviceState *dev, Error **errp)
>>  {
>>      MachineState *ms =3D MACHINE(qdev_get_machine());
>> @@ -197,10 +213,11 @@ static void s390_ipl_realize(DeviceState *dev, Err=
or **errp)
>>              ipl->start_addr =3D KERN_IMAGE_START;
>>              /* Overwrite parameters in the kernel image, which are "rom=
" */
>>              if (parm_area) {
>> -                if (cmdline_size > KERN_PARM_AREA_SIZE) {
>> +                uint64_t max_cmdline_size =3D get_max_kernel_cmdline_si=
ze();
>
> We might want an empty line here.

Yep.

>
>> +                if (cmdline_size > max_cmdline_size) {
>>                      error_setg(errp,
>>                                 "kernel command line exceeds maximum siz=
e: %zu > %lu",
>> -                               cmdline_size, KERN_PARM_AREA_SIZE);
>> +                               cmdline_size, max_cmdline_size);
>>                      return;
>>                  }
>>=20=20
>>=20
>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks for the review!

>
> --=20
> Thanks,
>
> David / dhildenb
>
--=20
Kind regards / Beste Gr=C3=BC=C3=9Fe
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen=20
Gesch=C3=A4ftsf=C3=BChrung: Dirk Wittkopp
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

