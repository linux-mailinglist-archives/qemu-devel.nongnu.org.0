Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC845EDDA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:26:03 +0100 (CET)
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqaIk-000539-Ow
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:26:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqa7T-0005B8-La; Fri, 26 Nov 2021 07:14:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqa7Q-0002cr-NU; Fri, 26 Nov 2021 07:14:23 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQBGX6H003467; 
 Fri, 26 Nov 2021 12:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=FyQ61RxRmIvj5CanxeDsOZ6TmOysm1+IQ76EeDx5m0Q=;
 b=Sc0nT4qo30QBYqQDbcaYmEJGCl2hCkQ8gizdseE72ZMibRqaG5PWx0BZ0NqVpFqAT/AS
 BUv8mrsEGfb1K67oqo3Gk0uHq5+WUkFc/LiQoVF5FQCsIDcq5mXIBVQ0aRqAwvOKBBID
 pc5BdBnFhxHPmFC+JR0XTwSbCbZVekdJXMsIq1ZgRIUPykHvfu8XoPv+m5XT+CSl4hwZ
 m7RIlDByKT8vj/fv1kMEvSa4rfkBxkdy/LfcMcmzQJnefaacN0Op2n/Nfe33g0gIx8IY
 f1InK+QxEFMZ5zTM/LjMz2OhxF3GAJ2Zr7EH3oqsXQ4ISzUlfsoQg05pVavDQ6Pa/Gkr DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjxjks4gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:13:55 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQCDtG3003059;
 Fri, 26 Nov 2021 12:13:55 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjxjks4fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:13:55 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQC8FNm003111;
 Fri, 26 Nov 2021 12:13:54 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3cernc14dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:13:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AQCDrrQ66519456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 12:13:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80BEDAC05E;
 Fri, 26 Nov 2021 12:13:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E17AC062;
 Fri, 26 Nov 2021 12:13:52 +0000 (GMT)
Received: from localhost (unknown [9.211.89.149])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Nov 2021 12:13:52 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>, =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
In-Reply-To: <20211126103732.GP614@gate.crashing.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <20211125093801.GM614@gate.crashing.org>
 <484dc989-71db-6273-e868-efaf2ad29fcf@kaod.org>
 <20211126103732.GP614@gate.crashing.org>
Date: Fri, 26 Nov 2021 09:13:49 -0300
Message-ID: <87lf1bqflu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yFv838ZyEmu5RizGuFqO_M9y_GwP4Jv6
X-Proofpoint-ORIG-GUID: mGDNKi5uGhOWSIp8ZDzLbaF519dm1BJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=860 malwarescore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111260071
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> Hi!
>
> On Fri, Nov 26, 2021 at 09:34:44AM +0100, C=C3=A9dric Le Goater wrote:
>> On 11/25/21 10:38, Segher Boessenkool wrote:
>> >On Thu, Nov 25, 2021 at 01:45:00AM +0100, BALATON Zoltan wrote:
>> >>As for guests, those running on the said PowerMac G4 should have suppo=
rt
>> >>for these CPUs so maybe you can try some Mac OS X versions (or maybe
>> >
>> >OSX uses hardware pagetables.
>> >
>> >>MorphOS but that is not the best for debugging as there's no source
>> >>available nor any help from its owners but just to see if it boots it =
may
>> >>be sufficient, it should work on real PowerMac G4).
>> >
>> >I have no idea what MorphOS uses, but I bet HPT as well.  That is
>> >because HPT is fastest in general.  Software TLB reloads are good in
>> >special cases only; the most common is real-time OSes, which can use its
>> >lower guaranteed latency for some special address spaces (and can have a
>> >simpler address map in general).
>>=20
>> The support was added to QEMU knowing that Linux didn't handle soft TLBs.
>> And the commit says that it was kept disabled initially. I guess that was
>> broken these last years.
>
> Ah :-)  So when was it enabled, do you know?

Hm.. That commit message does not match the code. They simply added the
software TLB implementation to an already existing SOFT_74xx MMU
model. I don't see anything that would keep it disabled at that time.

