Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455244B240
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:03:20 +0100 (CET)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVSp-00032h-Lf
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:03:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVOw-0001Db-EM
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVOu-0001xx-35
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636480755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVRCR5K22DBiFiZF4nUG9c7Eo7efS0bMdisrOMbfGtY=;
 b=I44GEJPckrnfDw2wUQJSvocJQtWpH7Sd4cHXxZO3ZIqOTz1xAsFY328dXS1jvjhj6e9FXa
 nsDslI32RdaPx3FozHxCPkuUq6A3FfKQ4E7hRFO5Ro5Xdy9LyDvR3MeaqEAT3J5SqQvw1c
 6fGaHftsfLyfpuHf3KHncdgN/eS9yZE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-2lTMfXNBNLWDedLS_bjPkg-1; Tue, 09 Nov 2021 12:59:14 -0500
X-MC-Unique: 2lTMfXNBNLWDedLS_bjPkg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w12-20020aa7da4c000000b003e28acbf765so18655744eds.6
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AVRCR5K22DBiFiZF4nUG9c7Eo7efS0bMdisrOMbfGtY=;
 b=nUEQqoAkge7CMSgaX5KMWCpDjgirdg1Qaeot94tmD/19CoWljIf+NPZTDUxx0bvtxH
 176lzB/8bg0it/wo/JFxLPVWeKtklOdEN3qP35/r+XQDj+fJUVEFZJ3cicycMVS5rMl5
 S46ignEuhEyG3l0DiiqvxRZSNNbS0v/5gVE+U40ccDU/WuZ08FICbg+IvbzoUg1tihzQ
 VjfYlrBgzOYmjhGewapMhqnE3BohSKti9LpL1NWcHG+g3uwDcw+q+6gXZ9PYkWIyO44r
 cftZZlIIErZATtZOUg13l9yKbiU7Nyf6Ia3Lvb6EcHCp9NSLXo8JjMqjPrL7HlgS3jEK
 Xcmw==
X-Gm-Message-State: AOAM531X3RtiE1Zx4SpWkU/9bercua9n4u8KpKus1KFg04iw1wpAJVZI
 tMWny0B+F4NG/uIrXJ2iCAdj8ccSq8xvZLHp2bbY8ul6vRbd5PQGM342ZTeqqzisluoQbmTfeU9
 NdoSMaY6rM9yS2aA=
X-Received: by 2002:a05:6402:1c95:: with SMTP id
 cy21mr12493481edb.320.1636480753063; 
 Tue, 09 Nov 2021 09:59:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCoGxhY+u6YaA9zyW2G+v2Z1hsS9JxIi2P8LrI5ys7I6FZxiCes45BUCVo8ZLCGzh9XNdH8g==
X-Received: by 2002:a05:6402:1c95:: with SMTP id
 cy21mr12493443edb.320.1636480752814; 
 Tue, 09 Nov 2021 09:59:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e7sm12141627edk.3.2021.11.09.09.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:59:12 -0800 (PST)
Message-ID: <5e3a38be-cc80-f870-04d1-bd0e225f402c@redhat.com>
Date: Tue, 9 Nov 2021 18:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] configure: Symlink binaries using .exe suffix with MinGW
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211109144504.1541206-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211109144504.1541206-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 15:45, Philippe Mathieu-Daudé wrote:
> When using the MinGW toolchain, we use the .exe suffix for the
> executable name. We also need to use it for the symlinks in the
> build directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

but perhaps we can get rid of the symlinks instead?...

Paolo

> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 48c21775f3a..31e8f586dc7 100755
> --- a/configure
> +++ b/configure
> @@ -3786,7 +3786,7 @@ fi
>   
>   for target in $target_list; do
>       target_dir="$target"
> -    target_name=$(echo $target | cut -d '-' -f 1)
> +    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
>       mkdir -p $target_dir
>       case $target in
>           *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
> 


