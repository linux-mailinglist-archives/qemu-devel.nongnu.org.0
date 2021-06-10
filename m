Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F23A329B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:59:04 +0200 (CEST)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOxK-00023r-WA
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrOw2-0001Np-NW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:57:43 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrOw0-0000Dy-Bi
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:57:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id a11so3271373wrt.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yARBuZEGoGsbKP63y22Byu0wSUJJcYAm2AVltKHm/S8=;
 b=mTCNXSG038/fm4/2z3K0K0G0BjrjH45dmZW5/mb4+qe+Fa58xQlRVbqbnnfDVaGyEG
 vZfZhiSDl+a0TGAfdqRkXQoazIlJ7h3Esb6Vu5hFdMEbkqY1svKxsXWC8suONU3TjaZG
 f2JsnNoPB/uOGByWGRtrLbDUaGs2lY1kyhPT7LgL9lMvRHakW06biE9sd2jVTuH//wql
 rTZuPOUB7jtgHZORsp+AupDV/35wAyZu/3E/xtNdUailMOvLrvf37oItxc0gkJms2+U3
 cDddKLMId4jzM4gyHR+w8z6aSzslsKfUi0Q5GjWOC1Sz765L6qMegb7q6Pd4/TBpAYw0
 wtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yARBuZEGoGsbKP63y22Byu0wSUJJcYAm2AVltKHm/S8=;
 b=TEMP0ZLDUG3CdMxSrEnL3l1v0SW/jt+tRWaOJAAzI67NYRvpu98mlkEwFVGUz6v+iu
 VS57dOnN34oqQFqwYwSgMy7i97lK8PlWRiSVzWHpuBFu0Ybd0qvBeeLJYHe47LF7rns5
 aNiUAs+j94yGSOQ020wTHR+cb5Blbo2J/NYq4jaM+9iKhSvat0IADPbm1t093bJ64rjB
 3Na9F9n8mdj0jurluNqDC5INVD1l8C/madMlDxqdpDSK+vPk4r0+IRdqRsX3xkCFkpt+
 m1+1fe+Y4QkfpzYYiXbwmJEkpNDhEmekdrWzrJzI555I7KxFvWBgjRVaVu2ghZlgO06x
 G7Rw==
X-Gm-Message-State: AOAM531EdQhTOIaleH5zxGUckO158m1pwClu+HCNGuXajft1u+Akfyop
 xZTwkXyhQJ238vol67SM968=
X-Google-Smtp-Source: ABdhPJwsA2tZ+0jA9fw1zQ6v+zORTaWLp713gxELHfeyF+fqioXr8fVpVrd7BCrOgGXFeNP1uDCKLQ==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr6952566wrs.18.1623347858830;
 Thu, 10 Jun 2021 10:57:38 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id p5sm4416523wrd.25.2021.06.10.10.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 10:57:37 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: Use MiB in tcg_init_machine
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210610164040.233820-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a1fa154b-04ba-ff4b-a7e6-0e9c006317da@amsat.org>
Date: Thu, 10 Jun 2021 19:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610164040.233820-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 6:40 PM, Richard Henderson wrote:
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This sits in the middle of my "Clean up code_gen_buffer allocation"
> patch set.  Alex mentioned it during review, and I had already made
> the change.
> 
> This is the only patch in the set that has not been posted and
> reviewed.  Rather than re-posting the entire set, I'm just
> sending this one and will queue the whole thing to tcg-next.
> 
> 
> r~
> 
> ---
>  accel/tcg/tcg-all.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

