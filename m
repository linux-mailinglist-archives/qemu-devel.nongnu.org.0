Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43AB49E78C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:30:33 +0100 (CET)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7fM-000186-Uo
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:30:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nD6WZ-0001cB-Qd; Thu, 27 Jan 2022 10:17:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24642
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nD6WW-0003Vx-Td; Thu, 27 Jan 2022 10:17:23 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RFDLGo007681; 
 Thu, 27 Jan 2022 15:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tUalFnfvlxRW+pCOSpZsYGjrxooDduCJGA7gpENRWT0=;
 b=CYOpCoQrM9YmuIMppU10+WTndNRm/l/5FeFzi8Tgj7k+WQm/9UzoOB7cDU3CgtogBly6
 RqqLkNL0gdetB4SWnSJ+/MXBg+Idayg7xbCyzTG6Z3Ahe1YvdnAWUj3H54vZErAxCPQA
 +2fiwDTe/V97S0jiTHiKGhLiqUyIkUTmgQvsQsWVes01ejf/1JOBrzpwBzFiwEA/QYLE
 Wy3brzmylU9y1FgEIo8yyO4rZqPshau0U8yjpErbAcrWCkB/KRuv+LSp+IpcVURlk9Yr
 8KV8nkENaJWQomJsYxEnr4LNPOcqxD47WxatqfSLkKcZn9JVaz8MkpGyTaJmQ0xMChgQ yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3duwujg1h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 15:17:03 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RFDcho008052;
 Thu, 27 Jan 2022 15:17:02 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3duwujg1gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 15:17:02 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RF8YM6015446;
 Thu, 27 Jan 2022 15:17:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3dr9jcnj8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 15:17:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RFH0rx19988782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 15:17:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E989CAC065;
 Thu, 27 Jan 2022 15:16:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9B05AC05B;
 Thu, 27 Jan 2022 15:16:58 +0000 (GMT)
Received: from localhost (unknown [9.211.129.51])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Jan 2022 15:16:58 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
In-Reply-To: <d592e76d-cb1f-7594-39ae-895fb4811242@ilande.co.uk>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
 <d592e76d-cb1f-7594-39ae-895fb4811242@ilande.co.uk>
Date: Thu, 27 Jan 2022 12:16:55 -0300
Message-ID: <87a6fhqkd4.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XvXzhmPSx6Eu8S0cXtCkREgLDu8XrCOg
X-Proofpoint-GUID: 1ISpVYY6Ff0gULb9SHbBOqrqji65LX9p
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270092
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 26/01/2022 16:41, Fabiano Rosas wrote:
>
>> This handles the exception code for the 74xx family, i.e. 7400, 7410,
>> 7440, 7445, 7450, 7455, 7457.
>>=20
>> This is another family that is quite well known, so it should be
>> straight-forward as well.
>>=20
>> Based on legoater/ppc-7.0
>>=20
>> Fabiano Rosas (8):
>>    target/ppc: Introduce powerpc_excp_74xx
>>    target/ppc: Simplify powerpc_excp_74xx
>>    target/ppc: 74xx: Machine Check exception cleanup
>>    target/ppc: 74xx: External interrupt cleanup
>>    target/ppc: 74xx: Program exception cleanup
>>    target/ppc: 74xx: System Call exception cleanup
>>    target/ppc: 74xx: System Reset interrupt cleanup
>>    target/ppc: 74xx: Set SRRs directly in exception code
>>=20
>>   target/ppc/excp_helper.c | 175 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 175 insertions(+)
>
> I'm not overly familiar with PPC exception handling detail, so I can't of=
fer much in=20
> the way of review I'm afraid. I could do a quick test and make sure nothi=
ng breaks=20
> with my MacOS images though?

Sure, no problem. This is more of an FYI and so you know whom to yell at
in case anything breaks for you.

I have some MacOS images I can use to test as well. I'll do a thorough
pass before sending the v2.

> Also any thoughts on Christophe's question re: e300 PVRs at=20
> https://lists.gnu.org/archive/html/qemu-ppc/2022-01/msg00592.html? I can =
handle=20
> merging the OpenBIOS changes if someone can come up with a suitable fix.

I believe C=C3=A9dric has been looking at the 60x, maybe he has some
input. We currently can only run the 604 if I'm not mistaken, so there's
some work to be done to bring all of the 60x back to life. The e300 will
be in the mix.

