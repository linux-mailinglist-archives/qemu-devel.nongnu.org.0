Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9C313DEE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:45:12 +0100 (CET)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BX5-0006tr-Ae
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l97Dg-0006zc-UY; Mon, 08 Feb 2021 09:08:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l97DY-00041g-35; Mon, 08 Feb 2021 09:08:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y134so5021404wmd.3;
 Mon, 08 Feb 2021 06:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x82Bni9D1JiqH28xkubjjjhDeBG9fnV0G57GB7wIZnA=;
 b=Gl4BhX5cNMZhuwgPLwMSL8Vh1dETQV8mkxF4hITpVN5A7sfz2nCkaLBLBYjPzJ8OMT
 3DWs3GSQzlo3xE/QbQJ95ChxMjEci/A4qtApdLcGoaFqVqnhFywKdWJ1YLdiCBjiMca8
 gJKQQYnKSLy+WwqqevZBcRy2DvMlR3m2VdDsNZCjawTss3sf23/S+1UqoN4vqa0csFVy
 csmMwYtIecDTBu6eHzfhb8558ceKN8IcjJ0yDa32OZ54I8mlv0FaCctPcohP6lkqNDbH
 8BT/YviCYDig3D6Py07N7LSwFa/bZjnDvW6KPXIPSJUU9Su+EHmfVWfWFVbjMSlk/ZNp
 SpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x82Bni9D1JiqH28xkubjjjhDeBG9fnV0G57GB7wIZnA=;
 b=iLJqGVczkRJwofdypicOeqma9oKyWzCERg2zP9pCwV0biEDyff1w3kEcwD/Hyk29PI
 03GN9LIlPxCbX0yG6FDMZiU+XI28eymHFCv4uxl2VFsKbjtWNFDnFM2rH8uXu9IYgqxM
 GsLaJARvNVLLJd/XPGNWx3UrYdYINNyKETcR2ipeQdGi8y5wd1IkG4exUY3jk56uu862
 AqVWN7nPBZN1/KXjOlQIza84JkgJr/NxkDCzrr5GlZpxiLR3+byPRfRBJzR0ChCp3Vpb
 SWpX5/tb90fAiier3+DFDkXhfDRgQEYuwzOY+V89doGjmb9/hZvV2/d4qHF3Xo6zrD4/
 8A/g==
X-Gm-Message-State: AOAM531q9V8bwFU7m402JNULmr7hqW+Bec10zO/9pMjYUysA6RMTAXz/
 mlNa++MsVnoJbX8NrGygDEs=
X-Google-Smtp-Source: ABdhPJyPlJPQJRaVIsnxFI7kxg81Im4vM356DL0ppuEL8+FdGWUxJiJ9jgoQGeha+K6iR1rJJ9DvRA==
X-Received: by 2002:a1c:6802:: with SMTP id d2mr14448077wmc.32.1612793321575; 
 Mon, 08 Feb 2021 06:08:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v1sm20820831wmj.31.2021.02.08.06.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 06:08:40 -0800 (PST)
Subject: Re: [PATCH v4 9/9] hw/sd: ssi-sd: Handle the rest commands with R1b
 response type
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <20210128063035.15674-10-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16fb545a-d793-6447-d52f-f504aecc988f@amsat.org>
Date: Mon, 8 Feb 2021 15:08:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128063035.15674-10-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 7:30 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Besides CMD12, the following command's reponse type is R1b:
> 
> - SET_WRITE_PROT (CMD28)
> - CLR_WRITE_PROT (CMD29)
> - ERASE (CMD38)
> 
> Reuse the same s->stopping to indicate a R1b reponse is needed.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v4:
> - new patch: handle the rest commands with R1b response type
> 
>  hw/sd/ssi-sd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 907d681d19..97ee58e20c 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -194,6 +194,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>                  /* CMD13 returns a 2-byte statuse work. Other commands
>                     only return the first byte.  */
>                  s->arglen = (s->cmd == 13) ? 2 : 1;
> +
> +                /* handle R1b */
> +                if (s->cmd == 28 || s->cmd == 29 || s->cmd == 38) {

Why not also check CMD13 for completeness?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +                    s->stopping = 1;
> +                }
> +
>                  cardstatus = ldl_be_p(longresp);
>                  status = 0;
>                  if (((cardstatus >> 9) & 0xf) < 4)
> 

