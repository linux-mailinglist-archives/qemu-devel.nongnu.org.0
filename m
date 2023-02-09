Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C6690176
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:42:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1YT-0000iT-9c; Thu, 09 Feb 2023 02:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pQ1YR-0000iJ-5h
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:41:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pQ1YP-0003xg-IF
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675928472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tBVnWOxZN0l6o+QuVuNWanJQCILIO8H7yQ/rQtmhRzc=;
 b=YKmtVutHCz5ZD+4lWbrqSzfIPu6BLDA2WczQdogTskYuqdZGXJD9iPkz8GqUKm55KH3FD1
 zBLnPbQipDQz2rjf9IZ60wYexkowSO4F012/n6vCSH05+GOMDPhKlbwQMAANe+8OcKwMN1
 fL3hovYbQC91Su3RNaIGY2VEvdfLsE8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-32Srf7qGO4ygaO0B-4iLeg-1; Thu, 09 Feb 2023 02:41:10 -0500
X-MC-Unique: 32Srf7qGO4ygaO0B-4iLeg-1
Received: by mail-ed1-f69.google.com with SMTP id
 fd23-20020a056402389700b004aaa054d189so896426edb.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBVnWOxZN0l6o+QuVuNWanJQCILIO8H7yQ/rQtmhRzc=;
 b=pVBFqgYzVtvKONqOUd6DWDK6DgUNVtNUMGgmgxgpKzWpJtmaZQRnyAzZU8VoMD6uLW
 KXyS5m44SyhYFZFIX2L2IPjv80O/tx+DinKBwUgaApJIvz+BFA5/BCq9liF1O1H1iIHA
 sgRk1LzznyBmyy32yN/qjIYyUD49HMyTY0SCqTwhpqcGvkwcf7ncRMagtHnrFL5rBdla
 9rqlr0LJnd2AvzLwLSE7PG747+80EpG4zEIhJJGb9HxhPHS46Kyf//PgzsQyXGOanIl2
 GSr/Dw5JTJWmxi/AvAsphj4ydVFTF5O1fQLVpYL9hxnrpI0kmiK+ZH52FC5beBsKSsJW
 waog==
X-Gm-Message-State: AO0yUKXQIGFRU3aarGYk4GKo4dI6miml3ZH4IU93BsZu0yc/CFryYWi+
 awW0yHf+LuTvLkBcjgQoP1sRkV3ahE+aZr1xoSHzTh8PbLEsjviMWDFgHWr+ehWO1LUQ6rlEQDz
 blBvhO3W+eIZLfgGrsg1ZXy2jZC8C36ieXeK0Bcm7dJSjwRglL9bWpscDBKmMnW1sulq0
X-Received: by 2002:a17:907:608b:b0:8aa:c105:f0bf with SMTP id
 ht11-20020a170907608b00b008aac105f0bfmr10478738ejc.17.1675928468963; 
 Wed, 08 Feb 2023 23:41:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9aH2PzEPPLo0YJUlnsK16u0uIVA5yC1U6lk43TVGarqiJIZI5lcQAf2CtyoaWTt+6rE9LS/w==
X-Received: by 2002:a17:907:608b:b0:8aa:c105:f0bf with SMTP id
 ht11-20020a170907608b00b008aac105f0bfmr10478695ejc.17.1675928468677; 
 Wed, 08 Feb 2023 23:41:08 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 b15-20020a170906660f00b00871075bfcfesm515007ejp.133.2023.02.08.23.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 23:41:07 -0800 (PST)
Date: Thu, 9 Feb 2023 02:41:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH RFC 5/7] Revert "x86: use typedef for SetupData struct"
Message-ID: <20230209024011-mutt-send-email-mst@kernel.org>
References: <20230208211212.41951-1-mst@redhat.com>
 <20230208211212.41951-6-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-6-mst@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 04:12:51PM -0500, Michael S. Tsirkin wrote:
> This reverts commit eebb38a5633a77f5fa79d6486d5b2fcf8fbe3c07.
> 
> Fixes: eebb38a563 ("x86: use typedef for SetupData struct")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


This one was actually good, I reverted so other reverts are clean.
Jason I would appreciate it if you can rebase this on top
of the revert.


> ---
>  hw/i386/x86.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 32f37ab7c2..76b12108b4 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -657,12 +657,12 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state)
>      return dev;
>  }
>  
> -typedef struct SetupData {
> +struct setup_data {
>      uint64_t next;
>      uint32_t type;
>      uint32_t len;
>      uint8_t data[];
> -} __attribute__((packed)) SetupData;
> +} __attribute__((packed));
>  
>  
>  /*
> @@ -803,7 +803,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      FILE *f;
>      char *vmode;
>      MachineState *machine = MACHINE(x86ms);
> -    SetupData *setup_data;
> +    struct setup_data *setup_data;
>      const char *kernel_filename = machine->kernel_filename;
>      const char *initrd_filename = machine->initrd_filename;
>      const char *dtb_filename = machine->dtb;
> @@ -1086,11 +1086,11 @@ void x86_load_linux(X86MachineState *x86ms,
>          }
>  
>          setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> -        kernel_size = setup_data_offset + sizeof(SetupData) + dtb_size;
> +        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
>          kernel = g_realloc(kernel, kernel_size);
>  
>  
> -        setup_data = (SetupData *)(kernel + setup_data_offset);
> +        setup_data = (struct setup_data *)(kernel + setup_data_offset);
>          setup_data->next = cpu_to_le64(first_setup_data);
>          first_setup_data = prot_addr + setup_data_offset;
>          setup_data->type = cpu_to_le32(SETUP_DTB);
> @@ -1101,9 +1101,9 @@ void x86_load_linux(X86MachineState *x86ms,
>  
>      if (!legacy_no_rng_seed) {
>          setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> -        kernel_size = setup_data_offset + sizeof(SetupData) + RNG_SEED_LENGTH;
> +        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
>          kernel = g_realloc(kernel, kernel_size);
> -        setup_data = (SetupData *)(kernel + setup_data_offset);
> +        setup_data = (struct setup_data *)(kernel + setup_data_offset);
>          setup_data->next = cpu_to_le64(first_setup_data);
>          first_setup_data = prot_addr + setup_data_offset;
>          setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
> -- 
> MST
> 


