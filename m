Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807431CDCD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:16:42 +0100 (CET)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC31l-0005Iq-IB
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC2zR-0003p6-9B
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC2zN-0001YL-Ts
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613492050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XbemDDORg/Nj5fTCWkjZd6YqPGJP22PktyH0l4mClbo=;
 b=Wejjo1GBnS7W87+UplPHRLCfldUxY07WPOqd30gQn79ESfPO4U2LuutJWBDY3vHkEbEQeR
 uGxGQOtDenP4e3DX25xwlh/VFTBOY47R280HRmw9iZmp4uvbnwCcr8fzlWagPgOcRKW+UK
 XMdMl855bPdC+qYk6anOa5uDWPFDzK4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-yYLGoDoMMsaa2PwBHqZCYw-1; Tue, 16 Feb 2021 11:14:09 -0500
X-MC-Unique: yYLGoDoMMsaa2PwBHqZCYw-1
Received: by mail-wr1-f70.google.com with SMTP id v1so7515900wru.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XbemDDORg/Nj5fTCWkjZd6YqPGJP22PktyH0l4mClbo=;
 b=tXn/93Vys/BvZmZU7hLuj65EH5rwqnAVzShwErQBzLWgP1VRX/1R1ShB/D0UgI6cy6
 9EvoiiYZ0fRF0VOwiAvcO/Z0nGP0KixUWkOZhfDa+iP4UXWnbUdz7Mkhquy8k3XoHUx4
 QC88TdAZ+GvS0i7JVaai3r3wXwuPg7pePycXwUYS3jpUOZCUFbROQNLAfuO11Yebwezq
 HsTt3nO8p/NvoRIlaQAS3+3qMOZCkg9fp4wrVUjy//6GX9SyCuUq/g8ldsus2bU30HqT
 0V3WnlHTtz3QWvzRwi0G6/7ZtxqTKE393g1QAcmYm6/b9jCZoAYnZzerjQGNJid+kiMr
 z7xA==
X-Gm-Message-State: AOAM53294sLWIoZpf1WRYFhplgJIhWwjVZ1r/79sMhfoxQ3PUgb6VGgd
 AP+7yxVPbUpn4qMec7RfrXklloL1sa+GiDXvszZfBvRttOPN+XPPXpFgbEQy+ZmaCGADvNwjWuW
 xVBE1tbKBs8mGdT4=
X-Received: by 2002:adf:a50c:: with SMTP id i12mr24190845wrb.299.1613492047924; 
 Tue, 16 Feb 2021 08:14:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6JumSjO1UGsmCXxoiuvl04rTERahXimd+SfLHtPu4sFEWhCVWSWkEg6oFYRaXoyZQSUJGkA==
X-Received: by 2002:adf:a50c:: with SMTP id i12mr24190831wrb.299.1613492047703; 
 Tue, 16 Feb 2021 08:14:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d5sm20504937wrp.39.2021.02.16.08.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 08:14:07 -0800 (PST)
Subject: Re: [PATCH] replay: fix icount request when replaying clock access
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161347990483.1313189.8371838968343494161.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5f2d2ef8-39b9-bfec-066c-81c262b77afd@redhat.com>
Date: Tue, 16 Feb 2021 17:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161347990483.1313189.8371838968343494161.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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

