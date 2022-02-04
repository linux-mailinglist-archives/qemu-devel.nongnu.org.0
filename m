Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8E4A9C16
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:39:26 +0100 (CET)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0gH-0005xO-CU
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:39:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0cG-0001Ng-HO
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:35:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0cE-0005Jx-Jw
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643988913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZaQCTJI8hRRekk/jT+uKTGnSoziT0v6Nrh2OGyx0MQM=;
 b=jN0eGa99puOixbocAko4iQm0zZXc4rQx0MT+HsK/9Dtv0v/JC6D3+/ZJGUodb4rGnmc5KX
 fojEzyTz1V4zTRO0pbQSoquEgfpmKqs22uAWFbrUWalHV+D39uO3yzqyZznplRgaNz6gOj
 AafELglNCA/p6KygUjUwRkNGM6n69TM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-bm58dd8SP3SRiE_t4fjHwA-1; Fri, 04 Feb 2022 10:35:12 -0500
X-MC-Unique: bm58dd8SP3SRiE_t4fjHwA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n6-20020a05600c3b8600b00350f4349a19so2016006wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZaQCTJI8hRRekk/jT+uKTGnSoziT0v6Nrh2OGyx0MQM=;
 b=CXIo44GEswIddOi7pgJnSvR/DywtoJla2/7mbqlDqdHVfXNJKrFRTAHDgkJKLNWFlJ
 PhUyuNhYXvaW5sFaM+v+lDu/ZZabUD7iXfJ0OzsI/qhGMFP1cb4WojwuM7BYvkcbIH+V
 xDEcnlxDc416x++k6FCnh/VaNN9YDIDnDNxvf3R6YmuJG4mwouVxPaFcpxQ7mYKQBDz3
 8h55fAU2KeP+FZtghAH8yrf68ADTn5l0phcugU1iFXyQipEHFbosMvZewAHUmh3Uwwio
 AHj1uhMsVY2frnKVXeLSj4p6l//ZMiMaVFXqscByYdGr4YS5U4UwoFCVwH7VNWkpl2ew
 f37A==
X-Gm-Message-State: AOAM53311fOo/N6kejb4SUjg0hEv5ly7kV1DLd9sFYClYegXunP0KQSr
 MLkkKD3NnAWPMKqwFtwj3fN1IMx06dUil3gE3YGp+j3BDFtCVQfzH0ZwL84HMr1GUn95+INkGQV
 SGBiHEsAVy/hTDhg=
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr3051401wrs.111.1643988911509; 
 Fri, 04 Feb 2022 07:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy/7gR6fqniP1LGbCK2+lwhNjnvxectJ6Vp3BHV3uUPqcYTlBZH+B300PJAsZEf+C+/O3LhQ==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr3051377wrs.111.1643988911267; 
 Fri, 04 Feb 2022 07:35:11 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id o14sm2547097wry.104.2022.02.04.07.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:35:10 -0800 (PST)
Message-ID: <5c1d7c6d-c7f4-aef5-6045-77fbf32f319b@redhat.com>
Date: Fri, 4 Feb 2022 16:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] configure: Restrict TCG to emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220204152924.6253-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2022 16.29, Philippe Mathieu-Daudé wrote:
> If we don't need to emulate any target, we certainly don't need TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   configure | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 9f40d60196..4002f81ac9 100755
> --- a/configure
> +++ b/configure
> @@ -370,7 +370,7 @@ slirp="auto"
>   default_devices="true"
>   
>   # 3. Automatically enable/disable other options
> -tcg="enabled"
> +tcg="auto"
>   cfi="false"
>   
>   # 4. Detection partly done in configure
> @@ -1777,7 +1777,7 @@ EOF
>     fi
>   fi
>   
> -if test "$tcg" = "enabled"; then
> +if test "$tcg" != "disabled"; then
>       git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
>       git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>   fi
> @@ -1819,6 +1819,14 @@ case " $target_list " in
>     ;;
>   esac
>   
> +if test "$tcg" = "auto"; then
> +  if test -z "$target_list"; then
> +    tcg="disabled"
> +  else
> +    tcg="enabled"
> +  fi
> +fi
> +
>   feature_not_found() {
>     feature=$1
>     remedy=$2

Reviewed-by: Thomas Huth <thuth@redhat.com>


