Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0C6D031F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:28:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqRc-0007Ce-RS; Thu, 30 Mar 2023 07:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqRU-0007CF-QJ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqRT-0007Ip-3P
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680175662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRxAXyaVxgiZhh/OG40B633BWWc1IAW20deQOfK+2wQ=;
 b=H2RV+352OUm5Q9kTW73cyTj9asl8OCLSR6yKb0/HktkbSVdvSPrfSv4I8o1lKqQa+9QvJG
 FgPgD2Q4HN4pXoA2McKNn1Yvi+UgBb0y+qIOpZu2N8sihIklPf4KWU6Uznp3Z4d/lJ1CzB
 XGryMccPOohvx9ikvI5vdITJebc2UXY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-Aq4d8mGMP7iqXQQeCPrrtw-1; Thu, 30 Mar 2023 07:27:38 -0400
X-MC-Unique: Aq4d8mGMP7iqXQQeCPrrtw-1
Received: by mail-qv1-f72.google.com with SMTP id
 oo15-20020a056214450f00b005a228adfcefso8146379qvb.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IRxAXyaVxgiZhh/OG40B633BWWc1IAW20deQOfK+2wQ=;
 b=AKsa2RRd/EqgB1z3HmgImT/sK0Nn25ALyBBX7qzIQnbpLMhXtHG8xHM3rBqYdK1ICz
 j7euzTkHF327TfvwP+p5Bl+kS+WwqDVDk32hXCkZpvCUz9n35zrB+f4MgsGZmTydx57+
 ALoMYCB5j2sIAvzUx5o7Q4VvXT1U9IJR3HQ6DHjo0fwTYqTYaXBxPEqzRUHYGTO2OaE8
 eyA4B3DvNbfVu+ic9BuKLtmPNHQeY+NsBo7QaccfPSuo+vC+KCgvzeoz3PP3GnlrDmr/
 IekUS3m2AYzq7ZlkV96MUkdcbsRpAoRCQeJO29PFeQlZCwvz7OMh/5R7/7c5R9Rlxl50
 XjGw==
X-Gm-Message-State: AO0yUKUbaABg3kYhGok27nsgy22l2/+y+OS2dXTaYrHA5gww9eS/CSu4
 uj5ejlUAN928GHn73db5YdsqIvC43vhiAYbHBxGXuLFngZWncfdE5/GZUfKb4mVEeIBvGVV0Vvq
 3lvEhkfq3haaKqiQ=
X-Received: by 2002:a05:622a:284:b0:3d6:9528:a0e1 with SMTP id
 z4-20020a05622a028400b003d69528a0e1mr37223249qtw.37.1680175658000; 
 Thu, 30 Mar 2023 04:27:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set+k8rqIrQG7MFAH25ABEJKZmVSqTDeUaoyDdUkpk3EGwRjONm+H3Kj+CAAYuFNciBwqKqBbTQ==
X-Received: by 2002:a05:622a:284:b0:3d6:9528:a0e1 with SMTP id
 z4-20020a05622a028400b003d69528a0e1mr37223227qtw.37.1680175657789; 
 Thu, 30 Mar 2023 04:27:37 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a37b601000000b00743592b4745sm19292075qkf.109.2023.03.30.04.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:27:37 -0700 (PDT)
Message-ID: <e279083e-f785-d64a-9464-30f95ffbc77d@redhat.com>
Date: Thu, 30 Mar 2023 13:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 07/11] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 30/03/2023 12.11, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
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
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230329124539.822022-1-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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

Reviewed-by: Thomas Huth <thuth@redhat.com>


