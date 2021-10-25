Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C588439770
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:23:17 +0200 (CEST)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezwa-0005ff-5P
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mezti-0002gg-W6
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1meztg-0008PD-Tw
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635168016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gS73QMhCABxdsK+8/NouLkryyYO8yHyD5fPWXjXLv/0=;
 b=BQaaPiMjbxJ6lRnLOMh50uesrxIibWB6JUKE6EmU8jwSSay+QSiJ1Rx9KqdnmICxzUdfYW
 p+9h9HVOlS5pnssNPveIbuuU7rSJLYLd2Lvgc3dxCNuq2QYxTMJIyaefFq6btwdiGdp66i
 iWg1p7dl+1X8TAYi6vhUFoztXW4KRbg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-TVNgLSOmOYyBZeu_zmz9Jg-1; Mon, 25 Oct 2021 09:20:13 -0400
X-MC-Unique: TVNgLSOmOYyBZeu_zmz9Jg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so3952318wmr.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 06:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gS73QMhCABxdsK+8/NouLkryyYO8yHyD5fPWXjXLv/0=;
 b=W5C1GH8KyRyd1FwPEOd6pMeQXoI45Y0AFiepJR1oLUlKBauFAuMK7tAEaO8pVxM2bV
 xbxIRe1ufSdG4boETpVuWz+kinmVHzO/3v81gRHwp02ZLlxwNBvS2qSioGyydgMqTRo9
 5yfSYmRatPx5NqV3GcRFtwxsRd+Q20paNf3eKBnFXBKy69Bz45qNoaMaZbt+6M8a2Prd
 CDLO5BniURoJYCLBawQsa0tozwQ/AGnvZ0Z/xF2gbGfCnDOb4HVaoju8R5sgGBt491E9
 PYzdkceDzq/Gmfp1b4SJagpHmoVLnLIG+7SKfjy9r4o+ih1Mn7vXBrCu82jFM7vdT7pA
 K7wA==
X-Gm-Message-State: AOAM5306b8fxNXqbTrW5TlsAavY4CiAin+edHJ6uwm+vF3PQZ39iOtFz
 eAnn05DIFwCKC/9+UAtxXchGzHt20+R1B1VfXDmMA/KLK59vkrWcGvwAHnXRpAQp7zS26ix01tV
 fV/lT/4dhrcLVoLg=
X-Received: by 2002:a7b:c082:: with SMTP id r2mr2141882wmh.67.1635168011982;
 Mon, 25 Oct 2021 06:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2PXeRZCUcxeGHpl6pg0mh9NxTqBiE1BzsZZTV0XoSswPx5eYF5GeD2pvDZRDgp0jMurRsiA==
X-Received: by 2002:a7b:c082:: with SMTP id r2mr2141849wmh.67.1635168011735;
 Mon, 25 Oct 2021 06:20:11 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j11sm15811342wmi.24.2021.10.25.06.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:20:11 -0700 (PDT)
Message-ID: <53d27c1f-c9de-5608-7f6a-f64bc39fb159@redhat.com>
Date: Mon, 25 Oct 2021 15:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 6/8] iotests/300: avoid abnormal shutdown race condition
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211013215748.2154908-1-jsnow@redhat.com>
 <20211013215748.2154908-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211013215748.2154908-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 23:57, John Snow wrote:
> Wait for the destination VM to close itself instead of racing to shut it
> down first, which produces different error log messages from AQMP
> depending on precisely when we tried to shut it down.
>
> (For example: We may try to issue 'quit' immediately prior to the target
> VM closing its QMP socket, which will cause an ECONNRESET error to be
> logged. Waiting for the VM to exit itself avoids the race on shutdown
> behavior.)
>
> Reported-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/300 | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> index 10f9f2a8da6..bbea7248005 100755
> --- a/tests/qemu-iotests/300
> +++ b/tests/qemu-iotests/300
> @@ -24,8 +24,6 @@ import random
>   import re
>   from typing import Dict, List, Optional
>   
> -from qemu.machine import machine
> -
>   import iotests
>   
>   
> @@ -461,12 +459,10 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
>                         f"'{self.src_node_name}': Name is longer than 255 bytes",
>                         log)
>   
> -        # Expect abnormal shutdown of the destination VM because of
> -        # the failed migration
> -        try:
> -            self.vm_b.shutdown()
> -        except machine.AbnormalShutdown:
> -            pass
> +        # Destination VM will terminate w/ error of its own accord
> +        # due to the failed migration.
> +        self.vm_b.wait()
> +        assert self.vm_b.exitcode() > 0

Trying to test, I can see that this fails iotest 297, because 
`.exitcode()` is `Optional[int]`...

(I can’t believe how long it took me to figure this out – the message 
“300:465: Unsupported operand types for < ("int" and "None")” made me 
believe that it was 300 that was failing, because `exitcode()` was 
returning `None` for some inconceivable reason.  I couldn’t understand 
why my usual test setup failed on every run, but I couldn’t get 300 to 
fail manually...  Until I noticed that the message came below the “297” 
line, not the “300” line...)

Hanna


