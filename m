Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015F1152D0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:18:59 +0100 (CET)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idERd-0003lm-Mq
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1idEKI-0005Am-8h
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:11:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1idEKG-0003ws-Iq
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:11:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47500)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1idEKF-0003tZ-V1
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:11:20 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB69RT3W075829
 for <qemu-devel@nongnu.org>; Fri, 6 Dec 2019 04:30:15 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9g5v6mj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 04:30:15 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 6 Dec 2019 09:30:13 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 09:30:09 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB69U8N923068704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 09:30:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CC4711C052;
 Fri,  6 Dec 2019 09:30:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD56711C04A;
 Fri,  6 Dec 2019 09:30:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 09:30:06 +0000 (GMT)
Subject: Re: [PATCH v2 06/13] s390x: protvirt: KVM intercept changes
To: Cornelia Huck <cohuck@redhat.com>
References: <20191129094809.26684-1-frankja@linux.ibm.com>
 <20191129094809.26684-7-frankja@linux.ibm.com>
 <20191205181532.46bee55c.cohuck@redhat.com>
 <3cdbba69-c465-f2ce-d3e4-15e0b8d1218e@linux.ibm.com>
 <20191205184637.4e6f4d23.cohuck@redhat.com>
 <bc5eb50d-1647-f40a-73b6-53be5445fd85@linux.ibm.com>
 <20191206092913.3af251dd.cohuck@redhat.com>
 <c7490fc2-e706-bf51-9979-559a90c65f6c@linux.ibm.com>
 <20191206100821.06b933e8.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Fri, 6 Dec 2019 10:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191206100821.06b933e8.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XCkOthSP7zicKPp88Dmd9lBAZuwLoSdLY"
X-TM-AS-GCONF: 00
x-cbid: 19120609-0028-0000-0000-000003C5CCCB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120609-0029-0000-0000-00002488F1B3
Message-Id: <89bdb9af-d499-588b-9d05-09d83a66a9b4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_02:2019-12-04,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060081
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XCkOthSP7zicKPp88Dmd9lBAZuwLoSdLY
Content-Type: multipart/mixed; boundary="PQfNkW1ifFEebNM37lR9T2QykSFn917m8"

--PQfNkW1ifFEebNM37lR9T2QykSFn917m8
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/6/19 10:08 AM, Cornelia Huck wrote:
> On Fri, 6 Dec 2019 09:45:41 +0100
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> On 12/6/19 9:29 AM, Cornelia Huck wrote:
>>> On Fri, 6 Dec 2019 08:44:52 +0100
>>> Janosch Frank <frankja@linux.ibm.com> wrote:
>>>  =20
>>>> On 12/5/19 6:46 PM, Cornelia Huck wrote: =20
>>>>> On Thu, 5 Dec 2019 18:34:32 +0100
>>>>> Janosch Frank <frankja@linux.ibm.com> wrote:
>>>>>    =20
>>>>>> On 12/5/19 6:15 PM, Cornelia Huck wrote:   =20
>>>>>>> On Fri, 29 Nov 2019 04:48:02 -0500
>>>>>>> Janosch Frank <frankja@linux.ibm.com> wrote:
>>>>>>>      =20
>>>>>>>> Secure guests no longer intercept with code 4 for an instruction=

