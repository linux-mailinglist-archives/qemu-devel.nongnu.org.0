Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BA3ADA88
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:14:39 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lucgA-0003N8-HU
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucbv-0006jM-Fe
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:10:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucbu-00032v-1E
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:10:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id w13so847317wmc.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QFxNa9OYnhjtwZBaF5r6wCx0q90S54vIzS0xFmavjUU=;
 b=UWqbAqe/tIwTMNnl1dAbl1gqdO+U5bjHO1lhXFT8taEPU3yfOpu5JfSlP6OFbqgiHG
 dG4LLzMoSbnfolYlDurVMKm+KH2W/U4TxpJmfXgPscWB/2IGS0o+jOAT8pjV0oElgTJL
 8eWksDNALLKY681Z+41gjPfJf3BOdFCFx2XgVlY+3ZqOVJD4U2BWHuiUq0OXM+eVuZwo
 MSPkEwwvMaUFMf8zJFL05IVbjyBpfb0A034lVmrNPYsUXQsOyt4MqVIgavnM92Yafwbo
 yrNgeae0VsvLaCgkyOfyyMaGhUPzssYjn9wFQGGugKoYQnUG4kV9qapaPHXf6isqHi74
 H71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFxNa9OYnhjtwZBaF5r6wCx0q90S54vIzS0xFmavjUU=;
 b=UuSBxrvuocjyXxgXr2lNzoWOaB6MRPKPRq/47NPyx16aNxbHlUcPRz+xlpCqTII+lg
 AZc2nQ0GWKhTO/JQQ2bexwzURaBjEm8ZV5bo+yNVhEk4WKl5GnTI1NOP2UYwB7s35i/U
 l5VXCU3ar/BcI3c6UV1/EeKkiGRpvLvyz7xjCi+lPgKrbGSTS9csFZK5kBTNVIiBWBN/
 kkqrQ9c5QSn0vXndU7R9osy9g9c3fDdECs7GEnqw2VfWsrIiwS1KiNw8lUrzhpaY8lN5
 6wA5lusv4eFNEUuAOSYFGeWHa+HDaVDDB15HdVp/TduZdGYhpwgvuqrnZiQH8M8rsU4N
 aoRQ==
X-Gm-Message-State: AOAM533IPPWDH9o83SsOY3d73nSPcpXhsOm+lxNSHA7C0xhI5O5ReyMg
 9vePNCJq0BwZKky3vDq/MsM=
X-Google-Smtp-Source: ABdhPJy1v12WLCFZf/4NU5e1Fe3gmvccmB54dOcT31hrxuVLmqFxPQjafBP/Z2hWGPoMyM5AoZ9sXw==
X-Received: by 2002:a1c:4682:: with SMTP id t124mr12951553wma.94.1624115412310; 
 Sat, 19 Jun 2021 08:10:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m184sm1074778wmm.17.2021.06.19.08.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:10:11 -0700 (PDT)
Subject: Re: [PATCH 04/11] softfloat: Introduce float_flag_result_denormal
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abfe3208-af62-4eed-20e1-ba962e3e59e6@amsat.org>
Date: Sat, 19 Jun 2021 17:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: mmorrell@tachyum.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:13 AM, Richard Henderson wrote:
> Create a new exception flag for reporting output denormals
> that are not flushed to zero.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-types.h | 3 ++-
>  fpu/softfloat-parts.c.inc     | 8 ++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

