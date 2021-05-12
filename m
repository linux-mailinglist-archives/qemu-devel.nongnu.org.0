Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C937B4C1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 05:57:40 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgg0B-00030c-Ou
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 23:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgfz1-0002Ak-MK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgfyz-0002YV-Fk
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620791784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v8Y9Obqyb3SptWPtRjegFiGp85bzNGOATYKD3YNgBI=;
 b=FDd1fbvKFGpcUKfNFibvmWH4FvNkvq8KfK30jb3moHEt4afnavhrpjNaiqMlMLI8VtedoU
 uCCJFRQd73E8jvILnKwPTNq2m9xxrwcFN+eGL2CnrXp9mjLYG4LpxW6XFj1OWcfCvj19i3
 20APfK7lsMCZa7MaQOqzcM0/ZrAsRc0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-NdXuslW7PhCfGEGmNDlzHQ-1; Tue, 11 May 2021 23:56:22 -0400
X-MC-Unique: NdXuslW7PhCfGEGmNDlzHQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j136-20020a1c238e0000b029014675462236so2642522wmj.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 20:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4v8Y9Obqyb3SptWPtRjegFiGp85bzNGOATYKD3YNgBI=;
 b=koUY6uqwCYUD0MmDlxl6JjRrtFR076wTgFzUInKG8lSEYkb6i/GFjpcY8wckf+hDp5
 yESTMKcB6UKqmcZy15Lt5UqMPAc15qjJj59RwmivtDkJfRTi8jatB/9Ktl+Zw5LhR5Me
 GnGuVT1k2qwjjkj+CrsByhOK97/8YJ7nSZIBjCDa5+dBjJoDeK5QmjQTCBnu1YC+uZ4D
 3J9xoOZ51KhgveTDmJhGwslGy8aYYs14SmkPokUYu6XnLhwfjAMffWjKNoU24sd9yJ9T
 laV0IoJIF6/JaJfQsSmG5Ssv8gcsiL6D4j6Pz3avbRUHkC1I2mDUYSrbE5J7Ok/vxOfL
 Njkg==
X-Gm-Message-State: AOAM533nEaLFz/THQJlDEP6ub3Yz/HbamR3YyOs2oeNxAM7wRr/IFVdd
 8qRAKugYtKiztRy7Aem6SmOOP+WRc2XoJvxjpNQCdZ6rATpZzE37B5L3wfuOteN3yawLoaZoGNg
 rLTUgs03vAZE9y8E=
X-Received: by 2002:a7b:cd01:: with SMTP id f1mr9070168wmj.177.1620791780155; 
 Tue, 11 May 2021 20:56:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdkzY77627R32EpxcNkpSyFvYaoBK8ibTVqSaqzdezCGbfe8EAWMxX4GCREeGSQTiLfwSd1g==
X-Received: by 2002:a7b:cd01:: with SMTP id f1mr9070144wmj.177.1620791779856; 
 Tue, 11 May 2021 20:56:19 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y12sm25332578wma.47.2021.05.11.20.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 20:56:19 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] buildsys: Do not use internal fdt library when
 asked for the system one
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <ed80da42-74e1-d112-5cd2-8c7456ce6e4b@redhat.com>
Message-ID: <7eabc7c2-d2cd-2bbd-c5b5-85defc649b9b@redhat.com>
Date: Wed, 12 May 2021 05:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ed80da42-74e1-d112-5cd2-8c7456ce6e4b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 5/11/21 5:57 PM, Philippe Mathieu-Daudé wrote:
> On 5/11/21 5:53 PM, Philippe Mathieu-Daudé wrote:
>> Attempt to fix the issue reported by John when building
>> with an outdated libfdt.
> 
> Unencoded version of this cover:
> 
> For now it changes:
> 
>   hw/ppc/spapr_hcall.c: In function ‘h_update_dt’:
>   hw/ppc/spapr_hcall.c:1966:9: warning: implicit declaration of function
> ‘fdt_check_full’; did you mean ‘fdt_check_header’?
> [-Wimplicit-function-declaration]
>    1966 |     if (fdt_check_full(fdt, cb)) {
>         |         ^~~~~~~~~~~~~~
>         |         fdt_check_header
>   hw/ppc/spapr_hcall.c:1966:9: warning: nested extern declaration of
> ‘fdt_check_full’ [-Wnested-externs]
>   [...]
>   /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in
> function `h_update_dt':
>   hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_check_full'
>   collect2: error: ld returned 1 exit status
> 
> by:
> 
>   qemu/meson.build:1352:4: ERROR: Running configure command failed.
>   The following clauses were found for PSERIES
> 
>     CONFIG_PSERIES=y
>     config PSERIES depends on FDT
> 

This is triggered with:

               fdt support: NO

having:

default-configs/targets/ppc64-softmmu.mak:6:TARGET_NEED_FDT=y

So this code doesn't seem to work:

if not fdt.found() and fdt_required.length() > 0
  error('fdt not available but required by targets ' + ',
'.join(fdt_required))
endif

BTW I disagree FDT is target-dependent, it is machine-dependent IMO.

> which is not better, but one step at a time...
>
> John said: https://gitlab.com/qemu-project/qemu/-/issues/255#note_572421108
> 
>   Distributions usually don't used embedded copies of libraries,
>   so the configure script should require the correct minimum version.
> 
> Personally I'd rather allow users to build the most of QEMU with what is
> available, that is all possible machines except pSeries, making pSeries
> machine selected by default and deselected if not possible, with this
> change:
> 
> -- >8 --
> diff --git a/default-configs/devices/ppc64-softmmu.mak
> b/default-configs/devices/ppc64-softmmu.mak
> index cca52665d90..62339661fca 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -5,6 +5,3 @@ include ppc-softmmu.mak
> 
>  # For PowerNV
>  CONFIG_POWERNV=y
> -
> -# For pSeries
> -CONFIG_PSERIES=y
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 3935b73456f..706debd4fee 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -1,5 +1,6 @@
>  config PSERIES
>      bool
> +    default y
>      depends on FDT
>      imply PCI_DEVICES
>      imply TEST_DEVICES
> ---
> 
> But I suppose it breaks user expectations.
> 
> Thoughts?
> 
> ;)
> 


