Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B968F2C2D37
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:46:01 +0100 (CET)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbS4-000557-QB
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khbAS-00041n-Vk
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:27:53 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khbAP-0002KY-Io
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:27:48 -0500
Received: by mail-pg1-x542.google.com with SMTP id 62so17910874pgg.12
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 08:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v7R0yEHqBfwUpftQm0xmC6ORTp2VBPF/dVT7Xedx6Ig=;
 b=cD5yJ5ulUrTyBc8PWFjIh6G55dVY6pr6FLW3EqTcfLyNjXDrW6/bVgdR9Bri06jtN8
 Y7w/GwplBNpzuN6bfDd9aqsOqTORvTIe0IJAZIy9kE0dm/uyc+nAiyR1jrbkHDMxO646
 e4Fek/LD8IyqCR+Htb/c60F6H20UxvXuMzWjk97W3PYuj7H6nX9VWH0K7Fob0L1QNPOl
 3cA9Rn1XET4Hqsx1tXlpoEDxdNWDZf1VDQ2RgAD0wOMj6jgEgPT6C2CbT5Bd1gc5NROQ
 ieoWs+FxdeAGkLd79u32nydcl0C8Wre82EPknH82+UXhk1ElHC33hIZr3t5aacBNAY6x
 +Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v7R0yEHqBfwUpftQm0xmC6ORTp2VBPF/dVT7Xedx6Ig=;
 b=bBrmgP3GpfWu5VQHI0VuJPxxxPg7khnjYwTxU2K/o49/NlknTIg2P89vduq+aZhhtM
 ZjKGvyBkc9bKzy/QDh6UW8HKooSuUvbR0Lr3AjcnWMt3h1DflGRa32wvTXq8syhIagPb
 lSKWG9ODKVWkYS4YdlD6/AlzcDGmFJeHFFXQzEbRCAiw2eKgbxAyX9h3Vb8cLcQQDYSi
 hwYGVVOiSmtIqGWM+2nyLzzUV3fETuhkvi08QNGlxqxxQKqUI2mUtqH5K55xw3qCevzn
 QBx7q0BYdT5hzFYU7rTowmydcNSMKuGn0iBtK0hQvFW+FjglWUwCzgmyOvSU4r1deYoU
 RH5w==
X-Gm-Message-State: AOAM530Z9QY3DbJrRTX8svTudorH+HnozdP5/JlF/f5U2PpJ+Y0v9Tng
 vCw64oqt2fcoJvH7M7w+owtiB5xY85ff/w==
X-Google-Smtp-Source: ABdhPJwCLT+uEzMNwSfpRLbW9kXQmeOff395pNFuiXzJyVf16ZCeYxcww41TS3BbvIOuN58vkYgFSA==
X-Received: by 2002:a63:3e0f:: with SMTP id l15mr4419632pga.208.1606235264222; 
 Tue, 24 Nov 2020 08:27:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id p15sm1092350pgb.40.2020.11.24.08.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 08:27:43 -0800 (PST)
Subject: Re: [PATCH] target/i386: Check privilege level for protected mode
 'int N' task gate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201121224445.16236-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b7cd394-0598-9302-0e2d-fb26c71ceefd@linaro.org>
Date: Tue, 24 Nov 2020 08:27:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201121224445.16236-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 2:44 PM, Peter Maydell wrote:
> When the 'int N' instruction is executed in protected mode, the
> pseudocode in the architecture manual specifies that we need to check:
> 
>  * vector number within IDT limits
>  * selected IDT descriptor is a valid type (interrupt, trap or task gate)
>  * if this was a software interrupt then gate DPL < CPL
> 
> The way we had structured the code meant that the privilege check for
> software interrupts ended up not in the code path taken for task gate
> handling, because all of the task gate handling code was in the 'case 5'
> of the switch which was checking "is this descriptor a valid type".
> 
> Move the task gate handling code out of that switch (so that it is now
> purely doing the "valid type?" check) and below the software interrupt
> privilege check.
> 
> The effect of this missing check was that in a guest userspace binary
> executing 'int 8' would cause a guest kernel panic rather than the
> userspace binary being handed a SEGV.
> 
> This is essentially the same bug fixed in VirtualBox in 2012:
> https://www.halfdog.net/Security/2012/VirtualBoxSoftwareInterrupt0x8GuestCrash/
> 
> Note that for QEMU this is not a security issue because it is only
> present when using TCG.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1813201
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/i386/seg_helper.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


