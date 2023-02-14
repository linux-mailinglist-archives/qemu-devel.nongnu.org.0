Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319E696380
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:30:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRuS7-000167-9r; Tue, 14 Feb 2023 07:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRuRz-00014f-7Z
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRuRx-00014d-HB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676377814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HwlFy0sI2B9FT+HNSgU8yAHl/LZ27l8/bQyoB1UQGE=;
 b=btoHMtyBNMaT/D9E2hrTR1D4giNyVrHxJ0c1kqvCxH0pyhlvQ3QX4i5BPrvaOPM9vF16Tw
 S2J9FeFWGLscRc3fkgatefqDUIicwygZUyeNHzPNEDIjOw/8B5ZktcNn3iSCQqAVN6I5bo
 RlvNxhHLkjZFiZLItPgt6KoiKdIzHJA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-Bo09tdElN1iHiMsMKB0Myw-1; Tue, 14 Feb 2023 07:30:13 -0500
X-MC-Unique: Bo09tdElN1iHiMsMKB0Myw-1
Received: by mail-qv1-f70.google.com with SMTP id
 i7-20020a056214020700b004ffce246a2bso8525978qvt.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6HwlFy0sI2B9FT+HNSgU8yAHl/LZ27l8/bQyoB1UQGE=;
 b=DzplrWo/lyXpcLZcviyLBGQKDSaKNAqbWFoektRbH+Mh/InEb/9LUeu9FWvbEVKJaT
 UpbhpyxPeNNUC6XvzvmdiAeiqoDGyPT6FvRBWjE0+QF+0xQq+j8kdZYb3cCFiHFHkzQd
 VV7i93kYhGfp9LVGkDGuQKZXwXt3QOjMC6rr4KmRCaY5lZtC62JuM3UYC81K9fa/Ejjs
 ZEbR6J/3N+carAuGRh+VUG3ApjuISnwcwmWFqZwo03AjqrEIT+3au7kv7yl3lGonXppn
 hCQ80X515izXkKG41vcj9fN/eLSjnPmOtt6j4JX57oDl1/shgTNV5+hfmEV3m5mhu7bU
 YHrA==
X-Gm-Message-State: AO0yUKWEGX+L7D6A1MsEJDvlbhix2uzwrZw86YTfla+yYHcb731yDcnS
 t2hxM1KRxHhTxYX0u6Fb1793BObaUwE4R3+Ni9/PFialPG4VVNIRxbmd21nvSFi8FjqdsAnTwOM
 Yu0RTl+omyyO9BMk=
X-Received: by 2002:ac8:5b4e:0:b0:3bc:e4d6:16c8 with SMTP id
 n14-20020ac85b4e000000b003bce4d616c8mr3446317qtw.13.1676377812642; 
 Tue, 14 Feb 2023 04:30:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/WS3yXjmb2YYTUhJClI7AHNuNBNCmTdSitjTff5at3TCXMjfRuHCKoWin8QB1+9CLHqLrnCg==
X-Received: by 2002:ac8:5b4e:0:b0:3bc:e4d6:16c8 with SMTP id
 n14-20020ac85b4e000000b003bce4d616c8mr3446297qtw.13.1676377812390; 
 Tue, 14 Feb 2023 04:30:12 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-176.web.vodafone.de.
 [109.43.177.176]) by smtp.gmail.com with ESMTPSA id
 x133-20020a37638b000000b006e07228ed53sm11843589qkb.18.2023.02.14.04.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 04:30:12 -0800 (PST)
Message-ID: <b1af01b9-da0a-5e10-b5cf-3992cbaff4fe@redhat.com>
Date: Tue, 14 Feb 2023 13:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-web PATCH] add language to <html> tag
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230214122509.30234-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230214122509.30234-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/02/2023 13.25, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   _layouts/blog.html          | 2 +-
>   _layouts/home.html          | 2 +-
>   _layouts/page.html          | 2 +-
>   _plugins/alias_generator.rb | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/_layouts/blog.html b/_layouts/blog.html
> index b7fcdbf..89adb90 100644
> --- a/_layouts/blog.html
> +++ b/_layouts/blog.html
> @@ -5,7 +5,7 @@ templated.co @templatedco
>   Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
>     -->
>   {% include relative_root.html %}
> -<html>
> +<html lang="en">
>   <head>
>   	<title>{{ page.title }} - {{ site.title }}</title>
>   	{% include assets.html %}
> diff --git a/_layouts/home.html b/_layouts/home.html
> index f7b6931..b34e6f6 100644
> --- a/_layouts/home.html
> +++ b/_layouts/home.html
> @@ -5,7 +5,7 @@ templated.co @templatedco
>   Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
>   -->
>   {% include relative_root.html %}
> -<html>
> +<html lang="en">
>   <head>
>   	<title>{{ site.title }}</title>
>   	{% include assets.html %}
> diff --git a/_layouts/page.html b/_layouts/page.html
> index 765d204..c0d2778 100644
> --- a/_layouts/page.html
> +++ b/_layouts/page.html
> @@ -5,7 +5,7 @@ templated.co @templatedco
>   Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
>   -->
>   {% include relative_root.html %}
> -<html>
> +<html lang="en">
>   <head>
>   	<title>{{ page.title }} - {{ site.title }}</title>
>   	{% include assets.html %}
> diff --git a/_plugins/alias_generator.rb b/_plugins/alias_generator.rb
> index b4b86ec..f69d90e 100644
> --- a/_plugins/alias_generator.rb
> +++ b/_plugins/alias_generator.rb
> @@ -80,7 +80,7 @@ module Jekyll
>       def alias_template(destination_path)
>         <<-EOF
>         <!DOCTYPE html>
> -      <html>
> +      <html lang="en">
>         <head>
>         <link rel="canonical" href="#{destination_path}"/>
>         <meta http-equiv="content-type" content="text/html; charset=utf-8" />

Reviewed-by: Thomas Huth <thuth@redhat.com>


