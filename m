Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD3420780
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:42:54 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJYj-00005Z-Ak
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJGj-0006kq-5R
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJGh-0003UN-C2
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2wbpkICgHhSrA7oKaJb/nuNpTmppm8SF2u99Et/0YU=;
 b=Ixrbb7lP3S4aiBtC0MzIwywyEDx8a0H02rBGmo7qVrGecEMFwuiPgGIbGg04DQOfxFq7xG
 lK7NM3GQOQsMOxYNQNju1XDyOSoWyq4eb0LnaDxSF9BFJ34ghu/hr/jasDUZ1HB5a8obpO
 wKlTdUv39B9r8i0ZnlodoFObEqd6+fM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-OTfs2E8dPaCLakiUCY5TmA-1; Mon, 04 Oct 2021 04:24:13 -0400
X-MC-Unique: OTfs2E8dPaCLakiUCY5TmA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y15-20020a50ce0f000000b003dab997cf7dso12882822edi.9
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s2wbpkICgHhSrA7oKaJb/nuNpTmppm8SF2u99Et/0YU=;
 b=CtnsfLNtMbVNM/XSEf+v6R5NgYEcIrMGrb/lcgyOZVNHvhROvUQTsxG7ogu7YEnvgf
 KTmA0uP8ku7drx0ETYs+0Ky6CPTvuQxUGhh5vfj7NJ3uR5nJP68uaOV48KSvg6EI0OqN
 TYgUMUg4AyTXGw7ttFwLA6IxpAmBMR/WJU+loeAZevefvGM3vw4Ft5fIS6TUUzOQ76EV
 nx9YqC2nPrQ5UVC5nqaK7o+DJovpBfS+faT22VNz/WqaU2SGMoHgwRPQ+Nb6S6SN/WxH
 331RrY40FYwBvS3XrjXfWgXc0fars2zEogZSI3xJ5SxIvy2MIHJYWNUzvbYh/UQCl9d1
 Ls/w==
X-Gm-Message-State: AOAM533PznuHWy3MibeGFmXrxM55h+wlkBh9X//pxmh3ZPxTCRvQEa3m
 EmkABqBnYTq+KUotHVWchE0jJUybbf7wfDMmJyXgA1uU5/3N7u+uq5COq0gqqFzBnixr5019Q8R
 tyXO1bpCIKdjp0yc=
X-Received: by 2002:a50:9347:: with SMTP id n7mr16072231eda.249.1633335852372; 
 Mon, 04 Oct 2021 01:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSYRxHjXuIiNzIC9LhjhLDKeJIO/SjrvxZlKS9sHkPCDOIwxpUdwlklnnKa3DULig0sdwbSA==
X-Received: by 2002:a50:9347:: with SMTP id n7mr16072204eda.249.1633335852091; 
 Mon, 04 Oct 2021 01:24:12 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u10sm6737189eds.83.2021.10.04.01.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:24:11 -0700 (PDT)
Message-ID: <6db5d402-518d-ac31-ead4-ab8edd46f113@redhat.com>
Date: Mon, 4 Oct 2021 10:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 15/22] target/i386/sev: Move
 qmp_sev_inject_launch_secret() to sev.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-16-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-16-philmd@redhat.com>
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
> Move qmp_sev_inject_launch_secret() from monitor.c to sev.c
> and make sev_inject_launch_secret() static. We don't need the
> stub anymore, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/monitor.c         | 31 -------------------------------
>   target/i386/sev-sysemu-stub.c |  6 +++---
>   target/i386/sev.c             | 31 +++++++++++++++++++++++++++++++
>   3 files changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index c05d70252a2..188203da6f2 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -733,37 +733,6 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>       return sev_get_capabilities(errp);
>   }
>   
> -#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> -struct sev_secret_area {
> -    uint32_t base;
> -    uint32_t size;
> -};
> -
> -void qmp_sev_inject_launch_secret(const char *packet_hdr,
> -                                  const char *secret,
> -                                  bool has_gpa, uint64_t gpa,
> -                                  Error **errp)
> -{
> -    if (!sev_enabled()) {
> -        error_setg(errp, QERR_UNSUPPORTED);
> -        return;
> -    }
> -    if (!has_gpa) {
> -        uint8_t *data;
> -        struct sev_secret_area *area;
> -
> -        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> -            error_setg(errp, "SEV: no secret area found in OVMF,"
> -                       " gpa must be specified.");
> -            return;
> -        }
> -        area = (struct sev_secret_area *)data;
> -        gpa = area->base;
> -    }
> -
> -    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
> -}
> -
>   SGXInfo *qmp_query_sgx(Error **errp)
>   {
>       return sgx_get_info(errp);
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index 813b9a6a03b..66b69540aa5 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -33,10 +33,10 @@ SevCapability *sev_get_capabilities(Error **errp)
>       return NULL;
>   }
>   
> -int sev_inject_launch_secret(const char *hdr, const char *secret,
> -                             uint64_t gpa, Error **errp)
> +void qmp_sev_inject_launch_secret(const char *packet_header, const char *secret,
> +                                  bool has_gpa, uint64_t gpa, Error **errp)
>   {
> -    return 1;
> +    error_setg(errp, QERR_UNSUPPORTED);
>   }
>   
>   int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 91a217bbb85..2198d550be2 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -949,6 +949,37 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
>       return 0;
>   }
>   
> +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> +struct sev_secret_area {
> +    uint32_t base;
> +    uint32_t size;
> +};
> +
> +void qmp_sev_inject_launch_secret(const char *packet_hdr,
> +                                  const char *secret,
> +                                  bool has_gpa, uint64_t gpa,
> +                                  Error **errp)
> +{
> +    if (!sev_enabled()) {
> +        error_setg(errp, QERR_UNSUPPORTED);
> +        return;
> +    }
> +    if (!has_gpa) {
> +        uint8_t *data;
> +        struct sev_secret_area *area;
> +
> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> +            error_setg(errp, "SEV: no secret area found in OVMF,"
> +                       " gpa must be specified.");
> +            return;
> +        }
> +        area = (struct sev_secret_area *)data;
> +        gpa = area->base;
> +    }
> +
> +    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
> +}
> +
>   static int
>   sev_es_parse_reset_block(SevInfoBlock *info, uint32_t *addr)
>   {
> 

Ok, this indirectly addresses my comment on patch 5.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