>>>>>>>> interception. Instead they have codes 104 and 108 for secure
>>>>>>>> instruction interception and secure instruction notification
>>>>>>>> respectively.
>>>>>>>>
>>>>>>>> The 104 mirrors the 4 interception.
>>>>>>>>
>>>>>>>> The 108 is a notification interception to let KVM and QEMU know =
that
>>>>>>>> something changed and we need to update tracking information or
>>>>>>>> perform specific tasks. It's currently taken for the following
>>>>>>>> instructions:
>>>>>>>>
>>>>>>>> * stpx (To inform about the changed prefix location)
>>>>>>>> * sclp (On incorrect SCCB values, so we can inject a IRQ)
>>>>>>>> * sigp (All but "stop and store status")
>>>>>>>> * diag308 (Subcodes 0/1)
>>>>>>>>
>>>>>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>>>>>> ---
>>>>>>>>  target/s390x/kvm.c | 6 ++++++
>>>>>>>>  1 file changed, 6 insertions(+)
>>>>>>>>   =20
>>>>>    =20
>>>>>>>> @@ -1664,6 +1668,8 @@ static int handle_intercept(S390CPU *cpu)
>>>>>>>>              (long)cs->kvm_run->psw_addr);
>>>>>>>>      switch (icpt_code) {
>>>>>>>>          case ICPT_INSTRUCTION:
>>>>>>>> +        case ICPT_PV_INSTR:
>>>>>>>> +        case ICPT_PV_INSTR_NOTIFICATION:
>>>>>>>>              r =3D handle_instruction(cpu, run);     =20
>>>>>>>
>>>>>>> I'm still a bit uneasy about going through the same path for both=
 104
>>>>>>> and 108. How does the handler figure out whether it should emulat=
e an
>>>>>>> instruction, or just process a notification? Is it guaranteed tha=
t a
>>>>>>> given instruction is always showing up as either a 104 or a 108, =
so
>>>>>>> that the handler can check the pv state?     =20
>>>>>>
>>>>>> diag 308 subcode 0/1 are 108, but all other subcodes are defined a=
s a
>>>>>> 104 (if they are an exit at all)...   =20
>>>>>
>>>>> I think that's a reason to really split 108 from 4/104, or at least=
 add
>>>>> an parameter...   =20
>>>>
>>>> And still call the diag 308 handler or have separate handlers? =20
>>>
>>> I'd probably split it into a "normal" one and one for pv special
>>> handling... does that make sense?
>>>  =20
>> IMHO: not really
>> We still need to do ipa/ipb parsing for both paths, which will result =
in
>> code duplication. Looking at diag308 subcode 4, we would have a code 4=

>> one which just does the device resets and reboots and one which does a=
ll
>> that, plus the teardown of the protected guest.
>>
>> I tried to inline as much as possible to have as little changes as
>> possible. Notable exception is sclp, which has more checks than
>> emulation code...
>=20
> Fair enough.
>=20
> But taking a step back: What's the purpose of the new exits, then?
> IIUC, we have the following cases:
>=20
> - code 4: normal guest, nothing special
> - code 104: protected guest, emulate the instruction
> - code 108: protected guest, notification for the instruction
>=20
> The backend code can figure out what to do simply by checking whether
> the guest is protected or not (as whatever needs to be done is simply
> determined by that anyway).
>=20
> Are we overlooking something? Or is the information contained in the
> different exits simply redundant?

The difference is in the entry after the exit:

On a 104 we have a "continuation", i.e. the data that's a result of the
emulation by KVM/QEMU is used to complete the instruction. Copying the
sccb from the satellite block into guest2 memory, etc.

For a 108 we don't have any special handling (except for maybe state
checking) and just continue with the next instruction.



--PQfNkW1ifFEebNM37lR9T2QykSFn917m8--

--XCkOthSP7zicKPp88Dmd9lBAZuwLoSdLY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3qH54ACgkQ41TmuOI4
ufiakA//fa17EkBF6WvCeJ9sNDGn40QtY3SaHxNREYZgQf/YU1aP2aJMQRyBu5qO
j4vq/i37URivORKRfHF8oJ/0GNXxsAhkalNG//kWUZqfzkAJy0TSGVCOa9TRD7/P
CkE7YE04kxeWeoq+pSByOTbg+kzSV8WX5CY61GjdHVWBDAnV1dW66xRmThc1k79m
F8a6e18UVWS4CR4Mp+nl55VCtYG51uJhfIpEIVZUD1aP0DvpIUlhwVDlGyr2Y8B0
vPVJ34o0We1iGbom/PxPwTL6ZKSUlxoamjdU9wqtB/DCdkoZwm3CqXX1PWBW06eV
Z1YpA+c22il1+aGqVgbm/0S4zsco5PMUPPyZmQKVd4+7Y1DZ1Fj94f6FQ/nCWn+2
WTN8NLg6sGnsRC5aV2+HsamtxhIuLaNXIQZh8eM40WxM7NtPkBXh5khUCKJziFo7
AfrwSt2xidb8/N2YFqRJH6cvBa2GnIAyLeiioHupyvFr8oKIQt3qZFiKzDzGMPFJ
f/mBttrY0GSf0/sexJVkFZMQfpiRsfQGcx0y59YtBnVtCDsQ8wA3PNOnxN0/fPsP
vJonwn59dmCBVxsOUO/pJFKgyaFAGL4frB/SZWMdtOU3/7cWUq1jpn0NvG/vUrXM
kV4HI1AK1xKc4YrOOtbOwWbsS8jCVuMYPJLRf/OJ3dms7vv72PY=
=vw3B
-----END PGP SIGNATURE-----

--XCkOthSP7zicKPp88Dmd9lBAZuwLoSdLY--


