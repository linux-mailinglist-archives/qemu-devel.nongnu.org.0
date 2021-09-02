Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F33FE90A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:02:28 +0200 (CEST)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLfnv-0007hB-8L
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfmF-0006ib-7B; Thu, 02 Sep 2021 02:00:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfmD-0007G4-LT; Thu, 02 Sep 2021 02:00:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so979807wrb.1;
 Wed, 01 Sep 2021 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B1vyF0FWQId7bwTXnHEeutDw+FkCAGcy5KQHf8ZJDTw=;
 b=MljYoFJEaIwmS4dEg0e7YETX8lV5qIR2vz1h2VVpTgq/xhGtpeJpZgbpvqt0bJoZyZ
 eiFcyzOqigqMiBZwW04OVp/3nAHIPILouTkBcFNgTy9UnwbTL7l6GGcqJlgv1xPZi1Lm
 AyYXpU6pxnEx3zrijoKIhlqMc8aV1oo3JvTPbGY5/LEzTLIlIG9HovmUrFLNC0EPiPyR
 2BgEg+ly8chT1FZfj7qaGs995d1Fb5IxFP5q1yzOth7t6gUsyzBgw7TWGu24D3TSGQ09
 y4XH6EXVilAxjmsfh69TwDSlg3tR0FSvn8vWzK85l6RJCubaf4ZfV20qzs+X1LYlhuaF
 pknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B1vyF0FWQId7bwTXnHEeutDw+FkCAGcy5KQHf8ZJDTw=;
 b=AgW18bKhkCCjA4eIm5oOezlTIuxkZk+u+XEoh09R3LnMN+kvIsdbod9DU8LN3wrskI
 oFwETU7zlsWYMYv1adpA0p+DRFnvpGowkZyjYuyV4MMrho8gEoXuGxqKWc2z4q1MUZZN
 RdXoWtLu2t91gKgZK0uh9+zQsrF6GzDAhNrFFbXjUC31jUFcHbe1QlxqOgR+cGDUKLvT
 px2swyMAQ70+mYku148RSLFcLKfEg5IVMo9XoFwqT0V23FJjUxDyXXsR4ZIJbb9IVYfy
 Nozk+dAvIdJjjowG3lBgqusXFgoOesJtOdShYIGs2QYZ8bA4D405wR+cIek18Z1tMlBX
 Avuw==
X-Gm-Message-State: AOAM532DvMomr9uz8YtPDcQear2P3F9TXzuPPACW7R+UFAwokKbxpyLu
 k0FRHbCiN2uzFTZFKtXs2eI2GD3trTk=
X-Google-Smtp-Source: ABdhPJwRbWzWO/F+tKiM/9wzHDrYAnau9HlXytfQgZz3E0Qk1o5XxJr7k6Rn1RcEE9sabriRzl37Og==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr1563976wrz.36.1630562439269; 
 Wed, 01 Sep 2021 23:00:39 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l124sm670702wml.8.2021.09.01.23.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 23:00:37 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dd3ff9bd-9064-6a5a-3baf-3af97f1aebb6@amsat.org>
Date: Thu, 2 Sep 2021 08:00:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901032724.23256-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

On 9/1/21 5:27 AM, Bin Meng wrote:
> Currently the clock/reset check is done in uart_receive(), but we
> can move the check to uart_can_receive() which is earlier.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - avoid declaring variables mid-scope
> 
>  hw/char/cadence_uart.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

