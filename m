Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6742B9D6F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:15:48 +0100 (CET)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsDT-0007cz-Bj
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfs56-0005XR-KO
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:07:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60952
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfs51-0007gK-Fx
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:07:06 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJM1bqu108795; Thu, 19 Nov 2020 17:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LVfrInorSDBAsyQBDt5W3Nx9tDmWZzahAmAg6P1SRD0=;
 b=LLVabaqpjX6jpNVu0RLtROdVfos0Ftw3pLlLcPtQc6cFyB+cTMZ5FoiOy9hPooMc4Y2/
 dDVNVGJ9dCW3AYTWtfcVF9unuuEqYO04UJ1kFhun9hPUImYkaSZbduiwIw6YbPzBLlHH
 FKxvmBPyKzn+81+15bb97dpOGH+ASqVEA1hw39ykYPaxw4ZL2r7Y+6dLPA6l8Pyk80mo
 8imyJbOv9ub+tKaMki2oBWueKkAzG+5datbsU/WKivylO0fCZk+7rEsVYIwbAFg26eCX
 cqZB/6ARWeRyEvQFA0XGu23yOnZEPCCaha0S9kPudXjmSgjTIzNdVNYlrKOMHhK7RXkU Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34x0m6rwxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 17:07:01 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJM28j3113383;
 Thu, 19 Nov 2020 17:07:01 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34x0m6rwxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 17:07:01 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJM3IFS027392;
 Thu, 19 Nov 2020 22:07:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 34t6v9hask-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 22:07:00 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJM6xXC38207920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 22:06:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C606A3C2;
 Thu, 19 Nov 2020 22:06:59 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A375F6A3BE;
 Thu, 19 Nov 2020 22:06:58 +0000 (GMT)
Received: from [9.65.247.165] (unknown [9.65.247.165])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 22:06:58 +0000 (GMT)
Subject: Re: [PATCH v3 1/9] fuzz: Make fork_fuzz.ld compatible with LLVM's LLD
To: Alexander Bulekov <alxndr@bu.edu>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-2-dbuono@linux.vnet.ibm.com>
 <20201106145028.qlkng2l25b7ehvsb@mozz.bu.edu>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <edfa9312-f2cf-7f6e-f77a-b63dde380d96@linux.vnet.ibm.com>
Date: Thu, 19 Nov 2020 17:06:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201106145028.qlkng2l25b7ehvsb@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_12:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190146
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Alex,
do you think you could also give it a try linking with LLD?

just add --extra-ldflags="-fuse-ld=lld"

I do see some small differences when moving from BFD ro LLD, but they 
should not be of importance. The position of the data.fuzz* is kept.

size -A on qemu-fuzz-i386, LTO DISABLED:

BFD
section                  size       addr
[...]
.got                    10704   29849128
.data                 1160800   29859840
__sancov_pcs          3362992   31020640
.data.fuzz_start       210187   34385920
.data.fuzz_ordered     211456   34596352
.bss                  9659608   34807808
.comment                  225          0
[...]

BFD
section                  size       addr
[...]
.got                      816   27824632
.got.plt                 9992   27825448
.data                 1160808   27839536
.data.fuzz_start       210187   29003776
.data.fuzz_ordered     211456   29214208
.data.fuzz_end              0   29425664
.tm_clone_table             0   29425664
__sancov_pcs          3362992   29425664
.bss                  9659624   32788672

I tried running the fuzzer and didn't seem to have any issues, but I
haven't tried a test-build with OSS-Fuzz. Is there a info somewhere
on how to do that?

Thanks,
Daniele

On 11/6/2020 9:50 AM, Alexander Bulekov wrote:
> On 201105 1718, Daniele Buono wrote:
>> LLVM's linker, LLD, supports the keyword "INSERT AFTER", starting with
>> version 11.
>> However, when multiple sections are defined in the same "INSERT AFTER",
>> they are added in a reversed order, compared to BFD's LD.
>>
>> This patch makes fork_fuzz.ld generic enough to work with both linkers.
>> Each section now has its own "INSERT AFTER" keyword, so proper ordering is
>> defined between the sections added.
>>
> 
> Hi Daniele,
> Good to know that LLVM now has support for "INSERT AFTER" :)
> 
> I compared the resulting symbols between __FUZZ_COUNTERS_{START,END}
> (after linking with BFD) before/after this patch, and they look good. I
> also ran a test-build with OSS-Fuzz container and confirmed that the
> resulting binary also had proper symbols.
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> 
> Thanks
> 
>> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> ---
>>   tests/qtest/fuzz/fork_fuzz.ld | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/fuzz/fork_fuzz.ld b/tests/qtest/fuzz/fork_fuzz.ld
>> index bfb667ed06..cfb88b7fdb 100644
>> --- a/tests/qtest/fuzz/fork_fuzz.ld
>> +++ b/tests/qtest/fuzz/fork_fuzz.ld
>> @@ -16,6 +16,11 @@ SECTIONS
>>         /* Lowest stack counter */
>>         *(__sancov_lowest_stack);
>>     }
>> +}
>> +INSERT AFTER .data;
>> +
>> +SECTIONS
>> +{
>>     .data.fuzz_ordered :
>>     {
>>         /*
>> @@ -34,6 +39,11 @@ SECTIONS
>>          */
>>          *(.bss._ZN6fuzzer3TPCE);
>>     }
>> +}
>> +INSERT AFTER .data.fuzz_start;
>> +
>> +SECTIONS
>> +{
>>     .data.fuzz_end : ALIGN(4K)
>>     {
>>         __FUZZ_COUNTERS_END = .;
>> @@ -43,4 +53,4 @@ SECTIONS
>>    * Don't overwrite the SECTIONS in the default linker script. Instead insert the
>>    * above into the default script
>>    */
>> -INSERT AFTER .data;
>> +INSERT AFTER .data.fuzz_ordered;
>> -- 
>> 2.17.1
>>
> 

