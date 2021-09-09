Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5740481E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:55:27 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGmE-0002Ng-Sh
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGko-0001CP-W3
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGkm-0002OQ-5j
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631181234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwr+3pvdxH1NRlgdXk14JF+JyDx/qDTwNZRMxhXGyjE=;
 b=Kyvdfd6JPFtmbyo9bNjcveIEg8umASDrTRRJy7yU8PiIdRAnA7McDFqfofJWFzyvESpSlV
 MCXykKbBUW6uIQMHKml7OBVXbKOOeY5Mf4fQnQJkITZuEOMKG3povZs64OrFU+LmGdW7sZ
 iuC9x5iLbjUK2uym4VFs7hUCyB7C98U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-PKQBtCnIMAO3VucuhvAiuA-1; Thu, 09 Sep 2021 05:53:52 -0400
X-MC-Unique: PKQBtCnIMAO3VucuhvAiuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso498205wml.7
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vwr+3pvdxH1NRlgdXk14JF+JyDx/qDTwNZRMxhXGyjE=;
 b=HuyC0QBjSNxiG5QZCpruxYiGw6/LQ1I4k6SKCENTkaV4E4UEvyB2izRKI8+8DykTAm
 LFIbJBbO/0J56Ht5FiGLmC5ZAdJZTxQXT4cHRqylquo1UWaUHPWZu7gS7YT2oI8eieks
 5ZlNRE3eUP/kZsx4tZyR7xN2kzEr6KQnM4FgbOCT9LRnxNEDG72URIpTNEPynliqBdRX
 VP1CGSE8EynbFngyraaDM8p2CRVyk7nbcsaSZND29+KeGOfdC3/IiAVSud8aT+dg+wJA
 K44v9n6qsQ2utFNvQ+9Eu702f56FlX1YczCinoPgBJ851w4KpzPT9jPGqhOuWF5os8zq
 hMSw==
X-Gm-Message-State: AOAM532iNbRzbDnI2o903lTiX++6Be7SwmKDIgazAWzIJ2cpYuywJTDT
 Q8n63RJL+I8XeHeSI+Vt/rFqeyOb7af7RsgeIDRzCGG5WOIJTSQPZ6h6Rz8D27Szz79wPCUbprt
 Hex6psMAjhadzeiE=
X-Received: by 2002:a7b:c441:: with SMTP id l1mr1908272wmi.69.1631181231051;
 Thu, 09 Sep 2021 02:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIkZfHni7JT96UiXXXKpQ6vrbvW/tTxBRZU6eZ7/YkCglB7MvuULXjbpqr0tqBjlH8EEPhiw==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr1908267wmi.69.1631181230881;
 Thu, 09 Sep 2021 02:53:50 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a133sm1238458wme.5.2021.09.09.02.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 02:53:50 -0700 (PDT)
Subject: Re: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eea8a6d7-72b8-9fd6-07cf-b14ab6099833@redhat.com>
Date: Thu, 9 Sep 2021 11:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 1:20 AM, Philippe Mathieu-Daudé wrote:
> Add the BlockDriver::bdrv_taints_security_policy() handler.
> Drivers implementing it might taint the global QEMU security
> policy.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/block_int.h | 6 +++++-
>  block.c                   | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index f1a54db0f8c..0ec0a5c06e9 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -169,7 +169,11 @@ struct BlockDriver {
>      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp);
>      void (*bdrv_close)(BlockDriverState *bs);
> -
> +    /*
> +     * Return %true if the driver is withing QEMU security policy boundary,
> +     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
>  
>      int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
>                                         Error **errp);
> diff --git a/block.c b/block.c
> index b2b66263f9a..696ba486001 100644
> --- a/block.c
> +++ b/block.c
> @@ -49,6 +49,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/id.h"
> +#include "qemu-common.h"
>  #include "block/coroutines.h"
>  
>  #ifdef CONFIG_BSD
> @@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>          }
>      }
>  
> +    if (drv->bdrv_taints_security_policy) {
> +        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
> +                                   "Block protocol '%s'", drv->format_name);

Hmm I should check for phase_check(PHASE_MACHINE_READY)
and qemu_security_policy_is_strict() somehow, to refuse
adding unsafe drv at runtime instead of exiting...

> +    }
> +
>      return 0;
>  open_failed:
>      bs->drv = NULL;
> 


