Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116AF47B082
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:43:55 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKpN-0006k2-Fk
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mzJuj-0002FB-9C; Mon, 20 Dec 2021 09:45:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mzJuP-00040n-DG; Mon, 20 Dec 2021 09:45:13 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK7kqX2022063; 
 Mon, 20 Dec 2021 10:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nMz/RG1aV2Suyg+573BYIR4XFYi6nEIdvmypLnMY9vs=;
 b=GBMydP7zGmPqdYaMeYIU8nrOuLEY+ouj5VgbU+uKbao0k5FrjEh9vBwSCuz6bRXwhZTf
 on0mJ/WAZQFG1CuLH+n1dB1adzvjozH+uU3CHGKWh52aO5dwvf52Rzqthc+kHRxA1ddT
 ydsGf9wca9mhyU4YNpV99jn0+2P1vtZ/lzxIDhzEvGm3DljMgGmKjy3Pr1y32pMNNZcu
 cGoryL6ZoFYXMkusshJ0YC5BAs6WQkj2uVBdfIzklF1zHaptMVZEGdKmCAkSbR08Z/P5
 io1Zn4ydvYqKujtxdwIdwIA8spQlCNugXiJOgiy5Bq+CLjJEnzv04ct6bK2WGpGm03N4 ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1ske8xtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 10:43:49 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKAVrnR003659;
 Mon, 20 Dec 2021 10:43:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1ske8xt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 10:43:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKAPIrn016469;
 Mon, 20 Dec 2021 10:43:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3d1799tvv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 10:43:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKAhYfv40370680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 10:43:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D523AE045;
 Mon, 20 Dec 2021 10:43:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFBB6AE057;
 Mon, 20 Dec 2021 10:43:33 +0000 (GMT)
Received: from [9.171.18.110] (unknown [9.171.18.110])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 10:43:33 +0000 (GMT)
Message-ID: <d7459eec-c760-1441-ce40-550b0897e1ba@linux.ibm.com>
Date: Mon, 20 Dec 2021 11:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
 <20211217145811.71dd0a70.pasic@linux.ibm.com>
 <7143886b-ffa2-e5f7-e7fe-b06212522824@linux.ibm.com>
 <20211217202818.7e843a1d.pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211217202818.7e843a1d.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KU_IN1vXWATLuBejNQHCHyKyPDmdWw_w
X-Proofpoint-GUID: Fsfkbsads1RobXRu9CmLGUjXFWEJ9N5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_05,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200055
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, Nico Boehr <nrb@linux.ibm.com>, frankja@linux.ibm.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/17/21 20:28, Halil Pasic wrote:
> On Fri, 17 Dec 2021 18:13:47 +0100
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>>>> Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
>>>> as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
>>>> 1, 6 and 7 need to be zero.
>>>
>>> On a second thought, don't we have to make sure then that bit 5 is
>>> ignored?
>>>
>>> static void copy_pmcw_from_guest(PMCW *dest, const PMCW *src)
>>> {
>>>       int i;
>>>
>>>       dest->intparm = be32_to_cpu(src->intparm);
>>>       dest->flags = be16_to_cpu(src->flags);
>>>       dest->devno = be16_to_cpu(src->devno);
>>>
>>> Here we seem to grab flags as a whole, but actually we would have to
>>> mask of bit 5.
>>
>> Why?
>> If this bit is ignored by the machine shouldn't we just ignore it?
>> Forcing it to 0 or to 1 is purely arbitrary no?
> 
> We do the masking later on:
> IOInstEnding css_do_msch(SubchDev *sch, const SCHIB *orig_schib)
> {
> [..]
>      /* Only update the program-modifiable fields. */
>      schib->pmcw.intparm = schib_copy.pmcw.intparm;
>      oldflags = schib->pmcw.flags;
>      schib->pmcw.flags &= ~(PMCW_FLAGS_MASK_ISC | PMCW_FLAGS_MASK_ENA |
>                    PMCW_FLAGS_MASK_LM | PMCW_FLAGS_MASK_MME |
>                    PMCW_FLAGS_MASK_MP);
>      schib->pmcw.flags |= schib_copy.pmcw.flags &
>              (PMCW_FLAGS_MASK_ISC | PMCW_FLAGS_MASK_ENA |
>               PMCW_FLAGS_MASK_LM | PMCW_FLAGS_MASK_MME |
>               PMCW_FLAGS_MASK_MP);
> [..]
> 
> I just didn't read far enough. We do that for a while now.

yes.

> 
> The PoP says that the machine shall ignore other fields
> of the PMCW when an MSCH is performed. I.e. we should not update
> "our" pmcw.flags bit 5 from 0 to 1 even if 1 was supplied, and
> thus STSCH should keep storing the bit 5 as 0 even if there was
> a MSCH with bit 5 set.

So I do understand that there is no problem, we do not keep track
of this bit in our pmcw.flags and stsch keep storing this bit as 0. right?

Regards,
Pierre

> 
> Regards,
> Halil
> 

-- 
Pierre Morel
IBM Lab Boeblingen

