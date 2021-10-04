Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DFB420786
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:43:53 +0200 (CEST)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJZg-0001az-PM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4k-0006dU-Hn
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ4e-0000J6-LZ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JOTlxYLH0xKyMAM5Ajk4RGdOyX+Cmjh7f4GUhdJsX3w=;
 b=D1XUufkn8tc+rCk7JIqGqpiZffI6j5o7XhxJuWlAbnZdm055WVQ+3WykTJDH0U6m6UkY0D
 QSi6Xn9JNvf9QPWjgUmDeq7EHXRW2qPS9crVpvNSdANV4mrN166nH6rFqFdq7z6XQIGnnu
 Kyt3/lbi2LdjJI5XTX973dh2czLTZ4Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-URUdj8d8NVuiYlECKDKNyQ-1; Mon, 04 Oct 2021 04:11:46 -0400
X-MC-Unique: URUdj8d8NVuiYlECKDKNyQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso16409756edx.2
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JOTlxYLH0xKyMAM5Ajk4RGdOyX+Cmjh7f4GUhdJsX3w=;
 b=p4YaDAlnGTqeXGouO0eRQM/Lx39+N4NMw6cXXWJ+rvkAeCzGAGcRCDyuB7onOB5ovB
 sP+U0VXH2hdOOwzqIwHR4U2N9gfnvPAs3+JKom/i5/RoJPo2ndfxXAdiamcD8VTZ+UJh
 R7HzN57HEru+XEW2xNIFwhZ0fi9IDb++D0e+0wT2FuQnTv+GFUYnILYHCkxlsoOKztVp
 iQ99K1WJIjBNSZAiL8Ov4UVg0QmJAx2eT4Htk0FlNMTnRctCuOvA0NsbWpulV7fdKK71
 GMvb7aia1yjoB+jBvjy2S2AVnhO9uzxELxWgby/LomD2ol837FY4FwBgyR/S+1LHH6S2
 TNcQ==
X-Gm-Message-State: AOAM530FFWJL6Vla2/dhBAaUdvU1dhZ73B95jF95ixO7Ggw6YK6/X9KE
 Bzqu1pzqgqGerR89HoO+8Z2xlkr3LSKn8EQGBzafjDIuk92WVgYAMZJx9mqPMdZkkv3R6cDFgZ8
 32txneVcpvmgNa/Q=
X-Received: by 2002:a17:906:5950:: with SMTP id
 g16mr16220353ejr.149.1633335104814; 
 Mon, 04 Oct 2021 01:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW3bRpHqjWjrgerbOfFgeANw9BAyxffq3xsPvQ0UCB6ZGuKiofp6fNk99tikE6GvBAR6wpgg==
X-Received: by 2002:a17:906:5950:: with SMTP id
 g16mr16220340ejr.149.1633335104607; 
 Mon, 04 Oct 2021 01:11:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q6sm6032505ejm.106.2021.10.04.01.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:11:44 -0700 (PDT)
Message-ID: <a44a2967-a8d5-8fc1-d755-3fe1456370a6@redhat.com>
Date: Mon, 4 Oct 2021 10:11:42 +0200
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

RB


