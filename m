Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE2313A3C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:57:11 +0100 (CET)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99qY-0003t0-PM
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93d5-0004aJ-JT; Mon, 08 Feb 2021 05:18:59 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93co-00081S-MS; Mon, 08 Feb 2021 05:18:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w4so12065741wmi.4;
 Mon, 08 Feb 2021 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hkl8OSZgbdpafDcn4t2Zr8qCSM7geDka9crt4wL3Tfo=;
 b=KJjW5hDBC8EKsElxmgF8MzWkpz8AAWaWULIv7Ag91/bDqtsaOiSgs90cPEZJVac070
 DsBgk/p85JdcWHozL3/Kbtp6hOF3lcrA+k5qrDfIXDxo0O8ugYnWZcjySQWzVBFsYe5a
 7r0qgGHmT6ztZrL6cdHXb7pWBxblTDFAK+jLqd/qTAQ2uqBuKAeBZT+W4Av/1v5VMSBu
 uumVxaHNbJ+pLYV5l0aX69OOmQF+NHSJCcP3TDIIXkPI6yeY2jcvaO3pCiYrO+JyKrqV
 gjGzMQpJA3j3Zpip3bBCu6w0YS5jyPUappDXColW49AYxB/b0HFU3OcGy9qXLe0JJ2Sv
 At9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hkl8OSZgbdpafDcn4t2Zr8qCSM7geDka9crt4wL3Tfo=;
 b=Uc2k4czk7Z7ecHtRvWzbk9O1tHpY2UDQR+xlo1o3a3bWSwoO7GdO5KWmpszbAgc4IA
 viHmAGW1rrO0r01f09hKdXBfon/n26Zo/jf3nhxJSjIycB/QkPQpYyyKYBd9olNjtxYh
 c7iI6mF3ubFUrjHvZbBtju0zaLxBRbcUa+Pkjkct2MiypxtncATFl62opLGycZiaWq5p
 9yY4iVR/HNhE8gkH6+DpbA27c4lL2GXhcIsOJZXyoWTxcSoEWg++IluOAgL99g8lpSHS
 aX2iq0omb1sMDtG9zp4gxGeNK8aki8Wi4a7/F/O8BWqUF+sDTLUbKmspy477Qff1JK2p
 A3Sg==
X-Gm-Message-State: AOAM530SC2s+LjFAlf1pLvpxWcUv+/96lRIJ+Bf/hfqN6gpPX/IwHYYL
 FiEBzuxUEcTeaM0qm4/MexQ=
X-Google-Smtp-Source: ABdhPJyw72VN6EMJQCN8OfOly/+z0lp0pXdH3hV7cGgD4yXWNhppkRdghDNH+a1JYaIG9I5K6in8OA==
X-Received: by 2002:a1c:b386:: with SMTP id c128mr14111184wmf.48.1612779447944; 
 Mon, 08 Feb 2021 02:17:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j39sm1828734wrj.21.2021.02.08.02.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 02:17:27 -0800 (PST)
Subject: Re: [PATCH 3/3] hw/sd: sd: Actually perform the erase operation
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
 <20210128064312.16085-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d30b48ee-4a5b-cd49-ee29-dd06240fed6a@amsat.org>
Date: Mon, 8 Feb 2021 11:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128064312.16085-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/28/21 7:43 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the sd_erase() does not erase the requested range of card
> data to 0xFFs. Let's make the erase operation actually happen.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
>  hw/sd/sd.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 1886d4b30b..8c397d4ad7 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -765,6 +765,8 @@ static void sd_erase(SDState *sd)
>      int i;
>      uint64_t erase_start = sd->erase_start;
>      uint64_t erase_end = sd->erase_end;
> +    uint64_t erase_addr;
> +    int erase_len = 1 << HWBLOCK_SHIFT;
>  
>      trace_sdcard_erase(sd->erase_start, sd->erase_end);
>      if (sd->erase_start == INVALID_ADDRESS
> @@ -788,6 +790,13 @@ static void sd_erase(SDState *sd)
>          return;
>      }
>  
> +    memset(sd->data, 0xff, erase_len);
> +    erase_addr = erase_start;
> +    for (i = 0; i < (erase_end - erase_start) / erase_len + 1; i++) {
> +        BLK_WRITE_BLOCK(erase_addr, erase_len);
> +        erase_addr += erase_len;
> +    }

Watch out, you are erasing eventual write-protected blocks.

>      erase_start = sd_addr_to_wpnum(erase_start);
>      erase_end = sd_addr_to_wpnum(erase_end);
>      sd->erase_start = INVALID_ADDRESS;
> 

