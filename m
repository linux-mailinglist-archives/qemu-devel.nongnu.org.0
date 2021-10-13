Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4E42BEA5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:04:32 +0200 (CEST)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mac3j-0002ew-Oq
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mac2b-0001np-DU
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mac2Z-00008P-Tt
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634122999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVVEtnqSBRmzMgXvsjIbLFiODkCy3P2aKGSVB5Dv2s0=;
 b=hVcCJlwM019z1DU+gutTrLqV/oAAtYKLgVva+aTpYfSR0Cz6kUsPff39ByWfFv8iGFBJqW
 teRS6R0FVi8D6yVJjd9XLLsq7nWGEZaWYfGLg7n1hqrKebH43TrG7kvsoiC/HcpRRTP1pY
 EGmPByZwr1Q5ScSvox3ICotXPBojswg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-xj4QHaSrPumi1E0DUy21Sg-1; Wed, 13 Oct 2021 07:03:18 -0400
X-MC-Unique: xj4QHaSrPumi1E0DUy21Sg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso1649462wrg.16
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JVVEtnqSBRmzMgXvsjIbLFiODkCy3P2aKGSVB5Dv2s0=;
 b=r2qrvmKQXSHOf8palUMBSsLyt4fcSS15GqmH7VYsAmqhxJGZbYuqf78/yFfZLBk5DB
 mmZhrkqeDI7doTK52fM4YuBtzlqwGCq7VaW5yO/JjYwD91MDgjFMJVPdUNF2EbEyYVwA
 cLOPZH4JGCIU5A87ri0I42LM1zq8t5ubU54XQ1HWhZlVErnyvrg/2x6zF0JkpMoNV0ag
 xD9lMDPXwAI4sWj/zPEtcLRtcwmsss9xvcjZhDaY0JDSPFhgCx/epsSYfDUvheIn3DP2
 0680VouJwIgOX1+Lh4Gkg11SDAdFSvLO5c2UEANpIzqCF04OMu9Y2fNvEaHf8RGnmvfW
 jFxA==
X-Gm-Message-State: AOAM5325c2gxVKQdNsXhVRkS4ZhNDcmiOF7eloUoyvLaMfkySSK10nbb
 BW2d/HT9naWH5pPAdQI3HNa8CLnGvb4T5q7uk7ikdW8zk8pwU+2cIi+aIRb3u+HB2Xk5D5BXuqh
 MHUBH1dTk/c+Rjw4=
X-Received: by 2002:a1c:1dcb:: with SMTP id
 d194mr11932908wmd.156.1634122996812; 
 Wed, 13 Oct 2021 04:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXODrH1sjuOVX3KvrOnXhoOmHh/EVCybQsKYQMV+y+PlaLsvZQoHCXeHSis8iHC0rwJSI19w==
X-Received: by 2002:a1c:1dcb:: with SMTP id
 d194mr11932879wmd.156.1634122996603; 
 Wed, 13 Oct 2021 04:03:16 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z12sm4798417wmk.38.2021.10.13.04.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:03:16 -0700 (PDT)
Message-ID: <343b9cfa-362c-51b1-cedf-67717db4aa15@redhat.com>
Date: Wed, 13 Oct 2021 13:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 05/13] iotests/297: Create main() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:04, John Snow wrote:
> Instead of running "run_linters" directly, create a main() function that
> will be responsible for environment setup, leaving run_linters()
> responsible only for execution of the linters.
>
> (That environment setup will be moved over in forthcoming commits.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/297 | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 65b1e7058c2..f9fcb039e27 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -89,8 +89,12 @@ def run_linters():
>           print(p.stdout)
>   
>   
> -for linter in ('pylint-3', 'mypy'):
> -    if shutil.which(linter) is None:
> -        iotests.notrun(f'{linter} not found')
> +def main() -> None:
> +    for linter in ('pylint-3', 'mypy'):
> +        if shutil.which(linter) is None:
> +            iotests.notrun(f'{linter} not found')

Now that I see it here: Given patch 4, shouldn’t we replace 
`shutil.which()` by some other check?

Hanna

>   
> -iotests.script_main(run_linters)
> +    run_linters()
> +
> +
> +iotests.script_main(main)


