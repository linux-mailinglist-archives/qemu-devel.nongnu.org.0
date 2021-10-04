Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A94207A0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:54:27 +0200 (CEST)
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJju-0001uu-OE
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJH5-0007jE-Ky
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJH0-0003jE-A5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=If+ReMAvz+ryketUBLo8OA3JB2QhFDQlrmRnIMs/CXU=;
 b=SJenmJvUntDzPtO8jYY2snid5K1rjdQIRtVL7E3y4HhD0Jzd11RwGL77fbd9Scy8Vb4a5C
 cagWkEED/U127uXzid1rEUqs8s3DnJT0N7kUUnQQ53l3+WB02gqA19HvEoJIBl5MsLMFDM
 V0np6ExOy7PV3htjmmYGiWaQMo4rNZY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-dNaNIp6vP5GT0czlBjhR8A-1; Mon, 04 Oct 2021 04:24:30 -0400
X-MC-Unique: dNaNIp6vP5GT0czlBjhR8A-1
Received: by mail-ed1-f71.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso6498695edt.11
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=If+ReMAvz+ryketUBLo8OA3JB2QhFDQlrmRnIMs/CXU=;
 b=O30HDpCDoB50hdaMEC5yKeGKkx6odzUdrPzGbO6NPzshcuQ+wUQhagyonOgZ7tUhKl
 3OrnEfSBKaeUm+XxeGpGWdB7atDDmH02funDSZ+46N3cPHDKTKQ5qC3DGnPbJSwZW5c+
 HSufSrpM4VvFYCnHOUKvicsEZBkoxFvqPsG7J7niu63ML793MoOJSAdUwJ3i443gajUG
 Hnfn+WBuORG1FJhNTdvWP8ioF6rnvAynJLsdxdrpoZrHsljSV/kIqGgkGAIqSfc7EQhA
 psSXkOVmDk9JAZN2/10rX2g/mdeazQ4E+9STj6cZ/5RRjaq979fSGOZ+uvqNZp1EvbTm
 sbVQ==
X-Gm-Message-State: AOAM533CigygEAZlFmzbg6XIQprki30SgiAwW9rOOkfhRC+qFMlo6Zc9
 gvzwH9vxwl35kO8L4oMLy3Aamdesff4bIHM8daB3mOEqyCL1xwDIFcu+kcZBwKGdeSTW6s8o+tr
 txuIbuDi7h8GmibU=
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr16981914edx.224.1633335869154; 
 Mon, 04 Oct 2021 01:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDeMdqlj0O9bsJxnESsAIptrfSTAzM8EvFxHRZ47LFFjvMhiABonkHnbCuplcc+QE0NlEeQQ==
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr16981897edx.224.1633335868977; 
 Mon, 04 Oct 2021 01:24:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b2sm5205962ejz.119.2021.10.04.01.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:24:28 -0700 (PDT)
Message-ID: <b5d73095-9348-ecb2-e9a7-1ec038cc85e6@redhat.com>
Date: Mon, 4 Oct 2021 10:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 16/22] target/i386/sev: Move
 qmp_query_sev_capabilities() to sev.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-17-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-17-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Move qmp_query_sev_capabilities() from monitor.c to sev.c
> and make sev_get_capabilities() static. We don't need the
> stub anymore, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev_i386.h        | 1 -
>   target/i386/monitor.c         | 5 -----
>   target/i386/sev-sysemu-stub.c | 4 ++--
>   target/i386/sev.c             | 8 ++++++--
>   4 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 5f367f78eb7..8d9388d8c5c 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -26,7 +26,6 @@
>   
>   extern SevInfo *sev_get_info(void);
>   extern char *sev_get_launch_measurement(void);
> -extern SevCapability *sev_get_capabilities(Error **errp);
>   
>   int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
>   int sev_inject_launch_secret(const char *hdr, const char *secret,
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 188203da6f2..da36522fa15 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -728,11 +728,6 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
>       return info;
>   }
>   
> -SevCapability *qmp_query_sev_capabilities(Error **errp)
> -{
> -    return sev_get_capabilities(errp);
> -}
> -
>   SGXInfo *qmp_query_sgx(Error **errp)
>   {
>       return sgx_get_info(errp);
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index 66b69540aa5..cc486a1afbe 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -27,9 +27,9 @@ char *sev_get_launch_measurement(void)
>       return NULL;
>   }
>   
> -SevCapability *sev_get_capabilities(Error **errp)
> +SevCapability *qmp_query_sev_capabilities(Error **errp)
>   {
> -    error_setg(errp, "SEV is not available in this QEMU");
> +    error_setg(errp, QERR_UNSUPPORTED);
>       return NULL;
>   }
>   
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 2198d550be2..fce007d6749 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -438,8 +438,7 @@ e_free:
>       return 1;
>   }
>   
> -SevCapability *
> -sev_get_capabilities(Error **errp)
> +static SevCapability *sev_get_capabilities(Error **errp)
>   {
>       SevCapability *cap = NULL;
>       guchar *pdh_data = NULL;
> @@ -489,6 +488,11 @@ out:
>       return cap;
>   }
>   
> +SevCapability *qmp_query_sev_capabilities(Error **errp)
> +{
> +    return sev_get_capabilities(errp);
> +}
> +
>   static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>                                                           Error **errp)
>   {
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


