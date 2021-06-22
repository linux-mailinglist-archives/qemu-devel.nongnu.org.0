Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8151F3B00B6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:47:45 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvd0S-0001cR-JM
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvcxd-00071m-Aj
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:44:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33570
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvcxZ-00018I-U3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:44:49 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M9Y4qE156963; Tue, 22 Jun 2021 05:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VgpLMbBN0f6GZPF50Zur4S/+qZ531kfC+pCmlz5+RcM=;
 b=Ok3py9VsKFeannFGGyxfaq6rqQ/m9iasziUnCbPAKGMZB291uRL6cdgzv+PuIYi4If4H
 aZEvin3PL8uYFhA0jCvh4VxS+rra5cQka22BQy4MX4WMCmHiVg5xGK3uNB3IsWYA3xFB
 5SObv2v2SvDUrW8LZY6R0uYlnTAX3cauuPGRBmY4kMDIVsDvmMOKbUA1ZwM79sgNYdCy
 K1Ws6ImaCq1A/b1okM+pwfMG418Am1RgYYU4OnhmPcAgvD2l6i/kElIsmxnu+3F/rAVF
 2hIb1AlfW3YMGXyLnP/q8EMr+Ziio+gz/BsN687eXund+4nGdvIQ3q8sJuluZioPXucw Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39b87p0e3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 05:44:42 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15M9YD0Q157546;
 Tue, 22 Jun 2021 05:44:42 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39b87p0e27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 05:44:42 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M9SofF008130;
 Tue, 22 Jun 2021 09:44:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 399878rrbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 09:44:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15M9ibRk29819238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 09:44:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C42F11C04A;
 Tue, 22 Jun 2021 09:44:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A65E11C054;
 Tue, 22 Jun 2021 09:44:32 +0000 (GMT)
Received: from [9.160.112.114] (unknown [9.160.112.114])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 09:44:31 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <89258a7b-fe24-4930-5af7-278b68d1f07c@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <25b381ad-cdca-60dc-6fb1-1d97ea626843@linux.ibm.com>
Date: Tue, 22 Jun 2021 12:44:30 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <89258a7b-fe24-4930-5af7-278b68d1f07c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k-P2-_ql9UI_IMly4IC_m3r0V2vrGmX8
X-Proofpoint-GUID: HuDjC1qE9XFUC1yAxbEySE-JsYGDveP-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_05:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220061
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L5=0.001, SPF_HELO_NONE=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.ibm.com,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 21/06/2021 23:32, Philippe Mathieu-Daudé wrote:
> Hi Dov,
> 
> Minor comments inlined.
> 
> On 6/21/21 9:05 PM, Dov Murik wrote:
>> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
>> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
>> table area.  For this to work, OVMF must support an encrypted area to
>> place the data which is advertised via a special GUID in the OVMF reset
>> table.
>>
>> The hashes of each of the files is calculated (or the string in the case
>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>> table is GUID identified and since they're passed through the
>> sev_encrypt_flash interface, the hashes will be accumulated by the PSP
>> measurement (SEV_LAUNCH_MEASURE).
>>
>> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  target/i386/sev-stub.c |   5 ++
>>  target/i386/sev.c      | 121 +++++++++++++++++++++++++++++++++++++++++
>>  target/i386/sev_i386.h |  12 ++++
>>  3 files changed, 138 insertions(+)
>>
>> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
>> index 0227cb5177..2b5e42d644 100644
>> --- a/target/i386/sev-stub.c
>> +++ b/target/i386/sev-stub.c
>> @@ -81,3 +81,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>>      error_setg(errp, "SEV is not available in this QEMU");
>>      return NULL;
>>  }
>> +
>> +bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
>> +{
>> +    return false;
> 
> Can't happen, so:
> 
>       g_assert_not_reached();
> 

OK, I'll use it.

I guess the comment is relevant to other functions in that file as well
(e.g., sev_encrypt_flash), but I'll leave that to your SEV-housekeeping
series.


>> +}
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 83df8c09f6..8e3f601bb6 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -23,6 +23,7 @@
>>  #include "qemu/base64.h"
>>  #include "qemu/module.h"
>>  #include "qemu/uuid.h"
>> +#include "crypto/hash.h"
>>  #include "sysemu/kvm.h"
>>  #include "sev_i386.h"
>>  #include "sysemu/sysemu.h"
>> @@ -83,6 +84,29 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>>      uint32_t reset_addr;
>>  } SevInfoBlock;
>>  
>> +#define SEV_HASH_TABLE_RV_GUID  "7255371f-3a3b-4b04-927b-1da6efa8d454"
>> +typedef struct __attribute__((__packed__))
> 
> The codebase used to use QEMU_PACKED (see "qemu/compiler.h" but
> apparently it isn't enforced.
> 

I can use it.


>  SevHashTableDescriptor {
>> +    /* SEV hash table area guest address */
>> +    uint32_t base;
>> +    /* SEV hash table area size (in bytes) */
>> +    uint32_t size;
>> +} SevHashTableDescriptor;
>> +
>> +/* hard code sha256 digest size */
>> +#define HASH_SIZE 32
>> +
>> +typedef struct __attribute__((__packed__)) SevHashTableEntry {
>> +    uint8_t guid[16];
> 
> What about using QemuUUID?
> 

I agree. I'll use it, coupled with your .data init below.


>> +    uint16_t len;
>> +    uint8_t hash[HASH_SIZE];
>> +} SevHashTableEntry;
>> +
>> +typedef struct __attribute__((__packed__)) SevHashTable {
>> +    uint8_t guid[16];
>> +    uint16_t len;
>> +    SevHashTableEntry entries[];
>> +} SevHashTable;
>> +
>>  static SevGuestState *sev_guest;
>>  static Error *sev_mig_blocker;
>>  
>> @@ -1077,6 +1101,103 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
>>      return 0;
>>  }
>>  
>> +static const uint8_t sev_hash_table_header_guid[] =
>> +        UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
>> +                0xd4, 0x11, 0xfd, 0x21);
> 
> Personally I'd have used:
> 
> static const QemuUUID sev_hash_table_header_guid = {
>     .data = UUID_LE(...);
> };

