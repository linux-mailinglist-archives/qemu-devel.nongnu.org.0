Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DEA431389
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:31:40 +0200 (CEST)
Received: from localhost ([::1]:35140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOzb-0001Dg-LP
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcOx9-00079o-2V
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcOx6-0006DZ-Ba
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eD28jSy/dQYwLuK2ztCsnsataxmEbOlav14J26akKRY=;
 b=Fr6T679Y0qZcIN/+t2mQEqO9ua4ABAz7QKZUy95CW0XWzMWhWGcEYOl8DjmT98XcRdDVpU
 8M5TAVc2ONZ59TRg+Mo1Xw/QaDkPM+B4KqVEhnVUdTJnDXR8sLoSkG+JIAY5KRFo5ZHxrr
 HUXOjBQ4YW5mfbrrxxtLrzEiOx8sGHA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-5GQsDAXYNByzztMTln5pig-1; Mon, 18 Oct 2021 05:29:01 -0400
X-MC-Unique: 5GQsDAXYNByzztMTln5pig-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso8605792wra.13
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eD28jSy/dQYwLuK2ztCsnsataxmEbOlav14J26akKRY=;
 b=Xw1xJ7X+A05S28iLuOt3LmBtCFSlnTHxqIl7iw1rXLWL0FYtucUbC35Q8UCt+QqWjh
 C9iN6JDTOpfeGScieYqxbIGHjAJoRsXU8PVTvsDebXkGL/SSXRbEeebbgY2zqm94JDLu
 zWtvan5VMgcM1FYl5nTNOKUYcV8jv4VWYatT/couY1gZZ8gBrLGAEjaRAUDgBDZeY4Sa
 E6NGFOfDjSqaDIDN0awWL1zAYbfHfK23ruMRpN8jlCXsAVE8A0zvn4gVf+cvR9hpRpoe
 eWclrST4dFQhPv+VypeLIE1JBGDHcmAeGf2ePT+g23blOqcFmScfdUFsFIWhYg/Ds69N
 IRHg==
X-Gm-Message-State: AOAM531Zw8KFChwMeZFpwZDB3EpoGJe0J5yEEc8W6RLsM1BM3Ppk+BFX
 x3ZO+cliSG15rroOMXzabJ7UPzTyea2GF2tVb1IpO6pqHTLQ4s+Kwh4FecQZSN1kmm8EXb/SuJj
 O5UGe85Z8eR3laDs=
X-Received: by 2002:adf:de0e:: with SMTP id b14mr34024135wrm.271.1634549340749; 
 Mon, 18 Oct 2021 02:29:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUoOmpKAwG+taExNYIjkFvg31O70VGqOLStMS6lZy4B2IwuRulDX6doRT4SpFydGKmxb/dbw==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr34024111wrm.271.1634549340539; 
 Mon, 18 Oct 2021 02:29:00 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id n12sm12500305wms.27.2021.10.18.02.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:29:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] roms/edk2: Only init brotli submodule to build
 BaseTools
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211018092354.2637731-1-philmd@redhat.com>
 <20211018092354.2637731-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b7d6a559-39c0-0511-e9a4-4d061bb04646@redhat.com>
Date: Mon, 18 Oct 2021 11:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018092354.2637731-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/2021 11.23, Philippe Mathieu-Daudé wrote:
> Since EDK2 BaseTools only require the brotli submodule,
> we don't need to initialize other submodules at to build it.

s/at to/to/

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   roms/Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/roms/Makefile b/roms/Makefile
> index eeb5970348c..b967b53bb76 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -143,7 +143,8 @@ build-efi-roms: build-pxe-roms
>   #    efirom
>   #
>   edk2-basetools:
> -	cd edk2/BaseTools && git submodule update --init --force
> +	cd edk2/BaseTools && git submodule update --init --force \
> +		Source/C/BrotliCompress/brotli
>   	$(MAKE) -C edk2/BaseTools \
>   		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
>   		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \

Reviewed-by: Thomas Huth <thuth@redhat.com>


