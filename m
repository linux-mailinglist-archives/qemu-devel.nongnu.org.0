Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07C351126
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:52:36 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRt47-0003IX-JK
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRt1b-0002Nk-IZ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRt1Z-000485-3u
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617266995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvWzL8akX5++DoAH5SrCKwq44ZUrmDwMsqpsF7lZwOw=;
 b=GJ+1/VpjshZ3eTE6qAZ19d4ccbAJ7oA27TfUJwOei9cXT1eyRR5mzSdfJx+GDKoxfmdiEI
 ljoQroATzMWu8aDKa0TV9D5q1nUB3yCz8QK0/4EsFG3KdNnLxe/yRogHvNAB6mvBpN6fJH
 XuhD0BOUVV6Rfhhx1vfUvjU7eB8jFPE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-4jye6LinO7iDq7WngiQHQw-1; Thu, 01 Apr 2021 04:49:53 -0400
X-MC-Unique: 4jye6LinO7iDq7WngiQHQw-1
Received: by mail-ed1-f70.google.com with SMTP id r6so2507522edh.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvWzL8akX5++DoAH5SrCKwq44ZUrmDwMsqpsF7lZwOw=;
 b=dLM5ItsqmdowDg4SDYgfZhpNaQlpT8+cm+gx4MkaY8CKnrDFhVaot4QtCxfBAkn40a
 BTyhzRFWUJJ9B/B6NdXM7qwJm8J4/QldntpmLzmN9WxPWdHRH6z1tqIDqYpMuYXWMBdx
 wgiatiAwiD85H+BpQcUbLhoYZzMbTLl0sKfgHeCyhzSMK9DCCrHFwt/yTeVJ5qBaQwy3
 l6b2VRU/UAOI5n28qqpgAeaHf5TOdlctXXhadrlJO7b8r97nwufahQX1deLownxjY6jy
 tzAi/GrvqZzb/VIhOoYCwh7dmjMUL7Z1sAEWmkgL4WInhi4q92PEj7ajs6aKlBJ9sZ/C
 vPLg==
X-Gm-Message-State: AOAM533LFLYSMrRAiNhm3F0LY81AbzTiWFi1Kc+y6SkCzYJwT6cKJ6l0
 alvOwHwcKdfFyiC21IjBvqhwa+F1UJ0ZefSnTs7ezjpUXz2nJZn1XssvzKGHrsfgdL4q0B+O5h+
 EsYoGMmpSaQ77RFk=
X-Received: by 2002:a17:906:144d:: with SMTP id
 q13mr8430404ejc.458.1617266992262; 
 Thu, 01 Apr 2021 01:49:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/iv8bR8ZcptY3S8AdaZwpiw2mC9i5DkvoGge4HOgH6ReKxKBjM5fccwvpObIzgSbepspX1w==
X-Received: by 2002:a17:906:144d:: with SMTP id
 q13mr8430393ejc.458.1617266992098; 
 Thu, 01 Apr 2021 01:49:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m14sm3092002edd.63.2021.04.01.01.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:49:51 -0700 (PDT)
Subject: Re: [PATCH v3] replay: notify CPU on event
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161726519158.1476949.7614181684462079836.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <085ea81c-6d08-11b1-d496-568320f53de7@redhat.com>
Date: Thu, 1 Apr 2021 10:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161726519158.1476949.7614181684462079836.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 10:19, Pavel Dovgalyuk wrote:
> This patch enables vCPU notification to wake it up
> when new async event comes in replay mode.
> 
> The motivation of this patch is the following.
> Consider recorded block async event. It is saved into the log
> with one of the checkpoints. This checkpoint may be passed in
> vCPU loop. In replay mode when this async event is read from
> the log, and block thread task is not finished yet, vCPU thread
> goes to sleep. That is why this patch adds waking up the vCPU
> to process this finished event.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay-events.c |    2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index a1c6bb934e..15983dd250 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -15,6 +15,7 @@
>   #include "replay-internal.h"
>   #include "block/aio.h"
>   #include "ui/input.h"
> +#include "hw/core/cpu.h"
>   
>   typedef struct Event {
>       ReplayAsyncEventKind event_kind;
> @@ -126,6 +127,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
>   
>       g_assert(replay_mutex_locked());
>       QTAILQ_INSERT_TAIL(&events_list, event, events);
> +    qemu_cpu_kick(first_cpu);
>   }
>   
>   void replay_bh_schedule_event(QEMUBH *bh)
> 

Queued, thanks.

Paolo