Yes, I'll use this.

> 
> and added qemu_uuid_copy() to complete the API, but that's fine.

I think simple C assignment works for structs (and hence QemuUUID),
something like:

    SevHashTable *ht = ...;
    ht->guid = sev_hash_table_header_guid;

(where both ht->guid and sev_hash_table_header_guid are QemuUUID.)


> 
>> +
>> +static const uint8_t sev_kernel_entry_guid[] =
>> +        UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
>> +                0x72, 0xd2, 0x04, 0x5b);
>> +static const uint8_t sev_initrd_entry_guid[] =
>> +        UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
>> +                0x91, 0x69, 0x78, 0x1d);
>> +static const uint8_t sev_cmdline_entry_guid[] =
>> +        UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
>> +                0x4d, 0x36, 0xab, 0x2a);
>> +
>> +static void fill_sev_hash_table_entry(SevHashTableEntry *e, const uint8_t *guid,
>> +                                      const uint8_t *hash, size_t hash_len)
>> +{
>> +    memcpy(e->guid, guid, sizeof(e->guid));
>> +    e->len = sizeof(*e);
>> +    memcpy(e->hash, hash, hash_len);
>> +}
>> +
>> +/*
>> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
>> + * which is included in SEV's initial memory measurement.
>> + */
>> +bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
>> +{
>> +    uint8_t *data;
>> +    SevHashTableDescriptor *area;
>> +    SevHashTable *ht;
>> +    SevHashTableEntry *e;
>> +    uint8_t hash_buf[HASH_SIZE];
>> +    uint8_t *hash = hash_buf;
>> +    size_t hash_len = sizeof(hash_buf);
>> +    int ht_index = 0;
>> +    int aligned_len;
>> +
>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> 
> If we never use the data_len argument, can we simplify the prototype?

The current uses for the OVMF reset vector GUIDed table is for simple
structs with known length (secret injection page address, SEV-ES reset
address, SEV table of hashes address).  But keeping the length there
allows adding variable-sized entries such as strings/blobs.



> 
>> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
>> +        return false;
>> +    }
>> +    area = (SevHashTableDescriptor *)data;
>> +
>> +    ht = qemu_map_ram_ptr(NULL, area->base);
>> +
>> +    /* Populate the hashes table header */
>> +    memcpy(ht->guid, sev_hash_table_header_guid, sizeof(ht->guid));
>> +    ht->len = sizeof(*ht);
>> +
>> +    /* Calculate hash of kernel command-line */
>> +    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->cmdline_data,
>> +                           ctx->cmdline_size,
>> +                           &hash, &hash_len, errp) < 0) {
>> +        return false;
>> +    }
> 
> Maybe move the qcrypto_hash_bytes() call before filling ht?

(below)

> 
>> +    e = &ht->entries[ht_index++];
>> +    fill_sev_hash_table_entry(e, sev_cmdline_entry_guid, hash, hash_len);
>> +
>> +    /* Calculate hash of initrd */
>> +    if (ctx->initrd_data) {
>> +        if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
>> +                               ctx->initrd_size, &hash, &hash_len, errp) < 0) {
>> +            return false;
>> +        }
> 
> Ah, now I see the pattern. Hmm OK then.
> 

But this might change if initrd_hash is no longer optional (see separate
self-reply to this patch).  In such a case I'll probably first calculate
all the three hashes, and then fill in the SevHashTable struct.


-Dov


>> +        e = &ht->entries[ht_index++];
>> +        fill_sev_hash_table_entry(e, sev_initrd_entry_guid, hash, hash_len);
>> +    }
>> +
>> +    /* Calculate hash of the kernel */
>> +    struct iovec iov[2] = {
>> +        { .iov_base = ctx->setup_data, .iov_len = ctx->setup_size },
>> +        { .iov_base = ctx->kernel_data, .iov_len = ctx->kernel_size }
>> +    };
>> +    if (qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, 2,
>> +                            &hash, &hash_len, errp) < 0) {
>> +        return false;
>> +    }
>> +    e = &ht->entries[ht_index++];
>> +    fill_sev_hash_table_entry(e, sev_kernel_entry_guid, hash, hash_len);
>> +
>> +    /* now we have all the possible entries, finalize the hashes table */
>> +    ht->len += ht_index * sizeof(*e);
>> +    /* SEV len has to be 16 byte aligned */
>> +    aligned_len = ROUND_UP(ht->len, 16);
>> +    if (aligned_len != ht->len) {
>> +        /* zero the excess data so the measurement can be reliably calculated */
>> +        memset(&ht->entries[ht_index], 0, aligned_len - ht->len);
>> +    }
>> +
>> +    if (sev_encrypt_flash((uint8_t *)ht, aligned_len, errp) < 0) {
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
> 

