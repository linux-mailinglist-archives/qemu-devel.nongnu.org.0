Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B73303FE
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 19:47:56 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIyRW-0005GO-L6
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 13:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIyP1-0004bg-7P
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:45:20 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIyOy-0003rj-Dr
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:45:18 -0500
Received: by mail-pl1-x630.google.com with SMTP id d8so3788441plg.10
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 10:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TG3NuoRArquLJMsO2AXnsigHQF8j7FRVJys05c8sKrc=;
 b=Wq8NhkCj5psfJm15d2rzyk7c9xUfeNWCvEx0j8wfrSI9FqsEkdxsKdPDxmyUjfgwKO
 v81a4GkJQehUHKM9Vojs7UZwMLKnzjcK6u0L1T9ky6FadDXviu1AJxdE/SB2OKPN+myl
 KZl2XVaW9WMvJd67RMH131deLrpBYWmfXIyqit2zy/EzYOxaUtLbvWNI8dn84ffFovML
 1X7Yf+11mgh8MSayEzZ35YNhF8ccSjqH8Ldeo6i+Rb2GX9ylJkG+1VP8Z0nMgt2T7ZUx
 NDTtuEol+sSI8K1iuLhn3fRrsfOawdTnb5p44pI1nXrZPLX+fbPsXw+Rfrl7vOYvgKA8
 MK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TG3NuoRArquLJMsO2AXnsigHQF8j7FRVJys05c8sKrc=;
 b=KjdtFVlGRK0mlWbfyFV8mSE1aDEa/B/MoDDiJt9ewxD0VD7mlgTvy1232D3pmIPG7J
 HGz1d31oAFp6J7UO+88ewwtsgixj41jen7aBA+M90Js/t82vcXFwvBkO+1DdJIP4QlND
 ElaqGf/gXYeEUf1iysa4Kgw+c16VagxmlXujIxJy2z9C3Ekg0UZrk1N/OOCnTwP95I9R
 c25Xs8KhDHApvDwvYnHpmg7H3O8PtpE4Ai698zq7TJYhAOdTCKoBQZnaBVGPnlTpxDdp
 F4FtoVqoxLMGD9JXWMPabMBc3fF7G3IqI0RG5Mk4kmHVxcwiPKIaoQuyfe2+OpCZHPw1
 4/Kw==
X-Gm-Message-State: AOAM533fXUk1AEsGMfoYnOpzYYAQXIKEyk/+45goV33q/1vHg+1c1l9r
 nupgTpvMFUVh/b2SPHjUOUaDNQ==
X-Google-Smtp-Source: ABdhPJw3+nwbTVQ6j96Oz4/6aTK85FEAyDycCEdK/ZOvwod3gYqw/d2MJBmwcek4nl6zFfzO4OReGA==
X-Received: by 2002:a17:902:9304:b029:e4:12f4:bdb0 with SMTP id
 bc4-20020a1709029304b02900e412f4bdb0mr17711658plb.55.1615142714633; 
 Sun, 07 Mar 2021 10:45:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y63sm7478246pfy.68.2021.03.07.10.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 10:45:14 -0800 (PST)
Subject: Re: [PATCH v2] target/m68k: implement rtr instruction
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307182210.473111-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f83aa053-76d8-5076-9f93-63eb4e489f18@linaro.org>
Date: Sun, 7 Mar 2021 10:45:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210307182210.473111-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 10:22 AM, Laurent Vivier wrote:
> +    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
> +    gen_set_sr(s, ccr, true);
> +    tcg_temp_free(ccr);
> +    tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
> +    tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
> +    tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);
> +    gen_jmp(s, tmp);

Both loads should happen (and thus exceptions recognized) before any other 
state writeback.


r~

