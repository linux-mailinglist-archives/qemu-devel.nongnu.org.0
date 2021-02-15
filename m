Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D631BA79
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:40:13 +0100 (CET)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe6m-00021z-68
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBdwl-0000Du-9x
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBdwj-0002P9-Ny
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613395788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FnyHzyMvst4ROaI4vjGeYwW+gdlm7NsxkAiVHtkUGlM=;
 b=S+fMLVUlvqXbLI9hiF2wr4EevmMdKDtTH7ZZJ5OAzGa8yLSEpbrRtZ0OXnvbnX7daILV3x
 Lw9bUmN5Ps3C9RjB5IoubifdLYI8S0xskU4mmCXOPVxenhUEve3SZJ3Nq3u+JehZ5Iui/x
 XxKz1iABwcMEYR441L3lHlHRgx5BXa4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-uUNVoRxkOD2Y0Tg2nxg0yA-1; Mon, 15 Feb 2021 08:29:46 -0500
X-MC-Unique: uUNVoRxkOD2Y0Tg2nxg0yA-1
Received: by mail-ej1-f71.google.com with SMTP id yd11so4304550ejb.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FnyHzyMvst4ROaI4vjGeYwW+gdlm7NsxkAiVHtkUGlM=;
 b=PXQV7ApxzPQX4xR/P9N9Biak5eSIibiEWULr3l7BPzN4ds4lL3F+hntY3wySPTDivX
 3fc+jogLl+vYlngMuHQ8al5uTHWQyFK/UZ9lmT/E1JLYvWOxjS86ZTy5l+mhg+LkjKU0
 CQvmu82IKkThFc2CnrNKfCiAyDKptXtWMSg2VUNr/X3axAAEvHZTVXPTi0LJjVXFrx4h
 BAOlZSdVBH8VRsLeIVIygyCBZxx6ZrnhGYge8QDCd9dYh6TGAbxHhqS+fnbXY5EAOYKi
 92hBcY1dqVZ6L4z54lw6o8ulYOwJTCcRA7lGWWluLj9PqvKTvW6I9w/SkmIsXHt1nigW
 zcSA==
X-Gm-Message-State: AOAM5339NxfSRhbdxRoi4269D27BpziPcCDe5tpSIxl15gd7Xn8m0FUw
 LnW8ZOWKuWN6BToYdq+7dO4pTYEddt1JEvcJs5PyYyI4TPOghD7uzF4IOCwx9yeX8Ri4iCEQzNX
 3PWpZd83rk6rEaw0=
X-Received: by 2002:a17:906:c10a:: with SMTP id
 do10mr15685710ejc.543.1613395785694; 
 Mon, 15 Feb 2021 05:29:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx544mhRwYT+KZUkztcgzM2Cfqk+ZxIMfGySVTndiTKow/7GPr+Yu8jFb7q/9yGabChPEg3mw==
X-Received: by 2002:a17:906:c10a:: with SMTP id
 do10mr15685690ejc.543.1613395785461; 
 Mon, 15 Feb 2021 05:29:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 35sm10159428edp.85.2021.02.15.05.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 05:29:45 -0800 (PST)
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161339392367.1222219.9529223857148298127.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] replay: notify CPU on event
Message-ID: <07b76b51-c3d5-0a0e-6c48-536bccab3d90@redhat.com>
Date: Mon, 15 Feb 2021 14:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161339392367.1222219.9529223857148298127.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/21 13:58, Pavel Dovgalyuk wrote:
> This patch enables vCPU notification to wake it up
> when new async event comes in replay mode.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay-events.c |    1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index a1c6bb934e..92dc800219 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -126,6 +126,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
>   
>       g_assert(replay_mutex_locked());
>       QTAILQ_INSERT_TAIL(&events_list, event, events);
> +    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>   }
>   
>   void replay_bh_schedule_event(QEMUBH *bh)
> 

Do you really want to notify the vCPU, or rather the main loop (which 
will run as a side effect of the lockstep behavior that RR puts in place)?

The reason I doubt you need to notify the vCPU, is that I'm not sure why 
an incoming event would cause you to recalculate the QEMU_CLOCK_VIRTUAL 
deadline.  Rather, perhaps the problem is that a bottom half cannot be 
run right away?  And if so, probably the issue only happens for a 
running vCPU (not a sleeping one) so you only need 
qemu_cpu_kick(current_cpu)?

Either way, your commit message does not explain why it is needed and 
how event are missed or delayed without the patch.  This is especially 
important for something like RR, which is pretty invasive and understood 
only by very few people (I don't put myself in the group, in fact).

Thanks,

Paolo


