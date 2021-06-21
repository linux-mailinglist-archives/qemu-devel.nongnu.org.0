Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C63AF6DE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 22:35:18 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvQdY-0006DU-BO
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 16:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvQb9-0005PC-Ew
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvQb5-0001SQ-VJ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624307562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rz56SAvaU/8YjXsqCj+GmFzXE6Wd1cl8n2UnofLbmw8=;
 b=be/OEPDfLD0BesL8ElePRn2SQnWCCo1lDNSBN275TdfIheoAYLCKrd6uZOdaSXDnlEu1VI
 0LlO0hhknJjYCiOuQ/vuwSYRZ1Q8QsnOIsaLw31eX0SYDttQctcGPsWKbkUcAp7yc1MqWl
 aJUk+uBZQ9KXHPR/V+fIh2BnI877i8U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-on6t4OkqNdyVvMitMwDWHg-1; Mon, 21 Jun 2021 16:32:41 -0400
X-MC-Unique: on6t4OkqNdyVvMitMwDWHg-1
Received: by mail-wr1-f71.google.com with SMTP id
 b17-20020a5d40d10000b029011a9ecaf55dso1401840wrq.19
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 13:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rz56SAvaU/8YjXsqCj+GmFzXE6Wd1cl8n2UnofLbmw8=;
 b=jua24Vb/Fxh/nLihuTejdmfZza0UnZVnSM7byi+vxKumK1L5l+J2W6qWrFqf2RdZni
 XrGrhSUOx1yD8mVw13IvLkghPr+yb5soqk5wdhfJM0Deqyw6NGE8g3fJXsR0+Pru1L0v
 LW5mLAsBz0nOqmz+rHhJR5GfKuY5jHyhG05ldVToT0aDcO8Tw4o8tXMUtc7G/C41WfHQ
 NwiSmYThM4C5cSqTZ6nXR/GmpAUzbX3XOlkfviLPyfO95kGOK7JEigfV9I3a6ZhrYk4S
 qiEwiLXKfm3iyrGvnp1GL8pW/AinyeaSXeZhu6OM6PrEDa1d768Ub1MTHGgW1HIfZDkF
 Dlew==
X-Gm-Message-State: AOAM5328wJAkga6Ye54IJY9LlB8RH00y6f/GQi8JBfmyesGkMd2GstdY
 EBN2Rp44uI7tccn1zRmakl22zpZlDtCM6JSrB8T/aVD85fGsJ1Lxkdz4EsO5YKi+wAnNpwGDBI8
 DgH8cm5ws2yz2k3g=
X-Received: by 2002:a7b:c005:: with SMTP id c5mr115238wmb.113.1624307559842;
 Mon, 21 Jun 2021 13:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbDzzctVIPZhD2qHaiZq4HKDT8WoB5sTiJy3Re9nzbTdPcHIQeEXFG8m9PD5ZTCjSPGYqH0A==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr115207wmb.113.1624307559606;
 Mon, 21 Jun 2021 13:32:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m6sm23008961wrw.9.2021.06.21.13.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 13:32:38 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <89258a7b-fe24-4930-5af7-278b68d1f07c@redhat.com>
Date: Mon, 21 Jun 2021 22:32:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621190553.1763020-2-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dov,

Minor comments inlined.

On 6/21/21 9:05 PM, Dov Murik wrote:
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

Can't happen, so:

      g_assert_not_reached();

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
> +typedef struct __attribute__((__packed__))

The codebase used to use QEMU_PACKED (see "qemu/compiler.h" but
apparently it isn't enforced.

 SevHashTableDescriptor {
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

What about using QemuUUID?

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

Personally I'd have used:

static const QemuUUID sev_hash_table_header_guid = {
    .data = UUID_LE(...);
};

and added qemu_uuid_copy() to complete the API, but that's fine.

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

If we never use the data_len argument, can we simplify the prototype?

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

Maybe move the qcrypto_hash_bytes() call before filling ht?

> +    e = &ht->entries[ht_index++];
> +    fill_sev_hash_table_entry(e, sev_cmdline_entry_guid, hash, hash_len);
> +
> +    /* Calculate hash of initrd */
> +    if (ctx->initrd_data) {
> +        if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
> +                               ctx->initrd_size, &hash, &hash_len, errp) < 0) {
> +            return false;
> +        }

Ah, now I see the pattern. Hmm OK then.

> +        e = &ht->entries[ht_index++];
> +        fill_sev_hash_table_entry(e, sev_initrd_entry_guid, hash, hash_len);
> +    }
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


