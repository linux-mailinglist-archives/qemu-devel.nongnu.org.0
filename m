Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E442927C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:47:18 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwaD-0001dj-9k
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mZwXM-0008So-Pp; Mon, 11 Oct 2021 10:44:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mZwXJ-0002Vs-O2; Mon, 11 Oct 2021 10:44:19 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BEgoxv021376; 
 Mon, 11 Oct 2021 10:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=royV54fNLOxJx98FksApBfv9O7nhmhW49JN3mTc+++w=;
 b=o6GEszhWxz0DUeD+NWkjoE5NCX9ubry8jducDXu6FM8m5MWaZfw1hb/gZyNMKJ0fvu8Q
 0YZLBBxVyEKEZ18pXs42YqFj7/2PSHmUbmz/eA8ac0x2fu2ObPWQKvyJxRvJM5r7JtOI
 YeHTFvkD79fPVSAJk3o03CgRQcQD046VCzpjcSBxqN5SY3gNAYa6WgGtwHp1lIjrwqOC
 nCzL5w1jOjkNEY5wOp8FQo0dtvsJY1hUOHsK5NMJewe0cC1pCw4/05fWLrra6mmLeb0o
 Zfw8hAjrsP2BMmrp1t5eva9c4SRT3PXO7Nq6lLBaqBdgIumYoxQR9u4PhE/WYZLDrwwH 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmnxcsy2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 10:44:13 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19BEgodg021441;
 Mon, 11 Oct 2021 10:44:13 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmnxcsy1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 10:44:13 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BEbKJ0027993;
 Mon, 11 Oct 2021 14:44:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3bk2q9nma9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 14:44:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19BEcaFS46727558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 14:38:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F9EDA404D;
 Mon, 11 Oct 2021 14:44:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1FEAA4059;
 Mon, 11 Oct 2021 14:44:06 +0000 (GMT)
Received: from marcibm.linux.ibm.com (unknown [9.171.45.13])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 11 Oct 2021 14:44:06 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] s390x/ipl: check kernel command line size
In-Reply-To: <4683659f-1efe-7c1a-070e-21803f5c8100@redhat.com>
References: <20211006092631.20732-1-mhartmay@linux.ibm.com>
 <4683659f-1efe-7c1a-070e-21803f5c8100@redhat.com>
Date: Mon, 11 Oct 2021 16:44:05 +0200
Message-ID: <871r4r4o5m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5-cLZHZe-T_d4NuIMMPj-BHaoj8gunCs
X-Proofpoint-GUID: _OX6bu3eHQVX5JTT9HsVTkNSKNiCRslM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110085
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 06/10/2021 11.26, Marc Hartmayer wrote:
>> Check if the provided kernel command line exceeds the maximum size of th=
e s390x
>> Linux kernel command line size, which is 896 bytes.
>>=20
>> Reported-by: Sven Schnelle <svens@linux.ibm.com>
>> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>> ---
>>   hw/s390x/ipl.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>> index 1821c6faeef3..a58ea58cc736 100644
>> --- a/hw/s390x/ipl.c
>> +++ b/hw/s390x/ipl.c
>> @@ -38,6 +38,7 @@
>>   #define KERN_IMAGE_START                0x010000UL
>>   #define LINUX_MAGIC_ADDR                0x010008UL
>>   #define KERN_PARM_AREA                  0x010480UL
>> +#define KERN_PARM_AREA_SIZE             0x000380UL
>>   #define INITRD_START                    0x800000UL
>>   #define INITRD_PARM_START               0x010408UL
>>   #define PARMFILE_START                  0x001000UL
>> @@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev, Err=
or **errp)
>>            * loader) and it won't work. For this case we force it to 0x1=
0000, too.
>>            */
>>           if (pentry =3D=3D KERN_IMAGE_START || pentry =3D=3D 0x800) {
>> -            char *parm_area =3D rom_ptr(KERN_PARM_AREA, strlen(ipl->cmd=
line) + 1);
>> +            size_t cmdline_size =3D strlen(ipl->cmdline) + 1;
>> +            char *parm_area =3D rom_ptr(KERN_PARM_AREA, cmdline_size);
>> +
>>               ipl->start_addr =3D KERN_IMAGE_START;
>>               /* Overwrite parameters in the kernel image, which are "ro=
m" */
>>               if (parm_area) {
>> +                if (cmdline_size > KERN_PARM_AREA_SIZE) {
>> +                    error_setg(errp,
>> +                               "kernel command line exceeds maximum siz=
e: %lu > %lu",
>
> I think the first %lu should be %zd instead?

Yep, makes sense - thanks!

>
> Apart from that, the patch looks fine to me... so if you agree, I can fix=
=20
> that up when picking up the patch.

Thanks.

>
>   Thomas
>
>
>> +                               cmdline_size, KERN_PARM_AREA_SIZE);
>> +                    return;
>> +                }
>> +
>>                   strcpy(parm_area, ipl->cmdline);
>>               }
>>           } else {
>>=20
>
--=20
Kind regards / Beste Gr=C3=BC=C3=9Fe
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen=20
Gesch=C3=A4ftsf=C3=BChrung: Dirk Wittkopp
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

