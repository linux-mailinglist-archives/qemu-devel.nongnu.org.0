Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F336DD34
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:39:37 +0200 (CEST)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnDs-0005jC-Hc
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnCa-0004q4-I9
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnCX-0002JL-Vz
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTaQc9FkCcuokZPM9UeLGsCCJu3lvE/81BuUp6++iKg=;
 b=ZJcaZEULMU8M30rcq1aXNpK8d+h3wTo3xmApQ8hdBbJojWJZYmTHcar8Nw48BKZ0c6NeWM
 4s9bASswsO7Q+6a2dZ6Yb3RY8Gv1e0mypch0xqTfMt9594/mmpzMY0vd87XVGK30jRLoYk
 yo1LLZAEaKklOj7OzlnIgLUr/RF7R6Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-9hwhrWZGMmmjOOM0AmldFg-1; Wed, 28 Apr 2021 12:38:08 -0400
X-MC-Unique: 9hwhrWZGMmmjOOM0AmldFg-1
Received: by mail-wr1-f69.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso4098316wrk.14
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uTaQc9FkCcuokZPM9UeLGsCCJu3lvE/81BuUp6++iKg=;
 b=cu4OAeDb8NTf6faFx8QYQtF3A7vulXUb+bfa8RMGl0HCvrCcba9bePGsqEngRchynO
 uPVinAfyySpVmAI+dyr4f+93TeWzPFRmymsuqmdTJlj1ALqi4iHYJCkyjZL+dwPdNQ+y
 ow3QSoN4YLlTxH3t2xM/Po0Pba11zKXCSwSq865OgrvZLCaRJhXDabJWs2znaZIYCzpW
 3E6Aw12Yi5XI5GcKdbCFh/OqOhzNT+jTBy9HaMNBLdZEUUBGnKYtt1inRVwQSEiBNVM3
 5AaOcK4jsF7vsHJwpnaeluuc6fr2LhWp1Mf8Yeph9Lgu4LjmzqVhBi+/EEA1hJ7Ehpl0
 zHsg==
X-Gm-Message-State: AOAM5313vaZ/BptUMH89bL8QVxNVajuz6HSIBGh22lRbWHuj3XnWkBvI
 25beIo5QUpu3WrS9UtIRM1W0rmxKVnO3nzD9zDdJMe0y9Cnv4UcbypDRl2GeANYBYHLsJvYDGLi
 1ZuW32IdSEdMdMFs=
X-Received: by 2002:adf:9011:: with SMTP id h17mr37172867wrh.384.1619627886728; 
 Wed, 28 Apr 2021 09:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGGsHrC5TU7IIy82VM8rOTRu8Rk5kMmGpfY7wEPlLOm7RTVpyQf3gUo/ZEjpRz1YWjydG6Gg==
X-Received: by 2002:adf:9011:: with SMTP id h17mr37172849wrh.384.1619627886559; 
 Wed, 28 Apr 2021 09:38:06 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u5sm330680wrt.71.2021.04.28.09.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:38:06 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com>
Date: Wed, 28 Apr 2021 18:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-13-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex, Richard, do you mind reviewing this one please?

On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The previous attempt (commit f77147cd4de) doesn't work as
> expected, as we still have CONFIG_TCG=1 when using:
> 
>   configure --disable-system --disable-user
> 
> Now than we have removed the use of CONFIG_TCG from target-dependent
> files in tests/qtest/, we can remove the unconditional definition of
> CONFIG_TCG in config_host.
> 
> This avoid to build a bunch of unrequired objects when building with
> --disable-tcg (in particular the softfloat tests):
> 
> Before:
> 
>   $ make
>   [1/812] Generating trace-qom.h with a custom command
>   ...
> 
> After:
> 
>   $ make
>   [1/349] Generating trace-qom.h with a custom command
>   ...
> 
> A difference of 463 objects...
> 
> Reported-by: Claudio Fontana <cfontana@suse.de>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Include Paolo's feedback:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
> therefore o not include Alex's R-b tag.
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>
> ---
>  meson.build | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..623cbe50685 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -262,7 +262,6 @@
>                          language: ['c', 'cpp', 'objc'])
>  
>    accelerators += 'CONFIG_TCG'
> -  config_host += { 'CONFIG_TCG': 'y' }
>  endif
>  
>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
> 


