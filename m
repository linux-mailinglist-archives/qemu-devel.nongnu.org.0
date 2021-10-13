Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281442BA16
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:22:09 +0200 (CEST)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZWa-0001ZP-KT
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maZVE-0000bX-TL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maZVC-0003Z6-Bc
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634113241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0nWfzSwcCKwj5S4l/qRY7VzOJY12ytbV6eBho16ZYU=;
 b=VPaf/ujOiRWikuweaK5f3/cd2LVckKTr241+w9W7mT5AOLU8rNnMKnp3EYwqsh2JlGwImT
 HyjocfVA1GMfhsc7qVBtaRJbantwBo6bv8VAayT8o2zNpAdAnW62vISjntupFHuQxeg79g
 hd3sxQhZ9QwwJ+vJixCFxqdfH9+NyB8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-jvgSAnvOPqCRiqGxw03ksA-1; Wed, 13 Oct 2021 04:20:40 -0400
X-MC-Unique: jvgSAnvOPqCRiqGxw03ksA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso1316452wra.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H0nWfzSwcCKwj5S4l/qRY7VzOJY12ytbV6eBho16ZYU=;
 b=dduV4Sy0V3oPPzEJOFwXcw6QWQMxsULD76jWNQII5I7PFr3yz+E6tXcliRaLifUkDY
 wwSsegoVsLfTDmibQcYyZDfMV0Cmrs6BUyE9zARb088jaE5f6ygEMvcu2fw+0He07LeG
 cqZTByyBcz3JJRx2v0rcAhLtMSfqr2QdfkTL6yArYQKNEop3x4MUgA+G9N4gxhn33ltl
 EHpz6YDfpZQNAvmM45pgAywY6vHHNzF0KkU70hOsmgSyMtGBkxNZblYiGJRrF6UeUkIK
 Vr6lEUnxDhp8+cLFRiyMC2XmGwUt1eFGfbEZy9p84wcgmym6TbMD797yTjPh42Ecp7QA
 Wfig==
X-Gm-Message-State: AOAM533hqrfM/snxaFe7snnNabrfT9B2XidWoMSf9Yn1nyq8WVbq5bzg
 Pm87ft2/zxOA2Gtcm/w9ECjITnXgHclUFDZwuT0ydsuXsGpODa1rskgKrLMzNPj51CmEa2js/Xp
 wvUEiWN0JMXS0yCY=
X-Received: by 2002:a1c:3586:: with SMTP id c128mr11417747wma.78.1634113239229; 
 Wed, 13 Oct 2021 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaafS7nJJXAkoYAsitCeT+5PrNgsyDxwwzkESoH9pFRQ2irCencD1lyVTJeHZTI7E8iJI2rQ==
X-Received: by 2002:a1c:3586:: with SMTP id c128mr11417725wma.78.1634113238997; 
 Wed, 13 Oct 2021 01:20:38 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id w26sm4712875wmk.34.2021.10.13.01.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 01:20:38 -0700 (PDT)
Message-ID: <f00e1954-5930-c0d9-fb9c-09a95b50d6b4@redhat.com>
Date: Wed, 13 Oct 2021 10:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 5/7] iotests: Conditionally silence certain AQMP errors
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <20211012223445.1051101-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012223445.1051101-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 00:34, John Snow wrote:
> AQMP likes to be very chatty about errors it encounters. In general,
> this is good because it allows us to get good diagnostic information for
> otherwise complex async failures.
>
> For example, during a failed QMP connection attempt, we might see:
>
> +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed: EOFError
> +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish session: EOFError
>
> This might be nice in iotests output, because failure scenarios
> involving the new QMP library will be spelled out plainly in the output
> diffs.
>
> For tests that are intentionally causing this scenario though, filtering
> that log output could be a hassle. For now, add a context manager that
> simply lets us toggle this output off during a critical region.
>
> (Additionally, a forthcoming patch allows the use of either legacy or
> async QMP to be toggled with an environment variable. In this
> circumstance, we can't amend the iotest output to just always expect the
> error message, either. Just suppress it for now. More rigorous log
> filtering can be investigated later if/when it is deemed safe to
> permanently replace the legacy QMP library.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py             | 20 +++++++++++++++++++-
>   tests/qemu-iotests/tests/mirror-top-perms | 12 ++++++++----
>   2 files changed, 27 insertions(+), 5 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


