Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E418B2DC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 12:59:12 +0100 (CET)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEtpP-0004pu-5Q
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 07:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jEtoM-0003ha-T8
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jEtoL-0001NK-QW
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:58:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6522
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jEtoL-0001N3-LO
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:58:05 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JBWdAH033543
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 07:58:05 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7ad91x4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 07:58:04 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 19 Mar 2020 11:58:03 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Mar 2020 11:58:01 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02JBw09S67043446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 11:58:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3288EA405D;
 Thu, 19 Mar 2020 11:58:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3214A4053;
 Thu, 19 Mar 2020 11:57:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.146.136])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 11:57:59 +0000 (GMT)
Subject: Re: [PATCH v10 03/16] s390x: protvirt: Support unpack facility
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20200318143047.2335-1-frankja@linux.ibm.com>
 <20200318143047.2335-4-frankja@linux.ibm.com>
 <20200319120848.19b34cb8.cohuck@redhat.com>
 <e15c18a9-6c94-379d-cd99-eed63c90fb88@linux.ibm.com>
 <aa6d4de2-2971-d1de-1c1d-69db99b56cee@de.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 19 Mar 2020 12:57:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <aa6d4de2-2971-d1de-1c1d-69db99b56cee@de.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IDCDLD82Ay6cJ6X4GqXyjiC9de7cATZWi"
X-TM-AS-GCONF: 00
x-cbid: 20031911-0028-0000-0000-000003E78724
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031911-0029-0000-0000-000024ACE22A
Message-Id: <655cfac5-93fc-c4ea-01a1-9ab1a4b3d6ff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_03:2020-03-19,
 2020-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003190051
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IDCDLD82Ay6cJ6X4GqXyjiC9de7cATZWi
Content-Type: multipart/mixed; boundary="N2pinggk27BYhHL0TPJ5YjIwJYptZUVmk"

--N2pinggk27BYhHL0TPJ5YjIwJYptZUVmk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/19/20 12:57 PM, Christian Borntraeger wrote:
>=20
>=20
> On 19.03.20 12:55, Janosch Frank wrote:
>> On 3/19/20 12:08 PM, Cornelia Huck wrote:
>>> On Wed, 18 Mar 2020 10:30:34 -0400
>>> Janosch Frank <frankja@linux.ibm.com> wrote:
>>>
>>>> The unpack facility provides the means to setup a protected guest. A=

>>>> protected guest cannot be introspected by the hypervisor or any
>>>> user/administrator of the machine it is running on.
>>>>
>>>> Protected guests are encrypted at rest and need a special boot
>>>> mechanism via diag308 subcode 8 and 10.
>>>>
>>>> Code 8 sets the PV specific IPLB which is retained separately from
>>>> those set via code 5.
>>>>
>>>> Code 10 is used to unpack the VM into protected memory, verify its
>>>> integrity and start it.
>>>>
>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>> Co-developed-by: Christian Borntraeger <borntraeger@de.ibm.com> [Cha=
nges
>>>> to machine]
>>>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>>> Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
>>>> ---
>>>>  hw/s390x/Makefile.objs              |   1 +
>>>>  hw/s390x/ipl.c                      |  59 +++++++++++++-
>>>>  hw/s390x/ipl.h                      |  91 ++++++++++++++++++++-
>>>>  hw/s390x/pv.c                       |  98 +++++++++++++++++++++++
>>>
>>> More of an aside: In MAINTAINERS, this new file will be covered by th=
e
>>> general s390x section, the tcg section, and the s390-ccw-virtio machi=
ne
>>> section, but not by the kvm section. Do we want to tweak that?
>>
>> @Christian?
>=20
> Yes, pv.c should be covered by the KVM section.
>=20
>=20

Ok, I'll add it


--N2pinggk27BYhHL0TPJ5YjIwJYptZUVmk--

--IDCDLD82Ay6cJ6X4GqXyjiC9de7cATZWi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5zXkcACgkQ41TmuOI4
ufgsGw//UYiwLt61ZA/zK+ysuFn8mRHoTaoXipNMdgDeBvRyhs4saEtyNSJzOw3K
B7aDBekFCRrbByD0BnTFEkYeev1p1ykR8DH3fEwZice0tfeKXHlbGLMPDA0jPJrx
QZ3xvFuyd6s8eZWU3bcsOfbbqI0V5tQHG0dtdwl6VhyTyI6KhB2Fe2RPjt4Kpky1
P75arVOlcqixJgCNhaCHL4ZFHqIS2ipQ5vlehFKB5G4/ClldhCtaZXLw/KpDPbHS
47C9MDevCcwY+U3zc9Db/1R6h1l9+ocmh6WeV+OqeFfrPgawufCnptkZmYrbB6gG
peHII5HTmla0CAKipXZJiNNbYsoePWtrnme28ybLTLqt0WkkoOUo60xijQ8si0F+
KAWnX2cShQcroDQ3reWUWN+NGLY7J/1Tk2z5GFgYqAhWebWrpQjUg4QIw8Txmlni
VUVCq0jc3gEDUWOiaDCnwVXQ9wIyOgkYLNsmhFXxNcn+3Q1Oq/ZEJ3w8JhHpQ5Dc
2kc+C+0ycq6OOtXnrrJT0AMp96BtwYuHsqLCbH3Zt01yH4yoV5Kp46q+LIU94nOI
gsT0lJrlIw1whz4tym2qJxvXjtmxpJ1/SmfYiPZrlPH652iID5JmOegjgpDi0cJk
OnS7FgxmnNMhRrSV7n+RkRZ7v/xydlCGyiSc5er1+FC8OOVIqYE=
=fN3S
-----END PGP SIGNATURE-----

--IDCDLD82Ay6cJ6X4GqXyjiC9de7cATZWi--


