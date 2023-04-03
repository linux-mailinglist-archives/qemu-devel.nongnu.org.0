Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89AA6D513E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:22:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPky-0001Y0-GY; Mon, 03 Apr 2023 15:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPkw-0001XR-QD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:22:18 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPku-0002lD-R3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:22:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id ja10so29075355plb.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680549735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fHM/XJB+JJ1KiZUHbqPwZhUFMjcB72KV04DtZgiO8U8=;
 b=wD0Dc4Gp4Vva5+HFEVKexbeYMaN4l8ZwMk5JH1x8kyzTyKgo3FBTdgurPGZX6tTX2S
 Se/fJo80gNkstQTiMEtFOrV4SeulKQgX8DgnAF8ZLhyVcpBABJN5EEvotip6V0M8e/oS
 EGEKX1qP6zry2fNmIH2xn/axfqogML5IQrJZhPmL+j5ARyEDxuUUWPJGIjpuV597de2n
 6w428NmKz4YHRkewsOYIggskLZSN0vqwopPu0yARq118JyZfM/1r48O5h40WP/P8wbiD
 XweMhJG2zyVTXLHBCRVKjDjgPEd1MqxxnHUgkctv7ycjuO7LllWa1PIqERvA3gykYhy8
 TTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHM/XJB+JJ1KiZUHbqPwZhUFMjcB72KV04DtZgiO8U8=;
 b=4vsjiFFWJvDCZ+fiTfpc3BP08FK5bxo0oN3JmHLj+PtaC1WdMfRx3B06B0a4EQTeba
 9ichH9qwSY4s9YPOed9G5tMjuIWS3MVOLKULwSJ8zyk5BHoAMUQmMUe+Lwt4c0FWnfUP
 Ex9ISfbdmal16Q3sXdNO6S69jlnE945mLLgcOvsB2ggADYZXzY7KHDn/bKcafb0+0VhC
 6XZqUX0XfGQGjWEQaXGq8kz8TIFTUwm31Rhmr1DHuZ3yfbhvbXyZf5yZ7OiM/QJqLMKL
 zsBpdVjsWUkKu1XAzfXeyDh5hXXDR++QAzh+XbwlATxdX1iv4UC+Wgdzx6UQYg7lLfe9
 9fCg==
X-Gm-Message-State: AAQBX9eNNtifdzBg3UKPfjjkN44T+dmkMl5rJQDHAmL+hlyJebmEaE67
 5bKmJEcbdoZ3G08RHNWveV30og==
X-Google-Smtp-Source: AKy350bYCHKUETHtTVCC6qKbISfbWf+hZMeY34dhEdyYxmnEtg3YpnaouEX5AT41Y52LR+DsASTytQ==
X-Received: by 2002:a17:90b:3b4f:b0:237:161e:33bc with SMTP id
 ot15-20020a17090b3b4f00b00237161e33bcmr24028pjb.16.1680549735262; 
 Mon, 03 Apr 2023 12:22:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a17090a714300b00230b8431323sm6502698pjs.30.2023.04.03.12.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 12:22:14 -0700 (PDT)
Message-ID: <3641e452-113c-8d69-76cd-6ad94554c044@linaro.org>
Date: Mon, 3 Apr 2023 12:22:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 07/10] hmp: Add 'one-insn-per-tb' command equivalent to
 'singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/3/23 07:46, Peter Maydell wrote:
> The 'singlestep' HMP command is confusing, because it doesn't
> actually have anything to do with single-stepping the CPU.  What it
> does do is force TCG emulation to put one guest instruction in each
> TB, which can be useful in some situations.
> 
> Create a new HMP command  'one-insn-per-tb', so we can document that
> 'singlestep' is just a deprecated synonym for it, and eventually
> perhaps drop it.
> 
> We aren't obliged to do deprecate-and-drop for HMP commands,
> but it's easy enough to do so, so we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst   |  9 +++++++++
>   include/monitor/hmp.h       |  2 +-
>   softmmu/runstate-hmp-cmds.c |  2 +-
>   tests/qtest/test-hmp.c      |  1 +
>   hmp-commands.hx             | 25 +++++++++++++++++++++----
>   5 files changed, 33 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

