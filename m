Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458302DFFA7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 19:26:21 +0100 (CET)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krPsx-0005K7-SD
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 13:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krPr6-000446-Ji; Mon, 21 Dec 2020 13:24:24 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:45508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krPr4-0000CZ-PS; Mon, 21 Dec 2020 13:24:24 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id a4so4531547qvd.12;
 Mon, 21 Dec 2020 10:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EE5H4NJOG5aRBxXsSXcxM3eRWdq8OadfVfM9AXBRQQY=;
 b=Hi51AE5BEyxHfwMs1tcJasog8CQyiZ0x6OCXagQdZZtgcUPzFihkIRt5V+MGJftULP
 JVEBSoLfoET6+09+0G8cI99qmHgkKaxSHaHYPU+XyU8HZsvFfOQnJDVMtTOW8ayVGOrx
 hCH7yW0EPq/SfgJyDdMU31Zzp6jwXxufGHDLXE9G+/296SSPK0aVvXKvzhcxjcg40MKN
 mReZSEsgwH8BqGIU99K6ir70x+O+Og8cpw6Yq/4kc4Tg/m9hpYQQB60mNfido22XMNu/
 P86MQKejmeK6DiIE2KzLdtqld0bTWKtbXYS9IvKpAWroji2ncRVX0jHH/vQmk5M7s355
 fBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EE5H4NJOG5aRBxXsSXcxM3eRWdq8OadfVfM9AXBRQQY=;
 b=H4fnk/9HN5jx17bbggszrTVQMTaudJt9LqBYWe9TkE3qNNYO1Uq+X0Cy318IzajJCd
 MW4FlrxncLuhPRYL7yCy5nohD12YBI5UkJKoEsrwlIbrcsuqHisk/TNkA6pn/UeA/f7g
 9UDS9AFhJ6rPbbO3uyq6q4YKUoEzqNcvhjcZnesZi8oEHg6SIToZNE7M741x+bKb1aaN
 0gcgI6KOAcOHBU/nOUqYh73iSqULTXAyl95ytBtu/xdf4dZuapwgiboCdoPItcaO4E33
 44J9Zh86Nr6c2J5PDA8855Ec53oGzWEaT0TqoDE1E25g9LZdxnBiatZRQtCOkOlf5ozF
 eaJA==
X-Gm-Message-State: AOAM532qLhndBZxSS1Akpy3V1+KumtgmRq0UHX7Au/rwrcj8P4/EKwX3
 /DK0E8cAJxwD0j6l9LHXcli6VnC7kOk=
X-Google-Smtp-Source: ABdhPJzSWWfYw7Zr0nHrP4VvLiCERNc9HeHIDJ68w6w8amDyDEwFwWnX4e1nJhwEOjnuLa2zlFw3/A==
X-Received: by 2002:a05:6214:20a1:: with SMTP id
 1mr18071486qvd.61.1608575061221; 
 Mon, 21 Dec 2020 10:24:21 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id a194sm10866143qkc.70.2020.12.21.10.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 10:24:20 -0800 (PST)
Subject: Re: [PATCH 1/6] spapr: Call spapr_drc_reset() for all DRCs at CAS
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-2-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <69e292a6-7af7-999a-929c-5026032c4389@gmail.com>
Date: Mon, 21 Dec 2020 15:24:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-2-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:33 AM, Greg Kurz wrote:
> Non-transient DRCs are either in the empty or the ready state,
> which means spapr_drc_reset() doesn't change their state. It
> is thus not needed to do any checking. Call spapr_drc_reset()
> unconditionally and squash spapr_drc_transient() into its
> only user, spapr_drc_needed().
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/spapr_drc.h | 3 ---
>   hw/ppc/spapr_drc.c         | 8 ++------
>   hw/ppc/spapr_hcall.c       | 7 ++++---
>   3 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index def3593adc8b..cff5e707d0d9 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -244,9 +244,6 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
>   void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
>   void spapr_drc_detach(SpaprDrc *drc);
>   
> -/* Returns true if a hot plug/unplug request is pending */
> -bool spapr_drc_transient(SpaprDrc *drc);
> -
>   static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
>   {
>       return drc->unplug_requested;
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index fc7e321fcdf6..8d62f55066b6 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -462,8 +462,9 @@ static const VMStateDescription vmstate_spapr_drc_unplug_requested = {
>       }
>   };
>   
> -bool spapr_drc_transient(SpaprDrc *drc)
> +static bool spapr_drc_needed(void *opaque)
>   {
> +    SpaprDrc *drc = opaque;
>       SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
>   
>       /*
> @@ -483,11 +484,6 @@ bool spapr_drc_transient(SpaprDrc *drc)
>           spapr_drc_unplug_requested(drc);
>   }
>   
> -static bool spapr_drc_needed(void *opaque)
> -{
> -    return spapr_drc_transient(opaque);
> -}
> -
>   static const VMStateDescription vmstate_spapr_drc = {
>       .name = "spapr_drc",
>       .version_id = 1,
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index c0ea0bd5794b..4e9d50c254f0 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1650,9 +1650,10 @@ static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
>                                                             prop->name,
>                                                             &error_abort));
>   
> -        if (spapr_drc_transient(drc)) {
> -            spapr_drc_reset(drc);
> -        }
> +        /*
> +         * This will complete any pending plug/unplug requests.
> +         */
> +        spapr_drc_reset(drc);
>       }
>   
>       spapr_clear_pending_hotplug_events(spapr);
> 

