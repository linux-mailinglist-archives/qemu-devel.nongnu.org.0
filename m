Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F142BDDF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:54:45 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabuG-00078Q-Tn
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mabtQ-0006KD-DM
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mabtO-0008Hr-NS
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634122430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9INo8xhBByfnSQNiWvNwki8l9Z+jX+pqJr0wd87v7c=;
 b=gPC6QrXxpTdTIsfoRQnJz4Q34ehHZreSY1x2ENlkLUbjcJ7Isr8Of465kRoTSzHb8P6eyS
 dOZHc5lhAhogCsNEx1+ycQHZbHX7UDlOFq3LSExNBQ9Cu7ZN/lgfYlQm8uMQhkDHX7/sTY
 ELVeVEqahQXXOAkeI27egBf7Epx5As4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-PWO43W2ZMnWL6qsL5xUy6Q-1; Wed, 13 Oct 2021 06:53:47 -0400
X-MC-Unique: PWO43W2ZMnWL6qsL5xUy6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso1666232wrb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 03:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R9INo8xhBByfnSQNiWvNwki8l9Z+jX+pqJr0wd87v7c=;
 b=2CAbz9ro+ckbUGOhVE8zkRl/vIWFV5gOO2+BsMCZ1BiIAFmWFFqB4zGGytWwuDHPJb
 4hFQQpEycl758Jr3pgnnnMXh35BIBfCYRcml5n2xvhqysWs5kuWQwIfABbUXQG11wPQZ
 QnPXKxwj2ctVM8VwNYLV6mbba1kvO5CSoOjyJao/8AWuXxQSNuzPHVygPqC6d3stg27E
 3dRGryTtrM/2HCjDqkBMMQlt/1x0Fza5eB+nbvUasSheMeXfJeXm1Cdw2KiY61AajVa7
 wOS27nrUu5t/0zCjnMMSVN38/z37iZRWON2sy+Z1hAR8LZqamgS6omeXKRTi9S9WeuLh
 zM1g==
X-Gm-Message-State: AOAM530xlcUlkZ3rdv+JNL4Dfgw1EPt65Z97YDchJfKLZOLoAKbMK2zD
 xuCzXhZyRrYsrBpXKSB0rfHitneiKsGKNUHlzOEcmD6gNvE3B4n4ubeySnwRT64uXvkpZ0aqNxf
 iJkvWgeBGEERAauo=
X-Received: by 2002:a5d:648d:: with SMTP id o13mr39467714wri.421.1634122425937; 
 Wed, 13 Oct 2021 03:53:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy49x5h2HCHNiJwyB24QzutAkqmpqyBU8pvMO39cd8XUqoNm6DCHair6M8AtessxegmshRrVQ==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr39467698wri.421.1634122425809; 
 Wed, 13 Oct 2021 03:53:45 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o19sm13487161wrg.60.2021.10.13.03.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 03:53:45 -0700 (PDT)
Message-ID: <c15ceed2-1b9a-3552-d5f9-70544e362662@redhat.com>
Date: Wed, 13 Oct 2021 12:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 02/13] iotests/297: Split mypy configuration out into
 mypy.ini
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:04, John Snow wrote:
> More separation of code and configuration.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297      | 14 +-------------
>   tests/qemu-iotests/mypy.ini | 12 ++++++++++++
>   2 files changed, 13 insertions(+), 13 deletions(-)
>   create mode 100644 tests/qemu-iotests/mypy.ini

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index bc3a0ceb2aa..b8101e6024a 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -73,19 +73,7 @@ def run_linters():
>       sys.stdout.flush()
>   
>       env['MYPYPATH'] = env['PYTHONPATH']
> -    p = subprocess.run(('mypy',
> -                        '--warn-unused-configs',
> -                        '--disallow-subclassing-any',
> -                        '--disallow-any-generics',
> -                        '--disallow-incomplete-defs',
> -                        '--disallow-untyped-decorators',
> -                        '--no-implicit-optional',
> -                        '--warn-redundant-casts',
> -                        '--warn-unused-ignores',
> -                        '--no-implicit-reexport',
> -                        '--namespace-packages',
> -                        '--scripts-are-modules',
> -                        *files),
> +    p = subprocess.run(('mypy', *files),
>                          env=env,
>                          check=False,
>                          stdout=subprocess.PIPE,
> diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini
> new file mode 100644
> index 00000000000..4c0339f5589
> --- /dev/null
> +++ b/tests/qemu-iotests/mypy.ini
> @@ -0,0 +1,12 @@
> +[mypy]
> +disallow_any_generics = True
> +disallow_incomplete_defs = True
> +disallow_subclassing_any = True
> +disallow_untyped_decorators = True
> +implicit_reexport = False

Out of curiosity: Any reason you chose to invert this one, but none of 
the rest?  (i.e. no_implicit_optional = True -> implicit_optional = 
False; or disallow* = True -> allow* = False)

Hanna

> +namespace_packages = True
> +no_implicit_optional = True
> +scripts_are_modules = True
> +warn_redundant_casts = True
> +warn_unused_configs = True
> +warn_unused_ignores = True


