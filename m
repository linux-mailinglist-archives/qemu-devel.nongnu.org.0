Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EF35A2F6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:23:02 +0200 (CEST)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtuP-0008Es-Gf
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtle-0004ik-TX
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:13:58 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtld-0002HG-5M
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:13:58 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f29so4273313pgm.8
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vho2apkGfu0Jj0CHjq7uHdMnlkJm53TUvTskJZfk1m4=;
 b=biDNsa1tq+zb7sAj7TMjJyGeARUVCcCl5X+Cso6D/6ssOCgFU6cRKYE248QyuH5i20
 pWzqJ7zT4yjxPNBBN0fCRELhJVaRP7mEkMVc/nO7MfUvJu6QS8wcqzhmNT5aEfxjHE2y
 K6qa5shBdoJoGxAcTxaWgSxzTC3/HUu3lrIz8YOSZyijrHkPdzaTFkFqtJx53GExi5Se
 n8nG+O9/sfc0bex+vokoxNeiIvZ96cFw5ktVX/0ywyw/1bod3AcnGpKU8z7gqNMmZbT6
 nnEK8LEJXAn6geLkpoUvUKFCUwspEhwaVhPsjd2yes24DlxOOKGCY8y4iNhBjnWinqnw
 wRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vho2apkGfu0Jj0CHjq7uHdMnlkJm53TUvTskJZfk1m4=;
 b=QfTiBUCkaC9OmtJx9iZjC431vAPcHQvKhnxosi/vOQdfiEKQcCoAfmiYPLGQZpi0vM
 FiQ8bsI0zsgBgAkrwYcR9IjWvPf/U+ohodElkw18K21gSKp7KdVYgefdmIMsOeHIhszB
 BNj8TaCFxeS0mGMXyRsV5gfSRE1K7lqtzLGaGGX1bxiozxAkQ8zuWYpFrJQ0dqHcLevV
 eOa1dpDhvMrtstn2ewyjP7f/mC/v/iMg57GjFi5XBChaDW9dEdbkQALpS/26TtBoDYmC
 9TzlQOFCGvBc7BjT52tCquw5VZWNffE8T9FBPXbdbiKt+mHdPmzYmzMnxIIv79JtLQo7
 5l+A==
X-Gm-Message-State: AOAM531UZWxheymf58wThET9ky1YZsG6+4Bp5l+htIZo70Wq/LGHOcuz
 ittQDC/YJYh5r6vktOvgPf8BRQ==
X-Google-Smtp-Source: ABdhPJx6DDZZQ1zAEi2Ayv017uQevmEkQ3SqyGGSBUuyJpBk2E7cTd6uZAm1xGFlIWeYAx+hna/8wA==
X-Received: by 2002:aa7:9533:0:b029:241:9d92:92e1 with SMTP id
 c19-20020aa795330000b02902419d9292e1mr13275698pfp.14.1617984835114; 
 Fri, 09 Apr 2021 09:13:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r26sm3132767pgn.15.2021.04.09.09.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:13:54 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 v2 2/6] target/mips/cpu: Update CP0 clock when
 CPU clock is propagated
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb2bb6d8-c6ec-e0d0-d8fe-e28351015abb@linaro.org>
Date: Fri, 9 Apr 2021 09:13:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409093623.2402750-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
> Setting the CP0 clock simply on CPU init is incorrect. First
> because the clock can not be yet propagated. Second because
> we aimed to support dynamic frequencies in commit a0713e85bfa,
> so the CPU frequency can be changed*after*  init time.
> 
> The correct way is to register a ClockCallback, which will
> update the CP0 period when the clock changes.
> 
> Fixes: a0713e85bfa ("target/mips/cpu: Allow the CPU to use dynamic frequencies")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


