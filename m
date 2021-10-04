Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D013420754
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:29:32 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJLn-0005N4-D0
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ7x-0004j4-AE
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ7v-0002rZ-1A
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qASqnQv3qByaQH2TDi0dGQ8HzqCHq9QyH+Cz2YAE5Uc=;
 b=fcjRpbLvGQaBBnp5dqf/0YSazEU/K0RUc046Hi118STJi9F6FsWlb/vg5vR9sZGqua1Iwy
 sGcMD4KwD89HWhruX2KK7Dk+CnR1LHa4dtsbOPQCMtF5MkCiBrsonJPL79H3ZbVOWmo+FC
 sYr0Nc2rIo75BROtSpSui1LeSdWKBwg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-1UF8QtyGPDGJNsbFIb4VqQ-1; Mon, 04 Oct 2021 04:15:06 -0400
X-MC-Unique: 1UF8QtyGPDGJNsbFIb4VqQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso1846591edn.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qASqnQv3qByaQH2TDi0dGQ8HzqCHq9QyH+Cz2YAE5Uc=;
 b=WmrjPrE9i9pkI0sswvFm1BLVEvSGe1XE2AhawkFl33dqTl36k0+TYbA5x5tAPYw/6q
 gkCe8gPlO40SxMGFdag650w/fb+KsyITPG+hx3KBVOXQAC3y/ROPY/aHZSGVpPpQDVoZ
 4Tq7K/yg6bsGMJMYx9iEitpLMysE6RggP4JQm0gf+Xo+AGftBTwc7jZrIzajZFq/clWf
 J9ZLT0TXl+ulCSccWWOwsxrvGd0/fNmj6K0JM2rv3+Uitr+v0fcadQOYat78CTH3nKhC
 Ls3EN2T8N956SxZsC0ROc6VkKvlFbVlYofhMSGMh//MLUEZ6rNxhyV8DJuUQnt15dOyj
 0AIg==
X-Gm-Message-State: AOAM5309kRcA1qIJkrn9ppHr4sc7UvPwnjVTxAu59osDdirirWIu+3uw
 CU+sqmlzPzSnpI4iQPJ2pOtLgA5oGY9LHUQ8/MQ4vuKdDLKk/q7eZIfK9SnfR39tqdbJi++KUFJ
 CMMmxmy6e2LBcYdk=
X-Received: by 2002:a05:6402:19ba:: with SMTP id
 o26mr16493721edz.1.1633335305414; 
 Mon, 04 Oct 2021 01:15:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY4ZYoEOucCxsqiEFxcwy2kB5C34GOhabXfVEe7DQy5l607rBEyp6fYpacfK+/x1KtLGlIVw==
X-Received: by 2002:a05:6402:19ba:: with SMTP id
 o26mr16493706edz.1.1633335305257; 
 Mon, 04 Oct 2021 01:15:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r18sm66029edy.86.2021.10.04.01.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:15:04 -0700 (PDT)
Message-ID: <698c9ce4-154b-0be2-c177-03fd22b2c92e@redhat.com>
Date: Mon, 4 Oct 2021 10:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 12/22] target/i386/sev: Declare system-specific
 functions in 'sev_i386.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-13-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-13-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> While prefixed with sysemu, 'sysemu/sev.h' contains the architecture
> specific declarations. The system specific parts are declared in
> 'sev_i386.h'.

While outside target/i386, 'sysemu/sev.h' contains some architecture 
specific declarations. Move them to 'sev_i386.h'.

Otherwise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/sysemu/sev.h   | 6 ------
>   target/i386/sev_i386.h | 7 +++++++
>   hw/i386/pc_sysfw.c     | 2 +-
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 94d821d737c..a329ed75c1c 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -18,11 +18,5 @@
>   
>   bool sev_enabled(void);
>   int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> -int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
> -int sev_inject_launch_secret(const char *hdr, const char *secret,
> -                             uint64_t gpa, Error **errp);
> -
> -int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
> -void sev_es_set_reset_vector(CPUState *cpu);
>   
>   #endif
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index afa19a0a161..0798ab3519a 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -33,4 +33,11 @@ extern SevCapability *sev_get_capabilities(Error **errp);
>   extern SevAttestationReport *
>   sev_get_attestation_report(const char *mnonce, Error **errp);
>   
> +int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
> +int sev_inject_launch_secret(const char *hdr, const char *secret,
> +                             uint64_t gpa, Error **errp);
> +
> +int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
> +void sev_es_set_reset_vector(CPUState *cpu);
> +
>   #endif
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 68d6b1f783e..0b202138b66 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -37,7 +37,7 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/block/flash.h"
>   #include "sysemu/kvm.h"
> -#include "sysemu/sev.h"
> +#include "sev_i386.h"
>   
>   #define FLASH_SECTOR_SIZE 4096
>   
> 


