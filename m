Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522113E09D5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 23:06:44 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBO67-0003mS-CU
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 17:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBO4e-0002ye-FO
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:05:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBO4c-0001uk-R5
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:05:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so2236428wmb.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 14:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eDx7JCySBKIvgnWx6MSqm6HwwzWs/dSFkAYsqsvF7es=;
 b=FxxmJU4CYvIjxxTpgOsqI9+sEgCqImsabfmxGGQ8HHOtUTYWHQ0XIo0NbFV7PIXA9c
 YA7I/WEKEUO3xu2z+1+YxP2jFDdNyn3/ThM9abSNkb8FVDzjue3JvCRxS+jxYOPFfFhA
 riNPd6QnGb7tJLioOZYpDcFDdgQ/cItiEVmGQWyuLHjz2iWafS+z1bmifK8VgNAkrrqe
 qks1/rBMgQF5jaX3qa5FWMn+6y6o66G6SUv8lZqT+e4aSC5D1sqqUHSkyxkVUEV2t24P
 B5+UGziI3I5l2fUv4qwaEeEj5E5ugAi6IxmdGamVwHSNx0g1wtvNniZWcVVS+thAQDtb
 IyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eDx7JCySBKIvgnWx6MSqm6HwwzWs/dSFkAYsqsvF7es=;
 b=tbe3YGBZpOUykmVicvfz5VDFRDm/RcHmskjftoO4ljK954hgQNXZ9DAjAQ8vbfDzte
 zAbE1c4xpjYXVRvccW50RyVswN2nqwamkEyNhpHTRvxsnD/ZJ2hMgshBH2ocZky6XK9s
 kF+c3fKfdBKea58gipdPBiVHETZm/pW4/cNyQ4gNjoGRoF1p/zaMkm8+Ee5eSuaJnRdc
 YLw6Hx8mUHM4I5fGKka02f9FfGDj+bKWP1sEI399iD2u3v6nI8zlRRs+ntQeUMZxUBut
 oGOtD5NRB0rHRb7BeQkC0wc3V07ERhHctWEM6vyGmLIksMgmsmFRtX/uM8wd2DXgDfA+
 s/Tw==
X-Gm-Message-State: AOAM530zkijhclik0IX02UW1BTXJXS9m19ioGdvlNQt8Qe3AmdDTINPf
 cqBFk+CWmroDlVnAx/+Xz6983rw1qeS7RQ==
X-Google-Smtp-Source: ABdhPJxX+t2ldP4UuFP9/zoI9SWziQbJJsZLMsZhcEAuKeXgr2OR9EEKXOyL80edTJFsXFRCNjht3w==
X-Received: by 2002:a1c:2984:: with SMTP id p126mr1367669wmp.58.1628111107910; 
 Wed, 04 Aug 2021 14:05:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h11sm6502739wmq.34.2021.08.04.14.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:05:07 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/alpha: Use dest_sink for HW_RET temporary
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708182519.750626-1-richard.henderson@linaro.org>
 <20210708182519.750626-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b7ae73e4-a2e0-7b2f-d5c3-18fed90b52d1@amsat.org>
Date: Wed, 4 Aug 2021 23:05:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708182519.750626-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
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

On 7/8/21 8:25 PM, Richard Henderson wrote:
> This temp is automatically freed, just like ctx->lit.
> But we're about to remove ctx->lit, so use sink instead.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

