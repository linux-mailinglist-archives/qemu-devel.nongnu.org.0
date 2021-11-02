Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FBC442E6B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:48:07 +0100 (CET)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtCw-0008Hl-RN
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mht1f-0007HJ-FR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mht1c-0002w0-Hx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TRuKjYayUmXolaypamfEr2A6Pbd+e4gb7MaP6R1B4ms=;
 b=f3/F6CHdDxGlOpaRkdfgZMPBDkHcWwERj+mPgz+xrK4QW72JxdRsRRUsByCPjqORq0E3xD
 jkarkPMObE4fRkM0bP7SFKAHw6mPczkWcadpDUjXu5a4PIn3KFawx4y58ssIgd6fRUufon
 D4DqPzzSK3zCCD/3gLZg820FmEQKgAc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-96biTqTYPbaBSHFOGMlE1g-1; Tue, 02 Nov 2021 08:36:20 -0400
X-MC-Unique: 96biTqTYPbaBSHFOGMlE1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso1076439wme.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TRuKjYayUmXolaypamfEr2A6Pbd+e4gb7MaP6R1B4ms=;
 b=H0docuzmGBhJNpMLf1jY7m9o61DyrGxsJvdwxpHfp5TlkGn/hazC/v+AQwtjqvC0J2
 PxttIeH5///Zbt56K4jMs6EjVrrg4aN4c9JbUhjkgKxF+h9Rd86WgP23acMyGqMDvzJS
 yh8pi0JV97kNazcKOmwZQ4mBf4X13kQniEj+1rrXnsFu1NclnLnAnVGRTxOqWj1GTUUM
 oh0d0kfT1RbVPFn+POVn/4GI973Lvo4BFXrsGMwlu+QW66kRnaNBEH+Xm5EITVYLnSrO
 HL4D1EpNQAQPcGhMzKqbwmOChHK+uGAzd37WcQL9Mklmd5EMpdUDe50VIcxBEex9rMsE
 qJow==
X-Gm-Message-State: AOAM533vs73KzfQmm2Er7eoUIRfEPggf4BBIHv5pNNr/47ycmR75cM79
 ofsJF3+Um44z0loCW+SB8Wo/VJm2B10E7T4FjLOOdZ/YoOgrezYIj5YdeKM+Ijglg1Y+VQCca1j
 hOF5r62fA+dfnV+U=
X-Received: by 2002:adf:fd4c:: with SMTP id h12mr33870840wrs.429.1635856579328; 
 Tue, 02 Nov 2021 05:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx4ARmhXwKApXgHx7EgGSOkaWiir+HdrpW2INPG5xkQDYwCJatxvu3f1AOFMyef4yjCP4SSw==
X-Received: by 2002:adf:fd4c:: with SMTP id h12mr33870812wrs.429.1635856579141; 
 Tue, 02 Nov 2021 05:36:19 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id w10sm16575001wrq.88.2021.11.02.05.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:36:18 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:36:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF
 hashes table area
Message-ID: <YYEwwMsS2SsUzypl@work-vm>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-3-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211101102136.1706421-3-dovmurik@linux.ibm.com>
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
> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> for measured linux boot", 2021-09-30) introduced measured direct boot
> with -kernel, using an OVMF-designated hashes table which QEMU fills.
> 
> However, no checks are performed on the validity of the hashes area
> designated by OVMF.  Specifically, if OVMF publishes the
> SEV_HASH_TABLE_RV_GUID entry but it is filled with zeroes, this will
> cause QEMU to write the hashes entries over the first page of the
> guest's memory (GPA 0).
> 
> Add validity checks to the published area.  If the hashes table area's
> base address is zero, or its size is too small to fit the aligned hashes
> table, warn and skip the hashes entries addition.  In such case, the
> following warning will be displayed:
> 
>     qemu-system-x86_64: warning: SEV: OVMF's hashes table area is invalid (base=0x0 size=0x0)
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Reported-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  target/i386/sev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 682b8ccf6c..a20ddb545e 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -1201,13 +1201,18 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>      uint8_t kernel_hash[HASH_SIZE];
>      uint8_t *hashp;
>      size_t hash_len = HASH_SIZE;
> -    int aligned_len;
> +    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
>  
>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>          warn_report("SEV: kernel specified but OVMF has no hash table guid");
>          return false;
>      }
>      area = (SevHashTableDescriptor *)data;
> +    if (!area->base || area->size < aligned_len) {
> +        warn_report("SEV: OVMF's hashes table area is invalid (base=0x%x size=0x%x)",
> +                    area->base, area->size);
> +        return false;
> +    }

That's probably a useful check, so


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

however, maybe it needs to be more thorough before using area->base to
qemu_map_ram_ptr? - I think it'll get unhappy if it's a bad address not
in a ram block. (Or check you're running over the end of a ramblock)

Dave

>  
>      /*
>       * Calculate hash of kernel command-line with the terminating null byte. If
> @@ -1266,7 +1271,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>      memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
>  
>      /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
> -    aligned_len = ROUND_UP(ht->len, 16);
>      if (aligned_len != ht->len) {
>          /* zero the excess data so the measurement can be reliably calculated */
>          memset(ht->padding, 0, aligned_len - ht->len);
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