On 16/02/21 13:51, Pavel Dovgalyuk wrote:
> Record/replay provides REPLAY_CLOCK_LOCKED macro to access
> the clock when vm_clock_seqlock is locked. This macro is
> needed because replay internals operate icount. In locked case
> replay use icount_get_raw_locked for icount request, which prevents
> excess locking which leads to deadlock. But previously only
> record code used *_locked function and replay did not.
> Therefore sometimes clock access lead to deadlocks.
> This patch fixes clock access for replay too and uses *_locked
> icount access function.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   include/sysemu/replay.h  |   14 ++++++++------
>   replay/replay-internal.c |   29 +++++++++++++++++++++++++----
>   replay/replay-time.c     |    4 ++--
>   replay/replay.c          |   23 +----------------------
>   stubs/replay-tools.c     |    2 +-
>   5 files changed, 37 insertions(+), 35 deletions(-)
> 
> diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
> index 56c0c17c30..0f3b0f7eac 100644
> --- a/include/sysemu/replay.h
> +++ b/include/sysemu/replay.h
> @@ -128,18 +128,20 @@ bool replay_has_interrupt(void);
>   int64_t replay_save_clock(ReplayClockKind kind, int64_t clock,
>                             int64_t raw_icount);
>   /*! Read the specified clock from the log or return cached data */
> -int64_t replay_read_clock(ReplayClockKind kind);
> +int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount);
>   /*! Saves or reads the clock depending on the current replay mode. */
>   #define REPLAY_CLOCK(clock, value)                                      \
> -    (replay_mode == REPLAY_MODE_PLAY ? replay_read_clock((clock))       \
> +    (replay_mode == REPLAY_MODE_PLAY                                    \
> +        ? replay_read_clock((clock), icount_get_raw())                  \
>           : replay_mode == REPLAY_MODE_RECORD                             \
> -            ? replay_save_clock((clock), (value), icount_get_raw()) \
> -        : (value))
> +            ? replay_save_clock((clock), (value), icount_get_raw())     \
> +            : (value))
>   #define REPLAY_CLOCK_LOCKED(clock, value)                               \
> -    (replay_mode == REPLAY_MODE_PLAY ? replay_read_clock((clock))       \
> +    (replay_mode == REPLAY_MODE_PLAY                                    \
> +        ? replay_read_clock((clock), icount_get_raw_locked())           \
>           : replay_mode == REPLAY_MODE_RECORD                             \
>               ? replay_save_clock((clock), (value), icount_get_raw_locked()) \
> -        : (value))
> +            : (value))
>   
>   /* Processing data from random generators */
>   
> diff --git a/replay/replay-internal.c b/replay/replay-internal.c
> index 2e8a3e947a..77d0c82327 100644
> --- a/replay/replay-internal.c
> +++ b/replay/replay-internal.c
> @@ -247,10 +247,31 @@ void replay_advance_current_icount(uint64_t current_icount)
>       /* Time can only go forward */
>       assert(diff >= 0);
>   
> -    if (diff > 0) {
> -        replay_put_event(EVENT_INSTRUCTION);
> -        replay_put_dword(diff);
> -        replay_state.current_icount += diff;
> +    if (replay_mode == REPLAY_MODE_RECORD) {
> +        if (diff > 0) {
> +            replay_put_event(EVENT_INSTRUCTION);
> +            replay_put_dword(diff);
> +            replay_state.current_icount += diff;
> +        }
> +    } else if (replay_mode == REPLAY_MODE_PLAY) {
> +        if (diff > 0) {
> +            replay_state.instruction_count -= diff;
> +            replay_state.current_icount += diff;
> +            if (replay_state.instruction_count == 0) {
> +                assert(replay_state.data_kind == EVENT_INSTRUCTION);
> +                replay_finish_event();
> +                /* Wake up iothread. This is required because
> +                    timers will not expire until clock counters
> +                    will be read from the log. */
> +                qemu_notify_event();
> +            }
> +        }
> +        /* Execution reached the break step */
> +        if (replay_break_icount == replay_state.current_icount) {
> +            /* Cannot make callback directly from the vCPU thread */
> +            timer_mod_ns(replay_break_timer,
> +                qemu_clock_get_ns(QEMU_CLOCK_REALTIME));
> +        }
>       }
>   }
>   
> diff --git a/replay/replay-time.c b/replay/replay-time.c
> index 43357c9f24..00ebcb7a49 100644
> --- a/replay/replay-time.c
> +++ b/replay/replay-time.c
> @@ -46,12 +46,12 @@ void replay_read_next_clock(ReplayClockKind kind)
>   }
>   
>   /*! Reads next clock event from the input. */
> -int64_t replay_read_clock(ReplayClockKind kind)
> +int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount)
>   {
>       int64_t ret;
>       g_assert(replay_file && replay_mutex_locked());
>   
> -    replay_account_executed_instructions();
> +    replay_advance_current_icount(raw_icount);
>   
>       if (replay_next_event_is(EVENT_CLOCK + kind)) {
>           replay_read_next_clock(kind);
> diff --git a/replay/replay.c b/replay/replay.c
> index d4c228ab28..c806fec69a 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -94,28 +94,7 @@ void replay_account_executed_instructions(void)
>       if (replay_mode == REPLAY_MODE_PLAY) {
>           g_assert(replay_mutex_locked());
>           if (replay_state.instruction_count > 0) {
> -            int count = (int)(replay_get_current_icount()
> -                              - replay_state.current_icount);
> -
> -            /* Time can only go forward */
> -            assert(count >= 0);
> -
> -            replay_state.instruction_count -= count;
> -            replay_state.current_icount += count;
> -            if (replay_state.instruction_count == 0) {
> -                assert(replay_state.data_kind == EVENT_INSTRUCTION);
> -                replay_finish_event();
> -                /* Wake up iothread. This is required because
> -                   timers will not expire until clock counters
> -                   will be read from the log. */
> -                qemu_notify_event();
> -            }
> -            /* Execution reached the break step */
> -            if (replay_break_icount == replay_state.current_icount) {
> -                /* Cannot make callback directly from the vCPU thread */
> -                timer_mod_ns(replay_break_timer,
> -                    qemu_clock_get_ns(QEMU_CLOCK_REALTIME));
> -            }
> +            replay_advance_current_icount(replay_get_current_icount());
>           }
>       }
>   }
> diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
> index c06b360e22..43296b3d4e 100644
> --- a/stubs/replay-tools.c
> +++ b/stubs/replay-tools.c
> @@ -13,7 +13,7 @@ int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
>       return 0;
>   }
>   
> -int64_t replay_read_clock(unsigned int kind)
> +int64_t replay_read_clock(unsigned int kind, int64_t raw_icount)
>   {
>       abort();
>       return 0;
> 

I can't honestly say I understand this very well, but it's all in 
replay_mode != REPLAY_MODE_NONE so queued, thanks.

Paolo


