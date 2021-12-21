Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554147BC34
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:52:30 +0100 (CET)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzasn-00013G-Cv
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:52:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzaqz-0000Mp-G1
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:50:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzaqw-000628-R2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640076633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OErse009dk8DCQ17SGvMQpVTjauki1Wih5CDTwbYQqg=;
 b=KW11SSSa87HyVcd/LQxOx8phvqWskublzLxDwIaZ/pgYzTySKo8JuWrYpVKL4S2zYrDqO6
 EbHg7JjZaU/tRusKxugRVUV//S6eFqLn2tX0DO66mmtG1YemFqjuLp8SbdhFb9D4y74Cj4
 SRSQ/ldvhyTpHhJIW845UleBq+GmTVo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-xI2u3fpuOM6rl7CPvogpcw-1; Tue, 21 Dec 2021 03:50:32 -0500
X-MC-Unique: xI2u3fpuOM6rl7CPvogpcw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so2619306wme.6
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OErse009dk8DCQ17SGvMQpVTjauki1Wih5CDTwbYQqg=;
 b=3DjePTSt2b2yrjIzx0zFsVy8UH1Fs0zL07ECZgITPp/Nd5s7e+IaDfn11UPE8LFWcq
 /GMzxvMbPfUK/Y1+b2q8STEw1VTtrvkgYvE6pABGZzk3ZeojWeJnGUlK5SI/wx/WGz6S
 QkusGzUJ9ZGLPfCg8qOqJxoTBiYWfJ72yib+j3OAZd0ZhsBCUiHqf3rQJFELKjYQoJJz
 +VVNwiYWsHmToE2J2bicLm4hc6Z8C2ibZjdFB97UK16JlAoSA9T1fKXivex3efdX7WBC
 oQvY6Gk/c4RkkRYy0wGqJx3tc3UGWpwNhe5l6ypw+MMWO7Di/Oe5cMH6MjbXwWKFtoDm
 NH/Q==
X-Gm-Message-State: AOAM533pmREuP5JHlbGp+Ae9tv4GpkvWZLmOwz+vy/d2OnJ+STuWNQfo
 vAs6SjHS4VrGgPYims+BwDeYHlJB/X0HTrFwCNHpDQETMyEXsDiIrHLKSdR+Ea8YsKNsjKNWxcj
 uusiEVKVKvQpn4yE=
X-Received: by 2002:a5d:6546:: with SMTP id z6mr1776695wrv.516.1640076631007; 
 Tue, 21 Dec 2021 00:50:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwnYe/dT4QUI64vjCcuf9V9egBUlqdSzY6ILChx6S4nJLkla4plG/oqoNvdnuDrYmal6x69g==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr1776682wrv.516.1640076630764; 
 Tue, 21 Dec 2021 00:50:30 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b19sm1811839wmb.38.2021.12.21.00.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:50:30 -0800 (PST)
Message-ID: <ca4a7621-5c42-1b4c-1361-f61afffd5f4d@redhat.com>
Date: Tue, 21 Dec 2021 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Update COLO Proxy section
To: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-dev <qemu-devel@nongnu.org>
References: <20211221080400.1492980-1-chen.zhang@intel.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211221080400.1492980-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2021 09.04, Zhang Chen wrote:
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1de6ce6e44..5479b9376e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2983,6 +2983,7 @@ F: docs/colo-proxy.txt
>   F: net/colo*
>   F: net/filter-rewriter.c
>   F: net/filter-mirror.c
> +F: tests/qtest/test-filter*
>   
>   Record/replay
>   M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


