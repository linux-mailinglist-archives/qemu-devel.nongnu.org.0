Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98B40266C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:51:04 +0200 (CEST)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXkt-0000dB-9N
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXjM-00085a-Bd; Tue, 07 Sep 2021 05:49:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63606
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXjK-0000MK-LN; Tue, 07 Sep 2021 05:49:28 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1879Ys6a002025; Tue, 7 Sep 2021 05:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=USvflf793sw/TascEeGlxQg26iYd7IpF47A4lJnUXhc=;
 b=Q8f4kk5BJODw8WcgH/D1v5i0m0QXyjvtv0zjyfsEvQoAJWzIYdXmQCx/qdmeOFMg9YZT
 sH3JxFFPYtlWt6xzuJTR3YVl7Tm9k45o1NmJ4GDi6xShkxSfJ1d4GcnFlZE+WgNB3STf
 wQV9aV1Tv7L27yoYzfOPsuBDuTCpOOg8fpKDLITOzTRbXH8YmIFqdFIeZGWrNJ8TdcLG
 9IPrTCBUAs+KHDD4fl0pXEvc6PJTJoz72JILzyDjPRhzCxHe3jJzq/Q49aE/oaXWabFh
 5/cPQEz4V5aEB18sJcfVYuxwEfVzEyGRVvQ6FGeD16L6/wWmAHo5WamkRFJRFX/ZfJYG Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ax0p3q2cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:49:24 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1879c6BS010407;
 Tue, 7 Sep 2021 05:49:23 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ax0p3q2by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:49:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1879g6mY017190;
 Tue, 7 Sep 2021 09:49:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3av0e94748-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:49:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1879nIxp53346648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 09:49:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E14BAE053;
 Tue,  7 Sep 2021 09:49:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1381AE056;
 Tue,  7 Sep 2021 09:49:17 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.9.165])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 09:49:17 +0000 (GMT)
Subject: Re: [PATCH v2 4/5] s390x: topology: Topology list entries and SYSIB
 15.x.x
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
 <ffcf733a-1e72-3437-9ece-58767629c5fb@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <4a69049f-8b24-dcfc-f7f2-db6549b94648@linux.ibm.com>
Date: Tue, 7 Sep 2021 11:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ffcf733a-1e72-3437-9ece-58767629c5fb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NEaq6JmO1xKLfrAOe743Lvevd1XV4BLK
X-Proofpoint-ORIG-GUID: q8HaDXoTbDR1PCDTPZBsZVcp1c9t3PpW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 9:54 AM, Thomas Huth wrote:
> On 22/07/2021 19.42, Pierre Morel wrote:
>> We define the CPU type Topology List Entry and the
>> Container type Topology List Entry to implement SYSIB 15.1.x
>>
>> This patch will be squatched with the next patch.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   target/s390x/cpu.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index b26ae8fff2..d573ba205e 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -564,6 +564,50 @@ typedef union SysIB {
>>   } SysIB;
>>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>> +/* CPU type Topology List Entry */
>> +typedef struct SysIBTl_cpu {
>> +        uint8_t nl;
>> +        uint8_t reserved0[3];
>> +        uint8_t reserved1:5;
>> +        uint8_t dedicated:1;
>> +        uint8_t polarity:2;
>> +        uint8_t type;
>> +        uint16_t origin;
>> +        uint64_t mask;
>> +} QEMU_PACKED SysIBTl_cpu;
>> +
>> +/* Container type Topology List Entry */
>> +typedef struct SysIBTl_container {
>> +        uint8_t nl;
>> +        uint8_t reserved[6];
>> +        uint8_t id;
>> +} QEMU_PACKED SysIBTl_container;
> 
> Any chance that you could drop the PACKED from th above two structs and 
> use QEMU_BUILD_BUG_ON to check the size instead?
> ... PACKED was causing some build issues on other architectures in the 
> past already, so we should try to avoid it if possible.

I can do this.

Thanks
Pierre

> 
>   Thomas
> 

-- 
Pierre Morel
IBM Lab Boeblingen

