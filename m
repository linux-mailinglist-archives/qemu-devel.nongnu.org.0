Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F06124790
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 14:04:55 +0100 (CET)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihZ0Y-0005bV-20
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 08:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1ihYF7-0007JA-HL
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:15:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1ihYF6-000759-0I
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:15:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57960
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1ihYF5-00070v-NC
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:15:51 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBICCqQ6106417
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 07:15:47 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wykfx1bau-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 07:15:47 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 18 Dec 2019 12:15:45 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Dec 2019 12:15:43 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBICFgTg36634758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 12:15:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA28811C050;
 Wed, 18 Dec 2019 12:15:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A31711C075;
 Wed, 18 Dec 2019 12:15:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.58.206])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 12:15:40 +0000 (GMT)
Subject: Re: [PATCH v3 4/4] pc-bios/s390x: Fix reset psw mask
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20191203132813.2734-1-frankja@linux.ibm.com>
 <20191203132813.2734-5-frankja@linux.ibm.com>
 <20191205111239.01e7b114.cohuck@redhat.com>
 <20191213130616.7da8136c.cohuck@redhat.com>
 <7d8f46eb-a08c-a678-1638-4634a6e675a3@redhat.com>
 <e049b13a-5094-cd42-72d9-a5cfdca01d78@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Wed, 18 Dec 2019 13:15:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e049b13a-5094-cd42-72d9-a5cfdca01d78@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nP6fu9UJ2R5kFCgF2PxD1Xm99p3NZtOqU"
X-TM-AS-GCONF: 00
x-cbid: 19121812-0016-0000-0000-000002D62647
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121812-0017-0000-0000-00003338645B
Message-Id: <f4d90d3b-7c73-c175-09af-ea81181ce724@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_03:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180102
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nP6fu9UJ2R5kFCgF2PxD1Xm99p3NZtOqU
Content-Type: multipart/mixed; boundary="LZ8OkGABXRxiArwfEPHmrTgHqPCxaZo1Q"

--LZ8OkGABXRxiArwfEPHmrTgHqPCxaZo1Q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/17/19 4:09 PM, Thomas Huth wrote:
> On 17/12/2019 13.36, Thomas Huth wrote:
>> On 13/12/2019 13.06, Cornelia Huck wrote:
>>> On Thu, 5 Dec 2019 11:12:39 +0100
>>> Cornelia Huck <cohuck@redhat.com> wrote:
>>>
>>>> On Tue,  3 Dec 2019 08:28:13 -0500
>>>> Janosch Frank <frankja@linux.ibm.com> wrote:
>>>>
>>>>> We need to set the short psw indication bit in the reset psw, as it=
 is
>>>>> a short psw.
>>>>>
>>>>> fixes: 9629823290 ("pc-bios/s390-ccw: do a subsystem reset before r=
unning the guest")
>>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>>> ---
>>>>>  pc-bios/s390-ccw/jump2ipl.c | 12 +++++++-----
>>>>>  1 file changed, 7 insertions(+), 5 deletions(-) =20
>>>>
>>>> Thanks, applied (together with a rebuild of the bios images.)
>>>
>>> This unfortunately breaks 'make check-qtest-s390x':
>>>
>>>    TEST    check-qtest-s390x: tests/boot-serial-test
>>>    TEST    check-qtest-s390x: tests/pxe-test
>>> ERROR - too few tests run (expected 1, got 0)
>>>
>>> When I revert this, the rebuild, and "s390x: Properly fetch and test
>>> the short psw on diag308 subc 0/1" (as it exposes the bug this commit=

>>> tried to fix), everything passes again. No idea what is wrong, though=
 :(
>>>
>>> For now, I've dropped the three patches mentioned above from the
>>> s390-next branch (I plan to send a pull request later). Let's fix thi=
s
>>> on top once we figured out whatever went wrong, no need to rush here.=

>>
>> I think I might have found the problem. You now need this patch on top=

>> to get it working again:
>>
>> diff a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
>> --- a/pc-bios/s390-ccw/jump2ipl.c
>> +++ b/pc-bios/s390-ccw/jump2ipl.c
>> @@ -18,7 +18,7 @@
>>  typedef struct ResetInfo {
>>      uint64_t ipl_psw;
>>      uint32_t ipl_continue;
>> -} ResetInfo;
>> +} __attribute__((packed)) ResetInfo;
>>
>>  static ResetInfo save;
>>
>> Without this patch, there is now a 32-bit padding in the struct. Not
>> sure why it then fails (I had a quick look at the disassembly of
>> jump2ipl.o and could not spot anything that was obviously wrong), but =
if
>> I mark the struct as "packed" to get the old size again, then the
>> pxe-test is working fine for me again.
>=20
> Never mind, the problem was not in the jump2ipl.c code, but in the
> pxe-test: The code only worked if the r3 register contained only zeroes=

> in the upper bits. The changes to jump2ipl.c here caused the compiler t=
o
> put a different value in r3, so the test suddenly crashed. I've now sen=
t
> a patch to fix the test ("tests/boot-sector: Fix the bad s390x assemble=
r
> code").
>=20
>  Thomas

Thank you a lot for having a look into that!




--LZ8OkGABXRxiArwfEPHmrTgHqPCxaZo1Q--

--nP6fu9UJ2R5kFCgF2PxD1Xm99p3NZtOqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl36GGwACgkQ41TmuOI4
ufiKbA//aCVSySl03zEnW7LalEiON7LoI/0yGw88CxvAogodk5lktchHXdEI/3dn
CarAvoUPGN2qb//t87tPNB2eeJ+VEqsOMotT9QJxTIu060Su4392poWvBzDruQvW
WLoMmGXf+bSn/oRYhtmasI57Yu7X/O53kiRcw/RLr83RSWXMlZUJEETwdeosU2Q4
+bbrXW6nhus/zRl1yVPVWyrotPVG93ptFOGI+n4arSNFwkuh9CupDce7aP937sBU
b/NYuZqmXPZG9sfWAbMYRqjknyd9xCAQhBVAsw/YFKkEZtW3yyHT+wf4sYnv9pv2
DHt5sql53hMWIczkBdenjquRVJYRzYmcEfTNeCUqwwlIDMkdx18uLirwTEx7WdqZ
1lu35hGrQiVyH2tvQLxiXS6cHNFpP5JxPAyYAnL/T23pVsdMeqjddLaMmZWF6AUe
ofjOs47K6Fwbldz4VaNvA7jtRD2fplPfNl/LcdkraDX+NH2K4EwT6pAm/9th/2vM
5tZJOdeCB+gPWwQOw49iUu10Yor7u8A8RRGq5YyGundn5ixiLZjSyEUW2QPgyZKU
2X6MqP3ecI9NcXSr5RsSrvEPqYdp2gmpj9K0pdWzzx2UQdIe5xp2l8j6PmEFdM7k
FEP0hW4zS0DPVbyOCRe9Dw+jytj5GHlf0185irO9nw+TTmZszMI=
=MdLW
-----END PGP SIGNATURE-----

--nP6fu9UJ2R5kFCgF2PxD1Xm99p3NZtOqU--


