Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8B44EA04
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:27:30 +0100 (CET)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYSe-0007VL-Pr
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:27:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYRS-0006bR-Ui
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:26:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYRR-0001Ak-9Y
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636730772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQ5xjINZuVEO+UDfjbRc5XqdzUb/V9zj3G5YdBt7qss=;
 b=jOO426H131JI1CO4UFloavvLh7hnS+WqGFe26MLF4FfIiEzZE81M2CfqZ0kVp4AoGXfamc
 OxHaAvcGa6huIdps3Ooco0kjfGVp6DfD7IzAC3wa8WNSjO4gq3yVqN9R20O9gRktgprDPg
 BrEZptdJMP5+1HkhArnlTQSsh/cTVRE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-yEY3V5TEM6ObAPtt549Vdg-1; Fri, 12 Nov 2021 10:26:11 -0500
X-MC-Unique: yEY3V5TEM6ObAPtt549Vdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so4394242wma.6
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 07:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mQ5xjINZuVEO+UDfjbRc5XqdzUb/V9zj3G5YdBt7qss=;
 b=FdzLQeqDdgEXyAwj5+pE5QF44DRazCR7YHvkGCWs+hvsUyJNNF/ej1Y4RsXV7/2A9F
 970PqC0wjzhqfRL950JGn1m/bSZSW09AVWxvCEjZF+Puf31ygueRPfkaXhDaWPjcBUxX
 WGXd6eLi1Myk9ipmPyi9YieJRS2Qwi2b4yIN/djm8Qha25NbV+OXLnxP+FaLxGFVhAQf
 a1UUMS4VV8GtYMhtf/51Uds5v2lyshJX97M5zTbS4HzD3G9mCYsKjDKnAITCV5ywbpOP
 PFmVCBjgh0wxB/IMTpcAGAkePb1JVszMtFCOuAdpqihON+eJs+Xg0jtTN0aZ2I4ZZZzc
 MGlw==
X-Gm-Message-State: AOAM533nqLkIQgtDhp2oUYpX4h+xTGbr0ZRkn+yqN9c4XWezCRoUQiiX
 miv8Kx2qWl2zp/ps8KC3YyxLvMGGWn2lfVvcmW4ZpwoAZmgXLrHUkb1bqYS8hGF/BL8DO5448pY
 wi659iB02TRKVu9Q=
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr19750095wrn.294.1636730770041; 
 Fri, 12 Nov 2021 07:26:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi8JpEQFcDA4w+JyXmw3mrew0jnqnUyCSDIK3N35DWEkd2uObuCd+q1xrQNEcMrFolwTXIVA==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr19750058wrn.294.1636730769853; 
 Fri, 12 Nov 2021 07:26:09 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l4sm5792158wrv.94.2021.11.12.07.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 07:26:09 -0800 (PST)
Message-ID: <c9ed5336-3e22-3a49-83f6-31af63da2053@redhat.com>
Date: Fri, 12 Nov 2021 16:26:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 12/25] assertions for blockob.h global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-13-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-13-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject: s/blockob.h/blockjob.h/

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   blockjob.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/blockjob.c b/blockjob.c
> index fbd6c7d873..4982f6a2b5 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -61,6 +61,7 @@ static bool is_block_job(Job *job)
>   
>   BlockJob *block_job_next(BlockJob *bjob)
>   {
> +    assert(qemu_in_main_thread());
>       Job *job = bjob ? &bjob->job : NULL;

Here and...

>       do {
> @@ -72,6 +73,7 @@ BlockJob *block_job_next(BlockJob *bjob)
>   
>   BlockJob *block_job_get(const char *id)
>   {
> +    assert(qemu_in_main_thread());
>       Job *job = job_get(id);

...here, the assertion and declaration should be switched.

Hanna


