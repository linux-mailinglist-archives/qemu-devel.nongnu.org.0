Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50037229A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:42:31 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgKk-0001du-5F
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgIK-0000Re-9p
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:40:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgIG-0006v7-9i
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:39:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id v12so7100968wrq.6
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XFKtCaDBomo0859eOmvWPYpYs+ZKNuohP3uxrrZDplo=;
 b=Ncfoo9GDLNo5MUr7iHvBx1vwOWi8C/dfhfBd7pSm0bJYqleOp/g+SpSfKAS3oMnpO6
 LXENDv9bBONISACsuYnfM4O7O9IxxL/unQED/IzL7WufuSo+7JrRtfnwa6LlH5ucuEed
 WSR7Jb+in18bh0i/BWuUtsM8HBkmxhCFnnhVW15NjLCEA2A/xav5aBgFzeJGxy65uqAX
 5zzyF8GQs7w10RDhaTG0ZvN6dauC8rByoV6bHL4LAczjvpWoY/wgQBC55jvm94gMfWTi
 IJkp4czS9K1iBmxBgHwF0jow28o58rGWB7NSQVPZNFpDqMIUS6DYt5NUS6jrfMEdox3L
 nojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFKtCaDBomo0859eOmvWPYpYs+ZKNuohP3uxrrZDplo=;
 b=QjebddbGQ2tO7rbYOYLvvHAmkgV7Xkv8I+GEjplskDfzQDaNnbPdn1eui7tjXn5Cmk
 3gGjtIiVpO110UW4zowUGxDg0220OQiXgheovZxZ5aJnctofkS3fSj2sxLLW1FwFd6yx
 44rDVdo4ARWBqsqKSsuzqAM9ZO29pYLz6s8mcO8rNsuT8ytoMBze0PhhwaV5Mrpop3Wx
 u3OaWDkoQ/dAsgYhi7TC4qBIdteStBYm0/XIp1p6XT/IF0Z3H2dNXr5n6E8EbRpsyk4b
 6kz6amqbVi47tNEVhlY3uqb3aZ46HCnl8MErH9RIYUq2JD/ThIvR0FnCgyZleF32qDQm
 GHug==
X-Gm-Message-State: AOAM530ytJANRqIN93vtE71xiehqk9fNqCU3A6cZaZNyU7O56z/cgcsY
 iu3QMxURQ+1tiUVm5bNiNi4bWKQNHUWLBg==
X-Google-Smtp-Source: ABdhPJyRgvIHl7I25DdAnjKKU0kZGCEbPKHO1xkyqiFju70vN4QufAFn0jeljFlduMVZZKG4nWB5vA==
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr12467357wrh.373.1620077994178; 
 Mon, 03 May 2021 14:39:54 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id u5sm12695932wrt.38.2021.05.03.14.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 14:39:53 -0700 (PDT)
Subject: Re: [PATCH v6 02/26] tcg: Add tcg_call_flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <046849de-ef2d-7267-166c-4fd3ceed8952@amsat.org>
Date: Mon, 3 May 2021 23:39:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> We're going to change how to look up the call flags from a TCGop,
> so extract it as a helper.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/internal.h | 33 +++++++++++++++++++++++++++++++++
>  tcg/optimize.c |  3 ++-
>  tcg/tcg.c      | 15 +++++++--------
>  3 files changed, 42 insertions(+), 9 deletions(-)
>  create mode 100644 tcg/internal.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

