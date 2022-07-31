Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2160585F84
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 17:40:21 +0200 (CEST)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIB3E-0005gE-Gr
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 11:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIB1v-0004KB-6Z
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 11:38:59 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIB1p-00012j-Sw
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 11:38:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id h132so7643719pgc.10
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=jRHbYs6z/gP+GfMAqGlRwjnUQIHAZ900osT/jPluSZ8=;
 b=TLCbEBmNlR2OSYio0ZEXObkAMhSqiUO6Vliji3GuNwJitoUYfkys3nf65UJsnGSmB3
 KWZ68CremBTPYvEQWZEA8Bfb3uKU+HNNs6WfzOuuE/XVQLhP1yQYcNJKd4VWXtcv95vo
 GSI/yhgMR18akhneYoS8+9/DdM7ngkyisPDiocAUS1GLuGXn5Rt9+qfiIM5vul1MuT4X
 c66QgMqUmdHntcV4q0VcUOkbWrNVfA2bQYGBDV/eFVzPjQ9ah8DPPc4PpL6EL1h7r+rA
 /gbsCFHRSv94AnM4vD9ETF+WNS0qn/eIsjyJLyCnVFHk0gs1FKyw4wxr5vctWTwd7UD+
 4hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jRHbYs6z/gP+GfMAqGlRwjnUQIHAZ900osT/jPluSZ8=;
 b=4U/U21ziOIcXsmmmznPJ/tt63desQRldP7BCrOJigOY5PRuoYT1QXXFaiJyEyeUY4W
 Ww17pUj9/dphl6qrgQv5Ldift0QaF+9PGNa9DcGwra9hSEZ7LBDiCawgRl6iOk3lVutB
 h1XraW/V7ys8uRIkjOXCHM7gkan9LcmDmdKIvGtm9Dwx4Vq01lhnfqOyOs9B7SiaJ/9i
 cjoTRRAM7GWoqbPcz7YZIcXwa4lGStznTNFqIccn1X7FrcpfMujxSlQu7ToiuhhxiIkv
 NQ5VAaxeWZ7f1rMmdYJYPOd1REskpqxY9y1AZEp2Yikl1in5nJBl8GJzq+GPrz1gKJQF
 1tvA==
X-Gm-Message-State: ACgBeo0wbD0sF4H0oDzADTpV8jTTWG0S3iJBN+G/5d1JJLCVLM4ou5vc
 5h6dv/gN0+SeNnjU+U7QpXq/7QaziL4XsA==
X-Google-Smtp-Source: AA6agR42kUbzJrb2q6g5GCkAXUn6qPPz5mqD2Xor7bDr7MpCiYnWYLwV6G9Ls6bb0195k/FDwbG04A==
X-Received: by 2002:a05:6a00:2d1:b0:52d:36bb:14d7 with SMTP id
 b17-20020a056a0002d100b0052d36bb14d7mr4764815pft.22.1659281931739; 
 Sun, 31 Jul 2022 08:38:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:5139:b549:d926:6e86?
 ([2602:ae:1549:801:5139:b549:d926:6e86])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a170902f64500b0016d7eb68aadsm7546010plg.230.2022.07.31.08.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 08:38:51 -0700 (PDT)
Message-ID: <1b223635-3cc6-9ec2-198b-e4397e0adc1a@linaro.org>
Date: Sun, 31 Jul 2022 08:38:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Implement faccessat2
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220729201414.29869-1-richard.henderson@linaro.org>
In-Reply-To: <20220729201414.29869-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 7/29/22 13:14, Richard Henderson wrote:
> -        ret = get_errno(access(path(p), arg2));
> -        unlock_user(p, arg1, 0);
> -        return ret;
> +        return do_faccessat2(AT_FDCWD, arg1, arg2, 0);

Oops, dropped path().

Should perhaps be incorporated into the helper, because newer targets won't have or use 
plain access()...


r~

