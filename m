Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B6702D17
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:50:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXdQ-00025U-LY; Mon, 15 May 2023 08:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pyXdN-00024p-TZ; Mon, 15 May 2023 08:49:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pyXdM-0006AH-12; Mon, 15 May 2023 08:49:01 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FCbwfX024647; Mon, 15 May 2023 12:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CEzcWTrWJ572ZT0WPFaL3oVFrcfOQR3tXODjk3fSRag=;
 b=HSw4kjKcKHLKGPyRxK/SngOIjvM0HkZbS8Q8JpHaNSwb0flozSaNS3wrjFfBqzBjhYmR
 Zxsq3ud8MPgHD1n5f8mQ87mtPbdfFTRHo1lR39UpdnhL1B4C2SIjcwCk5LGSOLJ3zcUy
 v6RX7zuo/Cn9ciyhmJyG1UeyHb1/njRRL3RS9YSe52DqOugboDdE19/JlhYTwMdY1iPF
 r/qFxdjaLgjsf+mtu3qt+U8Bi6rDRo8QGLHv95UyI7zPM5xA4a6L+9gg5NlCPxG2uzC4
 oD+q90fO/VKSHKk/J3ehU7Rjcq9KkQjvoxdDyJ3lDhfPD56ifyAb4uWhp1MMaynX/3nO bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkktqtnwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 12:48:53 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FCc0Ci024762;
 Mon, 15 May 2023 12:48:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkktqtnvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 12:48:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F9cE1B031944;
 Mon, 15 May 2023 12:48:50 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qj2650w9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 12:48:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34FCmm3545613584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 12:48:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18D1820040;
 Mon, 15 May 2023 12:48:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A29B2004B;
 Mon, 15 May 2023 12:48:47 +0000 (GMT)
Received: from [9.171.42.147] (unknown [9.171.42.147])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 15 May 2023 12:48:47 +0000 (GMT)
Message-ID: <71f07442-f4be-4efe-db1a-49f59b7bdbcb@linux.ibm.com>
Date: Mon, 15 May 2023 14:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] pnv_lpc: disable reentrancy detection for lpc-hc
To: Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "open list:PowerNV Non-Virtu..." <qemu-ppc@nongnu.org>
References: <20230511085337.3688527-1-alxndr@bu.edu>
 <3102db7a-bbaa-f394-b739-23950fe81be0@kaod.org>
 <20230511091509.nypeyd5fhzxlvo47@mozz.bu.edu>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20230511091509.nypeyd5fhzxlvo47@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DeyX6_yak_1P4J9W6hk5MY8cOLH1gAC4
X-Proofpoint-GUID: 0pnxNuIrzhwmlToe5sMrUmDrbnlrO3_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=583 phishscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150108
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/05/2023 11:15, Alexander Bulekov wrote:
> On 230511 1104, Cédric Le Goater wrote:
>> Hello Alexander
>>
>> On 5/11/23 10:53, Alexander Bulekov wrote:
>>> As lpc-hc is designed for re-entrant calls from xscom, mark it
>>> re-entrancy safe.
>>>
>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>> ---
>>>    hw/ppc/pnv_lpc.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
>>> index 01f44c19eb..67fd049a7f 100644
>>> --- a/hw/ppc/pnv_lpc.c
>>> +++ b/hw/ppc/pnv_lpc.c
>>> @@ -738,6 +738,8 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
>>>                                    &lpc->opb_master_regs);
>>>        memory_region_init_io(&lpc->lpc_hc_regs, OBJECT(dev), &lpc_hc_ops, lpc,
>>>                              "lpc-hc", LPC_HC_REGS_OPB_SIZE);
>>> +    /* xscom writes to lpc-hc. As such mark lpc-hc re-entrancy safe */
>>> +    lpc->lpc_hc_regs.disable_reentrancy_guard = true;
>>>        memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
>>>                                    &lpc->lpc_hc_regs);
>>
>> The warning changed :
>>
>>    qemu-system-ppc64: warning: Blocked re-entrant IO on MemoryRegion: lpc-opb-master at addr: 0x8
>>
>> I will take a look unless you know exactly what to do.
>>
> 
> That does not show up for me with "./qemu-system-ppc64 -M powernv8"
> Do I need to boot a kernel to see the message?
> 
> I was worried that there might be other re-entrant IO in this device.
> Maybe there should be a way to just mark the whole device re-entrancy
> safe.

Hello,

I was also started hitting it, with machine powernv10. And indeed, 
disabling the check on both lpc_hc_regs and opb_master_regs should be 
all we need (and it's working fine for me).

   Fred


