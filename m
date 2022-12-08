Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F413E64714B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3HWL-0005Vq-Np; Thu, 08 Dec 2022 09:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p3HWB-0005Vb-SY
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:04:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p3HW9-0003Hq-P0
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:04:55 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B8Ctx6p017535; Thu, 8 Dec 2022 14:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=TLMmRQrKenxkLdLNG4kGU2tCjajaDzO9SAZ/03Ont+Y=;
 b=RlaWClQ38gpALT+4B2pZOXHhTOwljnoGIrW7fz0Zsop0xXgpgJLVKOBTuUUHKX9R3JWA
 OSOIZXPEsvuScvuVheyyzOu3/P7qpCcz4JW5NBfeSdaCqxEZNnSiuNHPE4B1NdTA1CIh
 M0Vdx4nAZb7BvC1k8I1HkNFs/scvuqdujRfVR9GM5a6WO9O2ZY4Jr+9r1dVO+6LdFQnk
 8Tt4CmUVv21hTV44wNFUcZLWuohyKp2fn3dmQNP2nmxA1+59boRf+96gQMxQCuUdChX3
 I1V6h06v/2WCc7pZlj+ZawGX7YMk8eIYv0ZaAfUCa+O0qEfc3yiEXqRzrUzexZG7+DjW GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbgbu1v5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 14:04:51 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B8CxsMx029347;
 Thu, 8 Dec 2022 14:04:51 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbgbu1v4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 14:04:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B8D6xpj012217;
 Thu, 8 Dec 2022 14:04:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3m9pv9u5gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 14:04:49 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B8E4kmD43385284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Dec 2022 14:04:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCF3420065;
 Thu,  8 Dec 2022 14:04:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65E0D20040;
 Thu,  8 Dec 2022 14:04:46 +0000 (GMT)
Received: from [9.171.45.128] (unknown [9.171.45.128])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  8 Dec 2022 14:04:46 +0000 (GMT)
Message-ID: <287f432b086827002183ccffe66917aa25d43035.camel@linux.ibm.com>
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Date: Thu, 08 Dec 2022 15:04:46 +0100
In-Reply-To: <60d11ef4-40f5-6743-202a-549f83899efb@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
 <60d11ef4-40f5-6743-202a-549f83899efb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JBjZEDOE6u59Ohfe5GBTjFmihRzFxPQ2
X-Proofpoint-ORIG-GUID: W6yBMWVzsuvsknQTkLyZUGjOhbYsDuNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_07,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212080119
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 2022-12-06 at 18:42 -0600, Richard Henderson wrote:
> On 12/6/22 16:22, Richard Henderson wrote:
> > > Wouldn't it be worth keeping XILF/XIFH here?
> >=20
> > I don't know.=C2=A0 It's difficult for me to guess whether a dependency
> > chain like
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 val -> xor -> xor
> >=20
> > (3 insns with serial dependencies) is better than
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 val=C2=A0=C2=A0 --> xor
> > =C2=A0=C2=A0=C2=A0=C2=A0 load=C2=A0 -/
> >=20
> > (3 insns, but only one serial dependency) is better.=C2=A0 But there ma=
y
> > also be instruction=20
> > fusion going on at the micro-architectural level, so that there's
> > really only one xor.
> >=20
> > If you have suggestions, I'm all ears.
>=20
> Related microarchitectural question:
>=20
> If a 32-bit insn and a 64-bit insn have a similar size encoding (and
> perhaps even if they=20
> don't), is it better to produce a 64-bit output so that the hw
> doesn't have a false=20
> dependency on the upper 32-bits of the register?
>=20
> Just wondering whether most of the distinction between 32-bit and 64-
> bit opcodes ought to=20
> be discarded, simplifying code generation.=C2=A0 The only items that seem
> most likely to have=20
> real execution time differences are multiply and divide.

I think this will definitely lead to false dependencies if one produces
32 bits in one place, and then consumes 64 in the other. But if this
idea is applied consistently, then there should be hopefully not so
many such instances?

Two thing come to mind here: memory and CC generation.

The first is probably not very important: we can implement 32-bit loads
with lgf, which sign-extends to 64 bits.

CC generation can be tricker: for conditional jumps it's still going to
be okay, since the code would produce 64-bit values and consume 32-bit
ones, but if the back-end needs a CC from a 32-bit addition, then we
would probably need to sign-extend the result in order to get rid of a
false dependency later on. However, based on a quick inspection I could
not find any such instances.

So using 64-bit operations instead of 32-bit ones would be an
interesting experiment.

Best regards,
Ilya

