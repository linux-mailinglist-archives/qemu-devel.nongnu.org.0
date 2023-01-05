Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5E65EACD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPVa-0007Hq-OX; Thu, 05 Jan 2023 07:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDPVX-0007He-RE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDPVW-0007V8-4Q
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q65VSWzykCtFOvVffDVO/bPKM/5j/jklWtQ37BXcqTU=;
 b=TQkedxpH41nctkSe7fuuu5mLM4VvQxluQ+VcXGhWSPIbA8E5yC5F8gsPiSSwMTKwWTfsXb
 rTjD1/7wJ1Sk6GLE0F3xuqrfOZUp61e26GaFnMvQSF8uN6+k56sDmgOaMYRqELWZ3/zPKt
 aTnHcozb5zDbus0mXr1BeoHqVsO5AA8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-9_XkaSv9OjK7Lsja_Eewpw-1; Thu, 05 Jan 2023 07:38:03 -0500
X-MC-Unique: 9_XkaSv9OjK7Lsja_Eewpw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso319493wml.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q65VSWzykCtFOvVffDVO/bPKM/5j/jklWtQ37BXcqTU=;
 b=adp5ttQMK+ye47790T5YbM4kndslB0KHMsixj6QPc3Tw9vf6HdQtvxIXUls3E7qCR9
 HE+sQuOEHNuPJSp8yFRgJA6rNEtzmNbNPubTG/hkzTQ5c+ACIwcqouV+EC0T9szTcEbp
 cM4CQKMtK1TikJFbXAX6FgNH2eJod1dx8/k8a/h+8r+qIa3eyp0TqO9mNJHTxMEFzF0Q
 FtZ6JXIkIvXB9TvvSdMN8pF2Pp9JY66qZMJUzOKCLqvyK4cIo9bmReX9gCmQKKI9Z0k/
 5/Pu9JblniFFu2HykX5rk5WYio5ib+xa3j4NR0uDiKJcSIiutOmrdceYcS/2UZ3uPAGE
 vOGA==
X-Gm-Message-State: AFqh2kpoRHTBb856vkJAOs6m5ltuRfRZVgBPrSsXPhG4frJHpXs1qYcO
 3+yxq36MEZRXmx1vrlEDPeCcwvw0kOjxZRekAPRTWeeib4yEdEjNmTy19j7YTT+FlecjHPpCh6w
 5BNVdMeRbwUjceWs=
X-Received: by 2002:a5d:4ad0:0:b0:27f:43c6:9ab0 with SMTP id
 y16-20020a5d4ad0000000b0027f43c69ab0mr20902132wrs.20.1672922277459; 
 Thu, 05 Jan 2023 04:37:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNrJKi6GXzhvMIbMmQr3BvJCtzf4zgXgB5RwDgxUmf2PeASmBSwWh2sh9AewPwGwVIGVHsYQ==
X-Received: by 2002:a5d:4ad0:0:b0:27f:43c6:9ab0 with SMTP id
 y16-20020a5d4ad0000000b0027f43c69ab0mr20902115wrs.20.1672922277208; 
 Thu, 05 Jan 2023 04:37:57 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 o15-20020adfe80f000000b0028965dc7c6bsm22380280wrm.73.2023.01.05.04.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 04:37:56 -0800 (PST)
Message-ID: <83de04cb-7f2f-a83b-c160-90ea74c8e9bb@redhat.com>
Date: Thu, 5 Jan 2023 13:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/5] s390x/pv: Move check on hugepage under
 s390_pv_guest_check()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-6-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230104115111.3240594-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04/01/2023 12.51, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/s390x/pv.c       | 14 +++++++++++++-
>   target/s390x/diag.c |  7 -------
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 96c0728ec9..4e1f991d98 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -302,9 +302,21 @@ static bool s390_pv_check_host(Error **errp)
>       return true;
>   }
>   
> +static bool s390_pv_check_hpage(Error **errp)
> +{
> +    if (kvm_s390_get_hpage_1m()) {
> +        error_setg(errp, "Protected VMs can currently not be backed with "
> +                   "huge pages");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static bool s390_pv_guest_check(const Object *obj, Error **errp)
>   {
> -    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
> +    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp) &&
> +        s390_pv_check_hpage(errp);
>   }
>   
>   bool s390_pv_check(Error **errp)
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 9b16e25930..28f4350aed 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -170,13 +170,6 @@ out:
>               return;
>           }
>   
> -        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
> -            error_report("Protected VMs can currently not be backed with "
> -                         "huge pages");
> -            env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
> -            return;
> -        }
> -
>           if (!s390_pv_check(&local_err)) {
>               error_report_err(local_err);
>               env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;

Reviewed-by: Thomas Huth <thuth@redhat.com>


