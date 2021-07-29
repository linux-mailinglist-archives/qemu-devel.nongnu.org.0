Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98613D9D80
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:16:03 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zKt-0001Ns-0s
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zJP-0008E1-GS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:14:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zJO-0000EG-6I
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:14:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j2so5354336wrx.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ridnCXaFy15F3kwYev4gZcZsFZPy0u1s5PgLqDmip3U=;
 b=G2ScyD6DwgW9W+Qe2j58arbMiUaA/hyhWtYvO9SNz5BsYun/QZ66Jf2gZOXkI0pXTS
 cMlLUrngwCuyvG7omnN0S1qmXGndFU9+daMlLlhfCX6unpb6LunkoHhLnZynXEI17MtN
 t9JSEyLyl6RG3Sl3dx7iQKgCQ33htRTgZzFUnuVYPadQZPUS2ijLODcDfvafG1JgGMIS
 0C0PEe2+QoaOaIw4NEdovUBowTSdghcwGvvbyVBmH9NaqWeXuNp9RMuGEP3vK+Gy8J3w
 0DDiuxl0pqZHMnQPGo7kTuA0lQA2F/hLjv+GSzkZ2E/ME6oixi9ApPLXOh9GBBzt3lnQ
 iOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ridnCXaFy15F3kwYev4gZcZsFZPy0u1s5PgLqDmip3U=;
 b=UAHZujk2GUioTtshHhB+VuEJ332H82FHiNvFWXzPMid8zFg56VDyJ6KemZqxvJvRCz
 4I0jX0YByuh8N+AdkxkwwpaglQGsorTmIE+P55tWjR8cKmEE8zAaMneAMyKMBkWzKcJ7
 CM3Z7jCu52K/G/yv2M8gtnVRgjZIS5J/SIZGDuRXXNvQksqFJ+zHgnJ8ZZ/kRiARFhaS
 A+t+0llQE8k5rWu9wmbuw4tex3xsC4ln6eLhazeeJprxMzz/1E/KVPdgWVQM6xMA9U2j
 H2259oQh8iAdJ9nEgvWD78oErztcAZaRoXPiA4pdnqZugjD8ITDh2MM7V6GHF17LmmYa
 VQ5Q==
X-Gm-Message-State: AOAM53065+BEODuyN7V25Df3GWirX9qV0+srlDCzT+U0IFBNYA6rjwrG
 L+ozUECU1O85UCM+NpDwL4Aa2bUQxjNROg==
X-Google-Smtp-Source: ABdhPJwd15DlzJkdtk6FG6J4Jnezc1E3diPCC93IonrQ02fBfF0DeLKX6xPHsc/IrPo8BhvX0+aNfA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr2973958wrd.200.1627539268470; 
 Wed, 28 Jul 2021 23:14:28 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id r17sm7558472wmq.13.2021.07.28.23.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:14:27 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/43] hw/core: Make do_unaligned_access available
 to user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53a01834-1655-8de9-a7c6-0cc39964c9f8@amsat.org>
Date: Thu, 29 Jul 2021 08:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We shouldn't be ignoring SIGBUS for user-only.
> Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

