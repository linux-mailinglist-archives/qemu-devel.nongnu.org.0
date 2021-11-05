Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7828C446057
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 08:54:59 +0100 (CET)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miu3u-0005UM-4P
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 03:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1miu2B-0004n6-3P
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:53:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1miu28-0005tJ-Lu
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:53:10 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A54mjd6003215; 
 Fri, 5 Nov 2021 07:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=20+ABjorkr4nlg4bc0X/1qD1mxc7WqBtpuY1mlwp/a4=;
 b=nMYFalFvUSIZ/pW1YHe6Dgliiw1He2zXnD9EBUPTAghlZIT9f7FS3h9ebr2/0SBw7uc7
 7XVf/unJwgdrRjraLRS+xQAfngT9XvPju1Tfuaj72fKayXbybyMSl/Bt8uQeRdzgnpsP
 h04RRN9ubHJBWARsMwgdQz5WBBdEm0qY3CmlP8YNtlrL7AWTiFGXpiJaDaiATSRLkdh8
 wYzrX2pHqqk4Wk55vfV1/PJcSW+yU5al5NVW+Rwxk7SRzQLTFtymRlQhBoFPRD3NSadX
 QyU2/5RS9jZpzYdjEzXuTt1duE8iHQQIXaeZ3jJHFtSbyetgVzFJG24NgO79vUzJQ4qv yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4t5hevhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 07:53:04 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A57Q74D010195;
 Fri, 5 Nov 2021 07:53:04 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4t5hevhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 07:53:04 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A57lJeM002755;
 Fri, 5 Nov 2021 07:53:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3c4t4e6mwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 07:53:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A57r2Wg52101540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 07:53:02 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F1E7AE05C;
 Fri,  5 Nov 2021 07:53:02 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC886AE066;
 Fri,  5 Nov 2021 07:52:59 +0000 (GMT)
Received: from [9.65.75.52] (unknown [9.65.75.52])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 07:52:59 +0000 (GMT)
Message-ID: <1425e74c-91db-3338-0332-265b1d88b753@linux.ibm.com>
Date: Fri, 5 Nov 2021 09:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF
 hashes table area
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-3-dovmurik@linux.ibm.com>
 <YYKz0QX3AIf9oxYH@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYKz0QX3AIf9oxYH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DFs_6YuUY58o4RVurF_pPCAva2EBB4Pj
X-Proofpoint-GUID: dV8IsWb3lD1uOQJThaJv5Wd7Ge-sti8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111050041
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 03/11/2021 18:07, Daniel P. Berrangé wrote:
> On Mon, Nov 01, 2021 at 10:21:35AM +0000, Dov Murik wrote:
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
> I think warn_report is likely a bad idea.
> 
> If someone's use case is relying on the hashs being populated, then
> we need to be able to error_report and exit, not carry on with a
> known broken setup.
> 

Thanks you.  As I wrote elsewhere, I will put the whole thing under a
flag of sev-guest.  If the flag is ON then I will error_report and exit
if the GUID is missing or if the address/size is wrong, as you suggest.

-Dov

