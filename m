Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E05BD4AD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:16:40 +0200 (CEST)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLJv-0005wj-8H
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaLAX-0008QG-13
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 14:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaLAQ-0007fg-5R
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 14:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663610809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CBfkqJXcSSqqQO+sYCLFPShazhO6vPZSlOIPh91+eE=;
 b=Cp5wUQSH3eTh+lcu6XDEBfUHs/znV07d7i8oD9K2sZA/qGXYP0P+w8Fwu11TawIOxb5oKL
 2DONtZ4KIkEuBePjfOxAoldKzqXUxNWPH7N/8MNYlyWg2Hog9JdEUYBZjPDg7ITQQ22w9e
 pL9vujHZH2nO83ABE+kCahshgOro4Bg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-za2CrSaKMpOnf-Ba6rnjHg-1; Mon, 19 Sep 2022 14:06:48 -0400
X-MC-Unique: za2CrSaKMpOnf-Ba6rnjHg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z13-20020a05640240cd00b0045276a79364so165345edb.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 11:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5CBfkqJXcSSqqQO+sYCLFPShazhO6vPZSlOIPh91+eE=;
 b=D5YgW/EJW8p4ff8bC0CIhq+B28lnrgzuzCbeqhrbUPfKAXr5sb6WW9BFKW1rcLFNaZ
 HAIi+4zcZTS4GtU/kyYWZBEUtAQT8OGf224bk/rx1/dccG/gawLGxhGrMLXMQ4j1EwxV
 IhCGlIPQNOqlNDrGaknw3QRxe98E+VscVQ0bxL3fWhGhhuBVeHEfFldSdAJC1hEKbIj5
 4SZqjKeWV2G06CbAgICUg/169JJlgHXLENCZy1urfyaTCzo2MJckKCiGJVF4qi1cm88N
 midmkW7KRFAyZWVa7ypfvH2kKaxGDs5WicKt75uu7UzKCkr5QCefaxijEyOBXpkq+H/Z
 gwow==
X-Gm-Message-State: ACrzQf0rqLhSOdXovyGAy4+yDmy2+2N3OWylmDqY6GxACaM1Irt8LeYt
 NHNG/7Do9UHUtx7nKjUzD0uolL6TaAxeQQ1ljk8ICRDczo2G42kv/2DUhzFjDZgIGzn4wibIP6I
 zSFLN/JLfEhc1DFY=
X-Received: by 2002:a05:6402:240d:b0:442:b0c4:9e02 with SMTP id
 t13-20020a056402240d00b00442b0c49e02mr16709923eda.210.1663610807052; 
 Mon, 19 Sep 2022 11:06:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7l9LFf3hwMpyXWaiQ24xNtjRo57CBiCoQXMPtop7iJmE3Xu6Bm/vNUWK2CV+rv2xY0R0mWzw==
X-Received: by 2002:a05:6402:240d:b0:442:b0c4:9e02 with SMTP id
 t13-20020a056402240d00b00442b0c49e02mr16709910eda.210.1663610806848; 
 Mon, 19 Sep 2022 11:06:46 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b00764a76d5888sm15817324ejh.27.2022.09.19.11.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 11:06:46 -0700 (PDT)
Message-ID: <f89980b4-01ca-8c1c-df7c-e529e1eb8e52@redhat.com>
Date: Mon, 19 Sep 2022 20:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 8/8] meson-build: test-crypto-secret depends on
 CONFIG_SECRET_KEYRING
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>
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
 <20220902165126.1482-9-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902165126.1482-9-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> With this change "make check" works when configured with --disable-keyring.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/unit/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index b497a41378..988aed27cb 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -78,7 +78,6 @@ if have_block
>       'test-crypto-hmac': [crypto],
>       'test-crypto-cipher': [crypto],
>       'test-crypto-akcipher': [crypto],
> -    'test-crypto-secret': [crypto, keyutils],
>       'test-crypto-der': [crypto],
>       'test-authz-simple': [authz],
>       'test-authz-list': [authz],
> @@ -122,6 +121,9 @@ if have_block
>     if config_host_data.get('CONFIG_EPOLL_CREATE1')
>       tests += {'test-fdmon-epoll': [testblock]}
>     endif
> +  if config_host_data.get('CONFIG_SECRET_KEYRING')
> +    tests += {'test-crypto-secret': [crypto, keyutils]}
> +  endif
>   endif
>   
>   if have_system

Reviewed-by: Thomas Huth <thuth@redhat.com>


