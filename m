Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04035A2FC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:23:44 +0200 (CEST)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtv5-0000uy-Kc
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtmz-0006Sk-Ef
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:15:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtmx-0002xm-JL
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:15:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id g10so2981754plt.8
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iCJsJzJj1jiKxnJ6wgaLnHUp8QaxFgKiztChZ9DG/HY=;
 b=Oz7Vckjco86uwmJDsqITiitG6s/8Mqc+zA2CKzQwyyrnvai8z8WYWE2lejIk2oZY5Z
 CYrSp1DbsTDirsDhfnJ+E5XZUSOvfdO9p5oZ1o2EkQjuxVs9VwpdeUfIXgTEFh7vqVSf
 HsFhpaHJmUCopLitDE+2UN8GfYEvywqQbcXhTK+I1CaAdPt2gcfje6RiL5qHoM6f3U2/
 oQiIL9VbyrDy3DsQ9t2V3q9IzbBDhjX6hW4mWOxUpsVxQJy/52pCDEbUeD1cOQTQdDuz
 yVxwV45+t6mxyh886hRdgj/ZAXSWyUUVCuLlqWn5rQ4zqo2hQluZ7x3Cinsz2QpLFz/T
 9Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iCJsJzJj1jiKxnJ6wgaLnHUp8QaxFgKiztChZ9DG/HY=;
 b=ifHGTKoN+PK9psvt+li1CIMz5/pptWRAMFK0n50aCPJtGMcYw/92ZbehOtpSN/yBw2
 GN93UiMVnbrTgfokoX5K8pk0WbuUkrzapwjRTzhAIlmHFpqvMMuq6guAuaDC81IIsvfG
 625wLI7C+1RAMhXXHtLjGcWuQsUfkETjFSpQ+0y/TAkBQVZ1ij3sZWjtJsbEHlbUdj6K
 zYIzSJU94SCYTSRG6+iIxp74nXGelH2pE5jdUItap6gSnXJN9knU+Bf5YUn2g+dAcURo
 jxJ7T1w0pTMFS1aOx9MlWmtsY/4GQjrtKM2jANaKLF91Ox3GHHQxEBtoiZ0BRBB17C91
 VyXA==
X-Gm-Message-State: AOAM530cuvg6gN+e1wTRcV+7Qgcq7ucdpGn9a2/WmLRnviNUtbeRbyvk
 svDxAybzqSBNMHkPVEEhYtd7ERGC/Y8E6Q==
X-Google-Smtp-Source: ABdhPJx4qQvPGpWNR5EzWClq/HCRuyqOJENjOAI9tp8e/USY4nJ8o0GObcJnt37gRff4z1kUhyXutA==
X-Received: by 2002:a17:902:ac95:b029:e9:11:5337 with SMTP id
 h21-20020a170902ac95b02900e900115337mr13658224plr.8.1617984918120; 
 Fri, 09 Apr 2021 09:15:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id u12sm2722231pfn.123.2021.04.09.09.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:15:17 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 v2 3/6] target/mips/cp0_timer: Add
 ns_to_count() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89cedb17-60e7-f476-5c38-2f2ea543e3c7@linaro.org>
Date: Fri, 9 Apr 2021 09:15:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409093623.2402750-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>, Hao Wu <wuhaotsh@google.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 2:36 AM, Philippe Mathieu-Daudé wrote:
> Factor ns_to_count() out to simplify a bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cp0_timer.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


