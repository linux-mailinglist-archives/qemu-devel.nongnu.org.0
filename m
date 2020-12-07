Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477532D1D4C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:29:05 +0100 (CET)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmP0C-0008UV-CI
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmOyq-00083I-KY
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:27:40 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmOyp-0007al-3R
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:27:40 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so21736123ejb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lunY6IPWf+RfyUke3rmqlpFJcxA5t0HUA/rgshX+BsU=;
 b=u5MYPlA/REfSg6gFIoKyoAZEziomrRnt44rmPikw8ZeCA6jH0k+wuwEYAyz3wHo+ls
 dBIhqzsyBJPcBw/1McLKBD1eQQjSJTl31tCcROQuXEdgf6nubO3GzmBTIIxlqqAUnn9R
 +q//dR0t1WofgOLCvWeeQ5tSs/zTbR2jVtNQMqgFm5TLRuQeOCZAK6vrREut6Om894SD
 kr6DcCN2zT5YY4kxPbVH1ytMQFb7bhjdYGe3NiotnVaf/v732GpWPzv1h40NtoBxpjQp
 GBMGHi7+6a90HxQiJgos9IWHP4Hqqvi669EafpXXthFyO2b/d6EIhw/QLVzoPwKh7U6u
 GSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lunY6IPWf+RfyUke3rmqlpFJcxA5t0HUA/rgshX+BsU=;
 b=YcQymQxCvglmqkBb/jEjszNIEJdr0iyUb9LCG+iZDj1yjkQa46CZJb8JYmpxJF1uDb
 tsMdmEI28O3ZzOP9yl+YuegJ1tP/DDTu0hPtB/Op+6fxqNjUnLHDxMyBzczlw6Kmwv1X
 1mTxv7Av62C4PfMeBqEguwRIgSSMNxx55t6qhUVWFpmhlwD+JZ0yyeSeZTq2ESKV8/hv
 5zB7nLphkw8pGXAqxJ9T17k5enE48aZ1uzaoZjU51+Qrvnt/dt6OLbBbxcRcTRFt/3bm
 IwlHOmIj+og0W5NF2fk3fSWDTDWeFSXWjpTvezmjm8EZmjxfYuUj2teLHDrT7qRiUubk
 W/6g==
X-Gm-Message-State: AOAM533X+QrU7D+EXICTHlbR+5xVciLRIIKxhmg0ZOfv1MAIzL27mGel
 BZl88dlMlkh7/+lJWWvNNw0=
X-Google-Smtp-Source: ABdhPJxCqcWLdsQN4nSuJFOIt9atw1A+yNVP+B/vbyJb8tBlcxCh8Q9rpj61qOwT2Eg206l+v+KUiQ==
X-Received: by 2002:a17:906:1498:: with SMTP id
 x24mr20290017ejc.170.1607380056491; 
 Mon, 07 Dec 2020 14:27:36 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q23sm14415200edt.32.2020.12.07.14.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:27:35 -0800 (PST)
Subject: Re: [PATCH] target/mips: Allow executing MSA instructions on
 Loongson-3A4000
To: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201130102228.2395100-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a009ebd9-fd09-0a52-94e9-1acc435888eb@amsat.org>
Date: Mon, 7 Dec 2020 23:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130102228.2395100-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 11:22 AM, Philippe Mathieu-Daudé wrote:
> The Loongson-3A4000 is a GS464V-based processor with MIPS MSA ASE:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg763059.html
> 
> Commit af868995e1b correctly set the 'MSA present' bit of Config3
> register, but forgot to allow the MSA instructions decoding in
> insn_flags, so executing them triggers a 'Reserved Instruction'.
> 
> Fix by adding the ASE_MSA mask to insn_flags.
> 
> Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Buggy since 5.1, so probably not a big deal.
> ---
>  target/mips/translate_init.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to mips-next.

