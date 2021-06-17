Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77253ABC80
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:19:06 +0200 (CEST)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxXd-00049u-Si
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ltxVl-0002tS-En
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:17:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9576
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ltxVh-0008U1-PM
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:17:09 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HJ2SKj174516; Thu, 17 Jun 2021 15:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ldK8bw87dtvDQAZm8wMdWbHhTPuAcXEVVtvO6lDw+JU=;
 b=R6uBQB+yLnRZkzFNvuHXZ0WmdUqqAMsre5EPQy5aSbeV/6xuorWxSJhmXuIrv/H9+3QZ
 4rWddhb1shybV2yr9zUn7DF11oMmFg78sHbNaaRnIO+hBLa/8YDxHE72MRkT96iPIjuH
 YoMUeng9kNtCxfSqPUrw+Yv7rh19fGTSur7BY5fsThQgUKt52hfh4qKgtBGFrPaRMs1F
 fh0nuPEq2ywZhoa4YGKZOWEzlMzesu2Ln1VXOQjCaZ8NnPRFYgrK93CN++q9cZ9xE8u7
 IhXIxwgzKz9TcZdvlA0+7/qUQNTIFA9U3ijOAyIor99ZRN/PbrnilInSLxT6pg4rh1EM EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398bgq1ssy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 15:17:01 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HJ2onZ175597;
 Thu, 17 Jun 2021 15:17:01 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398bgq1ss9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 15:17:01 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HJGxAc001811;
 Thu, 17 Jun 2021 19:16:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3966jph3jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:16:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HJGu7W26608034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 19:16:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51E0D11C054;
 Thu, 17 Jun 2021 19:16:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCD7B11C04A;
 Thu, 17 Jun 2021 19:16:51 +0000 (GMT)
Received: from [9.160.80.73] (unknown [9.160.80.73])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 19:16:51 +0000 (GMT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
 <20210617172213.j2c3o7h76zrsw2yt@habkost.net>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <918371b8-f8d0-30c2-c0bb-812027e4cafb@linux.ibm.com>
Date: Thu, 17 Jun 2021 22:16:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617172213.j2c3o7h76zrsw2yt@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F4ase8e_eh0rc8YaMSljlBL3KtoHr41F
X-Proofpoint-ORIG-GUID: ZZWYMIM6b2qCdFYM8MYGgzzpgUCpyQJ8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170118
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/06/2021 20:22, Eduardo Habkost wrote:
> On Thu, Jun 17, 2021 at 03:48:52PM +0300, Dov Murik wrote:
>>
>>
>> On 15/06/2021 22:53, Philippe Mathieu-Daudé wrote:
>>> Hi Dov, James,
>>>
>>> +Connor who asked to be reviewer.
>>>
>>> On 6/15/21 5:20 PM, Eduardo Habkost wrote:
>>>> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
>>>>> From: James Bottomley <jejb@linux.ibm.com>
>>>>>
>>>>> If the VM is using memory encryption and also specifies a kernel/initrd
>>>>> or appended command line, calculate the hashes and add them to the
>>>>> encrypted data.  For this to work, OVMF must support an encrypted area
>>>>> to place the data which is advertised via a special GUID in the OVMF
>>>>> reset table (if the GUID doesn't exist, the user isn't allowed to pass
>>>>> in the kernel/initrd/cmdline via the fw_cfg interface).
>>>>>
>>>>> The hashes of each of the files is calculated (or the string in the case
>>>>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>>>>> table is GUID identified and since they're passed through the memcrypt
>>>>> interface, the hash of the encrypted data will be accumulated by the
>>>>> PSP.
>>>>>
>>>>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
>>>>> strings, remove GCC pragma, fix checkpatch errors]
>>>>> ---
>>>>>
>>>>> OVMF support for handling the table of hashes (verifying that the
>>>>> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
>>>>> to the measured hashes in the table) will be posted soon to edk2-devel.
>>>>>
>>>>> ---
>>>>>  hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>  1 file changed, 119 insertions(+), 1 deletion(-)
>>>>>
>>>>
>>>> This is not an objection to the patch itself, but: can we do
>>>> something to move all sev-related code to sev.c?  It would make
>>>> the process of assigning a maintainer and reviewing/merging
>>>> future patches much simpler.
>>>>
>>>> I am not familiar with SEV internals, so my only question is
>>>> about configurations where SEV is disabled:
>>>>
>>>> [...]
>>>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>>>> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
>>>>>      const char *initrd_filename = machine->initrd_filename;
>>>>>      const char *dtb_filename = machine->dtb;
>>>>>      const char *kernel_cmdline = machine->kernel_cmdline;
>>>>> +    uint8_t buf[HASH_SIZE];
>>>>> +    uint8_t *hash = buf;
>>>>> +    size_t hash_len = sizeof(buf);
>>>>> +    struct sev_hash_table *sev_ht = NULL;
>>>>> +    int sev_ht_index = 0;
>>>
>>> Can you move all these variable into a structure, and use it as a
>>> SEV loader context?
>>>
>>> Then each block of code you added can be moved to its own function,
>>> self-described, working with the previous context.
>>>
>>> The functions can be declared in sev_i386.h and defined in sev.c as
>>> Eduardo suggested.
>>>
>>
>> Thanks Philippe, I'll try this approach.
>>
>>
>> I assume you mean that an addition like this:
>>
>> +    if (sev_ht) {
>> +        struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
>> +
>> +        qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)kernel_cmdline,
>> +                           strlen(kernel_cmdline) + 1,
>> +                           &hash, &hash_len, &error_fatal);
>> +        memcpy(e->hash, hash, hash_len);
>> +        e->len = sizeof(*e);
>> +        memcpy(e->guid, sev_cmdline_entry_guid, sizeof(e->guid));
>> +    }
>>
>> will be extracted to a function, and here (in x86_load_linux()) replaced
>> with a single call:
>>
>>     sev_kernel_loader_calc_cmdline_hash(&sev_loader_context, kernel_cmdline);
>>   
>> and that function will have an empty stub in non-SEV builds, and a do-
>> nothing condition (at the beginning) if it's an SEV-disabled VM, and
>> will do the actual work in SEV VMs.
>>
>> Right?
> 
> I would suggest a generic notification mechanism instead, where
> SEV code could register to be notified after the kernel/initrd is
> loaded.
> 
> Maybe the existing qemu_add_machine_init_done_notifier()
> mechanism would be enough for this?  Is there a reason the hash
> calculation needs to be done inside x86_load_linux(),
> specifically?
> 

