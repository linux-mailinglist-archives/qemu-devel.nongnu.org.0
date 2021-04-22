Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AF8368749
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:37:19 +0200 (CEST)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZf8Y-0000XT-La
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZf79-0007yG-W6; Thu, 22 Apr 2021 15:35:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZf78-0002sc-40; Thu, 22 Apr 2021 15:35:51 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MJYlL1133644; Thu, 22 Apr 2021 15:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=QE33s+VgamGAEjMVqLCpyEviDz776gjEO+k9q3Ijh0E=;
 b=MOkKTl/Jgu/oOPTPjsMI+O/MSW3WR2lkk3hN03iZVCmkTr8WrEjSbb5XJbNNKRKuvuaH
 6yC/T7aBbw70MFFQJlM2R/H36W/VGGuG5z12K5pDcgw6DgBec9yL+0X8TGJa6k7Z2Hcp
 GBThqh72VQzcgZV/U8PAZwlFnFp6uT0lx7h5IpKP5FGzOArT8JOuYlYQ+/Ym16PDydo3
 mI8OzAZ8lmuxT4cAPxrAs9oFIICeAY0N428SikGf0tu4QqYujnWk3eiJRNG386qh+tm7
 oMi1svUqeQxi/6NNdF0oRV9U69BV6uEyl5eLPPeR+A8AoktSHrP8GCHVKZZGhHc5emm/ Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838n6wcne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 15:35:40 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13MJZdB5136180;
 Thu, 22 Apr 2021 15:35:39 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838n6wcn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 15:35:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MJQcqf024044;
 Thu, 22 Apr 2021 19:35:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 37yqa9m19v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 19:35:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13MJZchn31719932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 19:35:38 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B78E5AE05C;
 Thu, 22 Apr 2021 19:35:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D164AAE05F;
 Thu, 22 Apr 2021 19:35:37 +0000 (GMT)
Received: from localhost (unknown [9.211.116.182])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 22 Apr 2021 19:35:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
In-Reply-To: <CP2PR80MB44990338BCF641993404B901C7469@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB44990338BCF641993404B901C7469@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Thu, 22 Apr 2021 16:35:34 -0300
Message-ID: <87mttq15a1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iZwWyfQycyAPaZRyI-sCj3qWV_un-n-2
X-Proofpoint-ORIG-GUID: f5W8wHziUZbaSVM1jP4zwlZJmp6_aVac
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_14:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=733 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104220145
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

>> > You are correct! I've just tweaked the code that defines spr_register and
>> > it should be working now. I'm still working in splitting the SPR functions
>> > from translate_init, since I think it would make it easier to prepare the
>> > !TCG case and for adding new architectures in the future, and I found a
>> > few more problems:
>>
>> Actually looking at the stuff below, I suspect that separating our
>> "spr" logic specifically might be a bad idea.  At least some of the
>> SPRs control pretty fundamental things about how the processor
>> operates, and I suspect separating it from the main translation logic
>> may be more trouble than it's worth.

I disagree with the code proximity argument. Having TCG code clearly
separate from common code seems more important to me than having the SPR
callbacks close to the init_proc functions.

But maybe we should take a look at this RFC before we start discussing
personal preference too much.

> Well, all the errors that I got were related to to read/write functions, which
> I was already separating into a spr_tcg file. The solutions I can see are to
> include this file in translate.c, and either have the read/write functions not be
> static, or include the spr_common.c in translate as well, but only for TCG
> builds. Both solutions sound pretty bad imo, but the first sounds less bad,
> because it's a bit less complexity in the build process.

It would be helpful if we could apply these patches and do some
experimentation before recommending a solution. So I would pick the less
bad for now. Mention it in the cover letter and then we can discuss
looking at something more concrete.


