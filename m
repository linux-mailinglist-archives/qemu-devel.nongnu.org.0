Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382BDC0252
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:28:19 +0200 (CEST)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmXy-0000d0-8r
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iDmQw-0001yz-LG
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iDmQv-0004Ey-F4
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:21:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iDmQv-0004Dc-9S
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:21:01 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8R98asn112410
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 05:20:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w26spgg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 05:20:59 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 27 Sep 2019 10:20:57 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 10:20:56 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8R9KswK35848622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 09:20:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85BD8AE053;
 Fri, 27 Sep 2019 09:20:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FD38AE051;
 Fri, 27 Sep 2019 09:20:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.85.251])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 09:20:54 +0000 (GMT)
Subject: Re: [PATCH v1 1/2] s390x: Add sclp boundary check and fix error
 priority
To: David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <1569497622-12496-1-git-send-email-imbrenda@linux.ibm.com>
 <1569497622-12496-2-git-send-email-imbrenda@linux.ibm.com>
 <d7ee2ad4-d928-88f1-94d6-3f6b22d2da72@redhat.com>
 <a7f404a1-7985-e506-db3e-815bb6d8e8cc@linux.ibm.com>
 <db8f5dda-73fe-6e24-3bf5-a721853680a7@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Fri, 27 Sep 2019 11:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <db8f5dda-73fe-6e24-3bf5-a721853680a7@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3qrEC4bqsxD2iXOajTZva2pu6Wkbpn9zv"
X-TM-AS-GCONF: 00
x-cbid: 19092709-4275-0000-0000-0000036BB9C7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092709-4276-0000-0000-0000387E3B2A
Message-Id: <bdafeda3-0ec1-72c7-ccd6-ad5a06ea7077@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270088
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3qrEC4bqsxD2iXOajTZva2pu6Wkbpn9zv
Content-Type: multipart/mixed; boundary="8FoulMqNLheeDMEsLaOqas3Wle4MRLB1K";
 protected-headers="v1"
From: Janosch Frank <frankja@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Cc: borntraeger@de.ibm.com, cohuck@redhat.com
Message-ID: <bdafeda3-0ec1-72c7-ccd6-ad5a06ea7077@linux.ibm.com>
Subject: Re: [PATCH v1 1/2] s390x: Add sclp boundary check and fix error
 priority
References: <1569497622-12496-1-git-send-email-imbrenda@linux.ibm.com>
 <1569497622-12496-2-git-send-email-imbrenda@linux.ibm.com>
 <d7ee2ad4-d928-88f1-94d6-3f6b22d2da72@redhat.com>
 <a7f404a1-7985-e506-db3e-815bb6d8e8cc@linux.ibm.com>
 <db8f5dda-73fe-6e24-3bf5-a721853680a7@redhat.com>
In-Reply-To: <db8f5dda-73fe-6e24-3bf5-a721853680a7@redhat.com>

--8FoulMqNLheeDMEsLaOqas3Wle4MRLB1K
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/27/19 11:17 AM, David Hildenbrand wrote:
> On 27.09.19 11:14, Janosch Frank wrote:
>> On 9/27/19 10:51 AM, David Hildenbrand wrote:
>>> On 26.09.19 13:33, Claudio Imbrenda wrote:
>>>> From: Janosch Frank <frankja@linux.ibm.com>
>>>>
>>>> * All sclp codes need to be checked for page boundary violations.
>>>> * Requests over 4k are not a spec exception.
>>>> * Invalid command checking has to be done before the boundary check.=

>>>
>>> Can we split this patch up so we fix one thing at a time?
>>
>> Sure, but we would end up with very small patches.
>> Do you want that?
>=20
> Why should I say no to easy-to-review, logically consistent, small
> chunks? I have shortcuts for my RB's and ACK's, so I don't have to type=

> much ;)
>=20

Higher patch count for me, win - win :-)


--8FoulMqNLheeDMEsLaOqas3Wle4MRLB1K--

--3qrEC4bqsxD2iXOajTZva2pu6Wkbpn9zv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl2N1HUACgkQ41TmuOI4
ufi3dQ/9H3erk1mjpD7Nk9Bv4Q9xcqvodMP+K2ef3CJymqM44btCoaRvekYxLeaE
gRyrFc3bLDuXFi4v6gCPXoSmqveLyUX64KzSQeqL1P7/WU32Gb7tWg92OGPoTeQb
/OFInYmGNo8qHncIwj2XprFUtuoh+bNypGJsBMMuULFjCpbhCs8QVJTHLQsgsxkL
Bj27Criqhv0LKLACA/mom+rnn5u6T66P2KRHCjXuShayR0jHNiQUJWWbKcmqrStV
XPzNEl6IfiojimANhKupoOxlj7qiiIEFIO/wsO7suRR9rRuVnSPRE3rzS/k0PLtM
mzOjoi1whzpkXKZ4AiGRruHqg7cvVNLPY3Y+XcEx11VIq0oSpFJaTXgQwi+lp17h
4h/854xG9tmQqU8G4h1G3XrV8QgVBpTgDfV49C3XAiMJh2R/Hd7IMUobFU9JnJj4
hEOmz2hYVQAf2/etTvMCBRPy+MSW6kR2xz6zuTsebjFkJ5MR8K8J+yli2JY5eVEl
FRs+SoyZnln/VFIkDCW26D3tvkac/xf1rP7I+O808EJbPfSdMJHIxSb7x49tpllB
9e2+kQfkZDUU7YyiRbNHp0t6VQb1ulPpw2+IkjYxeXABJ3Y8ilfLvNryyCMJy7tW
HxOHM7vWh9aSGsu2De83moFJGYVAJWrmp524d+suWQbg4BnAEPA=
=8eZw
-----END PGP SIGNATURE-----

--3qrEC4bqsxD2iXOajTZva2pu6Wkbpn9zv--


