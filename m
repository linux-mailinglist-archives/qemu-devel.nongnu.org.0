Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB103A99E7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:07:06 +0200 (CEST)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUK1-0002Zx-FR
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ltUI4-0001TM-TT
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:05:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3828
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ltUI1-00046Z-6M
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:05:04 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GC4UqK049618; Wed, 16 Jun 2021 08:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DY8MK7N626Iwov+oAVqFa0Oq218G+EmO1jaLe7mh+vg=;
 b=RYaE1dE5crbqRdCK44btG0zAAl17fFKnCH+ZJgFBjzsypKQ3Uj4GOnhk9LrgRN36Q/EV
 j3i4muqFcKKfWApf/u8ylsinbgUtWYSKQoR1uMm6XcQF6uN5brCfs/B5TfRIQ+Ihivsp
 BKKAHcpEhRoL2twC8FIv45psABHPEOWzZUl8AWgyyCO0Ge8YusJBmCg+9v38Miqn74Td
 1tGxlQ012G2XghhwVT15hoDwKbdnyE+XVOZMmSJnGFh6Hc8xhtT0GqrNrVP3vckU53lb
 dSGbbdDxBbqDCoCkZQc0h8TnKL4W4zS++bqufGw0tltx7iV1gOVvjSCh5iqUf5SOAFCP ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397cv3fp1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 08:04:56 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GC4WoK049847;
 Wed, 16 Jun 2021 08:04:55 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397cv3fnk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 08:04:55 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GBx6j4017520;
 Wed, 16 Jun 2021 12:04:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 394m6h94v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 12:04:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GC4TI422938080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 12:04:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 640DB11C058;
 Wed, 16 Jun 2021 12:04:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4944111C05B;
 Wed, 16 Jun 2021 12:04:25 +0000 (GMT)
Received: from [9.160.80.73] (unknown [9.160.80.73])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 12:04:25 +0000 (GMT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <19ca38d7-7779-9707-b195-d608f3200951@linux.ibm.com>
Date: Wed, 16 Jun 2021 15:04:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615152033.czhsaz44yxtc5ext@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IA_kUzNdTjwWhSWdpp7dYNC-EhOZ_lPJ
X-Proofpoint-GUID: reQadgFV0A64NE7HPGeaGTTEvbCFejo6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160070
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
 Tobin Feldman-Fitzthum <tobin@ibm.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

On 15/06/2021 18:20, Eduardo Habkost wrote:
> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
>> From: James Bottomley <jejb@linux.ibm.com>
>>
>> If the VM is using memory encryption and also specifies a kernel/initrd
>> or appended command line, calculate the hashes and add them to the
>> encrypted data.  For this to work, OVMF must support an encrypted area
>> to place the data which is advertised via a special GUID in the OVMF
>> reset table (if the GUID doesn't exist, the user isn't allowed to pass
>> in the kernel/initrd/cmdline via the fw_cfg interface).
>>
>> The hashes of each of the files is calculated (or the string in the case
>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>> table is GUID identified and since they're passed through the memcrypt
>> interface, the hash of the encrypted data will be accumulated by the
>> PSP.
>>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
>> strings, remove GCC pragma, fix checkpatch errors]
>> ---
>>
>> OVMF support for handling the table of hashes (verifying that the
>> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
>> to the measured hashes in the table) will be posted soon to edk2-devel.
>>
>> ---
>>  hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 119 insertions(+), 1 deletion(-)
>>
> 
> This is not an objection to the patch itself, but: can we do
> something to move all sev-related code to sev.c?  It would make
> the process of assigning a maintainer and reviewing/merging
> future patches much simpler.
> 

I'll look into this following Philippe's suggestions.

> I am not familiar with SEV internals, so my only question is
> about configurations where SEV is disabled:
> 
> [...]
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
>>      const char *initrd_filename = machine->initrd_filename;
>>      const char *dtb_filename = machine->dtb;
>>      const char *kernel_cmdline = machine->kernel_cmdline;
>> +    uint8_t buf[HASH_SIZE];
>> +    uint8_t *hash = buf;
>> +    size_t hash_len = sizeof(buf);
>> +    struct sev_hash_table *sev_ht = NULL;
>> +    int sev_ht_index = 0;
>>  
>>      /* Align to 16 bytes as a paranoia measure */
>>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
>> @@ -799,6 +844,22 @@ void x86_load_linux(X86MachineState *x86ms,
>>          exit(1);
>>      }
>>  
>> +    if (machine->cgs && machine->cgs->ready) {
> 
> machine->cgs doesn't seem to be a SEV-specific field.
> What if machine->cgs->ready is set but SEV is disabled?
> 

You're right; I'll change this to sev_enabled() like in
hw/i386/pc_sysfw.c .

-Dov


>> +        uint8_t *data;
>> +        struct sev_hash_table_descriptor *area;
>> +
>> +        if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>> +            fprintf(stderr, "qemu: kernel command line specified but OVMF has "
>> +                    "no hash table guid\n");
>> +            exit(1);
>> +        }
>> +        area = (struct sev_hash_table_descriptor *)data;
>> +
>> +        sev_ht = qemu_map_ram_ptr(NULL, area->base);
>> +        memcpy(sev_ht->guid, sev_hash_table_header_guid, sizeof(sev_ht->guid));
>> +        sev_ht->len = sizeof(*sev_ht);
>> +    }
>> +
>>      /* kernel protocol version */
>>      if (ldl_p(header + 0x202) == 0x53726448) {
>>          protocol = lduw_p(header + 0x206);
> [...]
> 

