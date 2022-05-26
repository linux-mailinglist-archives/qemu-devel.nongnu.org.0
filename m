Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC4534F99
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:47:15 +0200 (CEST)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCtW-0002bl-6e
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCOI-0004Tf-NK
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCOG-0000WA-E7
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZ9Ap6coot9VoOg8m/sN40Yh56M0MRK1eIi833Q7AMI=;
 b=JCaQ9Hg28yhvsY6N63/iaxxtUf+bHAZJz9jzu+qaBScna448MS2x6codqj7MEFxNHgmkXJ
 n5etoi/IJt1rZ44xzdZElkxlNMOhfxiifrO60iYdfawCMqUAzcPXxnyf0xv7PSca0GQbZu
 o9+r/5crrA0pKBkvNJK5K209s8yWS58=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-uuAZFSF8O0uFDj_vdFkjEg-1; Thu, 26 May 2022 08:14:54 -0400
X-MC-Unique: uuAZFSF8O0uFDj_vdFkjEg-1
Received: by mail-ed1-f71.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so946587edb.17
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZ9Ap6coot9VoOg8m/sN40Yh56M0MRK1eIi833Q7AMI=;
 b=t+GhXyWMxlp3c9YfIrKzPmmqjRMFexKQ4YzUl24kSUDsQccMfgJ0frhIbImYvr3oje
 v3XC2/RrFLyns1XtVxK9ANk0XQuWTKOxKhxHEfmCu9YmDQ/4oQs4sxu3LCR3V7Mctd6P
 FTRdXm0Lpzll1mufA3Up/dbT5tFteDGfDe78Rwm6kG0LyPlsaxw6JPzoDujp7GN62RRU
 8Zm8ZJOc+M0OvHOivvOAVC/OY/csQhEs1yv7MuQEpl6Gr4v6FD7SRvYmV2lx/Bv4XenY
 e9SThQp+ks53RZTnIQFvJtWAMh2ACxb+RMqChn0vbA4mKetuCUaeR6b6fQ1Kh5zBrrSU
 5daw==
X-Gm-Message-State: AOAM531LEVuQE3Cfiuyhu9TwBJlqueg2Ze6dHuUlnsVMBy7CHhS1rHfJ
 hMVpD162qoHp5KZ7tT5BXbOno/uXFCvpkWhALN2kf87jxleBt5NmfjEXWmYGZnntIJ9wPDRPeCA
 pzlgEDF0kQxpDcYA=
X-Received: by 2002:a17:906:6a09:b0:6ff:182e:ce33 with SMTP id
 qw9-20020a1709066a0900b006ff182ece33mr5542987ejc.14.1653567292886; 
 Thu, 26 May 2022 05:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNluaTYjCChOqAz6TUmtKvY402e+vnXPtm/1dKg8I5Rbo8aH23tdnzIJWo8VeH2zpNB1zNow==
X-Received: by 2002:a17:906:6a09:b0:6ff:182e:ce33 with SMTP id
 qw9-20020a1709066a0900b006ff182ece33mr5542969ejc.14.1653567292679; 
 Thu, 26 May 2022 05:14:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 pg5-20020a170907204500b006f3ef214e6asm455420ejb.208.2022.05.26.05.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:14:52 -0700 (PDT)
Message-ID: <3f697d5a-a62b-5775-5d56-401e858db1c2@redhat.com>
Date: Thu, 26 May 2022 14:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 8/9] tests: add python3-venv to debian10.docker
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-9-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/22 02:09, John Snow wrote:
> This is needed to be able to add a venv-building step to 'make check';
> the clang-user job in particular needs this to be able to run
> check-unit.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/docker/dockerfiles/debian10.docker | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
> index b414af1b9f7..03be9230664 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -34,4 +34,5 @@ RUN apt update && \
>           python3 \
>           python3-sphinx \
>           python3-sphinx-rtd-theme \
> +        python3-venv \
>           $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


