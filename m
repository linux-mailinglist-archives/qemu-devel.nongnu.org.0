Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7469637F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:30:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRuRf-000112-7h; Tue, 14 Feb 2023 07:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRuRW-000104-TT
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRuRT-00087e-QT
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676377790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2ALLCZHhuXZNEXlHarPve+1TZo/YB6NQq3Dqqb/0Og=;
 b=JvKL3pT3JC+lrCQh7AxWUu2on/2PK1ZVIyPUzLKD5fOL5NgZMFaIa8M0JDDEJpiY/brrBG
 8P98H6FcAsdMea0ShhoMbSg7369e6UnGS0swIj06SxJu0UWczrNSrJ6A3i5eSfnc6uNFBF
 jjDN/fHqyBnnIjAqiqjQVbB3/zy1F4I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-Ea7OJRLEMGeqCBuvEzWCeg-1; Tue, 14 Feb 2023 07:29:49 -0500
X-MC-Unique: Ea7OJRLEMGeqCBuvEzWCeg-1
Received: by mail-qv1-f71.google.com with SMTP id
 f6-20020a0cc306000000b0056e96f4fd64so6054219qvi.15
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k2ALLCZHhuXZNEXlHarPve+1TZo/YB6NQq3Dqqb/0Og=;
 b=p3D3RidqifE04fBa0CzQtw1BRR/C2snH7GFypD/Rd7VY1vxCAtKQpwIspwWTb1zaF8
 RInlwzelirxDRZPImmEMyOVBFOi1YfUQWBq06KbVQMlstb3qhhLgcTcas75S9f32mtLE
 wavkBjUVpt8N2Ggn/WJJwHxDqppnmq9PcCj2I6QB0bKmVUu2xAx5ythIws+ienOpJFDn
 NV3iyY7a3qwlBzpZsv7QDe4EYz94T8gzloY12QwA764vxvSJ66NzYKKZq9Fb9338i1Ke
 lglYW2/57df4Fe8C0L48wAlRaCfh/pgG+h2F19id/Znao+ZeHG8CHdZYREEXVtt2mQvd
 Du8Q==
X-Gm-Message-State: AO0yUKUTAIfowFWWA9YVM0qtiq5qbmJU7WSPgQ5j0FaGRkDU4hCHj20A
 SiCqM6cEBbNn/lT2uaiC1mC7drMZMXQt1A+Dh+NpWKLxwNF6LoUVbmLLfed7R7vZoYY2lW0hoCE
 iP3wXmXT+vxy1eqA=
X-Received: by 2002:a05:622a:246:b0:3b3:b92f:3650 with SMTP id
 c6-20020a05622a024600b003b3b92f3650mr2339624qtx.62.1676377789165; 
 Tue, 14 Feb 2023 04:29:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8XPDguzcqdAvLNAkgRd1kmEqKQCBbmRrOrJvwgTyXBdbt4COtTMiexG1NiyEc8nIfDQF0Acg==
X-Received: by 2002:a05:622a:246:b0:3b3:b92f:3650 with SMTP id
 c6-20020a05622a024600b003b3b92f3650mr2339614qtx.62.1676377788916; 
 Tue, 14 Feb 2023 04:29:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-176.web.vodafone.de.
 [109.43.177.176]) by smtp.gmail.com with ESMTPSA id
 f18-20020ac80692000000b003b9e1d3a502sm11194380qth.54.2023.02.14.04.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 04:29:48 -0800 (PST)
Message-ID: <5b0f4e7f-7097-04d0-4149-694d72c333cc@redhat.com>
Date: Tue, 14 Feb 2023 13:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-web PATCH] add missing <h2> tag
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230214122453.30179-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230214122453.30179-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 14/02/2023 13.24, Paolo Bonzini wrote:
> The homepage goes straight from h1 to h3, add the missing tag for use in screen readers.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   assets/css/style.css | 12 ++++++++++++
>   index.html           |  3 +++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/assets/css/style.css b/assets/css/style.css
> index 779b111..2705787 100644
> --- a/assets/css/style.css
> +++ b/assets/css/style.css
> @@ -44,6 +44,18 @@
>   		color: #802400;
>   	}
>   
> +        .visuallyhidden
> +	{
> +		border: 0;
> +		clip: rect(0 0 0 0);
> +		height: 1px;
> +		margin: -1px;
> +		overflow: hidden;
> +		padding: 0;
> +		position: absolute;
> +		width: 1px;
> +	}
> +
>   	pre,code,samp,tt
>   	{
>   		font-family: 'Roboto Mono', monospace;
> diff --git a/index.html b/index.html
> index d72750c..676c379 100644
> --- a/index.html
> +++ b/index.html
> @@ -14,6 +14,9 @@ colorbox: True
>   	
>   <!-- Featured -->
>   <div id="featured">
> +	<header class="visuallyhidden">
> +		<h2>Features</h2>
> +	</header>
>   	<div class="container">
>   		<div class="row">
>   			<section class="4u">

Reviewed-by: Thomas Huth <thuth@redhat.com>


