Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C7442D8D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:11:08 +0100 (CET)
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsd4-0004Bd-44
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mhs5w-0003lD-Op
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mhs5u-0006iX-Rm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJT9NpPkO7S4wp+T1GWIa6j460Km9pcGxBKHKJxk3mE=;
 b=Dkj9nJPWSoQBCaTNJfhYFiJVLkTFJLgcempT26tf4+I0S2JX/B3Di3LgnIqIOeBkUIwKYT
 N86CKgYrx0q/FDCBSxWafzeKJq5b2624zbUIJunw4StbyaaftxdqFNMwMViCnYt9PikXwK
 Qyjy6uLTE/LGh+RcwNP2iWJn9oLCvKU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-F4smMYPSO4-W_JyQ_0VmrA-1; Tue, 02 Nov 2021 07:36:44 -0400
X-MC-Unique: F4smMYPSO4-W_JyQ_0VmrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso753505wms.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BJT9NpPkO7S4wp+T1GWIa6j460Km9pcGxBKHKJxk3mE=;
 b=D4MetSIi9YPtq9XG0k6ckfgFSmi13zgwqvLabdhN4YCufnfdW1kAxKp6eMVXU3OJf/
 zKJafk1BXFAKJ5SAIaK6KzQOi5MnOXTiZ8QbjdvEQ9nr9FhZcISxl04+T/EMP1Fcfzep
 xf5HIjI7aTP17JHFdGe4oNJr0H+CjG0ihuyaTfnmkMmnxc6vXOaItS3HPlcQ+7+qZyeF
 MYG+rZ9XI+AnVzp43euebhujCBwyTAUKWY3488UqOuDJhJDXZHd3cUVgNguGDjHOqOpZ
 luwWXwej+pqoEzRwpHJuFQVvoeqlRUoj11+ri76D3Ah18Ew765yvOCqxsAFtFeQJpj7H
 5UbQ==
X-Gm-Message-State: AOAM533TAq1btu9pQvAb7Jx+1CHyztO7PMEIKzMxro03WcJeIaPFgo+L
 bHt4MtQIHHqpXaQfpIZaJI/XtEL92hC5iDkIzkIKZ/n3JktgItbeSpWyEni6u1A8zaf9B+2VPrG
 lt1OEdkENWUkv3RU=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr18926493wro.320.1635853003067; 
 Tue, 02 Nov 2021 04:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybQL+LMOuyPg4LZJqN1GmfxYXUjjB0NWcTUVmO5Bo4+EG9CVmkP1lFSWnXT24HZG6TdM2pWA==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr18926461wro.320.1635853002867; 
 Tue, 02 Nov 2021 04:36:42 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n184sm589633wme.2.2021.11.02.04.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:36:42 -0700 (PDT)
Date: Tue, 2 Nov 2021 11:36:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 3/3] sev/i386: Perform padding calculations at compile-time
Message-ID: <YYEiyJ73TCg2AFOl@work-vm>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-4-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211101102136.1706421-4-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> In sev_add_kernel_loader_hashes, the sizes of structs are known at
> compile-time, so calculate needed padding at compile-time.
> 
> No functional change intended.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/sev.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index a20ddb545e..c09de9c6f0 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -109,9 +109,19 @@ typedef struct QEMU_PACKED SevHashTable {
>      SevHashTableEntry cmdline;
>      SevHashTableEntry initrd;
>      SevHashTableEntry kernel;
> -    uint8_t padding[];
>  } SevHashTable;
>  
> +/*
> + * Data encrypted by sev_encrypt_flash() must be padded to a multiple of
> + * 16 bytes.
> + */
> +typedef struct QEMU_PACKED PaddedSevHashTable {
> +    SevHashTable ht;
> +    uint8_t padding[ROUND_UP(sizeof(SevHashTable), 16) - sizeof(SevHashTable)];
> +} PaddedSevHashTable;
> +
> +QEMU_BUILD_BUG_ON(sizeof(PaddedSevHashTable) % 16 != 0);
> +
>  static SevGuestState *sev_guest;
>  static Error *sev_mig_blocker;
>  
> @@ -1196,19 +1206,19 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>      uint8_t *data;
>      SevHashTableDescriptor *area;
>      SevHashTable *ht;
> +    PaddedSevHashTable *padded_ht;
>      uint8_t cmdline_hash[HASH_SIZE];
>      uint8_t initrd_hash[HASH_SIZE];
>      uint8_t kernel_hash[HASH_SIZE];
>      uint8_t *hashp;
>      size_t hash_len = HASH_SIZE;
> -    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
>  
>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>          warn_report("SEV: kernel specified but OVMF has no hash table guid");
>          return false;
>      }
>      area = (SevHashTableDescriptor *)data;
> -    if (!area->base || area->size < aligned_len) {
> +    if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
>          warn_report("SEV: OVMF's hashes table area is invalid (base=0x%x size=0x%x)",
>                      area->base, area->size);
>          return false;
> @@ -1253,7 +1263,8 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>       * Populate the hashes table in the guest's memory at the OVMF-designated
>       * area for the SEV hashes table
>       */
> -    ht = qemu_map_ram_ptr(NULL, area->base);
> +    padded_ht = qemu_map_ram_ptr(NULL, area->base);
> +    ht = &padded_ht->ht;
>  
>      ht->guid = sev_hash_table_header_guid;
>      ht->len = sizeof(*ht);
> @@ -1270,13 +1281,10 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>      ht->kernel.len = sizeof(ht->kernel);
>      memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
>  
> -    /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
> -    if (aligned_len != ht->len) {
> -        /* zero the excess data so the measurement can be reliably calculated */
> -        memset(ht->padding, 0, aligned_len - ht->len);
> -    }
> +    /* zero the excess data so the measurement can be reliably calculated */
> +    memset(padded_ht->padding, 0, sizeof(padded_ht->padding));
>  
> -    if (sev_encrypt_flash((uint8_t *)ht, aligned_len, errp) < 0) {
> +    if (sev_encrypt_flash((uint8_t *)padded_ht, sizeof(*padded_ht), errp) < 0) {
>          return false;
>      }
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


