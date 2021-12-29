Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49E481403
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 15:22:26 +0100 (CET)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ZqT-0006to-3o
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 09:22:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2Zmy-0005wO-D7; Wed, 29 Dec 2021 09:18:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2Zmv-0006iu-Uw; Wed, 29 Dec 2021 09:18:47 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTDj2oJ018719; 
 Wed, 29 Dec 2021 14:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=NRNheN4fqYBjwr7ms2+qOEfymkQ8Y/5nCES58Hq2I9k=;
 b=fz/6qZV7+wFdYyIYHGgUqDTgUqSLOnyNFB7FkEA57GnkefMq54HfuBYj+fAHNvKSb9tp
 CuMTmo2Byt+/KQ42yOLCdA2gAqeoR46MpszD2dajscHMlXrqVYlmHEFBlrBLzA29WLOs
 TGiyNT+Vk125mb5g+xnBw9kk8VYEqsF0lL2WTz/XBj0o0PL5yAVf4XYsY9vW6OekoFcE
 DgRWpp9e7h5pjdRA6/dje096SYk6OLmHu8pWJdWU05y4sAUBIvTjIWAoHSl6+VXS94l0
 B8AjPXAjINGuoJZrALxQx6RC/EB59uJBhTQvcdOuWX0lQ/hhbCBLR3KeGBq46yPnThDD LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7xduwqsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 14:18:33 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BTDplLa012080;
 Wed, 29 Dec 2021 14:18:33 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7xduwqsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 14:18:33 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTE8vW8001731;
 Wed, 29 Dec 2021 14:18:32 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3d5txc0sqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 14:18:32 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTEIUVM30409050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 14:18:31 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1703AE05C;
 Wed, 29 Dec 2021 14:18:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDAD5AE060;
 Wed, 29 Dec 2021 14:18:29 +0000 (GMT)
Received: from localhost (unknown [9.211.90.107])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 29 Dec 2021 14:18:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [RFC v2 00/12] target/ppc: powerpc_excp improvements
In-Reply-To: <1ae8b8d3-6987-9f8d-baca-fc38ea492bad@kaod.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <1ae8b8d3-6987-9f8d-baca-fc38ea492bad@kaod.org>
Date: Wed, 29 Dec 2021 11:18:26 -0300
Message-ID: <87bl0z3365.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0qsg9NaEOeiH_D281a6WXksKmAn5ygUn
X-Proofpoint-ORIG-GUID: ou2UotdooTwZA8E7klbyZWMvQD1kXTMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_05,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112290077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Hello Fabiano,
>
> On 12/20/21 19:18, Fabiano Rosas wrote:
>> This changed a lot since v1, basically what remains is the idea that
>> we want to have some sort of array of interrupts and some sort of
>> separation between processors.
>>=20
>> At the end of this series we'll have:
>>=20
>> - One file with all interrupt implementations (interrupts.c);
>>=20
>> - Separate files for each major group of CPUs (book3s, booke,
>>    32bits). Only interrupt code for now, but we could bring pieces of
>>    cpu_init into them;
>>=20
>> - Four separate interrupt arrays, one for each of the above groups
>>    plus KVM.
>>=20
>> - powerpc_excp calls into the individual files and from there we
>>    dispatch according to what is available in the interrupts array.
>
>
> This is going in the good direction. I think we need more steps for
> the reviewers, for tests and bisectability. First 4 patches are OK
> and I hope to merge them ASAP.

Ok, I'm sending another series with just these 4 + the bounds check
Richard mentioned.

>
> The powerpc_excp() routine has grown nearly out of control these last
> years and it is becoming difficult to maintain. The goal is to clarify
> what it is going on for each CPU or each CPU family. The first step
> consists basically in duplicating the code and moving the exceptions
> handlers in specific routines.
>
> 1. cleanups should come first as usual.
>
> 2. isolate large chunks, like Nick did with ppc_excp_apply_ail().
>     We could do easily the same for :
>
>     2.1 ILE
>     2.2 unimplemeted ones doing a cpu abort:
>=20=20=20=20=20=20
>           cpu_abort(cs, ".... "  "is not implemented yet !\n");
>     2.3 6x TLBS
>
>     This should reduce considerably powerpc_excp() without changing too
>     much the execution path.

Agreed.

>
> 3. Cleanup the use of excp_model, like in dcbz_common() and kvm.
>     This is not critical but some are shortcuts.

The issue here is that we would probably be switching one arbitrary
identifier for another. I don't think we have a lightweight canonical
way of identifying a CPU or group of CPUs. But maybe having these
conditionals on a specific CPU should be considered a hack to begin
with.

>
> 4. Introduce a new powerpc_excp() handler :
>
>     static void powerpc_excp(PowerPCCPU *cpu, int excp)
>     {
>         switch(env->excp_model) {
>         case POWERPC_EXCP_FOO1:
>         case POWERPC_EXCP_FOO2:
>             powerpc_excp_foo(cpu, excp);
> 	   break;
>         case POWERPC_EXCP_BAR:
>             powerpc_excp_legacy(cpu, excp);
> 	   break;
>         default:
>             g_assert_not_reached();
>         }
>     }
>
>     and start duplicating code cpu per cpu in specific excp handlers, avo=
iding
>     as much as possible the use of excp_model in the powerpc_excp_*() rou=
tines.
>     That's for the theory.
>
>     I suppose these can be grouped in the following way :
>
>     * 405 CPU
>          POWERPC_EXCP_40x,
>
>     * 6xx CPUs
>          POWERPC_EXCP_601,
>          POWERPC_EXCP_602,
>          POWERPC_EXCP_603,
>          POWERPC_EXCP_G2,
>          POWERPC_EXCP_604,
>=20=09
>     * 7xx CPUs
>          POWERPC_EXCP_7x0,
>          POWERPC_EXCP_7x5,
>          POWERPC_EXCP_74xx,
>=20=09
>     * BOOKE CPUs
>          POWERPC_EXCP_BOOKE,
>
>     * BOOKS CPUs
>          POWERPC_EXCP_970,            /* could be special */
>          POWERPC_EXCP_POWER7,
>          POWERPC_EXCP_POWER8,
>          POWERPC_EXCP_POWER9,
>          POWERPC_EXCP_POWER10,
>=20=20=20=20=20=20
>     If not possible, then, we will duplicate more and that's not a proble=
m.
>
>     I would keep the routines in the same excp_helper.c file for now; we
>     can move the code in different files but I would do it later and with
>     other components in mind and not just the exception models. book3s,
>     booke, 7xx, 6xx, 405 are the different groups. It fits what you did.
>=20=20=20=20=20
> 5. Once done, get rid of powerpc_excp_legacy()
>
> 6. Start looking at refactoring again.
>
>     There might be a common prologue and epilogue. As a consequence we co=
uld
>     change the args passed to powerpc_excp_*().
>
>     There could be common handlers and that's why an array of exception
>     handlers looks good. this is what you are trying to address after pat=
ch 5
>     but I would prefer to do the above steps before.

Ack all of this. I'm working on it.

Thank you for the inputs.

