Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305D32352F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:24:25 +0100 (CET)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEiud-0004uH-RK
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEisF-0003qm-L7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:21:55 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEisE-0000jG-2N
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:21:55 -0500
Received: by mail-pf1-x42e.google.com with SMTP id r5so183957pfh.13
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pRrE3+QeZby6wi7bds90M6hX42zkAHnnMczH6UE7M+M=;
 b=Kz760X3nQFFls7RFrZgI5VV8m46njIkD49PjmU7wdLmcTHIruVsCRQsPbdtnsZ6yFi
 oRyqV/y7ahems3BBrBcdtOH70w0bH/uBIVTaFK+Lv13iOyjVsY7ru1XGHvKZbHOTbfIA
 xK+Spul0oAyWnkIW1FcbsyRfNTdOiIGUXxcpPsrSE95Bki/0u6bJB7iE1n46y6K6qfd1
 NQOoKUHlXrk+Us+SrmyPNPSsada7LlBwRFVu0Alhjn+jZLAmpT+c6mGWrygMSbojdBR4
 +whKL18jEIBE/fx5LQIrYE0r73xA70MmQdpZ/lqfAkbroxfOByfubcgAqteMxYhY+EQX
 9Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pRrE3+QeZby6wi7bds90M6hX42zkAHnnMczH6UE7M+M=;
 b=YkiqU6sTmrmdRx2FHjFPC+hJfWjy45HqTLHYhVKnB+Ae/zYkWyYBRSblqnNOTbZOYO
 60rJ5FblX0xvtW+HE6vjChfvofnraKX0DdPzGzByamaUlfY1HYptNXwbFErORYpWdy9C
 pYvauR0V595K3Cavn9n27qqWjjTr5ZodYOtrH1PfFxhyL5KcFDVLevn7aeFxt+urmkdY
 csLrRCzGrpqSF9bKxadNhdXWkfHxD3+bJaONPo1aw0CVpq0fXnNWH3pUCzN8pDyz9ejj
 nME3BqmSIIRBU25ZUmB0RiA/PlxIk898pTN3GL1aNiP/gDPkU38n19ELacfsGwtqstjB
 uxwA==
X-Gm-Message-State: AOAM530EBynht+/fj99P5RNIZMuuL3plnrxV9SKYCR98e7F4I0Fz2fzG
 9LLgxr5olunvTkStOudjBn4FmA==
X-Google-Smtp-Source: ABdhPJwh1p0Z8sQBBZRLIhuK3q7kCmlow+6cUG/jH3kkFHLiJDG4GWrMjxxzQu9T/FVW1d4rVPC5+Q==
X-Received: by 2002:a05:6a00:1a01:b029:1da:a7ee:438f with SMTP id
 g1-20020a056a001a01b02901daa7ee438fmr4888613pfv.77.1614129712539; 
 Tue, 23 Feb 2021 17:21:52 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id np7sm337935pjb.10.2021.02.23.17.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:21:51 -0800 (PST)
Subject: Re: [PATCH v3 01/10] target/mips: Rewrite complex ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c8b363c-0332-ed3f-5c49-f3f8df552027@linaro.org>
Date: Tue, 23 Feb 2021 17:21:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
> No need for this obfuscated ifdef'ry, KISS.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

