Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D289A42078C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:47:01 +0200 (CEST)
Received: from localhost ([::1]:48496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJci-0006MS-T8
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4u-0006eR-7l
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4p-0000UD-SB
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxt3IlMwGgH/3HVBb8TMDbjlbaO6BWLe0pI5QdapWsE=;
 b=YuSyTGBGG46dtDP2YRh0t8aj++hQntMxFGvk0u8DJAqOgG8on9vYjT8ezOiB7fB59Bsx+q
 xtSiOnTMsOwa4ipn5oXqYQvNm6iR4wuDqmrPTuA9VngeGqsw8WfU9BP42BV1vuV4e0P1I0
 sizuULMu9LFLVooDwIyUPvT3UgfvtCo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-vEqLgbmtP7OGHi_7SaiP9g-1; Mon, 04 Oct 2021 04:11:56 -0400
X-MC-Unique: vEqLgbmtP7OGHi_7SaiP9g-1
Received: by mail-ed1-f70.google.com with SMTP id
 1-20020a508741000000b003da559ba1eeso16459007edv.13
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nxt3IlMwGgH/3HVBb8TMDbjlbaO6BWLe0pI5QdapWsE=;
 b=K4/nj3uu0+AFFpUtloif3XfwjlnlP72egPsVJnTQEYM0QSRaT2rgwCeyZmWO7RMGsM
 /+530G8Sd820bbXm64JImpLFayZCmJn90SKzCrLRBePz0L3i/NYk6OYZ5JnFWodDA0lU
 aAQP+LmnbQo6Kt/n56O8koyg2NJ2ofXJzse2Tgh+BpC4DJ5qRl5+StV+NI1CmTb0W/Ub
 yKxy6fhBQ4BqsGvr42osk4w/+5jz9ZqX4fAeA901wfN+zNC6D8NSMloQzziYxI+CHFjM
 SEyRB34qr9A/AH7/qgCRapC3iWaWG45KWadH2Acn/iPqbaxOvTdo6lQl4SjjNhKT8EhP
 nBKg==
X-Gm-Message-State: AOAM531CJL2LaxRWsfhg7VJseRMkNnbCAatCc2Znjsxr+I10w+LlMufJ
 aZ5Edc1JvIn/FHm13WagMmuXEyqYXONELxs5c3aPRbpTbyKjhTKCCtCZor7Jn4IBas8nJibFOgM
 tjG1jRkCt2x8/q0c=
X-Received: by 2002:a17:907:7691:: with SMTP id
 jv17mr14786005ejc.378.1633335115569; 
 Mon, 04 Oct 2021 01:11:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKXY/Mp02EhfUz9ie5EsTxFIrQa3PTxzv66us1lXEt4B0npQdV/hooBBhLcAdHgBNpUXLPMw==
X-Received: by 2002:a17:907:7691:: with SMTP id
 jv17mr14785972ejc.378.1633335115299; 
 Mon, 04 Oct 2021 01:11:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm5887814ejs.4.2021.10.04.01.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:11:54 -0700 (PDT)
Message-ID: <890d12fc-c2ee-0857-fd66-3d0893990885@redhat.com>
Date: Mon, 4 Oct 2021 10:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 08/22] target/i386/sev: Remove sev_get_me_mask()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-9-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-9-philmd@redhat.com>
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
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> Unused dead code makes review harder, so remove it.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev_i386.h | 1 -
>   target/i386/sev-stub.c | 5 -----
>   target/i386/sev.c      | 9 ---------
>   3 files changed, 15 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index f4223f1febf..afa19a0a161 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -25,7 +25,6 @@
>   #define SEV_POLICY_SEV          0x20
>   
>   extern bool sev_es_enabled(void);
> -extern uint64_t sev_get_me_mask(void);
>   extern SevInfo *sev_get_info(void);
>   extern uint32_t sev_get_cbit_position(void);
>   extern uint32_t sev_get_reduced_phys_bits(void);
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index d91c2ece784..eb0c89bf2be 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -25,11 +25,6 @@ bool sev_enabled(void)
>       return false;
>   }
>   
> -uint64_t sev_get_me_mask(void)
> -{
> -    return ~0;
> -}
> -
>   uint32_t sev_get_cbit_position(void)
>   {
>       return 0;
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index fa7210473a6..c88cd808410 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -64,7 +64,6 @@ struct SevGuestState {
>       uint8_t api_major;
>       uint8_t api_minor;
>       uint8_t build_id;
> -    uint64_t me_mask;
>       int sev_fd;
>       SevState state;
>       gchar *measurement;
> @@ -362,12 +361,6 @@ sev_es_enabled(void)
>       return sev_enabled() && (sev_guest->policy & SEV_POLICY_ES);
>   }
>   
> -uint64_t
> -sev_get_me_mask(void)
> -{
> -    return sev_guest ? sev_guest->me_mask : ~0;
> -}
> -
>   uint32_t
>   sev_get_cbit_position(void)
>   {
> @@ -804,8 +797,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>           goto err;
>       }
>   
> -    sev->me_mask = ~(1UL << sev->cbitpos);
> -
>       devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
>       sev->sev_fd = open(devname, O_RDWR);
>       if (sev->sev_fd < 0) {
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


