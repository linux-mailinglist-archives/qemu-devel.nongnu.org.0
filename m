Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239BA31FEF9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:51:39 +0100 (CET)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAsM-0003kl-7E
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lDAqs-00033A-8v; Fri, 19 Feb 2021 13:50:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lDAqn-00004r-H9; Fri, 19 Feb 2021 13:50:05 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11JIhvkI038560; Fri, 19 Feb 2021 13:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=F1uq8sX5ZXgduYVRLM+Lk7rBYXpmr1mFEW+JLi9ILkg=;
 b=Ol+jxA71Lr44HeJCPYaEs8ZILzO0dapticp3XmyJRrcF/3aEC3bivNuAV7hyP4E20D0X
 Wkz5gfsKr5S7AqIFpFbzeCG5HuPiKvURW+B1cgm+KZJ70uUrOJrxkYZ4tpkk2Pvbh68q
 HuEU+Ed9wUL5dKt7ejZpE67eHS4DfAe/PwPV7OVi78RRccgy12yklRWoNncSI7sYoE0m
 XjDypSQZzD1eg6mhoRiJBvrAEE9RqAwcS4i8Pyvh58YVZt0vRcFfKfU0RptGFfChaoMs
 fpN1x0wdJFYdCxHj+QxesbCZdeKj4VIiY/HeCGNjuD6ZiC/lvmsdxmwa+4fOqr+H4JLX bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36tjv5g4p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 13:49:57 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11JIjI1a042503;
 Fri, 19 Feb 2021 13:49:56 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36tjv5g4my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 13:49:56 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11JIm69V031616;
 Fri, 19 Feb 2021 18:49:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 36p6d8dtdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 18:49:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11JInpYY42795510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 18:49:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71444A4051;
 Fri, 19 Feb 2021 18:49:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15DA9A4040;
 Fri, 19 Feb 2021 18:49:51 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.23.206])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Feb 2021 18:49:51 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] css: SCHIB measurement block origin must be aligned
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1613741973-3711-1-git-send-email-pmorel@linux.ibm.com>
 <1613741973-3711-2-git-send-email-pmorel@linux.ibm.com>
 <c5d8de0c-9dab-ec80-3ac7-cd180baed81a@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <4887200d-bdaf-42dc-176d-439efef4de45@linux.ibm.com>
Date: Fri, 19 Feb 2021 19:49:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c5d8de0c-9dab-ec80-3ac7-cd180baed81a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102190144
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/19/21 2:41 PM, Thomas Huth wrote:
> On 19/02/2021 14.39, Pierre Morel wrote:
>> The Measurement Block Origin inside the SCHIB is used when
>> Measurement Block format 1 is in used and must be aligned
>> on 64 bytes otherwise an operand exception is recognized
>> when issuing the Modify Sub CHannel (MSCH) instruction.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   target/s390x/ioinst.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
>> index a412926d27..1ee11522e1 100644
>> --- a/target/s390x/ioinst.c
>> +++ b/target/s390x/ioinst.c
>> @@ -121,6 +121,12 @@ static int ioinst_schib_valid(SCHIB *schib)
>>       if (be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_XMWME) {
>>           return 0;
>>       }
>> +    /* for MB format 1 bits 26-31 of word 11 must be 0 */
>> +    /* MBA uses words 10 and 11, it means align on 2**6 */
>> +    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
>> +        (be64_to_cpu(schib->mba) & 0x03fUL)) {
>> +        return 0;
>> +    }
>>       return 1;
>>   }
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

