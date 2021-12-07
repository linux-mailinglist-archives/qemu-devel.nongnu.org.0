Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABC46BD3B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:07:09 +0100 (CET)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mub7b-0001I6-ND
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:07:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mub5I-000897-9B; Tue, 07 Dec 2021 09:04:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50002
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mub5F-0004bk-L4; Tue, 07 Dec 2021 09:04:44 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7CqqD5016767; 
 Tue, 7 Dec 2021 14:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RWEc6mU6A/pNUZvBKznFLX7bAuUJXTtuSeSTwjR58y4=;
 b=ImQUTEB9Ub4sKNZLkp6kuRUFz9vKgx4lJep51X3XO2yxyh9cRhoqBChpIqAPxJcuHB26
 xf3j4yfxJY0OrkfK3xyUKznEO0g//PaSlLeLwSX+aE1iAy/KozrN4O9m1EqjTUMnh/eh
 bDHqtmTUyw61pITD17+MtRPpitDNt/pS+UW7WUs2dO/6CmNv40Qm7KZMwhVyvq4c4Yb7
 WV7OpId08HfLeIK/25abhWXfm3ZWXtybnjSDzQarrWdaRLGhNwcmwLF+d9AKJtNdvxSK
 xBvhL1MlSdTrjDQ5XhhcqtXt0+vMrv2/pQ0rxup1CU/s6Wj1e5BSKjOZkLB2kGpvKCiA JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct80r1guj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 14:04:33 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7Dx942011754;
 Tue, 7 Dec 2021 14:04:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct80r1gtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 14:04:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7E3AVb001766;
 Tue, 7 Dec 2021 14:04:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyaq213-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 14:04:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7E3hRr31326604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 14:03:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EB6D11C07D;
 Tue,  7 Dec 2021 14:03:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEA9011C050;
 Tue,  7 Dec 2021 14:03:42 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 14:03:42 +0000 (GMT)
Message-ID: <6ee71d8d-33b8-47cf-66c1-92b960d3c5fe@linux.ibm.com>
Date: Tue, 7 Dec 2021 15:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/14] ppc/pnv: Introduce a num_pecs class attribute for
 PHB4 PEC devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-8-clg@kaod.org>
 <453c5cc3-5ac5-c6ff-fa7f-5ccb8492e314@linux.ibm.com>
 <fe4c3744-91b1-bd5b-2a04-e2782c46fc09@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <fe4c3744-91b1-bd5b-2a04-e2782c46fc09@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZlSxifNv1tp-hbyIFvigZy_J5hBp7RvL
X-Proofpoint-GUID: M4bUzcb0K67avHSiTBivYZfW6Ma9T6h1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_06,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/12/2021 11:45, Cédric Le Goater wrote:
> On 12/7/21 11:00, Frederic Barrat wrote:
>>
>>
>> On 02/12/2021 15:42, Cédric Le Goater wrote:
>>> POWER9 processor comes with 3 PHB4 PECs (PCI Express Controller) and
>>> each PEC can have several PHBs :
>>>
>>>    * PEC0 provides 1 PHB  (PHB0)
>>>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>>>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
>>>
>>> A num_pecs class attribute represents better the logic units of the
>>> POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
>>> This will ease adding support for user created devices.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>
>> With this patch, chip->num_phbs is only defined and used on P8. We may 
>> want to add a comment to make it clear.
> 
> Yes.
> 
> With the latest changes, I think we can now move num_phbs under PnvChip8
> and num_pecs under PnvChip9 since they are only used in these routines :
> 
> P8:
>      static void pnv_chip_power8_instance_init(Object *obj)
>              chip->num_phbs = pcc->num_phbs;
>          for (i = 0; i < chip->num_phbs; i++) {
> 
>      static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>          for (i = 0; i < chip->num_phbs; i++) {
> P9:
>      static void pnv_chip_power9_instance_init(Object *obj)
>              chip->num_pecs = pcc->num_pecs;
>          for (i = 0; i < chip->num_pecs; i++) {
> 
>      static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>          for (i = 0; i < chip->num_pecs; i++) {
> 
>> As I review this series, something is bugging me though: the 
>> difference of handling between P8 and P9.
>> On P9, we seem to have a more logical hiearachy:
>> phb <- PCI controller (PEC) <- chip
> 
> Yes. It's cleaner than P8 in terms of logic. P8 initial support was
> done hastily for skiboot bringup in 2014.
> 
>> With P8, we don't have an explicit PEC, but we have a PBCQ object, 
>> which is somewhat similar. The hierarchy seems also more convoluted.
> 
> But we don't have stacks on P8. Do we ?


Stacks were introduced on P9 because all the lanes handled by a PEC 
could be grouped differently, each group being called a stack. And each 
stack is associated to a PHB.
On P8, there's no such split, so the doc didn't mention stacks. But each 
PEC handles exactly one PHB. So we could still keep the same abstractions.
On all chips, a PEC would really be equal to a pbcq interface to the 
power bus. The pbcq is servicing one (on P8) or more (on P9/P10) PHBs.



>> I don't see why it's treated differently. It seems both chips could be 
>> treated the same, which would make the code easier to follow.
> 
> I agree. Daniel certainly would also :)
> 
>> That's outside of the scope of this series though. 
> 
> Well, this patchset enables libvirt support for the PowerNV machines.
> Once this is pushed, we need to keep the API, the object model names
> being part of it.
> 
> 7.0 is a good time for a change, really. After that, we won't be able
> to change the QOM hierarchy that much.
> 
>> So maybe for a future patch? Who knows, I might volunteer...
> 
> You would introduce a phb3-pec on top of the phb3s ?


Or rename pnv_phb3_pbcq.c to pnv_phb3_pec.c and starts from there. 
Conceptually, the TYPE_PNV_PBCQ and TYPE_PNV_PHB4_PEC_STACK objects seem 
close. But that's easy to say in an email...

   Fred


> Let me send a v2 first and may be we could rework the object hierarchy
> in the 7.0 time frame. We don't have to merge this ASAP.
> 
> Thanks,
> 
> C.

