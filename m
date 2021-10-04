Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C5E4207AD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:58:51 +0200 (CEST)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJoA-0002Ff-Ls
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJHA-0007lu-Eh
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJH8-0003pN-Ci
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w509nbdg8JL5H/S2ZdE6yOSvT63DYCsGYgqBOg4h6xw=;
 b=XfIB4HHJEQv0qzWBTyXC8GaI1U6BJ5+wyphOpdSiMrORSFyjIxo77TwkxITG5TYEBYknzP
 BBnJoy6eEWKHGPwbpm0jRGS25yBDERoTiwL/4nd7/20hiMNeoYLwWchAYjBhn4e0iFbwdV
 qssU+sRvx8G+LMGyQGP2dLNwjdO/MUQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-IDhVGxCiOmmk_Ko_g5d78Q-1; Mon, 04 Oct 2021 04:24:40 -0400
X-MC-Unique: IDhVGxCiOmmk_Ko_g5d78Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 x96-20020a50bae9000000b003d871ecccd8so1465482ede.18
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w509nbdg8JL5H/S2ZdE6yOSvT63DYCsGYgqBOg4h6xw=;
 b=gpzq+rePIcYBkpYC2diqSvcchq+DoHQLqo7yObZSNuQVdTrHyyzwQmUl/hCUOTFEAG
 5wtj9AEAjI0VfNZBAVieno/XN6CJParKCiZzvdT6QRdg2o0tZQ2Ts4IQb0rZfgCEEnET
 3MrrIAOljhvNYalrLu9A1AcS259Pr4o/xQm2UpwNw3OD+cib1c0au3AkWfvhtApvp2aS
 bm+/Ulu8H8tJySN+jFp2nU4BbkpdFtj429VY/DhsaJNDZg16iPkBJ4qTb+VSNGijG73r
 EQd813Qw1wziwGx+RPgUBvC2VS4ll3skK8qAIK+QVLrH98Ap/ATn7ZHTO/0yrVOmcXnM
 HnbA==
X-Gm-Message-State: AOAM530addwN3Sr8sDF938DvKKrJMQ0OZD3u8sZuW/zGOqqs0ADB8JA4
 77TkOFcNtrYO/8PBYEfRnZ5K6AESevEXSp/aguqigiZIyufVO8CPQyeGLrVEYhkeGCV13SQfPUE
 FVGWEWE3sdsoAgsY=
X-Received: by 2002:a05:6402:35c9:: with SMTP id
 z9mr1392658edc.174.1633335879101; 
 Mon, 04 Oct 2021 01:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1A9pPlY+x/EAis1SWI+1SZYm1j/pBPT8XG3HQkWLg8ugz12kqQjFiV+OfH8qb6mZC65y9pg==
X-Received: by 2002:a05:6402:35c9:: with SMTP id
 z9mr1392639edc.174.1633335878901; 
 Mon, 04 Oct 2021 01:24:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d21sm4933933edp.27.2021.10.04.01.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:24:38 -0700 (PDT)
Message-ID: <17ad4157-8c17-153d-540e-5ca0923d4e51@redhat.com>
Date: Mon, 4 Oct 2021 10:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 17/22] target/i386/sev: Move
 qmp_query_sev_launch_measure() to sev.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-18-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-18-philmd@redhat.com>
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
> Move qmp_query_sev_launch_measure() from monitor.c to sev.c
> and make sev_get_launch_measurement() static. We don't need the
> stub anymore, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev_i386.h        |  1 -
>   target/i386/monitor.c         | 17 -----------------
>   target/i386/sev-sysemu-stub.c |  3 ++-
>   target/i386/sev.c             | 20 ++++++++++++++++++--
>   4 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 8d9388d8c5c..1699376ad87 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -25,7 +25,6 @@
>   #define SEV_POLICY_SEV          0x20
>   
>   extern SevInfo *sev_get_info(void);
> -extern char *sev_get_launch_measurement(void);
>   
>   int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
>   int sev_inject_launch_secret(const char *hdr, const char *secret,
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index da36522fa15..0b38e970c73 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -711,23 +711,6 @@ void hmp_info_sev(Monitor *mon, const QDict *qdict)
>       qapi_free_SevInfo(info);
>   }
>   
> -SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
> -{
> -    char *data;
> -    SevLaunchMeasureInfo *info;
> -
> -    data = sev_get_launch_measurement();
> -    if (!data) {
> -        error_setg(errp, "Measurement is not available");
> -        return NULL;
> -    }
> -
> -    info = g_malloc0(sizeof(*info));
> -    info->data = data;
> -
> -    return info;
> -}
> -
>   SGXInfo *qmp_query_sgx(Error **errp)
>   {
>       return sgx_get_info(errp);
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index cc486a1afbe..355391c16c4 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -22,8 +22,9 @@ SevInfo *sev_get_info(void)
>       return NULL;
>   }
>   
> -char *sev_get_launch_measurement(void)
> +SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
>   {
> +    error_setg(errp, QERR_UNSUPPORTED);
>       return NULL;
>   }
>   
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index fce007d6749..8e9cce62196 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -718,8 +718,7 @@ free_measurement:
>       g_free(measurement);
>   }
>   
> -char *
> -sev_get_launch_measurement(void)
> +static char *sev_get_launch_measurement(void)
>   {
>       if (sev_guest &&
>           sev_guest->state >= SEV_STATE_LAUNCH_SECRET) {
> @@ -729,6 +728,23 @@ sev_get_launch_measurement(void)
>       return NULL;
>   }
>   
> +SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
> +{
> +    char *data;
> +    SevLaunchMeasureInfo *info;
> +
> +    data = sev_get_launch_measurement();
> +    if (!data) {
> +        error_setg(errp, "Measurement is not available");
> +        return NULL;
> +    }
> +
> +    info = g_malloc0(sizeof(*info));
> +    info->data = data;
> +
> +    return info;
> +}
> +
>   static Notifier sev_machine_done_notify = {
>       .notify = sev_launch_get_measure,
>   };
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


