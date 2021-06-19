Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB913AD900
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:34:17 +0200 (CEST)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXMm-0006zm-L3
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXKN-0005Ic-RC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:31:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXKM-00083M-EU
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:31:47 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j2so3000411wrs.12
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0aNkCLsVW4yjKoW6vvU1rdar2x2Dpp0x9quK+8UAWRI=;
 b=J8uo/bqV2+2S67AaCwXH271JRBwqmm9G6xkp+yuBq8unV39ZD1Wy4hIC3tXfU+jswN
 I+Dcm4IxGdplYDLx0AmjnfZgwkr+EOQ4zaPogf43mxsqY6zIs1wBQ8ZkoZ1xrqNxlqt2
 BiGR3+c8a0WDKiLZHDOkqEzdr9fAEkFSp6HOELloAijaK7eW3jo810WWn5b9SCCLV97F
 a+rJzwo9ZBoxb/PZ9ByNKtJ8haZmAy50ZahpGpBUnQStatmTW3YzpNWZEUhWAKcZBKSZ
 L9+wYrmYwGtRIdtlL+ruAWiJHt63ZOMo4QeFOHL4Qnl+fzgZ2n60/oMuEARoQX5aeCl3
 PpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0aNkCLsVW4yjKoW6vvU1rdar2x2Dpp0x9quK+8UAWRI=;
 b=Nh7ndfC2FKLnYcOz0qg7qgcdBBPPDGkKOTmXerDq9anHXFuda+n/KU+hzmVnmloXm5
 cAt/cFefH7eX5ebZ9q8U5R9Y7DXjsufbHEqp7DhpNaumwkuuq+tlc5DsgK8k1r+GYYl1
 zHA8Iv3A/ZDa7brGyTTLMTrqScGa5qj4Lze4hEmQNCIT86s+hmYNRbGUVs+Ukl6FXTH0
 mrNM/5B822V9B4EXOIOGwoz45LW/7BSkfRsltrEKwJhhApUAEj1XbqhGzGekt/jrZvBB
 gZmVlkd/JrZ80MSOI8S8ij5TqOWNhH+BZRPGqcxi7g4wiXGETrD0MtLDbpEjv/5RcVub
 G1KQ==
X-Gm-Message-State: AOAM530KgoEE8aYV24wL3MxetmfMehrHfjw/mYtEAV5ekXToTTdVcgIg
 A1hZj8V2Z0S7118kZGgFRzw=
X-Google-Smtp-Source: ABdhPJxBWypEJNHXAH2Kj0JT7tab8enu1ou/1s0KlE4+KblA1Pn/hsIrurJ12OjBApD/h/6pprcl+w==
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr7080034wrp.70.1624095105196; 
 Sat, 19 Jun 2021 02:31:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f14sm10868575wri.16.2021.06.19.02.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:31:44 -0700 (PDT)
Subject: Re: [PATCH v2 08/23] linux-user/hexagon: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <684379ff-3076-165c-33e2-afab94f5c970@amsat.org>
Date: Sat, 19 Jun 2021 11:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618192951.125651-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 9:29 PM, Richard Henderson wrote:
> Continue to initialize the words on the stack, as documented.
> However, use the off-stack trampoline.
> 
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hexagon/target_signal.h |  2 ++
>  linux-user/hexagon/signal.c        | 19 +++++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

