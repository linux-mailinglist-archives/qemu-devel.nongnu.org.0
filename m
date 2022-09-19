Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBD5BD4C1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:32:04 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLYo-0003Lf-UY
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaL9A-0005nu-Pd
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 14:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaL92-0007Ug-UH
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 14:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663610724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5vEYelug09/xK4VvZE+Zs0VSddcUWjFU+X6iHQ+u+Q=;
 b=hF/WL3O3C+WkKSHIELl4c1dQ/d1x0M2FwnGS1Hyw3BPWxt9aarHMw6YND6DVpfERVzaKeg
 hyxdU4duoPWMAWlQy8BnfD9RrZe5UFLZJp46RlEnbk8A+YcNqi1scJpEcET8NkgvAOx92M
 eZHwM5qbJ7oE7mZBc7nho5G7xWnyXOQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-aXnKI55vNXK6NZ0PvEA7-A-1; Mon, 19 Sep 2022 14:05:23 -0400
X-MC-Unique: aXnKI55vNXK6NZ0PvEA7-A-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr12-20020a1709073f8c00b0077e8371f847so77324ejc.20
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 11:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=T5vEYelug09/xK4VvZE+Zs0VSddcUWjFU+X6iHQ+u+Q=;
 b=lfiZW/WkufYzDcd2CUbZeUdtoLxRxT8eEKliatyr7EfX2tEysFtCnyFlCjIqUL8igw
 /C/EL8hQWsizbPc3+I+s10+AfEZcolmq1s3+B9rKkCtzT1S+NT4dHsqR8mWjc1NbwGhS
 YuH8SJTOhsSo3MR8IzBcrfpQVJB9U/UOtlgvgjOvDdvgsYI6Cd0OGGZ9yyGo5tsIV7kQ
 1ciAeGc/VYcIsxSuZc0iOncsiJDR7Qr/j85mYxMzsHV+76iYYt/9jJyCFGDYe4oXlNjK
 5wMS3pAOjVZt8TF2Jh4XrOyuFhxRBF1HdZace4gfk1C9xV822fiPX5VAI6WPMPROZtEX
 DZKA==
X-Gm-Message-State: ACrzQf1pb8wXGBD3BDI4CKcL5Xl5AYj5Kzo7k89TqW2GBzGQaPvc4yPa
 48uQvx02Vu3kOmQULMr856Mge9GY5AK+q9IFeBrxkCPrg7a0NoDOoEnRAt1kTVmECnT1Rtn2NB7
 drU78KpC58q7j++I=
X-Received: by 2002:a05:6402:350a:b0:452:8c84:8b with SMTP id
 b10-20020a056402350a00b004528c84008bmr16811978edd.93.1663610722004; 
 Mon, 19 Sep 2022 11:05:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4yOOTeBjtiUQIDRfhI0pKf5vWZ8YVbXzYpjL/nIBicLYiUd61yrj2TNBERg8kAGUaO1Zg+xA==
X-Received: by 2002:a05:6402:350a:b0:452:8c84:8b with SMTP id
 b10-20020a056402350a00b004528c84008bmr16811933edd.93.1663610721662; 
 Mon, 19 Sep 2022 11:05:21 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00715a02874acsm16064040ejt.35.2022.09.19.11.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 11:05:21 -0700 (PDT)
Message-ID: <34e1bfcf-368e-2a89-4ad4-72c2e6db0eb0@redhat.com>
Date: Mon, 19 Sep 2022 20:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 7/8] meson-build: Enable CONFIG_REPLICATION only when
 replication is set
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
References: <20220902165126.1482-1-quintela@redhat.com>
 <20220902165126.1482-8-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902165126.1482-8-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 02/09/2022 18.51, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 20fddbd707..cab0474d0c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1878,7 +1878,7 @@ config_host_data.set('CONFIG_DEBUG_STACK_USAGE', get_option('debug_stack_usage')
>   config_host_data.set('CONFIG_GPROF', get_option('gprof'))
>   config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
>   config_host_data.set('CONFIG_QOM_CAST_DEBUG', get_option('qom_cast_debug'))
> -config_host_data.set('CONFIG_REPLICATION', get_option('live_block_migration').allowed())
> +config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
>   
>   # has_header
>   config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))

Fixes: 406523f6b3 ("configure, meson: move block layer options to meson_options.txt")

Reviewed-by: Thomas Huth <thuth@redhat.com>


