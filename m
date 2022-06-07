Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD253F870
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:44:40 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyUpL-0000DJ-H6
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nyUmN-00077L-6N; Tue, 07 Jun 2022 04:41:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41788
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nyUmL-0002Ar-Am; Tue, 07 Jun 2022 04:41:34 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2578bqux023407;
 Tue, 7 Jun 2022 08:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VK39m9Lo1aBGgZmPd4UO+L4di/DbJOpqFetZXAyYbwY=;
 b=D4+RNDYEqgnVzFK1PlvgQScI+qTfy2xPndgxVarBUAfXn7aJP0ChCa5LsidhF7nJkscu
 DmxNMW05Az7avsNXE9jX34b1hQi6/D8VlZz8uIjP/iw7w0y5eLFryVGdiXNGJKeY9ZtO
 3hEy08RD2KnN1g3Sv+J6Sm7Hxyu9vgnjjbALNA8yTTm32/R3voP/ZZGRm5qC/dyHl8LQ
 8gO+1Sambma49SfJYCdDaZKpCEj/9FnulDS8+wQ5VpdGL+jfFViYNs3GLAyQX6X6xPUL
 S4rwkBYE2OsR53+NTPvRnp0Hokl0nEiHwxA77H3XyJtn1GGJh9in9zEudPpa8pp8MVBF AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gj2yn0e9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jun 2022 08:41:18 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2578eKFB000926;
 Tue, 7 Jun 2022 08:41:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gj2yn0e8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jun 2022 08:41:17 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2578bbBP000990;
 Tue, 7 Jun 2022 08:41:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3gfy19bfn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jun 2022 08:41:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2578exZf18153836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jun 2022 08:40:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95E4F11C054;
 Tue,  7 Jun 2022 08:41:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24F8011C058;
 Tue,  7 Jun 2022 08:41:13 +0000 (GMT)
Received: from [9.171.53.11] (unknown [9.171.53.11])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jun 2022 08:41:12 +0000 (GMT)
Message-ID: <56bf8c09-9831-a4f3-1eb0-61a6e55841a8@linux.ibm.com>
Date: Tue, 7 Jun 2022 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-9-danielhb413@gmail.com>
 <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
 <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QwIAGoqH0LAadsStydHIJHQcinMqdQ33
X-Proofpoint-ORIG-GUID: AYrL48-zCYHaPCRMLMrRBYdgFUtqz1zJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_02,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070035
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 03/06/2022 23:00, Daniel Henrique Barboza wrote:
>>>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>>   {
>>>       PnvPHB4 *phb = PNV_PHB4(dev);
>>> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>>> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>>>       XiveSource *xsrc = &phb->xsrc;
>>> +    BusState *s;
>>> +    Error *local_err = NULL;
>>>       int nr_irqs;
>>>       char name[32];
>>> +    if (!chip) {
>>> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
>>> +        return;
>>> +    }
>>> +
>>> +    /* User created PHBs need to be assigned to a PEC */
>>> +    if (!phb->pec) {
>>> +        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
>>> +        if (local_err) {
>>> +            error_propagate(errp, local_err);
>>> +            return;
>>> +        }
>>> +    }
>>> +
>>> +    /* Reparent the PHB to the chip to build the device tree */
>>> +    pnv_chip_parent_fixup(chip, OBJECT(phb->phb_base), phb->phb_id);
>>
>>
>> Didn't you mean to do that only for the user-created case? 
> 
> It's done for both because the default generated PHBs are being created 
> loosely
> from the chip starting on 3f4c369ea63e ("ppc/pnv: make PECs create and 
> realize
> PHB4s"). We had to amend the code after that commit to fix the QOM 
> hierarchy
> of these devices. 6e7b96750359 ("ppc/pnv: fix default PHB4 QOM 
> hierarchy") has
> more details.
> 
> 
>> And why not attaching the PHB to the PEC instead of the chip, like in 
>> pnv_pec_default_phb_realize() ? I think it makes more sense to keep 
>> the chip->PEC->PHB parenting in the qom tree (and incidentally, that's 
>> where I'd prefer to have the phb3 model move to).
> 
> I can only speculate since I didn't participate in the initial design. My
> educated guess is that we didn't want to show PECs in qtree, hence we
> made the PHB a child of the chip instead. I'll also guess that this can be
> due to how PHB3 worked and we just copied the existing design.


I don't believe that's correct though. As Cedric replied, the PECs show 
up in the qom tree on P9/P10, with chip->PEC->PHB, in that order. And I 
think that's fine, that's the model we should tend to (and which would 
require a fix on P8, since there we have chip->phb->pbcq, which is 
backwards. The pbcq object is the equivalent of the PEC).

So I think we should keep the qom relationship as it currently is on 
P9/P10, since it looks good. On P8, we can keep the current status for 
now and, as discussed privately, have another series later to clean 
things up.

   Fred


