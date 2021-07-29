Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2E3D9DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:31:18 +0200 (CEST)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zZd-0008DV-B5
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zYI-0007Ri-0A
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:29:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zYG-00053E-Kx
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:29:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p5so5425936wro.7
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KtlinxeObYJWNHH5+7r+Ug/uMnSK0f+ce19fEuNltAY=;
 b=cQ9/266AK+fSwGcABN8zl7JGnDR3odjCHsdYupdYumoDnRltnWL2CIceKT9kiKEmMQ
 OTTvdYih0LoeeqRXfnWnzI0l12i5JAGQktn/s3JchpLjQm8gposRF6ceBw7/G0ExIWIl
 F28E9u+UmfP0YoutL3MbK5iN/K85ZvkJ3XBuDqdP10+ZBYZBkyo9SnTdcWVLlWmaVqiH
 6DDpRkNK7uN6iQcNpO7BzjboMx5ju81zvFzNWdCuzwCSDzCmoi9CXm0tg3tcnFIQgFZx
 8e7apc3ytb5dLV7N3w/P2iD/OfXlKkrxOAtUmGvMiHDvmVXa/cmdtyfpFatvrxG/5LjD
 CXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KtlinxeObYJWNHH5+7r+Ug/uMnSK0f+ce19fEuNltAY=;
 b=m+1GOueWvoWpPEB21abAVYbRGdjHIwi6I2KtnIw5kJBqgrFxPa6/ht4rqYqBYCDu5G
 elbYAKa8krMCth6a//IIMa7HXHmbJELp+FE2UuNov5/eNmTF3y0dB7tv900aFdYTJPJ0
 r5qWcSl2OSEP4eXo/oTt+8i7Mt4vkmEetwdFmbEzkqSRQCDDM/8kUV8BbGnqbWrKyHOZ
 OuUNFDpNIzAu2tAuleGKpaO1PiccpvxinWeLN9ZvuwoB4rrzpHd64YIesWz9WEdAeeUr
 F03LXUlie5EMMaBo8DEkvTdje1qB8ZaaGQkB7ibXT1zp/4p6wscGNp18566z5ufHz6kH
 iCiQ==
X-Gm-Message-State: AOAM533xpD/1AnfQ6etHyqLnp7LS1c/fyMuEkqggmKJd3dnOO4jAV0L0
 U5uDlVsrBNJbmwkdoAHwh82hlWbAgPXsKw==
X-Google-Smtp-Source: ABdhPJz13OumRhMcry1MjL1EPjjvg/f1jiv62t+yDiX/MX2bjnnJzUEwYpf7ckjRJFwlufwc82I+pQ==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr2920156wru.313.1627540190802; 
 Wed, 28 Jul 2021 23:29:50 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h16sm2144423wre.52.2021.07.28.23.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:29:50 -0700 (PDT)
Subject: Re: [PATCH for-6.1? 23/43] accel/tcg: Remove double bswap for
 helper_atomic_sto_*_mmu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1da8d060-4e79-e128-0700-ae6ae17f302b@amsat.org>
Date: Thu, 29 Jul 2021 08:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
> This crept in as either a cut-and-paste error, or rebase error.
> 
> Fixes: cfec388518d
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
> index 4427fab6df..4230ff2957 100644
> --- a/accel/tcg/atomic_template.h
> +++ b/accel/tcg/atomic_template.h
> @@ -251,7 +251,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
>                                           PAGE_WRITE, retaddr);
>      uint16_t info = atomic_trace_st_pre(env, addr, oi);
>  
> -    val = BSWAP(val);
>      val = BSWAP(val);
>      atomic16_set(haddr, val);
>      ATOMIC_MMU_CLEANUP;

Why not merge this for 6.1? Because old bug, no regression?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