SEV already registers that callback - sev_machine_done_notify, which
calls sev_launch_get_measure.  We want the hashes page filled and
encrypted *before* that measurement is taken by the PSP.  We can squeeze
in the hashes and page encryption before the measurement *if* we can
calculate the hashes at this point.

x86_load_linux already deals with kernel/initrd/cmdline, so that was the
easiest place to add the hash calculation.

It's also a bit weird (semantically) to modify the guest RAM after
pc_memory_init has finished.


We can add a new notifier towards the end of x86_load_linux, but can we
avoid passing all the different pointers+sizes of kernel/initrd/cmdline
to that notifier?  Do you envision other uses for registering on that event?


-Dov


>>
>>
>> Also, should I base my next version on top of the current master, or on
>> top of your SEV-Housekeeping patch series, or on top of some other tree?
>>
>>
>> -Dov
>>
>>>>>  
>>>>>      /* Align to 16 bytes as a paranoia measure */
>>>>>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
>>>>> @@ -799,6 +844,22 @@ void x86_load_linux(X86MachineState *x86ms,
>>>>>          exit(1);
>>>>>      }
>>>>>  
>>>>> +    if (machine->cgs && machine->cgs->ready) {
>>>>
>>>> machine->cgs doesn't seem to be a SEV-specific field.
>>>> What if machine->cgs->ready is set but SEV is disabled?
>>>>
>>>>> +        uint8_t *data;
>>>>> +        struct sev_hash_table_descriptor *area;
>>>>> +
>>>>> +        if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>>>>> +            fprintf(stderr, "qemu: kernel command line specified but OVMF has "
>>>>> +                    "no hash table guid\n");
>>>>> +            exit(1);
>>>>> +        }
>>>>> +        area = (struct sev_hash_table_descriptor *)data;
>>>>> +
>>>>> +        sev_ht = qemu_map_ram_ptr(NULL, area->base);
>>>>> +        memcpy(sev_ht->guid, sev_hash_table_header_guid, sizeof(sev_ht->guid));
>>>>> +        sev_ht->len = sizeof(*sev_ht);
>>>>> +    }
>>>>> +
>>>>>      /* kernel protocol version */
>>>>>      if (ldl_p(header + 0x202) == 0x53726448) {
>>>>>          protocol = lduw_p(header + 0x206);
>>>> [...]
>>>>
>>>
>>
> 

