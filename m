Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F734549A8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:14:49 +0100 (CET)
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMe8-0001rd-Lo
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:14:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMVF-0008NB-2x
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMVC-0003Cz-SG
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637161534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlPhL/WYkRkxEyyPde1lpsPjzJyiZiky8z0qrVNLR2c=;
 b=PfdZT9ZklXUqwWfD5i5Wf2/8zDb/sREsFzqAECcV8FR2SYxen6RIkLQebERKEJlhyf+Lah
 7b8fexOuBdtDQjbXdo8Evv/pUe49iOnOhjkPLlN/uWT9fcC0ueZGDZP+Yf+92cOGLAJ4Qs
 VvrBpbJCdGmQq+mkv0joFh2psq06Z5k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-0LXIcwtmNGah-PTK603Kqw-1; Wed, 17 Nov 2021 10:05:30 -0500
X-MC-Unique: 0LXIcwtmNGah-PTK603Kqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso2953984wme.8
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 07:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TlPhL/WYkRkxEyyPde1lpsPjzJyiZiky8z0qrVNLR2c=;
 b=te31/4lLpNQDBK2JiRLWynwAgG6rIbNyt/N08Zcd2eeaRz2xtzyqRh3/cRHI+risRj
 LGD8VYulj0fIrtpBFa3pd+GL/ul8d7xjiGCXSXL75l3Tmh0KTA6cAk1E+Zqyg9m/3tq3
 D1HQIGC5GkEZ3aWbl+WDvAYimS50KeQR3LOV29U2oJGKFgF0n2a2L/JXbhw8qpwEUmkK
 fOdDxCIV+CJ3vCaqYoSigMe2ldfoA92egljbXpyCSnwvQ5Y6TigIRpRfO/clt4YiQlw1
 E/VpvzWJoGyRabsItvWlzlahEWRPgvVEDhNwBb89VYrRadyhybjqLus/KyDu9MxBM8pW
 sDSA==
X-Gm-Message-State: AOAM532zvZLdBNhFk25mZe6SL2PKy8zHAvTKrt61kae3kGoF2jw5BQPx
 sDOV6KUUofFtorHejoKcz3utuIRqgfZzZ91v4+pJPztS7C/VZ2JUZUnxTCOtRIjZtveMAbCvZ9A
 cOcxR2JOEOKdttIs=
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr20954878wrd.52.1637161529560; 
 Wed, 17 Nov 2021 07:05:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUrJaG9cPKl/f3MDCQigePL/RFJ6mF5PImvbdz7phDne279vxORHcNgYok9VbCOZiKO1YrLA==
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr20954807wrd.52.1637161529131; 
 Wed, 17 Nov 2021 07:05:29 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id w17sm99863wrp.79.2021.11.17.07.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 07:05:28 -0800 (PST)
Message-ID: <1d499aa2-86bb-db1f-6379-88dc7d5ab356@redhat.com>
Date: Wed, 17 Nov 2021 16:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] iotests/149: Skip on unsupported ciphers
To: qemu-block@nongnu.org
References: <20211117150159.41806-1-hreitz@redhat.com>
 <20211117150159.41806-3-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211117150159.41806-3-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.11.21 16:01, Hanna Reitz wrote:
> Whenever qemu-img or qemu-io report that some cipher is unsupported,
> skip the whole test, because that is probably because qemu has been
> configured with the gnutls crypto backend.
>
> We could taylor the algorithm list to what gnutls supports, but this is
> a test that is run rather rarely anyway (because it requires
> password-less sudo), and so it seems better and easier to skip it.  When
> this test is intentionally run to check LUKS compatibility, it seems
> better not to limit the algorithms but keep the list extensive.
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/149 | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
> index 328fd05a4c..adcef86e88 100755
> --- a/tests/qemu-iotests/149
> +++ b/tests/qemu-iotests/149
> @@ -230,6 +230,18 @@ def create_image(config, size_mb):
>           fn.truncate(size_mb * 1024 * 1024)
>   
>   
> +def check_cipher_support(output):
> +    """Check the output of qemu-img or qemu-io for mention of the respective
> +    cipher algorithm being unsupported, and if so, skip this test.
> +    (Returns `output` for convenience.)"""
> +
> +    if 'Unsupported cipher algorithm' in output:
> +        iotests.notrun('Unsupported cipher algorithm '
> +                       f'{config.cipher}-{config.keylen}-{config.mode}; '

Oops.  Just when I sent this I realized that during refactoring (putting 
this code into its own function) I forgot to pass `config` as a parameter.

Didn’t notice that because...  It seems to work just fine despite 
`config` not being defined here?  Python will forever remain a black box 
for me...

Hanna

> +                       'consider configuring qemu with a different crypto '
> +                       'backend')
> +    return output
> +


