Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6920F4CA6D1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:58:44 +0100 (CET)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPV5-0004c5-Dx
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nPPAt-0006Ol-Vk; Wed, 02 Mar 2022 08:37:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50366
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nPPAs-0000qn-8b; Wed, 02 Mar 2022 08:37:51 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Cs8DR032123; 
 Wed, 2 Mar 2022 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/SR+GL8jC3wygn/S2n1xDR7Zs8Q4WSPvLxJSVlv5GFc=;
 b=nTjnf6nysfwDjKMM/XQtcZWNvV5wJwv2dg/Jun8G2HqtfOF28HL+w9YRd9NeIY5GwJgb
 eKRooRcPHwLSxJvLILNxGHLRUacQ6pGtWkSwsfZXkXgH6mL0tEn9uBUULIjtI7E9b9IM
 EzudbE+WJPyD2U6ZgHoVED/VpBUaagP2bqiJZIhcMlvnjoQJsiCLYMTAHoq/m1ketMY9
 8AM63nBmVuH/Q+gGwBUs2HZjbxVnRtFAXzE+rmetc5d9t4uLT3py97tohjvCXTPp7X+e
 MS6moVT8OPpnoyJBH4wMTinWyuSipoH91NTU2N5LbNyjzucF1KlOkalSbDi5iYc+ZlvO xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej90arv1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 13:37:35 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222DT3c5001095;
 Wed, 2 Mar 2022 13:37:35 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej90arv1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 13:37:35 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222DJ9Us027691;
 Wed, 2 Mar 2022 13:37:34 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3eftrrpmdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 13:37:34 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222DbXFD34669030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 13:37:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA641BE05D;
 Wed,  2 Mar 2022 13:37:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B74EBE059;
 Wed,  2 Mar 2022 13:37:33 +0000 (GMT)
Received: from localhost (unknown [9.211.52.19])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Mar 2022 13:37:32 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 03/17] target/ppc: Move 40x CPUs code to their own file
In-Reply-To: <941e7add-aa94-d6d8-11dc-6eb8dffc3c@eik.bme.hu>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
 <20220301135620.2411952-4-farosas@linux.ibm.com>
 <941e7add-aa94-d6d8-11dc-6eb8dffc3c@eik.bme.hu>
Date: Wed, 02 Mar 2022 10:37:31 -0300
Message-ID: <871qzkqxus.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zul_uxA5Ci8BIJd2a3Y-6SeriZrSQXjd
X-Proofpoint-GUID: AB_pE9xR0_SD1V8QuFJJwnvrlzWQ5mQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_06,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020057
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

> On Tue, 1 Mar 2022, Fabiano Rosas wrote:
>> Affects the 405 CPU.
>>
>> This moves init_proc, init_excp and register_*sprs functions that are
>> related to the 40x CPUs (currently only 405) into a separate file.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> target/ppc/cpu_40x.c   | 263 +++++++++++++++++++++++++++++++++++++++++
>> target/ppc/cpu_init.c  | 250 ---------------------------------------
>> target/ppc/meson.build |   1 +
>> 3 files changed, 264 insertions(+), 250 deletions(-)
>> create mode 100644 target/ppc/cpu_40x.c
>>
>> diff --git a/target/ppc/cpu_40x.c b/target/ppc/cpu_40x.c
>> new file mode 100644
>> index 0000000000..4ed2cbc305
>> --- /dev/null
>> +++ b/target/ppc/cpu_40x.c
>> @@ -0,0 +1,263 @@
>> +/*
>> + * CPU initialization for PowerPC 40x CPUs
>> + *
>> + *  Copyright IBM Corp. 2022
>
> I think you can't replace the copyright when moving code. You have to 
> retain the original header and maybe you can add your own if you change or 
> rewrite it. You can only drop old copyright it you've completely replaced 
> the content.

Well spotted, thanks!


