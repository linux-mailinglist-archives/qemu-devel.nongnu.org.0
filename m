Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B104E3FD9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:53:19 +0100 (CET)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWewo-0003ke-H5
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:53:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWevD-0002Hv-PN
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:51:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWev9-0007rS-N5
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647957094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkL4C+oqBNWsIHOQgB8fDItj+CXioxgjo8lPGk5HJns=;
 b=FFatCRgBMD7aGpjYG8mfDRF94DNGC72g1QWTr54PzItyM+ojxmA2kN31molQdWE/JB80bp
 zK7B13tTnory2vr1edIIV2HnQ7cMcLHYB4DJQZaMxZFGQU+dgdbZhnuWKb4lfUCP9m89Ky
 oJ40lQ142pTAa60oBi2FWnRu0e2NRYg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-vIi3Vng3Mw6FIr2y2VaX3A-1; Tue, 22 Mar 2022 09:51:33 -0400
X-MC-Unique: vIi3Vng3Mw6FIr2y2VaX3A-1
Received: by mail-ed1-f71.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso10595370edh.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OkL4C+oqBNWsIHOQgB8fDItj+CXioxgjo8lPGk5HJns=;
 b=u1ISL+r8nAey+23MEaYarKmDOkk08tasYxn2hslFOvX/jRuMv6/3IBZ9HsUTO9G+i9
 Fjmz1elOMo/qgTxjxTxyAcm9waZ+MzMQ80LmQurCEa7p/14VIksQqVpd0o+Hw3ZTJj/9
 oiD4+ham8nmbWzeuaJaIjIOal5xb6iCJyFX9CqzGdilALP0WVBnBf7YzBHjWIlR2svmX
 2rgEiMwuZXu9SzUUSN6CObkv+tb8UK/tOW1/1W7hBn2vpsatQlF/v8ElVultxcQ+E7MH
 LLV780gLw6AGcKRmXUblDgDGsrhAQWvrn1wDHnQ6hmXRsxwJExS3SbMEbArRacAlgFUo
 ApGg==
X-Gm-Message-State: AOAM533CFPwjUNY9jV0jniQVjqiLbTfcUWFDzwecSzlwTIdHc29QWiHa
 vn7ONYhDg4hpvZR/nDYOMaH3Yng2iQVQ7Na9LGXldV23YXM/qyEOeinlxXk2B7gt7XX4V98DZnn
 JP6/8db8uascr1j8=
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id
 l7-20020a170906794700b006da892f2503mr25122670ejo.710.1647957091841; 
 Tue, 22 Mar 2022 06:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfmktbtvVbrrPYrT5Gm41hH4wpj1y+EXH/YylZpOKXiRHkBzNFgZFU+EvrG346xbqmnt6EDA==
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id
 l7-20020a170906794700b006da892f2503mr25122652ejo.710.1647957091557; 
 Tue, 22 Mar 2022 06:51:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 sd33-20020a1709076e2100b006e0339b4a5asm1534316ejc.109.2022.03.22.06.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 06:51:31 -0700 (PDT)
Message-ID: <52e30816-6cb1-4d43-a68c-e47eee7e6cc8@redhat.com>
Date: Tue, 22 Mar 2022 14:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/15] iotests: replace calls to log(qemu_io(...)) with
 qemu_io_log()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> This makes these callsites a little simpler, but the real motivation is
> a forthcoming commit will change the return type of qemu_io(), so removing
> users of the return value now is helpful.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/242 | 2 +-
>   tests/qemu-iotests/255 | 4 +---
>   tests/qemu-iotests/303 | 4 ++--
>   3 files changed, 4 insertions(+), 6 deletions(-)

Perfectly reasonable, but...

> diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
> index b3afd36d72..4b7ec16af6 100755
> --- a/tests/qemu-iotests/242
> +++ b/tests/qemu-iotests/242
> @@ -61,7 +61,7 @@ def add_bitmap(bitmap_number, persistent, disabled):
>   
>   def write_to_disk(offset, size):
>       write = 'write {} {}'.format(offset, size)
> -    log(qemu_io('-c', write, disk), filters=[filter_qemu_io])
> +    qemu_io_log('-c', write, disk)

This breaks 242 because qemu_io_log is not imported.

Hanna


