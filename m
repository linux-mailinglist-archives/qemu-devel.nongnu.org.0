Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B461B34CD42
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:44:41 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoRs-0006Rx-PI
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoQ4-0004eV-1U
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoQ0-0007K5-DJ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617010962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Wr8NaBlzypqZ5E/Tq3mxoc6Q05U+5aZ8KJoE2oldl0=;
 b=MU+7AGnjjdIvLHWnDGn2mDAcqc6NbqQxM9ZsLbITyLpWUCxFBkYJ/+/+6s45WtQcdXVhcN
 l3gJ/lOWXKpeWy2/ZbNPxveismWkHldxfwVmKDCwRyDSwHwMuQK+nvRaF/79OxpumSZjsF
 5C6veQPuo1lXbdWfRpAGYAWDbAddOtk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-oDxMh9Q1Pb2AiR7-VEHfsw-1; Mon, 29 Mar 2021 05:42:40 -0400
X-MC-Unique: oDxMh9Q1Pb2AiR7-VEHfsw-1
Received: by mail-wr1-f69.google.com with SMTP id f3so8408949wrt.14
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 02:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Wr8NaBlzypqZ5E/Tq3mxoc6Q05U+5aZ8KJoE2oldl0=;
 b=R8JF4y9b0zy3TIwcV4j8q+o3rpMaGenrfzRaq9NXW/11GnXECNmlbav1/zkKRBoJ1q
 Km1c7uvRIHQCu+L/jd7SeMzdK29GeV6tQ841avkDP9Lr55+pwipalkrIC0pPFfCK7h0g
 QbEmO0RKOBDKtMkwG+NpZcsv9mtGHfk/5nTuqLAFSi3XkZW1j4I5ko8mx4g88y+j+g1m
 N7A/h5dj3I4E9wEEFgvtgouuw5z/Fy3V2Vhmzrv0v8o/cdbDM78Zya3EhsazAqqZIfol
 dsMkxLQBSAQMNR56cEMxsQdKfr93iehdiyLwknqs4ElFQZ90JJb7BuKywPleaVfNEYws
 Eo/g==
X-Gm-Message-State: AOAM533S7Thvnb/aJGwWTGD6vICm3sKEddb0DgKYIfXMH6au3h5u1IUc
 UpQo4B99cjmnyIRGHtIFYxuqAgEZHrUe/m+mRozBcRrOMclutPpxuUOZt5Tnl0JlHDEinb/DRI/
 cQln5UZXTDAdC2Dc=
X-Received: by 2002:adf:f851:: with SMTP id d17mr27221416wrq.267.1617010959367; 
 Mon, 29 Mar 2021 02:42:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHRXvNiPOLxg+DNoXZlkzAruELwEaxqlv+kNfeCKrkGk3X1mBkV0MwXBnpzm46ifHy0+pi5A==
X-Received: by 2002:adf:f851:: with SMTP id d17mr27221401wrq.267.1617010959213; 
 Mon, 29 Mar 2021 02:42:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s9sm26511081wmh.31.2021.03.29.02.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 02:42:38 -0700 (PDT)
Subject: Re: [PATCH] qcow2: use external virtual timers
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700516327.1141158.8366564693714562536.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50f2815b-a5ef-f7ae-b82e-572edc6796d7@redhat.com>
Date: Mon, 29 Mar 2021 11:42:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161700516327.1141158.8366564693714562536.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu block <qemu-block@nongnu.org>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 10:06, Pavel Dovgalyuk wrote:
> Regular virtual timers are used to emulate timings
> related to vCPU and peripheral states. QCOW2 uses timers
> to clean the cache. These timers should have external
> flag. In the opposite case they affect the execution
> and it can't be recorded and replayed.
> This patch adds external flag to the timer for qcow2
> cache clean.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/qcow2.c |    7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 0db1227ac9..2fb43c6f7e 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -840,9 +840,10 @@ static void cache_clean_timer_init(BlockDriverState *bs, AioContext *context)
>   {
>       BDRVQcow2State *s = bs->opaque;
>       if (s->cache_clean_interval > 0) {
> -        s->cache_clean_timer = aio_timer_new(context, QEMU_CLOCK_VIRTUAL,
> -                                             SCALE_MS, cache_clean_timer_cb,
> -                                             bs);
> +        s->cache_clean_timer =
> +            aio_timer_new_with_attrs(context, QEMU_CLOCK_VIRTUAL,
> +                                     SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                                     cache_clean_timer_cb, bs);
>           timer_mod(s->cache_clean_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
>                     (int64_t) s->cache_clean_interval * 1000);
>       }
> 

Cc: qemu-block@nongnu.org


