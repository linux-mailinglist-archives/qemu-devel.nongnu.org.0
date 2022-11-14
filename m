Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD72628E03
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijZ-0003kI-6Y; Mon, 14 Nov 2022 18:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieV-0002E1-VG
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue1T-0004KF-SP
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668449851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E39TT7hwW+d8FZBdNlWC/xMxINvOQod7iqJ+jSJoO/M=;
 b=HeNy7RVCey5zOh1M+si7iQswRkM3gZ588JYHgL0BsTelU3BmURY+FJF3gyYAGtI+Np4O8b
 7kW680/95NS5JOC2q6w7ou3tX7SKzoiMs3H5tBihMjvVg49p20pH2I6AO3oSCGqvhzajWU
 xO81EBDiVHgbmvCfcXSzyhhqq+1oSx0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-EM1ScjvUNtOgsGdjpq6U1A-1; Mon, 14 Nov 2022 13:17:29 -0500
X-MC-Unique: EM1ScjvUNtOgsGdjpq6U1A-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc40-20020a1709078a2800b007ae024e5e82so5890595ejc.13
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E39TT7hwW+d8FZBdNlWC/xMxINvOQod7iqJ+jSJoO/M=;
 b=1P/+6tQQLBFfAODMa1vthGG3yz97EUhfg727pmiYQfPsudWz3KzZ9FrM3/rxBsfpuJ
 EostHg7qL1O+CMe5gWzQF+nqYXLLYAEHBmlGEi/sogFDg7QdznyvrKbDdZheL9J9lFZ+
 tiOjTDXfvHxvC2I2MmqJVJg82zpaeGVsEPPQWuLJZoeI7ji9lo4WxpiNYnSGKnBXiV/P
 GFseI2xaS53+9jYAUhEB8ATXXPn6llOEetfneXoARg7r/Ydvoi3xPd3vBNrmhvTytIEb
 vdxEKaKOPej+FDEZyT60HXYHD/1vH7wD1uoV5t5GvSkc92FDOymdVbPKUOm28KwXPkgA
 hAYg==
X-Gm-Message-State: ANoB5plg0Lkdf/XTUQ9XLzpoZ5EQ36UHTrHWADVKHmWzez63jHXHAHLy
 vlZOSS7ZWR0fSYkkE45SA1xS7brInyeuEZdhViYHyGQDxmeJ+ElyrUUiH05AXLpyZeVChcvkkOs
 qwC32IjW3trkpkuY=
X-Received: by 2002:a17:906:bc85:b0:781:e01e:951f with SMTP id
 lv5-20020a170906bc8500b00781e01e951fmr11659963ejb.283.1668449847937; 
 Mon, 14 Nov 2022 10:17:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4WHflRP4J77UDNSADWq7KTEIepoujCnAyz8GXQnSp7C/Eyl22KeKTSYoHXiCI3+Wm4/prcPg==
X-Received: by 2002:a17:906:bc85:b0:781:e01e:951f with SMTP id
 lv5-20020a170906bc8500b00781e01e951fmr11659949ejb.283.1668449847724; 
 Mon, 14 Nov 2022 10:17:27 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 em3-20020a056402364300b00458b41d9460sm5095678edb.92.2022.11.14.10.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:17:27 -0800 (PST)
Message-ID: <87f8b422-8583-6e94-5159-08ec65d7d96a@redhat.com>
Date: Mon, 14 Nov 2022 19:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/13] block: Revert .bdrv_drained_begin/end to
 non-coroutine_fn
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-4-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-4-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08.11.22 13:37, Kevin Wolf wrote:
> Polling during bdrv_drained_end() can be problematic (and in the future,
> we may get cases for bdrv_drained_begin() where polling is forbidden,
> and we don't care about already in-flight requests, but just want to
> prevent new requests from arriving).
>
> The .bdrv_drained_begin/end callbacks running in a coroutine is the only
> reason why we have to do this polling, so make them non-coroutine
> callbacks again. None of the callers actually yield any more.
>
> This means that bdrv_drained_end() effectively doesn't poll any more,
> even if AIO_WAIT_WHILE() loops are still there (their condition is false
> from the beginning). This is generally not a problem, but in
> test-bdrv-drain, some additional explicit aio_poll() calls need to be
> added because the test case wants to verify the final state after BHs
> have executed.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block_int-common.h | 10 ++++---
>   block.c                          |  4 +--
>   block/io.c                       | 49 +++++---------------------------
>   block/qed.c                      |  4 +--
>   block/throttle.c                 |  6 ++--
>   tests/unit/test-bdrv-drain.c     | 18 ++++++------
>   6 files changed, 30 insertions(+), 61 deletions(-)

As the others have already suggested, I’d too drop the _co_ in qed and 
throttle, and the coroutine_fn in throttle.  With that done:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


