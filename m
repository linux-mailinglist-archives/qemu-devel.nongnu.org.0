Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885E43138E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:34:03 +0200 (CEST)
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcP1u-0004TH-JD
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOzl-0002RM-8U
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOzi-0002E4-S9
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFp8z2+3qQ/fZHLQdSG5ejdRjo57+r6l289Jf1cbwig=;
 b=eRa+p9UZqzb/V3/NEmS1wo6h/moII7vohM7/F6ykvA2w8/tPKc02+a7I/ZM/SmhAc54uxq
 yya33Ju2I9Mu38P1pqmP8cnanZtlZ1ACdF7nvJj9GXVhnvycfbE8lL7NfA3UUO8WHyW2dv
 yPgxS2eRD4gHM8LFB7bcxMD67zZOvUg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-4cJp5s4WNF6YJjwQPHEaZg-1; Mon, 18 Oct 2021 05:31:45 -0400
X-MC-Unique: 4cJp5s4WNF6YJjwQPHEaZg-1
Received: by mail-wr1-f70.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so8606657wrc.22
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GFp8z2+3qQ/fZHLQdSG5ejdRjo57+r6l289Jf1cbwig=;
 b=jFNO4lvMyWdwtu0wHzuxOdRSzfT/nv6WyThDgyaDciy+Le6eP08wbb/BKCmVLNZCnx
 faHbjlzRXdMKcPC88f7Cek5yYub0YFIhenG+Eo002Fmc6SVHIXTnpB45a+4RNDsIejs8
 Av/KiZyIFsQTMZtpaXXg/o6umKWOtla/f3j9dUw+mQIwIDMMuo/ENcXMyIEP4CSS5M0C
 bW1nYZmWktNr1JfLU10OoAheLCPzU/SnZhr1aUdp1wdOI0h0N+jWZAMMT2qRSEa3vyyd
 N0oBd2wJab8avwOP5dBBLyf3TsEjneXHyeYM08W3XvKF1+v0k9Rk6uaFhH2m/s/0HxGs
 falA==
X-Gm-Message-State: AOAM530qhvxbEASwvA3d2XUtXRI1yYMG45CffePy7KjwN1X1aW85MFqU
 DOzWrpTJMJnm+pFjEHc+xV4LB7zTb3hS1cpegaVgTlQn8k71Dl3dpBwVmxMyr5Ralk/EKdfQ5xo
 VKT+gGYKwBaTIcKERyOXoRj5+l9yTe77eriRIPSJ780PcoTClnt22+UvSyy8moWCq
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr29288866wmq.180.1634549503494; 
 Mon, 18 Oct 2021 02:31:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvFULAOAfxPBHQK5c/jUVZXU2BH7TtkOgNm9qKDOu72DJaD+qNs1zc/oOkHT3vK5jgK571Qg==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr29288848wmq.180.1634549503261; 
 Mon, 18 Oct 2021 02:31:43 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 10sm16199319wme.27.2021.10.18.02.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:31:42 -0700 (PDT)
Message-ID: <ab758bac-169c-198f-1d53-be59f5a51710@redhat.com>
Date: Mon, 18 Oct 2021 11:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] roms/edk2: Only initialize required submodules
To: qemu-devel@nongnu.org
References: <20211018092354.2637731-1-philmd@redhat.com>
 <20211018092354.2637731-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211018092354.2637731-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 11:23, Philippe Mathieu-Daudé wrote:
> The EDK2 firmware images built to test QEMU do not require
> the following submodules:
> 
>  - MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
>  - UnitTestFrameworkPkg/Library/CmockaLib/cmocka
> 
> The only submodules required are:
> 
>  - ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
>  - BaseTools/Source/C/BrotliCompress/brotli
>  - CryptoPkg/Library/OpensslLib/openssl
>  - MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
> 
> Adapt the buildsys machinery to only initialize the required
> submodules.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/edk2.yml | 4 ++++
>  roms/Makefile.edk2    | 7 ++++++-
>  scripts/make-release  | 7 ++++++-
>  3 files changed, 16 insertions(+), 2 deletions(-)

>  # See notes on the ".NOTPARALLEL" target and the "+" indicator in
> diff --git a/scripts/make-release b/scripts/make-release
> index a2a8cda33c0..a9ff933a4ca 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -27,7 +27,12 @@ git submodule update --init
>  # don't necessarily have much control over how a submodule handles its
>  # submodule dependencies, so we continue to handle these on a case-by-case
>  # basis for now.
> -(cd roms/edk2 && git submodule update --init)
> +(cd roms/edk2 && \
> +    git submodule update --init \

Hmm I forgot the '--' separator here.

> +        ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
> +        BaseTools/Source/C/BrotliCompress/brotli \
> +        CryptoPkg/Library/OpensslLib/openssl \
> +        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
>  popd
>  tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
>  rm -rf ${destination}
> 


