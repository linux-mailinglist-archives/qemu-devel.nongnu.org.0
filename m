Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA82653CF0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:24:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GmM-00066O-Oj; Thu, 22 Dec 2022 03:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GmL-000666-3n
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GmJ-0006wl-Jq
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671697091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o4hMkkf8Rkr2uNBj2iR3P0pTYgs74LbuGJ1J4I2A60=;
 b=Hqztd4ipI4KRsur2alQH+jMeLdkRUvXzzx6I8cIdG0i3MazadtQiY+Pw+oFM8opm40juxa
 FI7Q6QiyWYVJ4ZuVsBvkXeO7DtG5qairTL/JWFSQhOPTRJeXBO9sr4NZKov0KGou7Nw1c4
 ZfR6vIof7mr00pCML/h88deIyTw4cj4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-HASkXKZoMj6wPHphpDbgjw-1; Thu, 22 Dec 2022 03:18:09 -0500
X-MC-Unique: HASkXKZoMj6wPHphpDbgjw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0047028edd264so1002997edb.20
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4o4hMkkf8Rkr2uNBj2iR3P0pTYgs74LbuGJ1J4I2A60=;
 b=drjhw+FXEqm9YQuG1mHUIeM5RajTQSb9g+XQsX10+Fxxq247TTPC56Mun8rJJMaSLX
 BM4UlauM3gdE8K60ZcUXaqHnQ7aNiqb+9UYNh8O0hJ7bSu8sz6mgh8tHga49au1hHay2
 elguPRIzxgpzMwu2zv69lqyRZtb6pyBZ4LTMAz5AQlON+2o57cJAisup2oaJdJxjszVn
 W85iMah8kiO4ZiusSxiz+ih/jFj3NtPRGSDpjQws/ai5LJvBCBX7SVC9x7AYN5d2f1xF
 jVLTunZjv1Pz0FsYK8W6VeUtsJethWJ58DzM67VNS50kFtBw5eXlnydV3mm7gKaxoKG3
 VCqg==
X-Gm-Message-State: AFqh2kpdeT3bWIBcmuyKmOM30K1ss1ya3fW1tXv6Hlr5GDYelRgLeHCG
 2vvrHkrsU4H1e4uNHifH12bYRjC+kcKMv5L19n0DkFg2v68+Phes7tTFIpE+/rgm65OGdtVOjVT
 1JRpFFGNLIdFiGBE=
X-Received: by 2002:a17:907:2be8:b0:7e6:bae:fa0f with SMTP id
 gv40-20020a1709072be800b007e60baefa0fmr7280062ejc.58.1671697088100; 
 Thu, 22 Dec 2022 00:18:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLGcWtpx1P9uzTt0cHS1/wpmQ8/Wb2hOozUpcd8TFIp1CZothzmp5LxiN8LYqdm8ecBv/h1w==
X-Received: by 2002:a17:907:2be8:b0:7e6:bae:fa0f with SMTP id
 gv40-20020a1709072be800b007e60baefa0fmr7280050ejc.58.1671697087915; 
 Thu, 22 Dec 2022 00:18:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 d6-20020a170906304600b007c1a6692aeesm8046925ejd.189.2022.12.22.00.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:18:07 -0800 (PST)
Message-ID: <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
Date: Thu, 22 Dec 2022 09:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 stefanha@fmail.com, peter.maydell@linaro.org, sw@weilnetz.de
References: <20221221163652.1239362-1-eric.auger@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221221163652.1239362-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/21/22 17:36, Eric Auger wrote:
> To avoid compilation errors when -Werror=maybe-uninitialized is used,
> replace 'case 3' by 'default'.
> 
> Otherwise we get:
> 
> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>     2495 |     d->Q(3) = r3;
>          |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>     2494 |     d->Q(2) = r2;
>          |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>     2493 |     d->Q(1) = r1;
>          |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>     2492 |     d->Q(0) = r0;
>          |     ~~~~~~~~^~~~
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
> ---
>   target/i386/ops_sse.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 3cbc36a59d..c442c8c10c 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
>           r0 = s->Q(0);
>           r1 = s->Q(1);
>           break;
> -    case 3:
> +    default:
>           r0 = s->Q(2);
>           r1 = s->Q(3);
>           break;
> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
>           r2 = s->Q(0);
>           r3 = s->Q(1);
>           break;
> -    case 3:
> +    default:
>           r2 = s->Q(2);
>           r3 = s->Q(3);
>           break;

Queued, but this compiler sucks. :)

Paolo


