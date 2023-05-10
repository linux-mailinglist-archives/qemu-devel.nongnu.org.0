Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08FA6FE0B5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:46:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwl4i-0007aJ-VT; Wed, 10 May 2023 10:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwl4d-0007Zk-Mb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:45:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwl4c-0005Pu-4M
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:45:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30786c6082dso3327992f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683729945; x=1686321945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CMyqeCLtHyuEgEMAiZSTT4lQykJAPv9+1MufHK3zofA=;
 b=isVojIkbuqHWHKql2QdOCWIvMGOj9fGhMC06owUTLfGMeBGtMJnSh4I50UR32A20PK
 ahMocbkutpHDU8RgAaFeTpatjxyziTVg1LXa1Y16Ce6lPjXxZGkNU/DLqlc9U6vBagKZ
 am3nDpyNl3he+PL5QQyrreyGvFtVKASmzWdfupoISEw9gH55DfBzY8BqtrWzRPkkUaIR
 ELf22OEk/DzsJxdI5cYdTTY2gId9ZROmP7AJ9Wt2VFQix7+V/Bhtj8llSKl65BTn+kYX
 buHdLhtAqyr1n9ZVa0nXuEJL1XdHHd54+Ec4umNOnTHiAdBlHFpMK44z2+fjHI6hCBu4
 P8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683729945; x=1686321945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMyqeCLtHyuEgEMAiZSTT4lQykJAPv9+1MufHK3zofA=;
 b=XuIS72NTGymHaGrYEo8jVAgENt+3jllj/p8WtnSyTBcnSDKlBg+mUfdDdpf8gHeZxZ
 rQ9cJHvPkUl3/ZFl/tyboAzV+EoWGzdWfiam0t6wEhduHh3fG8l7UhUygXhP7acPIJo6
 g3CZZBAM59sNYj7LXrcS0AGDLR0HyI/l6QM4itPsWxvMqMAnFh8CTxRArtQJgwJQ7CNT
 IAAvxo/HV8VtmVUBNGIygt5YABiOE+SZA1b+peYbiqo7/ve2wi2nCvpAf0z1JLtTyY/w
 uAfc7mylrB4FgoZRk6JGxtDinWWkLcncO/2idRld5PW43UAOh0tqAhUYNV+Slh2VMdEB
 bLnQ==
X-Gm-Message-State: AC+VfDw9f+Lj9jzyay+PWsQtznJkPuZTyYIl9SlKAX8GwdAXVfj2PuZD
 HZRowZg6U2HnNSzekBtRGQczMw==
X-Google-Smtp-Source: ACHHUZ57U1ZS1QwL/eYxtxIJL0RhlnOIVkm1D0n8a5cxAo8KqsGxovxSnc4li7+UoGrkuKDDLb9SQA==
X-Received: by 2002:a5d:6ac5:0:b0:306:3429:1833 with SMTP id
 u5-20020a5d6ac5000000b0030634291833mr12324599wrw.46.1683729944762; 
 Wed, 10 May 2023 07:45:44 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002e5f6f8fc4fsm17673032wrm.100.2023.05.10.07.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 07:45:44 -0700 (PDT)
Message-ID: <25b5c535-0a72-9f80-a2ac-6fc730f77d13@linaro.org>
Date: Wed, 10 May 2023 16:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 10/16] target/nios2: Remove TARGET_ALIGNED_ONLY
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, crwulff@gmail.com, marex@denx.de,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230502160846.1289975-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/5/23 18:08, Richard Henderson wrote:
> In gen_ldx/gen_stx, the only two locations for memory operations,
> mark the operation as either aligned (softmmu) or unaligned
> (user-only, as if emulated by the kernel).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/nios2-softmmu.mak |  1 -
>   target/nios2/translate.c          | 10 ++++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


