Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAE34CD41
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:44:27 +0200 (CEST)
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoRe-0005oJ-NF
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoPe-0004Ry-1A
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoPc-00078z-CW
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617010939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5X8xHo2CAgVzDpHzbTsjYMKZL/Kb82vidqtM8LLymK0=;
 b=MrqJ1Q1go7sHmpobZcDCPICf4a4TKrnCJIE8Vk0plY8O/T7UlK+7OjBt9gzQ+wc/mGyRFo
 70yyB8HyfjrwViB/ZHd935wIFX/wZ9mfS2g/GtNiobSJwUXYvT5xKjQ10VlP/1PfAJ0tnk
 RBlElzr4dF/hG4gifOT2u4uzEzasV/Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-KsUy5HQxOWadRO1cjGd63Q-1; Mon, 29 Mar 2021 05:42:17 -0400
X-MC-Unique: KsUy5HQxOWadRO1cjGd63Q-1
Received: by mail-wm1-f71.google.com with SMTP id n17so1414804wmi.2
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 02:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5X8xHo2CAgVzDpHzbTsjYMKZL/Kb82vidqtM8LLymK0=;
 b=KcLK7n+odpYNPq2qOnn8r1RSeqbHa5nBsgr/1+pZH6YsM0d2PcxZ4snUd1/8xoQjlR
 iAemaDz+KQoPT4jVsLZe/iY5h44uxmUkZeYGLhyZFz1q9ZYQpldS5bMFzzduOfwbWVsf
 obQUQlisYEFtCG4cb494SNQCwYBfsAbUZ2II3gmyN9OPNI4zl8wu2RaC6tcplrSJA/xX
 Zby4Ilees8LOC1UYcDjwy12AJHb1eNgmclwLvlsvkB23p/xY33sk83qjY8pzEHENgl5u
 2qiJhWRFDEcrUBYl0CnTtLHlV7RKKUqs/5BYeRZu/Sh0P76ImtVeIaFUGGfCFZQpSGPn
 91Fw==
X-Gm-Message-State: AOAM533ap/rzfLz2suB1PeMYxuCeiYmpldn4rLRZsto/pMR78zcw0mD+
 zCTvxzTiAGxjk9cnBROrc4RlDqxx6iKYgH30DYfJ8j7vB/pZdvQvPMEgmopBXjklOvTnO9x3c+j
 DGZD2iVeEWHTqylQ=
X-Received: by 2002:a5d:526b:: with SMTP id l11mr27194254wrc.385.1617010936209; 
 Mon, 29 Mar 2021 02:42:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdI5j3khU2Vh77OcGrDUNNKvi5T1Ogp8L0wygd49URYrBT4Utert3quCNkNq3upbkcWnaLug==
X-Received: by 2002:a5d:526b:: with SMTP id l11mr27194238wrc.385.1617010936010; 
 Mon, 29 Mar 2021 02:42:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s8sm28983697wrn.97.2021.03.29.02.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 02:42:14 -0700 (PDT)
Subject: Re: [PATCH] replay: fix recursive checkpoints
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a2b1a26f-4ed9-cb0c-5fbe-0ae599006738@redhat.com>
Date: Mon, 29 Mar 2021 11:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 29/03/21 09:59, Pavel Dovgalyuk wrote:
> Record/replay uses checkpoints to synchronize the execution
> of the threads and timers. Hardware events such as BH are
> processed at the checkpoints too.
> Event processing can cause refreshing the virtual timers
> and calling the icount-related functions, that also use checkpoints.
> This patch prevents recursive processing of such checkpoints,
> because they have their own records in the log and should be
> processed later.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay.c |   11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/replay/replay.c b/replay/replay.c
> index c806fec69a..6df2abc18c 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -180,12 +180,13 @@ bool replay_checkpoint(ReplayCheckpoint checkpoint)
>       }
>   
>       if (in_checkpoint) {
> -        /* If we are already in checkpoint, then there is no need
> -           for additional synchronization.
> +        /*
>              Recursion occurs when HW event modifies timers.
> -           Timer modification may invoke the checkpoint and
> -           proceed to recursion. */
> -        return true;
> +           Prevent performing icount warp in this case and
> +           wait for another invocation of the checkpoint.
> +        */
> +        g_assert(replay_mode == REPLAY_MODE_PLAY);
> +        return false;
>       }
>       in_checkpoint = true;
>   
> 

Queued, thanks.

Paolo


