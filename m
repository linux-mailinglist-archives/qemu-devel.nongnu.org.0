Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7B733DEF7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 21:39:07 +0100 (CET)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGT4-0006rx-EY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 16:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMGRv-0006Pp-Vk
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMGRq-0002Ph-5Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615927069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dCmIqY4Kdj2E7M6QGNS6XbxnBe5AC6wbOrgE49vQ+4=;
 b=aHSnX0skmPCM/VJP02fw2qhYy59vVVV08GNKM/3O6iVZSyWsZUdV071pk7ORFQbpFnFDJq
 mcZUY5Q85uBDRrh4zlVUyDFkCz7Q427sqrxTKRAdz2eHqKfFPNZ7wWroWzKRCQThuNOJOa
 CpBA1AD9rbHX47cmA1tgZSES7J9CGHk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-jFkYHOTAOcCSJSa57MVcfA-1; Tue, 16 Mar 2021 16:37:46 -0400
X-MC-Unique: jFkYHOTAOcCSJSa57MVcfA-1
Received: by mail-wr1-f72.google.com with SMTP id i5so17225899wrp.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 13:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dCmIqY4Kdj2E7M6QGNS6XbxnBe5AC6wbOrgE49vQ+4=;
 b=pJZ16I5XjtWzCFLPOg2VSiFV+KJmk2iKxaxvhCj59LtGzDbTAN6FpiYw8hWGqBCa9V
 7Ys/a+2Tl50WuImIlh+wFj+YVIPVgYRzcQBS425PZO5zZ36MuzPmQT1SscQcsbnjetmO
 niuyh/vwL0+wIQbAKYhjZHgi0AiwKk1gViUUED7iEdjIjPEeWXQxVABUcV3n5f694SDI
 MkRi3dEZFtTTolNpleVfX1Sj+ttnHV0PHItSGVucajKAx/kE8i9WI4RZZQwavFWqiFQq
 4/yk79aHijg7zEzPxe+6YV5aIPJ8MzRsBXg7VEGSt9Th17OPsOI1hqFPmsgbZmKt+k7S
 FxyA==
X-Gm-Message-State: AOAM531M9UO3M8GsAqOZygh8DCb/FWjvp1igsoTET9EyKEmkx4IWJ377
 X0y0bCTdLyrKwYqJDmIhV35Kld/VP+nC/rgqxR+YNpGgRzJNpWgvwRMzfbCCZThVgGt+L+d+XpC
 4faeis2s3RCgLoMw=
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr843958wro.404.1615927065044;
 Tue, 16 Mar 2021 13:37:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZpBPILt/rfvKa1f1DYxb7oNJYIfFs41EUB8lWA6iMzYqnuBpDEhZGUzQaNQH6sF+rMXGJ5Q==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr843928wro.404.1615927064536;
 Tue, 16 Mar 2021 13:37:44 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s3sm23292234wrt.93.2021.03.16.13.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 13:37:44 -0700 (PDT)
Subject: Re: [PATCH] hw/core: fix link error with --disable-fdt
To: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>, qemu-devel@nongnu.org
References: <20210316202347.415131-1-anthoine.bourgeois@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <050a5da3-1049-dc1c-a839-6f141ff19c87@redhat.com>
Date: Tue, 16 Mar 2021 21:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316202347.415131-1-anthoine.bourgeois@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Anthoine,

On 3/16/21 9:23 PM, Anthoine Bourgeois wrote:
> The link error appends only with x86_64-softmmu as the only target.
> 
> Fixes: a33ff6d2c6bd480fbab3bc9f748655a9269881eb ("hw/core: implement a
> guest-loader to support static hypervisor guests")
> 
> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
> ---
>  hw/core/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 9cd72edf51..5e61347779 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -37,7 +37,7 @@ softmmu_ss.add(files(
>    'clock-vmstate.c',
>  ))
>  
> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> +softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_FDT'], if_true: files('guest-loader.c'))
>  
>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>    'machine-qmp-cmds.c',

I suggested this change first, but then figured it would be better to
declare a Kconfig entry for guest-loader:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg791755.html

Do you mind reviewing or testing it?

Thanks,

Phil.


