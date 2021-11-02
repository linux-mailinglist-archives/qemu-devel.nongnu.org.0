Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0426442EE0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:11:16 +0100 (CET)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtZM-0005MR-36
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhtL4-0007gb-O0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:56:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38132
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhtL2-0004zM-Mr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:56:30 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2CLdaO031742; 
 Tue, 2 Nov 2021 12:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0eH07bIZjRnMC15iH7IBNVy5g3jMkZ0SLnyota69mF0=;
 b=btu40ttJDVozlRQXBQX3GXGh3E1WnUjEbrsKyyYeYjKo/ZiboRUQ2VUcT9XzFhsW0RZ+
 I9sjkc4kVSjbRuFrOGTTWXe8wIyJdv8C6IEB+H7VmU+SyrONSLYQhROQTIU2gYG3JMcU
 JbAIEEb0teug5gFTGOtxdmDFWq+WVCNix1d+zTfrrHx5D77L4uldHAtIJHv/tE/I8ABu
 I9yWeXUfxGFejZ/WguQzMY+Wam65UthGkKG5LLoB4khWdH8hiawVnoHIwHiVKF8CXyc2
 Mla8dpgy/+BjW8UnCNF7RGqcWkj8VPn55/+mFZ/zFmH+nzjx6XdDbm5m2WcpUFJLqub3 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c35940qpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 12:56:25 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2Cdw4g001837;
 Tue, 2 Nov 2021 12:56:25 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c35940qp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 12:56:25 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2CrCP1021874;
 Tue, 2 Nov 2021 12:56:24 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3c0wpb6h2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 12:56:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2CuNaE38732176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 12:56:23 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B0A812405A;
 Tue,  2 Nov 2021 12:56:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3AEE124052;
 Tue,  2 Nov 2021 12:56:20 +0000 (GMT)
Received: from [9.65.202.213] (unknown [9.65.202.213])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Nov 2021 12:56:20 +0000 (GMT)
Message-ID: <83e91693-5e05-ad5a-4d42-75badb2036e0@linux.ibm.com>
Date: Tue, 2 Nov 2021 14:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF
 hashes table area
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-3-dovmurik@linux.ibm.com> <YYEwwMsS2SsUzypl@work-vm>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYEwwMsS2SsUzypl@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v2cKXxKwWj5nrWz4E4iokAZP67EGpG6H
X-Proofpoint-ORIG-GUID: HGxXkqtHvv0waEwBbNAh-gFDXlt5xgSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020072
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/11/2021 14:36, Dr. David Alan Gilbert wrote:
> * Dov Murik (dovmurik@linux.ibm.com) wrote:
>> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
>> for measured linux boot", 2021-09-30) introduced measured direct boot
>> with -kernel, using an OVMF-designated hashes table which QEMU fills.
>>
>> However, no checks are performed on the validity of the hashes area
>> designated by OVMF.  Specifically, if OVMF publishes the
>> SEV_HASH_TABLE_RV_GUID entry but it is filled with zeroes, this will
>> cause QEMU to write the hashes entries over the first page of the
>> guest's memory (GPA 0).
>>
>> Add validity checks to the published area.  If the hashes table area's
>> base address is zero, or its size is too small to fit the aligned hashes
>> table, warn and skip the hashes entries addition.  In such case, the
>> following warning will be displayed:
>>
>>     qemu-system-x86_64: warning: SEV: OVMF's hashes table area is invalid (base=0x0 size=0x0)
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Reported-by: Brijesh Singh <brijesh.singh@amd.com>
>> ---
>>  target/i386/sev.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 682b8ccf6c..a20ddb545e 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -1201,13 +1201,18 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>>      uint8_t kernel_hash[HASH_SIZE];
>>      uint8_t *hashp;
>>      size_t hash_len = HASH_SIZE;
>> -    int aligned_len;
>> +    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
>>  
>>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>>          warn_report("SEV: kernel specified but OVMF has no hash table guid");
>>          return false;
>>      }
>>      area = (SevHashTableDescriptor *)data;
>> +    if (!area->base || area->size < aligned_len) {
>> +        warn_report("SEV: OVMF's hashes table area is invalid (base=0x%x size=0x%x)",
>> +                    area->base, area->size);
>> +        return false;
>> +    }
> 
> That's probably a useful check, so
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 

Thanks.


> however, maybe it needs to be more thorough before using area->base to
> qemu_map_ram_ptr? - I think it'll get unhappy if it's a bad address not
> in a ram block. (Or check you're running over the end of a ramblock)
>

Does address_space_write perform these checks? Or maybe another API for
accessing the guest's RAM?

-Dov

> Dave
> 
>>  
>>      /*
>>       * Calculate hash of kernel command-line with the terminating null byte. If
>> @@ -1266,7 +1271,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>>      memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
>>  
>>      /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
>> -    aligned_len = ROUND_UP(ht->len, 16);
>>      if (aligned_len != ht->len) {
>>          /* zero the excess data so the measurement can be reliably calculated */
>>          memset(ht->padding, 0, aligned_len - ht->len);
>> -- 
>> 2.25.1
>>

