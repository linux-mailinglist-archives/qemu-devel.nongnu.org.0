Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CD4A9C48
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:53:02 +0100 (CET)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0tR-00033K-Pa
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG0ju-0003W1-96; Fri, 04 Feb 2022 10:43:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG0jr-0007Ee-Ne; Fri, 04 Feb 2022 10:43:09 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214Dp6fU031209; 
 Fri, 4 Feb 2022 15:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=nboW8YTxjsfDT2y6JbMqVQo5xPWkf2tOtUUVyCefeug=;
 b=lJQgf8sU35q2NGvpTz6dUkaWcjPpJ86Cv7HtLM+3R5wgTxla2q2SE3P26kQJPtNCyf4V
 aYFgeSWCvwZgounCqMj/YH1UYIBBTcKZKEtTs6zMdCms+9Q6Ye+4JzmEV1kfG4iHovvE
 zi6EP/Eu8/Emsi7U9CSnajV3UQqA0av5N5PGBMaElNzJDIn7Qc7EYEU+XL02r97N3RLq
 nkYgOAe1ZQF439A0LQiq6FFWYvuxbb/YxOybaVuz8Vgpou0AaYjl7T9lSd37AqmGDAtq
 JgJywZyAhXO5EKSzuNHoWBRlzoVxqxb7phJIuLbkhCET/2dp2mZ1wLg873mxCkYIHMin UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0w6tk7hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:42:51 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214FJE1B010582;
 Fri, 4 Feb 2022 15:42:50 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0w6tk7h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:42:50 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214FXNeq006674;
 Fri, 4 Feb 2022 15:42:49 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3e0r0y5d8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:42:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214FglIq23593234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 15:42:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE239BE059;
 Fri,  4 Feb 2022 15:42:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E117BBE071;
 Fri,  4 Feb 2022 15:42:46 +0000 (GMT)
Received: from localhost (unknown [9.211.79.16])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Feb 2022 15:42:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 04/11] target/ppc: 6xx: Critical exception cleanup
In-Reply-To: <9580615e-c7-9b40-6534-6f1d8abe9f3b@eik.bme.hu>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
 <20220203200957.1434641-5-farosas@linux.ibm.com>
 <9580615e-c7-9b40-6534-6f1d8abe9f3b@eik.bme.hu>
Date: Fri, 04 Feb 2022 12:42:44 -0300
Message-ID: <87wnia8wp7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TEBK7alS4ACgWNoV8uXojBrIUtSu1hku
X-Proofpoint-ORIG-GUID: 4cDXXpPk8xpnO660AazNVUWsGoUnaCS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040088
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 3 Feb 2022, Fabiano Rosas wrote:
>> This only applies to the G2s, the other 6xx CPUs will not have this
>> vector registered.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> target/ppc/excp_helper.c | 15 ---------------
>> 1 file changed, 15 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index d855a275ca..e27e1c3c70 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -596,20 +596,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>>
>>     switch (excp) {
>>     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
>> -        switch (excp_model) {
>> -        case POWERPC_EXCP_40x:
>> -            srr0 = SPR_40x_SRR2;
>> -            srr1 = SPR_40x_SRR3;
>> -            break;
>> -        case POWERPC_EXCP_BOOKE:
>> -            srr0 = SPR_BOOKE_CSRR0;
>> -            srr1 = SPR_BOOKE_CSRR1;
>> -            break;
>> -        case POWERPC_EXCP_6xx:
>> -            break;
>> -        default:
>> -            goto excp_invalid;
>
> It may not be a problem but this seems to change previous behaviour. To 
> keep that you may need to test for G2 here, or rather move this whole case 
> before the default case to avoid goto and be able to just fall through to 
> invalid if CPU is not a G2 (unless we're Ok with an if the default case).

I should have been more explicit in the commit message, but that is on
purpose. If another 6xx CPU incorrectly registers the CRITICAL
exception, then we'll let it crash. This code needs to assume the work
done in cpu_init is correct. Otherwise we'd have to check everything
twice.

This whole exception work is walking towards removing the POWERPC_EXCP
identifiers because we have been misusing them as a way to identify
individual CPUs.

