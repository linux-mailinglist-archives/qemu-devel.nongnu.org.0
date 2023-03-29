Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C576CD9FE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:05:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVTw-0006NM-8u; Wed, 29 Mar 2023 09:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVTu-0006Mq-G7
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVTq-0006bH-Cn
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680095069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULiz4XrpYLwXLNogvMqCef9pCJnfQ59KC6tho/RDz88=;
 b=LKxZB8fKeQfhDzou84M7l+fUQxR4Fa5VbAW0z5o2iX4g9Sykl0CV+hQ0M1H1CXJapdP5bQ
 UjSPMR8K5hh08Nji/LjCKEwWzH3mE42lr8OMGQjwWjaK2A9NTFaXvoKFE8xeiABPg8qVPX
 61dImYQUmm4dMq8iFSR1o07rAfccbVg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-QZClypImN9CcxJD270Sntw-1; Wed, 29 Mar 2023 09:04:26 -0400
X-MC-Unique: QZClypImN9CcxJD270Sntw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso22056613edu.17
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095050; x=1682687050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ULiz4XrpYLwXLNogvMqCef9pCJnfQ59KC6tho/RDz88=;
 b=lX4/2ppI4qgaERT+tUw1kk0G5bY7UULSKDVTPLEXwCvRQgkNTEsdxssmkkw3Bzu0iM
 bF/66a3Xr5AyepvHwGycuajG0Kmn31rHO4B4aJNamhVsZEBWlKyZkaSjhcZPhxwbCeBl
 agzhf/qvbe9pJ9Kg0JrM/EhlnHPVoOhhuD8xWEPlY4IGBuiBNJcNqRnLDiFdaoFKxslE
 Kz9/8ycpRrMuRiP7u4tAE/gs/iQp98zYCmoSLvSifudOyoa0BbzOYc5AFPS7Wea01gKy
 wDtbsz3eJ1J/nb0MFLMjEwqwXTD+RHin6qeKxykvALJ0HHG3cEFsXbrVgcOdzkllpYDM
 /kxA==
X-Gm-Message-State: AAQBX9ef3Qzdd9aJSmNJxjWBHCd5UaUPD1z1bQgAoKYlasvluvKm2t5h
 UKvVf+Xso+X7EqLXBkrV73KaiJq7Y1rXBRk5/Xx2B11o2H/lF8ehfbGg2mT+4/TsZ/+xRzsSy8N
 /KPXhuzl82JUosTc=
X-Received: by 2002:a05:6402:1113:b0:4fa:aee8:235f with SMTP id
 u19-20020a056402111300b004faaee8235fmr20534948edv.9.1680095050212; 
 Wed, 29 Mar 2023 06:04:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350bMKTnyxVjPhihuvCbWY5iEQYULvsFzkehOVaWsJ5dy/csCcy+PmxKwLKjVM92MCQ4160Hfrw==
X-Received: by 2002:a05:6402:1113:b0:4fa:aee8:235f with SMTP id
 u19-20020a056402111300b004faaee8235fmr20534926edv.9.1680095049951; 
 Wed, 29 Mar 2023 06:04:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 k2-20020a50c082000000b005002daeb27asm16983151edf.37.2023.03.29.06.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 06:04:09 -0700 (PDT)
Message-ID: <1ac5fff1-3948-b7c1-b6bd-5090b8c11ab8@redhat.com>
Date: Wed, 29 Mar 2023 15:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230329124539.822022-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230329124539.822022-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/29/23 14:45, Daniel P. Berrangé wrote:
> The 'check' script will use "#!/usr/bin/env python3" by default
> to locate python, but this doesn't work in distros which lack a
> bare 'python3' binary like NetBSD.
> 
> We need to explicitly invoke 'check' by referring to the 'python'
> variable in meson, which resolves to the detected python binary
> that QEMU intends to use.
> 
> This fixes a regression introduced by
> 
>    commit 51ab5f8bd795d8980351f8531e54995ff9e6d163
>    Author: Daniel P. Berrangé <berrange@redhat.com>
>    Date:   Wed Mar 15 17:43:23 2023 +0000
> 
>      iotests: register each I/O test separately with meson
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index a162f683ef..9735071a29 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -47,19 +47,20 @@ foreach format, speed: qemu_iotests_formats
>     endif
>   
>     rc = run_command(
> -      [qemu_iotests_check_cmd] + args + ['-n'],
> +      [python, qemu_iotests_check_cmd] + args + ['-n'],
>         check: true,
>     )
>   
>     foreach item: rc.stdout().strip().split()
> -      args = ['-tap', '-' + format, item,
> +      args = [qemu_iotests_check_cmd,
> +              '-tap', '-' + format, item,
>                 '--source-dir', meson.current_source_dir(),
>                 '--build-dir', meson.current_build_dir()]
>         # Some individual tests take as long as 45 seconds
>         # Bump the timeout to 3 minutes for some headroom
>         # on slow machines to minimize spurious failures
>         test('io-' + format + '-' + item,
> -           qemu_iotests_check_cmd,
> +           python,
>              args: args,
>              depends: qemu_iotests_binaries,
>              env: qemu_iotests_env,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


