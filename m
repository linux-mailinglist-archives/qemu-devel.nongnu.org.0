Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0B611AE4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:30:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooV2z-00042N-Nn; Fri, 28 Oct 2022 15:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV2w-00040Y-8E
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:29:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV2s-0004wd-Te
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:29:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i3so5570621pfc.11
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3c/wXoG10dQHdfbeEv3PKxbfo1wSzt4UiAO5gTPYV3Y=;
 b=tnMXrFkF2iu46RmsZfFMCLyQzQoarjx2fDdhChcC7dfyVbUaVeVETOnbzlZA0CZQO+
 tEyjHr4r26bqX7yvR8zynbjWyJ2MCNJ1Tzbe5G8PBN/CJufORP4ym0JdqUJ0sw/QVNvP
 l0is3+oXfyPfDa5TtmlJu4Rzt34zVApfWjPnofFqruikYTwSbq5ksosFeySMQUawa+xs
 9B/xZgGKaymEUm4/HSo/tUbsoX002sUuXBzF4lOAYf6D1McE6/xrJYiHvZa7/mxX4DXJ
 o+TgIAQaZaYBDNVT5eO/JdcE/ifYd++apaTKO/QJGB098DCQKLUMPXYfAPY1j/D4Z9OU
 2zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3c/wXoG10dQHdfbeEv3PKxbfo1wSzt4UiAO5gTPYV3Y=;
 b=VPWmQ7B0sAeNKGqyyrXz0jFkfF7c/+d0vCv9XTd7Qjs8syH7WQOdAdZupbH7yXbVij
 qgDmY9MBqef8tFuk8uYsMEhUGF9HV2GmocCR2Qy7ULLuUd5iiBhfYsYvl7o6yhqVw9+E
 CnHM6tK463xK6S1pTwUzmmkXatwvyxuOb0y3MvPp00qqxem+SwPFbzEwA1QCfwFhxEs1
 6Wl1i5RaqBfsjJgHz4hJjt6U4zU75iYnIK6txTNQQn/1YwkQ+T4Ip2nU5EZYj3ok9/W+
 Ff10qT1ZsOm/usxN7El7qIYmmzhfzLvTt+x3ylI02l2P3I61Zs3mqK2A/7iFwlze/NHx
 M+7w==
X-Gm-Message-State: ACrzQf0tVRrxsE+YpssZkfJ61L0NsiMC8y4pXtGRpxFC9iai1mG66/NR
 X0MyVX8PmPRBM2209VeLSKO8Ig==
X-Google-Smtp-Source: AMsMyM7itA84Lh7NMGaY7/oz4+7rZnkGBApGmPQvyCdlphrGetYJXdlXoO1LZCZxtGS0vsDWHe+zOA==
X-Received: by 2002:a63:e04:0:b0:46f:75bc:8bec with SMTP id
 d4-20020a630e04000000b0046f75bc8becmr894807pgl.559.1666985373377; 
 Fri, 28 Oct 2022 12:29:33 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 142-20020a621794000000b005636326fdbfsm3190365pfx.78.2022.10.28.12.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:29:32 -0700 (PDT)
Message-ID: <76b38dcd-9435-8031-feeb-80c8daab63a5@linaro.org>
Date: Sat, 29 Oct 2022 06:29:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/7] target/arm: Make TLBIOS and TLBIRANGE ops trap on
 HCR_EL2.TTLB
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/29/22 00:39, Peter Maydell wrote:
> The HCR_EL2.TTLB bit is supposed to trap all EL1 execution of TLB
> maintenance instructions.  However we have added new TLB insns for
> FEAT_TLBIOS and FEAT_TLBIRANGE, and forgot to set their accessfn to
> access_ttlb.  Add the missing accessfns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)

Oops.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

