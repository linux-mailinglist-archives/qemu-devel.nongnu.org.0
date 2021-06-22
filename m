Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440403AFF45
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:29:21 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbma-0008WU-A0
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvblg-0007Nn-Kw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:28:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvblc-0001JK-L7
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:28:24 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M83Uc0020717; Tue, 22 Jun 2021 04:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pPqMr6Dizr3ylq2V5Epsgrxf2cjncgzfuiHjnRCmYRM=;
 b=LQOHMuaYPO7dZmhHQqGLr2+l30BOI34e6RgK7IdqMLzSXG/fkDZCT0RrIq4LmnlHJ3WF
 +IM2dDPv9Hl2fpyLQsVph+9czwd545lYhmf1rpYIHrkCS2lhtg6EVBwCSD3ess5NHnKa
 T0V9vn1QOiKN1ZHoHqDerSqGNwcF/dQBV8b5YObzLf8Go3JZg9RfndZY61TG4Lrhysij
 iHCgCj7m1oZUrTwQWKMmIM89TZcwHzZN+7v6SyDs033Ps6A47Up8W/7ZfFHu10n3lbIR
 5NCGJDsOFM68w1tfOiguqE14XCFQWSZDpeLDXu2GSjJZaUR6MbsJ6iJUoOUduCwbGIwd OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b8ng60n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 04:28:17 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15M85gDk028779;
 Tue, 22 Jun 2021 04:28:16 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b8ng60m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 04:28:16 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M8NgXD019125;
 Tue, 22 Jun 2021 08:28:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 399878rqja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:28:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15M8QoIR34472296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 08:26:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BA6211C054;
 Tue, 22 Jun 2021 08:28:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DE2311C04C;
 Tue, 22 Jun 2021 08:28:05 +0000 (GMT)
Received: from [9.160.112.114] (unknown [9.160.112.114])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 08:28:05 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: qemu-devel@nongnu.org, James Bottomley <jejb@linux.ibm.com>
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <8baafd9e-50b4-15cd-72c0-af17ccd5dc8b@linux.ibm.com>
Date: Tue, 22 Jun 2021 11:28:03 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621190553.1763020-2-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yBgSTvVnz3PGdM8zGCDo42l858j7Hdfl
X-Proofpoint-ORIG-GUID: WX__P1aLKyJr_cDm36rwGBmGqybiJ2sN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_04:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220050
Received-SPF: pass client-ip=148.163.156.1;
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
 Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found an issue with this patch when no -initrd is passed, see below.



On 21/06/2021 22:05, Dov Murik wrote:
> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
> table area.  For this to work, OVMF must support an encrypted area to
> place the data which is advertised via a special GUID in the OVMF reset
> table.
> 
> The hashes of each of the files is calculated (or the string in the case
> of the cmdline with trailing '\0' included).  Each entry in the hashes
> table is GUID identified and since they're passed through the
> sev_encrypt_flash interface, the hashes will be accumulated by the PSP
> measurement (SEV_LAUNCH_MEASURE).
> 
> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  target/i386/sev-stub.c |   5 ++
>  target/i386/sev.c      | 121 +++++++++++++++++++++++++++++++++++++++++
>  target/i386/sev_i386.h |  12 ++++
>  3 files changed, 138 insertions(+)
> 
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 0227cb5177..2b5e42d644 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -81,3 +81,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>      error_setg(errp, "SEV is not available in this QEMU");
>      return NULL;
>  }
> +
> +bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
> +{
> +    return false;
> +}
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 83df8c09f6..8e3f601bb6 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -23,6 +23,7 @@
>  #include "qemu/base64.h"
>  #include "qemu/module.h"
>  #include "qemu/uuid.h"
> +#include "crypto/hash.h"
>  #include "sysemu/kvm.h"
>  #include "sev_i386.h"
>  #include "sysemu/sysemu.h"
> @@ -83,6 +84,29 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>      uint32_t reset_addr;
>  } SevInfoBlock;
>  
> +#define SEV_HASH_TABLE_RV_GUID  "7255371f-3a3b-4b04-927b-1da6efa8d454"
> +typedef struct __attribute__((__packed__)) SevHashTableDescriptor {
> +    /* SEV hash table area guest address */
> +    uint32_t base;
> +    /* SEV hash table area size (in bytes) */
> +    uint32_t size;
> +} SevHashTableDescriptor;
> +
> +/* hard code sha256 digest size */
> +#define HASH_SIZE 32
> +
> +typedef struct __attribute__((__packed__)) SevHashTableEntry {
> +    uint8_t guid[16];
> +    uint16_t len;
> +    uint8_t hash[HASH_SIZE];
> +} SevHashTableEntry;
> +
> +typedef struct __attribute__((__packed__)) SevHashTable {
> +    uint8_t guid[16];
> +    uint16_t len;
> +    SevHashTableEntry entries[];
> +} SevHashTable;
> +
>  static SevGuestState *sev_guest;
>  static Error *sev_mig_blocker;
>  
> @@ -1077,6 +1101,103 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
>      return 0;
>  }
>  
> +static const uint8_t sev_hash_table_header_guid[] =
> +        UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
> +                0xd4, 0x11, 0xfd, 0x21);
> +
> +static const uint8_t sev_kernel_entry_guid[] =
> +        UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
> +                0x72, 0xd2, 0x04, 0x5b);
> +static const uint8_t sev_initrd_entry_guid[] =
> +        UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
> +                0x91, 0x69, 0x78, 0x1d);
> +static const uint8_t sev_cmdline_entry_guid[] =
> +        UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
> +                0x4d, 0x36, 0xab, 0x2a);
> +
> +static void fill_sev_hash_table_entry(SevHashTableEntry *e, const uint8_t *guid,
> +                                      const uint8_t *hash, size_t hash_len)
> +{
> +    memcpy(e->guid, guid, sizeof(e->guid));
> +    e->len = sizeof(*e);
> +    memcpy(e->hash, hash, hash_len);
> +}
> +
> +/*
> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
> + * which is included in SEV's initial memory measurement.
> + */
> +bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
> +{
> +    uint8_t *data;
> +    SevHashTableDescriptor *area;
> +    SevHashTable *ht;
> +    SevHashTableEntry *e;
> +    uint8_t hash_buf[HASH_SIZE];
> +    uint8_t *hash = hash_buf;
> +    size_t hash_len = sizeof(hash_buf);
> +    int ht_index = 0;
> +    int aligned_len;
> +
> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
> +        return false;
> +    }
> +    area = (SevHashTableDescriptor *)data;
> +
> +    ht = qemu_map_ram_ptr(NULL, area->base);
> +
> +    /* Populate the hashes table header */
> +    memcpy(ht->guid, sev_hash_table_header_guid, sizeof(ht->guid));
> +    ht->len = sizeof(*ht);
> +
> +    /* Calculate hash of kernel command-line */
> +    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->cmdline_data,
> +                           ctx->cmdline_size,
> +                           &hash, &hash_len, errp) < 0) {
> +        return false;
> +    }
> +    e = &ht->entries[ht_index++];
> +    fill_sev_hash_table_entry(e, sev_cmdline_entry_guid, hash, hash_len);
> +
> +    /* Calculate hash of initrd */
> +    if (ctx->initrd_data) {
> +        if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
> +                               ctx->initrd_size, &hash, &hash_len, errp) < 0) {
> +            return false;
> +        }
> +        e = &ht->entries[ht_index++];
> +        fill_sev_hash_table_entry(e, sev_initrd_entry_guid, hash, hash_len);
> +    }


