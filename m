Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD358B6BC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 18:19:07 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKMW2-00039L-Kd
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 12:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oKMSi-0001Ri-S9
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 12:15:40 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oKMSh-0000Ou-4L
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 12:15:40 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so5493223pjf.5
 for <qemu-devel@nongnu.org>; Sat, 06 Aug 2022 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=64v9T4EaPEPYb+PtWEflY8Tn0z/ul01gUKHtIhul39w=;
 b=qmmiMGnomfu7/34lQJ2XxMHTFiY50zTUaW1R4E6Her14CbTpIS6/UTM2BX/vks6NZk
 Z7h5D71Xks2JAD1IqNeJ2tkYzymGoNdNPjrDxLAncqGf/xUSIlAQMSR/YOPSxoShevKq
 uxRWJjzcVV8aR38W0JyTAbUJsfT/FOM7cJWIqzYlZLKUpPx8NW4kPmgLtTIygeWG2pWu
 OpXleeeHCdbt6a6sjoYFOktBAkYlG6EDRL1M1cUNjLbxic0/YnidDDakzcbqR8m0UZVs
 rHi8gzDJMLipVInX4wwAff5t8mQsxqvR9U813g5/VEMvtexej/OAEZoXWpv9LEneww9b
 wV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=64v9T4EaPEPYb+PtWEflY8Tn0z/ul01gUKHtIhul39w=;
 b=7SN7JZ7DRIvPms2Au5efWJk7lh/XhA+AsxPPmCn4hBqCmixKfZmOWw30SXG6VAo4p5
 lmd1Dz3LGzvcKDdNnK1Fbz1H0jD1onQei0hm3uhhdGF3PaIe1G3ibDmCXFInxftX6A90
 M4Cdwl/enH3NYphN91b6mrXNN6nmtUymNN/g4Xnpu//wVxfxzjLNKk7U4RChIcRtOXja
 O871saREkDW6wSjXYfNVIK6szanGmpNuLVpXxlAezB5Dwrg+PrvxVSxbGlzDAZsSdXRG
 p6FZewHE/UhpnKlrIGLVMWTYTZksBj4ab2WKIS9l+jfCsszwCWBCATkz21imjaHsBnve
 p/fQ==
X-Gm-Message-State: ACgBeo0lnlWGlWCRGlax8GSzYWCNTPHGHmV6QCjKyvV5ijerFmqYPf+W
 /HzCqytuf7p5JP6bZXzwvXxgAg==
X-Google-Smtp-Source: AA6agR6/IpJne8GLwIItCOMyKwGsq+g5w0TpO1NnQA8xKgM4AJn89D5hf9YHuOmL+pdxlY9lcpPmBQ==
X-Received: by 2002:a17:902:ccd0:b0:16c:5d4f:99f3 with SMTP id
 z16-20020a170902ccd000b0016c5d4f99f3mr11490949ple.139.1659802537127; 
 Sat, 06 Aug 2022 09:15:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:e1d0:6bbf:50d3:62d0?
 ([2602:ae:154e:e201:e1d0:6bbf:50d3:62d0])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a621c13000000b0052ac5e304d0sm5319500pfc.179.2022.08.06.09.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Aug 2022 09:15:36 -0700 (PDT)
Message-ID: <26f5be99-e9be-df9d-be50-1a2f2cd64986@linaro.org>
Date: Sat, 6 Aug 2022 09:15:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/loongarch: Fix "movfcsr2gr" gets wrong value
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, Feiyang Chen <chenfeiyang@loongson.cn>
References: <20220806133426.542314-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220806133426.542314-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/22 06:34, Qi Hu wrote:
> In follow sequence:
>    movgr2fcsr $r0,$r0
>    movgr2fr.d $f0,$r0
>    fdiv.d     $f0,$f0,$f0
>    movfcsr2gr $r12,$r0
> 
> The value of $r12 is "0x00000000", but it should be "0x10100000"(V flag).
> 
> These fp helpers are definded with wrong flag "TCG_CALL_NO_WG" (but the
> helpers write the globle "fcsr"). This causes the "fdiv" helper updates
> the "fcsr" into mem, but "movfcsr2gr" does not load it from mem.
> 
> Reported-by: Feiyang Chen<chenfeiyang@loongson.cn>
> Signed-off-by: Qi Hu<huqi@loongson.cn>
> ---
>   target/loongarch/helper.h | 64 +++++++++++++++++++--------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)

That's one solution, though it may perform less well.

The other is to remove cpu_fcsr0, and instead access that value with explicit loads and 
stores in the two (!) instructions that use that tcg temporary.


r~

