Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DF508B3B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:53:13 +0200 (CEST)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBhg-0004Ye-PL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nhBYD-0001nc-AE; Wed, 20 Apr 2022 10:43:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49772
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nhBY8-0000RB-S0; Wed, 20 Apr 2022 10:43:25 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KDFkjR005505; 
 Wed, 20 Apr 2022 14:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=scz2TfbcXJkxNi8KSDWPR5T4rMfXqRlGEAjeJ9nwcjw=;
 b=ccFLx50OCjDY2RYvsKHJ+YM4589jFfKcKWNQkg/1bU+/kevHxI+Ug46mghzREk2ukzbA
 Dqi/nkcpFkJrUdLaEadBUBJG6vzcrFt/VWy3fA/jJZRuvSFPKPIeyXxqYwxeABMjRnC5
 HdjzryJbN7edIccnMK32D7TcQE9Yzf/HUGi6keAW6FvA7Ya2pPMmsYH/DNz7R4485Lee
 r9XaNhd9+ACePfYWAG10P5IH8I6t3APQep/TGF6b22XRNTqmXBEZbct0icqTPHMAi76G
 KUBVZbxf36tzhqSxJvHapAuQULeKXyaMf7yqu679GgnvPpx4VZFvIJ2orlrvOUZJ9vDU 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fjf51y788-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 14:43:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23KCvdwQ002353;
 Wed, 20 Apr 2022 14:43:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fjf51y77p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 14:43:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23KEbbA8003749;
 Wed, 20 Apr 2022 14:43:08 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3ffnead09s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 14:43:07 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23KEh7nQ31523098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 14:43:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2012C7805C;
 Wed, 20 Apr 2022 14:43:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C9837805F;
 Wed, 20 Apr 2022 14:43:06 +0000 (GMT)
Received: from localhost (unknown [9.65.232.226])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Apr 2022 14:43:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] target/ppc: Fix BookE debug interrupt generation
In-Reply-To: <CAEUhbmWUkZc4v+rJvKK=D9Kv+v061+5TbpyUAkd+7es=8ca6zw@mail.gmail.com>
References: <20220420082006.1096031-1-bmeng.cn@gmail.com>
 <87mtgf27e7.fsf@linux.ibm.com>
 <CAEUhbmWUkZc4v+rJvKK=D9Kv+v061+5TbpyUAkd+7es=8ca6zw@mail.gmail.com>
Date: Wed, 20 Apr 2022 11:43:04 -0300
Message-ID: <87k0bj24uf.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oWkOLXGylqvGbdQyR7jZyMtkWkMW5SQR
X-Proofpoint-ORIG-GUID: dAxpoPaRBW0Kq3FcMyH_l1qNJvkgQyut
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_04,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=739 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> On Wed, Apr 20, 2022 at 9:50 PM Fabiano Rosas <farosas@linux.ibm.com> wrote:
>>
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>
>> > From: Bin Meng <bin.meng@windriver.com>
>> >
>> > Per PowerISA v2.07 [1], Book III-E, chapter 7.6 "Interrupt definitions"
>>
>> Which BookE board are you concerned about? I don't think we have any
>> BookE ISA v2.07 in QEMU currently.
>
> It's actually a PPC E500 core, but I am too lazy to dig out the E500
> manual from Freescale/NXP :(

Here it is: https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf

You can keep it =)

> Let me know if I need to replace the link to an E500 manual.

Yes, please. And the description as well:

  "An instruction complete debug event occurs when any instruction
  completes execution so long as MSR[DE] and DBCR0[ICMP] are both set..."
  
  "Instruction complete debug events are not recognized if MSR[DE] is
  cleared at the time of the instruction execution."

Otherwise a few years from now someone will use the git log as reference
and will get confused.

Thanks.

>>
>> > "When in Internal Debug Mode with MSR.DE=0, then Instruction Complete
>> > and Branch Taken debug events cannot occur, and no DBSR status bits
>> > are set and no subsequent imprecise Debug interrupt will occur."
>> >
>> > Current codes do not check MSR.DE bit before setting HFLAGS_SE and
>> > HFLAGS_BE flag, which would cause the immediate debug interrupt to
>> > be generated, e.g.: when DBCR0.ICMP bit is set by guest software
>> > and MSR.DE is not set.
>> >
>>
>> The rationale and the change itself look ok.
>>
>> > [1] https://ibm.ent.box.com/s/jd5w15gz301s5b5dt375mshpq9c3lh4u
>> >
>> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > ---
>> >
>> >  target/ppc/helper_regs.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>
> Regards,
> Bin

