Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512043DE04D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:52:09 +0200 (CEST)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdyq-0004do-Cu
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdxj-0003a9-Vb
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:50:59 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdxi-00086X-Bk
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:50:59 -0400
Received: by mail-pj1-x1035.google.com with SMTP id a8so3634600pjk.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=giioyal96sr8D4WvjtsKaKobGHWFZXzqEFva1pnx4nY=;
 b=IaMV5LEAqcC3KzjggxcU3CgGNccsK54Wn7kIf8lMH8IinEN9wNqyZFG5aoGY8KpYj4
 FmcJ9jIRhXIXbII2SGabyEbydP3xUi54E/mfIH0MffkDEIMJii5S5ATBTj7nbt8peR7d
 jPziRS1Q1Lmw25hf4n94oXfSaNGs0W0/3NqLASi05qaZsSHs3faLChADg4qyAp+QcxK6
 BpMAbFyQ9fo/x4N7RHUF/PTZZKmABqNncVNKz05vdsKZqJULSs9N51O6SYDgTnDDe4bV
 3ds6tzYU0a33ELuh/2PhQ8D8G6LHXEszFjo9vYij5HQ2GAXGvBXA0pWn0yBscuvP1F1C
 itGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=giioyal96sr8D4WvjtsKaKobGHWFZXzqEFva1pnx4nY=;
 b=HigsiB4gP1f9QVHSmTgV6xitbI/UdwXnSTTQKy+xHGphb740S7hvvhC1hZMFhZLAzi
 UwNKey7fE99epJfgmIhSMt9hQyshzIAyCbamsMgOF+sqcdDhXtTkaxkWl5cKvax+JreP
 1aQTZgRsAH84LxiW3JpAP9eMGFfBcWtHe2BedBJQTxSrjhsAgXwdGZZUggwVZGCAsQOo
 55kASg6zYNdfyVKrwWzVuKiKz2V1HPAGiMyNLYoDXBqg020jwIiTZJa6HlMF2JyKpjZh
 NnmjIYLyR1sQ71z97g/7WmHhP9L71jO3r8u94ahKHs9aqQZAwBBMaX8DzdlMLjEDjrNG
 yIYQ==
X-Gm-Message-State: AOAM5336I0+qvA70+yXt3eJOpiZbltc/SPT67FpmOY+USuHixvUBh5Ji
 unyqOoZSt7rGx63qFeqE1FW0sg==
X-Google-Smtp-Source: ABdhPJw/v9CwRA05XiTt6wG5IszD1+MMN+RWebIYzjW6jHTcM6pS8TqUnlYqwvOGyt+hvcrOM/biTA==
X-Received: by 2002:a17:90b:3581:: with SMTP id
 mm1mr509122pjb.98.1627933856412; 
 Mon, 02 Aug 2021 12:50:56 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x8sm5700339pjn.10.2021.08.02.12.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:50:56 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 3/5] target/mips: Convert Vr54xx MACC* opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801235926.3178085-1-f4bug@amsat.org>
 <20210801235926.3178085-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b8cf681-08e9-4e6b-c037-aec831dd6221@linaro.org>
Date: Mon, 2 Aug 2021 09:50:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801235926.3178085-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/21 1:59 PM, Philippe Mathieu-Daudé wrote:
> Convert the following Integer Multiply-Accumulate opcodes:
> 
>   * MACC         Multiply, accumulate, and move LO
>   * MACCHI       Multiply, accumulate, and move HI
>   * MACCHIU      Unsigned multiply, accumulate, and move HI
>   * MACCU        Unsigned multiply, accumulate, and move LO
> 
> Since all opcodes are generated using the same pattern, we
> add the gen_helper_mult_acc_t typedef and MULT_ACC() macro
> to remove boilerplate code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/vr54xx.decode      |  9 +++++++
>   target/mips/tcg/translate.c        | 16 ------------
>   target/mips/tcg/vr54xx_translate.c | 40 ++++++++++++++++++++++++++++++
>   3 files changed, 49 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#define MULT_ACC(opcode, gen_helper) \
> +static bool trans_##opcode(DisasContext *ctx, arg_r *a) \
> +{ \
> +    return trans_mult_acc(ctx, a, gen_helper); \
> +}

Perhaps copy the TRANS macro from ppc/translate.c, so we don't have to have so many 
single-use macros like this?


r~

