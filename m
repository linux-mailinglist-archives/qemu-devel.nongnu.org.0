Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0E3FE929
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:13:11 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLfyI-0004vf-6a
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfwg-0003Ju-4F; Thu, 02 Sep 2021 02:11:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfwb-0007lr-Cj; Thu, 02 Sep 2021 02:11:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so468548wme.0; 
 Wed, 01 Sep 2021 23:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SwS2yU3eNtA/0jXdXLasMfEAQTNQV8yAzA0XBOzs7/Q=;
 b=jYWLyjla0fJGuaN9opTfmg8V0lznnrsAkxC4i58ORnrQXSeYI9ZSqm+nUOfp89fLpU
 +AKArW8Wjpk0/ao0kXBE2GyU8KcH8D62DZ08YATj+iw9dnuGSH8wl/94s9fXPJUvX9hD
 mMMAGBV706pL9/tDLnkzfxUhBwGH59JjgF/+RkiBPTiqfYe/nN9BKDHQ8iaqBdGOWiNq
 z1yE7hM3/B+62xwCR+h+iH+zy0cQrje5BsQxsiwFao9iBsYiu15hG8S5t/Jxq92cJFu5
 OYX7Vu2xIzMPtjqTxR52kriCbhwbEoaXKt7QMPTY24MdtXz/dU3gl3kfbqJxPvF6/NPu
 ITqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SwS2yU3eNtA/0jXdXLasMfEAQTNQV8yAzA0XBOzs7/Q=;
 b=NTBWWS4/Ofn6o84ah5Tt1BQeWnw0yyedQ5zVWmk1NBlvaQDLOvv8vbdH3cjKBP6UwG
 1TmJAnVcIxJqbKSEaHY5R9Ys/sfYUStcBV7IDi/ZfC3DgjsC9NAUvwGDDPZKuyWgjdjB
 RWhXkybMsCxqXERaYMlTUxk2sxUgD+SXwlK12/8M6o5eMyhZKJNop7d0yXPagoIe1/rw
 iYUmhwcIPgWcxKiRc1a8W3impUKmNGDxsqnpuH3JfiF/+m4bGDp7O8ULeKH2SdEWxzj/
 89O//fmf/xt37mciGNuNf/YC6p2L4uXezctwHYDoTyXIIsUOXnnwDaxEsEc8dklxnUDU
 6KHA==
X-Gm-Message-State: AOAM533MsC34oUp3UXVg5ba5gE0i/v+HELtH6gtdEtUgIq3I+iG46qBS
 Mz4tzqM+PS6sadWO1APxPiNbRHl2U/8=
X-Google-Smtp-Source: ABdhPJz/gnIAYv8+u2bhr+bC3RgLH8xuAD1maFur1gQc3qrlBsAodHcEq7W+NRnQIyblL8Z1JMtRqA==
X-Received: by 2002:a05:600c:3656:: with SMTP id
 y22mr1367187wmq.58.1630563083397; 
 Wed, 01 Sep 2021 23:11:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p13sm824173wro.8.2021.09.01.23.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 23:11:22 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read, write}()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com>
 <869636f3-6e6a-d5d3-e377-1634f8165aa4@amsat.org>
Message-ID: <bf3ad08b-f1c8-317d-6378-3e33b5279573@amsat.org>
Date: Thu, 2 Sep 2021 08:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <869636f3-6e6a-d5d3-e377-1634f8165aa4@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 8:09 AM, Philippe Mathieu-Daudé wrote:
> On 9/1/21 5:27 AM, Bin Meng wrote:
>> Read or write to uart registers when unclocked or in reset should be
>> ignored. Add the check there, and as a result of this, the check in
>> uart_write_tx_fifo() is now unnecessary.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>
>> ---
>>
>> Changes in v2:
>> - new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()
>>
>>  hw/char/cadence_uart.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Just realized it is simpler to implement MemoryRegionOps::accepts().

