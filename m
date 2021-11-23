Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0945A096
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:41:54 +0100 (CET)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTFJ-0000jk-6b
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:41:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTAx-00017y-Aw
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:37:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTAt-00011s-3y
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637663838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VEb37U1slu0yp0Bp10etxMhNh/Ku6tkDqw3PZyYptRM=;
 b=ZCSEIHVA6EFQB0Gt25h4kVI/ENnlERR32PECv0KjLURbZ3ketpPy21DE0sBxwMM3B5eC0W
 Mm7892wsb72KaIvWtVZtGGb4sqJAvIAcSUB/raxNPh/Bi7EOhFKKkOVf+uAIMOsjqKzBd6
 QmNYAhGJQ+M1JnRIpOswLqkHhCZktho=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-UN7s0kJxPdmwn55yljZxAA-1; Tue, 23 Nov 2021 05:37:16 -0500
X-MC-Unique: UN7s0kJxPdmwn55yljZxAA-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so8236590wmb.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VEb37U1slu0yp0Bp10etxMhNh/Ku6tkDqw3PZyYptRM=;
 b=Jp/IReOFG7L5SoydHVZbgMimJr8/MGfz4vtLtTEpZ0m8CEgb4BjamI6vAw7h/3627T
 yXm2YR4/szFk/jvvXJGUrMevTOLouWmZ4G2olKgFLIuMm8oxBiKV3PKEKwkOuFM3bhJC
 jvl41SASAGMMuTSpJ3klN530TaU0Tam90RHZZzgl9XJQeTEV2r4xCv2WI9sr5Y/cbuJY
 K2QHPwZsfaCY6ITrtPNzzll6GPiKghjDKptnaKX6+dJiIJiXX5JNvdw+0uTfvYbS3G7I
 mwzNT9xFU78ra3FfubEXRwVzrjtpfK6B8jVCSFvFHgorRXKHnscuguOSjDfPw+RHgcH6
 5dlw==
X-Gm-Message-State: AOAM530Tvkv/ALExY63yH0U3yP9Xig9lP3MfLJfFBESCYqeUV2H+enD0
 jOiJ9vTxM0y09IreSe6L7KIGXNPgBBeNAsvfvgE+ZcwhXsbRsUj7bjp8O2shMmHOsmnpJiNtR7F
 a+F69Z39In7SI0vw=
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr1724612wmj.115.1637663834920; 
 Tue, 23 Nov 2021 02:37:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSXmDuY52NCA2B/xV5VemPykH/Ot7LsnEzpsLGz6urlkYTVsT122kstv71nNFmTYb9av0rDQ==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr1724582wmj.115.1637663834754; 
 Tue, 23 Nov 2021 02:37:14 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k187sm1938859wme.0.2021.11.23.02.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 02:37:14 -0800 (PST)
Message-ID: <5aa31f51-f9d3-ac21-4c09-28c4a05480ff@redhat.com>
Date: Tue, 23 Nov 2021 11:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20211122191124.31620-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211122191124.31620-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 20:11, Willian Rampazzo wrote:
> Remove me as a reviewer for the Build and test automation and the
> Integration Testing with the Avocado Framework and add Beraldo
> Leal.

Thank you Willian for your QEMU contributions and reviews,
they helped the community in having a better idea of what
integration testing is and is not, and how to use the
Avocado framework, having a better idea what Avocado can
not do for QEMU needs. Also thank you for improving the
documentation :)

Beraldo, thank you for replacing Willian as an upstream
Avocado <-> QEMU projects bridge :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c1..8f5156bfa7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3469,7 +3469,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>  M: Thomas Huth <thuth@redhat.com>
>  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -R: Willian Rampazzo <willianr@redhat.com>
> +R: Beraldo Leal <bleal@redhat.com>
>  S: Maintained
>  F: .github/lockdown.yml
>  F: .gitlab-ci.yml
> @@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
>  R: Cleber Rosa <crosa@redhat.com>
>  R: Philippe Mathieu-Daudé <philmd@redhat.com>
>  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -R: Willian Rampazzo <willianr@redhat.com>
> +R: Beraldo Leal <bleal@redhat.com>
>  S: Odd Fixes
>  F: tests/avocado/
>  
> 


