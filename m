Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8282EF71A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:15:01 +0100 (CET)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwHs-00083j-Lb
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxwGZ-0007UA-UG; Fri, 08 Jan 2021 13:13:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxwGX-000494-DO; Fri, 08 Jan 2021 13:13:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m5so9854584wrx.9;
 Fri, 08 Jan 2021 10:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=etDvuXBAUM11ZaEBnBYy/KiVDdiLH2tl4ZJyUxGTR0E=;
 b=keXfF6Jy6+xUmQdywT4uR/AB9u9qwxiagwqP7BBlMVNNxlb/RX6OOaJUNJJggtth+G
 Gvlu2A6C0zkqsAyjjcgKw0rA6TnPIv1EjCoLl8iU88oW1riUHwk0c1Be0WVlG6uNq+QN
 8OueFWL+bp2mNzG2VysUpfrmLpjdmXkDflp/0tuA7fBN5bAlELjgjtXHSWnSsfL8212e
 KmuI52SGsj+XZjAmbWTWxvpOl89nIYxG8VJHSHr/+mRFwcUOact4gtDy7zL5QD7+inrt
 E79LPDrFIpniFBRHaOF1NrkDWf/bdcw9dQFKI3Mwvx6zTqxVbRV0fv1TRUmrq0MXdt4+
 5GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=etDvuXBAUM11ZaEBnBYy/KiVDdiLH2tl4ZJyUxGTR0E=;
 b=JDFzlfiKjsZSlLXlVHWyMhVNP/fKKyL5bBuIylALh6RZXcw2XAsGs/cm7e3bbXlgxQ
 IAcANCCvgpDefM9I33aptyJxHJWzFk2uyBSYVD5qBzltFBEtlq7SjukYyfhPfKQmCKpn
 7B3uTNqTXwA6NyiV3dNku+hH3h1//3kTum7bMeIY1D0jYK+1rxes5KCjKW7aG9uHCaD8
 9FM+kKUll/T5i/ytNhFC/+YZLJXc+93lH/VO/evaO2D6genOQrMdzbQoZ4vgibcysRSj
 2yt/codA4ZkGo2wxb9VcSHiGFABqXGHzuDbjTmB2AiBmIIyLXvNXCjyjIAQjxWWSeqJz
 5JbA==
X-Gm-Message-State: AOAM532V4QREk4OU2lW7JpUM3Qr7yu4Yr81aj7tuLOXgaRnSEjkHYPab
 y15vdrmco+6Q667bV5rrJawBugnIwWI=
X-Google-Smtp-Source: ABdhPJzp0dFG+5QMk9DvH0fB3ygRSYd2bo3/0dNdAtgq07gxOTx+TMnaX1HnEngBSce5RY8uROVSKA==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr4902941wrp.401.1610129615002; 
 Fri, 08 Jan 2021 10:13:35 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a14sm14009127wrn.3.2021.01.08.10.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 10:13:34 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/net/lan9118: Fix RX Status FIFO PEEK value
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210108180401.2263-1-peter.maydell@linaro.org>
 <20210108180401.2263-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c2ef0b51-09fe-97f1-cd72-632d97310b4a@amsat.org>
Date: Fri, 8 Jan 2021 19:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108180401.2263-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.241,
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

On 1/8/21 7:04 PM, Peter Maydell wrote:
> A copy-and-paste error meant that the return value for register offset 0x44
> (the RX Status FIFO PEEK register) returned a byte from a bogus offset in
> the rx status FIFO. Fix the typo.

Wow, nice catch :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Cc: qemu-stable@nongnu.org
> Fixes: https://bugs.launchpad.net/qemu/+bug/1904954
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/lan9118.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index ab57c02c8e1..13d469fe24f 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -1206,7 +1206,7 @@ static uint64_t lan9118_readl(void *opaque, hwaddr offset,
>      case 0x40:
>          return rx_status_fifo_pop(s);
>      case 0x44:
> -        return s->rx_status_fifo[s->tx_status_fifo_head];
> +        return s->rx_status_fifo[s->rx_status_fifo_head];
>      case 0x48:
>          return tx_status_fifo_pop(s);
>      case 0x4c:
> 


