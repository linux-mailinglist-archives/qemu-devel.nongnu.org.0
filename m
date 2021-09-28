Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6C41AD96
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:07:58 +0200 (CEST)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAxp-0003iI-Sp
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVArP-0005WE-Tr
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVArK-0001vv-NZ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojLNV1KlCnyKppemMIrj9EcELL88WGgvs8mHLiVPhwY=;
 b=CkDAHtxYv9dIysxCpwJ5c0HJTSjKEhAv0qogkiMt9gbwp9WNf71KOpCaZ3Hw0AO6HUHCX9
 qEFJpsfVN4iKdOQF+nMi3m+BuZWfumOOT4c699nKC1SALtcIulKUaBUeNU7cXg1QehFRAQ
 YNOnBd4bWBd3nQLVKRj9Lo7ghjXdFzI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-pYyXn-usNoWWAxCgjogLEQ-1; Tue, 28 Sep 2021 07:01:10 -0400
X-MC-Unique: pYyXn-usNoWWAxCgjogLEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s13-20020adfeccd000000b00160531902f4so7294649wro.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ojLNV1KlCnyKppemMIrj9EcELL88WGgvs8mHLiVPhwY=;
 b=i7TIuUuch/9ceK/e2ZzoDa5dyNlFC3jAOAMXufUFl/vD3HHYToFKd5btGHUaSadTEl
 o8R8BSF62DDDZ/lWmZC3OrVhHcc4Wu1rGw7rAtzBaf+pRFUWmDpMYNxWkRy+ARRZwAPs
 azWPoRkr/jVPNbANd4vxpYzCzHBYe1McjwoJLuUBF8S6jxu1JxPsrsw65WcVQAUKWjzw
 1LZtpCcjPUr5kb5/Z4ZNlcllsf/wHgPZzNQo91pPpVgc2nf/gX7WRzflteSKf5f+/0vP
 NMrGuTy3lRQzd4yAWsdq+kjF431jE4y/ecja/lb9JDPpTv78il8iudjTc/erudJ5JZJY
 clsA==
X-Gm-Message-State: AOAM531HWzzoUe93yc3cmhNMEXtd/gkZerozL88A8ur3/zqow2vgOH6b
 AYIKbs60x5TAsZVNU/azpvwrVW0o5QT1rDPC747RD8oRPf8G0QeIFmwoIux92CZg9bSIfD+EEox
 rtcJYOBhiMOaPq9c=
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr4008014wms.119.1632826868872; 
 Tue, 28 Sep 2021 04:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyieif9gIt2XYAlIBgpSHOWz9pdgtKLnZ7leNw8UXX9dCbJKODjmWTmN6WAqsBewlsyPzErBg==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr4007984wms.119.1632826868710; 
 Tue, 28 Sep 2021 04:01:08 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n186sm2360613wme.31.2021.09.28.04.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 04:01:08 -0700 (PDT)
Message-ID: <cf292444-d89c-5acb-f47b-c135079a60b2@redhat.com>
Date: Tue, 28 Sep 2021 13:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 14/14] machine: Put all sanity-check in the generic
 SMP parser
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-15-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-15-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 05:57, Yanan Wang wrote:
> Put both sanity-check of the input SMP configuration and sanity-check
> of the output SMP configuration uniformly in the generic parser. Then
> machine_set_smp() will become cleaner, also all the invalid scenarios
> can be tested only by calling the parser.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e2a48aa18c..637acd8d42 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -798,6 +798,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
> +    /*
> +     * Specified CPU topology parameters must be greater than zero,
> +     * explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        warn_report("Invalid CPU topology deprecated: "

Maybe:

   "Deprecated CPU topology: "
or

   "Deprecated CPU topology (considered invalid): "

> +                    "CPU topology parameters must be greater than zero");
> +    }