As can be seen, we conditionally add the hash table entry for initrd,
depending on whether the user passed the -initrd switch to QEMU.
However, in the OVMF side, initrd hash is *always* verified; in this
case it will be verified against a the hash of an empty buffer (sha256
starts with e3b0c44298fc...).  Since QEMU (this patch) doesn't add that
entry in the hashes table, we get an an access denied error in OVMF.

I think OVMF is doing the correct thing: the Guest Owner wishes to have
no initrd, and OVMF should verify that the initrd it reads is indeed
empty.  Therefore the measured SEV hashes table should include an entry
for initrd with the sha256 of an empty buffer.

(James - do you agree?)


I think we should remove this condition, and always fill the three
entries in the hashes table: cmdline, initrd, and kernel.  Here's the
treatment for missing arguments:

* No -cmdline: use the hash of the 1-byte "\0" string (this is already
  the case, no code changes needed).
* No -initrd: use the hash of the empty buffer.
* No -kernel: this code will not be reached at all (this is already the
  case, no code changes needed).


This leads to another possible modification: instead of array of
SevHashTableEntry entries[] in SevHashTable, we can have:

typedef struct __attribute__((__packed__)) SevHashTable {
    uint8_t guid[16];
    uint16_t len;
    SevHashTableEntry cmdline;
    SevHashTableEntry initrd;
    SevHashTableEntry kernel;
    uint8_t zero_padding[];  /* padded to 16-byte boundary */
} SevHashTable;


This could clear up things here; keeping the GUID+length in each entry
leaves the future option for a more modular table.

It will also make the order of entries clear, which is required for
calculating the expected measurement on the Guest Owner side.

This also means that the total length of the entire table is known in
advance (168 bytes; aligned to 176 bytes with zero padding).  Not sure
if this helps.


-Dov


> +
> +    /* Calculate hash of the kernel */
> +    struct iovec iov[2] = {
> +        { .iov_base = ctx->setup_data, .iov_len = ctx->setup_size },
> +        { .iov_base = ctx->kernel_data, .iov_len = ctx->kernel_size }
> +    };
> +    if (qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, 2,
> +                            &hash, &hash_len, errp) < 0) {
> +        return false;
> +    }
> +    e = &ht->entries[ht_index++];
> +    fill_sev_hash_table_entry(e, sev_kernel_entry_guid, hash, hash_len);
> +
> +    /* now we have all the possible entries, finalize the hashes table */
> +    ht->len += ht_index * sizeof(*e);
> +    /* SEV len has to be 16 byte aligned */
> +    aligned_len = ROUND_UP(ht->len, 16);
> +    if (aligned_len != ht->len) {
> +        /* zero the excess data so the measurement can be reliably calculated */
> +        memset(&ht->entries[ht_index], 0, aligned_len - ht->len);
> +    }
> +
> +    if (sev_encrypt_flash((uint8_t *)ht, aligned_len, errp) < 0) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static void
>  sev_register_types(void)
>  {
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index ae6d840478..deb3eec409 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -28,6 +28,17 @@
>  #define SEV_POLICY_DOMAIN       0x10
>  #define SEV_POLICY_SEV          0x20
>  
> +typedef struct KernelLoaderContext {
> +    char *setup_data;
> +    size_t setup_size;
> +    char *kernel_data;
> +    size_t kernel_size;
> +    char *initrd_data;
> +    size_t initrd_size;
> +    char *cmdline_data;
> +    size_t cmdline_size;
> +} KernelLoaderContext;
> +
>  extern bool sev_es_enabled(void);
>  extern uint64_t sev_get_me_mask(void);
>  extern SevInfo *sev_get_info(void);
> @@ -37,5 +48,6 @@ extern char *sev_get_launch_measurement(void);
>  extern SevCapability *sev_get_capabilities(Error **errp);
>  extern SevAttestationReport *
>  sev_get_attestation_report(const char *mnonce, Error **errp);
> +extern bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp);
>  
>  #endif
> 

