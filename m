Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406F6B27FE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:57:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHgk-0001iY-JW; Thu, 09 Mar 2023 09:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1paHgh-0001gD-PP; Thu, 09 Mar 2023 09:56:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1paHge-0002R7-5S; Thu, 09 Mar 2023 09:56:11 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329DbORu012161; Thu, 9 Mar 2023 14:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=28rgBPvw0mPXFJaMJlOHVa+x7vSRwLGaZB03JSH7kfo=;
 b=fnkSWj0OW/JhrhqEGOxckf7t+UKutrV0Y5hKJOamr4vk3lHiSPbI3o0odI51qahe5Vft
 Tv0gOVl4xh5YO0/oh38Q0LR5U2PMHvgANlISLrrbkk66v7W8hJ87/7YBpgYvzItSgPWq
 C49AdDZYqkQhK6hwgVcZCBPJVDcBcOFKnlHa5ymUgDFhKBnpHKyuPACckOUhJ4p2UeS3
 cnlIEt8D3Vxso7yKMCC7gqwcGj3iq9k32VikcJMzzvLLP9J0kFrQ54jTBe6Tshi+ojga
 DNlR5FcIIrvxEzP9XgndQQIqIaWhWrLaUtTlygxUsmnjVF2JITKLcRnXsgWv3xgsWgmn vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6ry4eqr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 14:56:05 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 329EWxu3012040;
 Thu, 9 Mar 2023 14:56:04 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6ry4eqq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 14:56:04 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329DBFEk014998;
 Thu, 9 Mar 2023 14:56:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3p6gbw9ug5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 14:56:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 329EtxJv60293540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Mar 2023 14:55:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57B1D2004B;
 Thu,  9 Mar 2023 14:55:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A5D920043;
 Thu,  9 Mar 2023 14:55:59 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.152.224.238])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  9 Mar 2023 14:55:59 +0000 (GMT)
Message-ID: <8d1970cec6280754cd8d53b2d46c6af0bfa3f685.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Add C(G)HRL test
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org
Date: Thu, 09 Mar 2023 15:55:59 +0100
In-Reply-To: <2e9087d2-3ea1-816f-40c6-c5cf879243f9@redhat.com>
References: <20230308210226.2847503-1-nsg@linux.ibm.com>
 <20230308210226.2847503-3-nsg@linux.ibm.com>
 <2e9087d2-3ea1-816f-40c6-c5cf879243f9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EbFRAR778BFemLyx1xjuZFplLEgYknPj
X-Proofpoint-ORIG-GUID: XNYY0-OSo7tiYL0U7qWMKik3YHo-L5sa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxlogscore=536 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2023-03-09 at 14:47 +0100, Thomas Huth wrote:
> On 08/03/2023 22.02, Nina Schoetterl-Glausch wrote:
> > Test COMPARE HALFWORD RELATIVE LONG instructions.
> > Test that the bytes following the second operand do not affect the
> > instruction.
> > Test the sign extension performed on the second operand.
> >=20
> > Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> > ---
> >=20
> >=20
> > I don't know what the coding style is for inline asm.
> > checkpatch.sh complains about the tabs inside the asm, which I find a
> > bit surprising given they're inside a string.
> > IMO emitting tabs makes sense in order to be consistent with gcc output=
.
> > I left the tabs in for now, but can remove them.
>=20
> I don't mind too much, but all the other files use spaces, not tabs, so I=
=20
> think it's maybe best to also use spaces here for consistency?

Seems pretty inconsistent. Sometimes \t is used everywhere, sometimes some =
number of spaces.
I'll put \n\t at the end of lines, put the labels on a separate line and us=
e a single space
between the mnemonic and the operands.
>=20
>   Thomas
>=20


