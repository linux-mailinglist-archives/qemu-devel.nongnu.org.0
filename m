Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5526E5B6F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:03:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogIm-0001HX-Qu; Tue, 18 Apr 2023 04:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogIf-0001Fl-6M
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:02:54 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogIc-00029X-Qr
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:02:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o11so9410820ybk.11
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681804969; x=1684396969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7orP+Dehk9SpC4m2sfUMHGJ+U5eE1vPd1wsl86ksqYE=;
 b=LyvJf0/ShQqs/ntjJD3uV9F4DFX4IoPh55hSLQtiO5Y3lmBP75l1+warTpBCGQffwO
 zAZt0xBYEWggyzKb9BwFB5X7cvWH613BC8OD9bculoPOGF32aSQrQ0box49gUKSugbqn
 Ch6DL7LtJ813lTwsL3K7pPNV3A+V4GuQEBfKeqDNnQNb7xJYlUgvPfL7lnOAsVuUD6GM
 qwfML1oC03omFe24f8mX9h0EqNOdymB4ZWHs/xgZID5JkMnesCVJPYIEajGU2rgcq8et
 AuVW4Jyj0R6Nz+/Hrcnb/7heqHarej7cPmDDVEYXtW0apw9k7gMoYbglBM8F6yZARZ83
 tczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681804969; x=1684396969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7orP+Dehk9SpC4m2sfUMHGJ+U5eE1vPd1wsl86ksqYE=;
 b=dYqBaV0L188TyyDMTi8UrzUsCZrS5L7ZMHI5+a2Ts0j82mvUnHPFwmSJ17CqVrOXDd
 B2QRUdd1VvkhZIZx3RAWl8cm+UDLXJbatRxrK1vonkAJD8Q68QVYm5+Y/7dK39HrAN70
 RWRscJwNKrFqEbdnKy1GjAx9SbM0AroR18ocMNBoJCQgXOUzNqcVl7Jp5bBg+9MdNjGI
 5ar27JDLkzxHK+HHYJbKITUIlyUJ8Zhb5wVSgC87dxlMB/AUdSUcf4SGU5YZP6sxeXZB
 Oo3fsTE2zR1h2Vx80/oUWMxMeIouK9+zYM9g3ftP7KSmwoi2TRgn6LUO5ng8l0lnjC55
 iXKw==
X-Gm-Message-State: AAQBX9cxIlMDGFEaEKToOzNao5bKNWC9VjpiqQ0UWXzEwbXlDyVDnnbG
 KfixZXoQFi16FEG2TFCMbl88cg==
X-Google-Smtp-Source: AKy350YuoVD7b2VpfCm8UmPrwT36NQ8Hmo8L0lUhjrivDPioKPA1ECxi7B2Trw+aLfznCtZRv37Q4Q==
X-Received: by 2002:a25:aba9:0:b0:b65:89bd:3c85 with SMTP id
 v38-20020a25aba9000000b00b6589bd3c85mr16396381ybi.4.1681804969677; 
 Tue, 18 Apr 2023 01:02:49 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 f185-20020a2551c2000000b00b8f517ecdc5sm3520128ybb.35.2023.04.18.01.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:02:49 -0700 (PDT)
Message-ID: <eb9e2777-ccd9-0d23-118e-9925690766de@linaro.org>
Date: Tue, 18 Apr 2023 10:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/10] accel/tcg: Use one_insn_per_tb global instead of
 old singlestep global
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417164041.684562-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/17/23 18:40, Peter Maydell wrote:
> The only place left that looks at the old 'singlestep' global
> variable is the TCG curr_cflags() function.  Replace the old global
> with a new 'one_insn_per_tb' which is defined in tcg-all.c and
> declared in accel/tcg/internal.h.  This keeps it restricted to the
> TCG code, unlike 'singlestep' which was available to every file in
> the system and defined in multiple different places for softmmu vs
> linux-user vs bsd-user.
> 
> While we're making this change, use qatomic_read() and qatomic_set()
> on the accesses to the new global, because TCG will read it without
> holding a lock.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> In discussion on v2, we talked about combining this with the
> 'nochain' flag so as to have a single 'tcg_cflags_global' that
> held the flags for the current (one_insn_per_tb, nochain) state.
> I have not attempted that here, because it's a little tricky:
>   * util/log.c is built into some binaries that don't have an
>     accelerator at all (the tools), so it can't simply call
>     current_accel() to get the TCG accelerator

Ah ha, yes, tricky.

>   * the initial value of the logging flags is set before the
>     TCG accelerator is even created
> So I leave that to somebody else to have a go at if they like.
> ---
>   accel/tcg/internal.h      | 2 ++
>   include/exec/cpu-common.h | 2 --
>   accel/tcg/cpu-exec.c      | 2 +-
>   accel/tcg/tcg-all.c       | 6 ++++--
>   bsd-user/main.c           | 1 -
>   linux-user/main.c         | 1 -
>   softmmu/globals.c         | 1 -
>   7 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

