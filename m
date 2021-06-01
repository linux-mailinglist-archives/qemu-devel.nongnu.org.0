Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0D3971CD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:49:37 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1xo-0005LW-Po
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lo1wi-0004T2-Ho
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lo1wf-0001l1-Fn
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622544503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ic4NWOLQ0tnymafCtBcrjzUOFMCWmOrls8If2U4umc=;
 b=DNnoPGVBChiQLCershIu6SuM8YdkMSJ3U13QNvUWJ4DkXZp4ZwGIlaP8fw8H0cazOR38Pc
 g/9KAzHQmex1BiQrnyEcImiv3MnXnGG6p59N6dsqQi+02fzkPJbAM4LWudiPMufpGRLftM
 D+S8n5zRYVmq8bHUm7AQRVs0GN6cngc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-FPne4s9oMEmSqsWK0lTQqQ-1; Tue, 01 Jun 2021 06:48:22 -0400
X-MC-Unique: FPne4s9oMEmSqsWK0lTQqQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 j13-20020aa7de8d0000b029038fc8e57037so6147245edv.0
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Ic4NWOLQ0tnymafCtBcrjzUOFMCWmOrls8If2U4umc=;
 b=byYiRroU1PhaTzocNVUEMNKzRkK0JsU/NB8AHbMUOavE5Rop5oBGOlZnqdnp4TbHh9
 6UEXQ4l9x2xaDWK/c2EOTblT1rhiOwm351c/298csjp/SFZIOxYkAWi8IBcpC49n3pF4
 xvsNJBH5ixBNBsyuJe0bBHCS/PahjHnH1oYttvOEMutPf6gJ3dtoiipHr5ZQXkNkrVDE
 IYFd8Xj3IQncYRD2wnQoiUskRoRHvco9MLhmrF6BD5/uxk2vzcT/uLe+rydTZnp06/o9
 54pE4qvWjKuVN+S7F/i879ZmK9/hW9MyjccwRzD6Lo32F1Y63xj8WAFvTbmgoeb86ejb
 D/Tw==
X-Gm-Message-State: AOAM533G8FrClpaFR1WNUhy+6EN1k0CnLYHIAqGcKC+qtYsus3NmWuwp
 xvxlQH9H+akZpWcwC+zh7XgLKzx9ttBvf9DW1CbHT5/Tnidx10UUIRXYXJ+SrMMrBNxe9S5FUuo
 71DmLeLQN/XBLyCU=
X-Received: by 2002:a05:6402:883:: with SMTP id
 e3mr31426993edy.1.1622544501017; 
 Tue, 01 Jun 2021 03:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVu6E0HkSwVWipD7fkj57xfiIhLIiJkb5YB2EOoNz3jwbGpUgnlHCGwpEfGs8Rox/wk/PS9g==
X-Received: by 2002:a05:6402:883:: with SMTP id
 e3mr31426971edy.1.1622544500833; 
 Tue, 01 Jun 2021 03:48:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r1sm6653071edp.90.2021.06.01.03.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 03:48:20 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: allow the overriding of default-config in
 the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210528163116.31902-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5313539f-c41a-3dda-cb51-5dbc0443dd61@redhat.com>
Date: Tue, 1 Jun 2021 12:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210528163116.31902-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/05/21 18:31, Alex Bennée wrote:
> +  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-cc-FOO option"

Extra "cc".

Looks pretty good otherwise, possible tweaks include:

1) check that the architecture exists (i.e. that it there is a valid 
softmmu target named after it)

2) checking that the file exists using "test -f".

> diff --git a/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak b/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak

Not sure if you want to include this file or it's just an example; if 
you do, you probably should either remove the directory or call it 
64bit-only.mak, without including aarch64-softmmu twice.

Paolo

> index 0000000000..3626de9e3c
> --- /dev/null
> +++ b/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak
> @@ -0,0 +1,10 @@
> +#
> +# A version of the config that only supports 64bits and their devices.
> +# This doesn't quite eliminate all 32 bit devices as some boards like
> +# "virt" support both.
> +#
> +
> +CONFIG_ARM_VIRT=y
> +CONFIG_XLNX_ZYNQMP_ARM=y
> +CONFIG_XLNX_VERSAL=y
> +CONFIG_SBSA_REF=y
> diff --git a/meson.build b/meson.build
> index 3f065f53f2..656ebde513 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1350,9 +1350,10 @@ foreach target : target_dirs
>                                                  configuration: config_target_data)}
>   
>     if target.endswith('-softmmu')
> +    config_input = meson.get_external_property(target, 'default-configs/devices' / target + '.mak')
>       config_devices_mak = target + '-config-devices.mak'
>       config_devices_mak = configure_file(
> -      input: ['default-configs/devices' / target + '.mak', 'Kconfig'],
> +      input: [config_input, 'Kconfig'],
>         output: config_devices_mak,
>         depfile: config_devices_mak + '.d',
>         capture: true,
> 


