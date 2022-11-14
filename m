Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F20628E94
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiiD-0001rD-HD; Mon, 14 Nov 2022 18:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieW-0003HL-1j
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue0g-0003q0-4F
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668449801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmI89viTkyqxUWwrtsXJ+rtF40uSzNlYQmZHtjJ/4HM=;
 b=C9wlZxxXeLAVG5Ygcxf+Y8kN8Ypc5vBp8Pb6zoiBfRnTGQI6QwYnnTKoROD89syeuk5z+x
 DCpWBRscW2VegcItXm/vuNCIyH2XRFvP2YZaw/MQbMdNUur0kpu8m+aMH8gBEfMsD8KLaC
 tW4kTe7VKQVt4QJ+ytotiuD/kJl9Fvs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-QeS8VuIfM8em9AyGtENNhQ-1; Mon, 14 Nov 2022 13:16:40 -0500
X-MC-Unique: QeS8VuIfM8em9AyGtENNhQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 qb20-20020a1709077e9400b007ae67a9aa7dso5860615ejc.16
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmI89viTkyqxUWwrtsXJ+rtF40uSzNlYQmZHtjJ/4HM=;
 b=z29u0nc3CPhabYqfn4YYrAIK7xyI5PpUf8zUHU+VPgLX6hbMpmCy+DGPuNNIIDjlt+
 0MvblRKb2t38gXAYeU/p+SEzjeETcz3wF0TI6YnsXuXswaXPLSsKZ3iOCsefcwz1HicU
 MSGZgcti+lnK8vW8GprbBaOX3L0QL3+oGzsv9Iccjs543Krp7QBQX/kSBEwrELZt3Npr
 3B0ZXe1qmARfI0kMXjGejtZm9IBiKRmb0jaaFvbpnpUK9oxH/NzttitUJEGukL71bkgL
 9FoG0N5yTJYnBvgW7nyEQxM2HYFOKjh0jeYhNCFgE6SRh8coCe10SEcrI3LllZOhg/mX
 QrBw==
X-Gm-Message-State: ANoB5pner/2bbfX8X1pyY7BK9VlW62f6dtBg2XavvcwCjGTRUsChe/fw
 UiidbewOpCJGfjcU9j5sbEm85IbLZaLCcF8/830hFRhXH8nbeCCxyUDNkWuX25KCkh0GzePrNb7
 qms2oP5StEm0p+08=
X-Received: by 2002:a17:906:aac7:b0:7af:9bff:8de6 with SMTP id
 kt7-20020a170906aac700b007af9bff8de6mr123327ejb.91.1668449798683; 
 Mon, 14 Nov 2022 10:16:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Jaao8scwkH14SFHmU7qN22hHgpa3hy0ppE56Bcz2quULVkoVEZ11oyhtnJ37cefqgtoBEww==
X-Received: by 2002:a17:906:aac7:b0:7af:9bff:8de6 with SMTP id
 kt7-20020a170906aac700b007af9bff8de6mr123306ejb.91.1668449798418; 
 Mon, 14 Nov 2022 10:16:38 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a056402164100b004616cce0a26sm5069830edx.24.2022.11.14.10.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:16:37 -0800 (PST)
Message-ID: <3cd1cafb-5b99-4c5c-3bf8-4b94112ad5c3@redhat.com>
Date: Mon, 14 Nov 2022 19:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/13] test-bdrv-drain: Don't yield in
 .bdrv_co_drained_begin/end()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-3-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-3-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> We want to change .bdrv_co_drained_begin/end() back to be non-coroutine
> callbacks, so in preparation, avoid yielding in their implementation.
>
> This does almost the same as the existing logic in bdrv_drain_invoke(),
> by creating and entering coroutines internally. However, since the test
> case is by far the heaviest user of coroutine code in drain callbacks,
> it is preferable to have the complexity in the test case rather than the
> drain core, which is already complicated enough without this.
>
> The behaviour for bdrv_drain_begin() is unchanged because we increase
> bs->in_flight and this is still polled. However, bdrv_drain_end()
> doesn't wait for the spawned coroutine to complete any more. This is
> fine, we don't rely on bdrv_drain_end() restarting all operations
> immediately before the next aio_poll().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/unit/test-bdrv-drain.c | 64 ++++++++++++++++++++++++++----------
>   1 file changed, 46 insertions(+), 18 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


