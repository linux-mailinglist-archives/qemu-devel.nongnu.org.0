Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01C332391
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:03:51 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa9W-0005m3-5u
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZva-0007cF-Hf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZvS-00081l-Te
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qB4KHqPlrFTctEbnFGKvZBqJc9jrC/hw8b5hgzChfIM=;
 b=byczoRcG8KiGyyWHwMmOw4NE/OROy6j8p08Yom7M3wjXqRTMBpxcduLHQZGEyWcCNoYErH
 +tguZ+SnQToAu9+pj+gk7Ju6BvpkIwHHsDRtLJT0Q5TzIKkH3WVvDp7Yvvz/gjdSHrAGDE
 2wX/D6tQyi3uh3y/GyUv2NdSubrs7+g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-32vNJyQZMIuOYCnERvHp5g-1; Tue, 09 Mar 2021 05:49:15 -0500
X-MC-Unique: 32vNJyQZMIuOYCnERvHp5g-1
Received: by mail-ed1-f69.google.com with SMTP id a2so6531685edx.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qB4KHqPlrFTctEbnFGKvZBqJc9jrC/hw8b5hgzChfIM=;
 b=hxoeGPGkdCZJW9eSUcI7LzXWBOr3wJPmsNqgqvfcRT+Wy3LUXlMsQN0+e+njhhWJTg
 jgQ0d1v/CTw1hRQckdExJ/6PA+pf89VmRP/6kstu6YqWKIXGy1bw6wVo2Ez61P7c+Ssf
 eZQckCOK3gxTR/ugDaiGLwYMsX5ZkqSiEhc1t8nMyIx5EU07dIjhHOWNmFBGcJISfd+s
 CF5m7Pr00j4WrHSDBbs8//OEfELShF8eZkwUjt8oPi0FAILY+lu1qG66X7Q7obry3K1C
 YFvv8BQE699pDoCufEeGHMjSoRcggSrU8FVwng0Ea1hVqbHMp49aGVtyH9UZTo2qqe8U
 yASg==
X-Gm-Message-State: AOAM533bGAVLTvYQ1Mlqo2wwayvyDmNeSxbIlARCsmaQi+KZgLcS/M37
 bEPt8Ew+4JTOCf+4gB3o6lwgl9alOzP/bmZKLlkY18be+UrqL6+/RacFFtHuKEfsrzCktWXCS4b
 WKardCIhygPNi3YU=
X-Received: by 2002:a17:906:3444:: with SMTP id
 d4mr19539479ejb.410.1615286954412; 
 Tue, 09 Mar 2021 02:49:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn8TRrTJopVhSteEiMup0Bu91G8pdzdJQ5s6wkx6Nu/K0J3QiCslgbBVpcm3u+MKfLL25x8Q==
X-Received: by 2002:a17:906:3444:: with SMTP id
 d4mr19539470ejb.410.1615286954243; 
 Tue, 09 Mar 2021 02:49:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r24sm8736441edw.11.2021.03.09.02.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:49:13 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] coroutine/mutex: Store the coroutine in the
 CoWaitRecord only once
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-4-david.edmondson@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0fe082d7-acb4-a9a2-8a50-0448b32ecf11@redhat.com>
Date: Tue, 9 Mar 2021 11:49:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309102157.365356-4-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 11:21, David Edmondson wrote:
> When taking the slow path for mutex acquisition, set the coroutine
> value in the CoWaitRecord in push_waiter(), rather than both there and
> in the caller.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   util/qemu-coroutine-lock.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index 5816bf8900..eb73cf11dc 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -204,7 +204,6 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
>       unsigned old_handoff;
>   
>       trace_qemu_co_mutex_lock_entry(mutex, self);
> -    w.co = self;
>       push_waiter(mutex, &w);
>   
>       /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


