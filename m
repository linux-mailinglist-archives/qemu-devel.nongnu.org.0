Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2517369052
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:26:48 +0200 (CEST)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZt1L-00033d-Ut
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZsz8-0002QH-Uo
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:24:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZsz7-0007yi-KX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:24:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id p6so41163400wrn.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wBC2bj0ZsMYdaOYchJ+KQOzARFJdiNOfjZkpl8qTfyk=;
 b=Ntw6wCWUGoAwhHNZ+NhEZgeDxFSunpidCttvdQ4A8X0WfmgTAygzaX9IsXZFduP8an
 isCkW77S04eCKSd6ee9KTSV4H0E09e94I2ugHPrjTMZim6cXo9QbkaSyCyM0PzneMF5+
 24R8QD8ZKmMayAtJWde8tLrtgc9oOJoXHOGVnDN8/8g/t+Uq7N6OaHZ5hGgeH1ncUfIB
 3rwh9GxbUCErNPl7uYOIY8bHTYJKnujAmbOqnbqYIOAWEAGMh1TojCbxoWhhMNntcGkb
 BF/Ik6NHaor67tmFddpqFiuPE5Qy+sGB7Mj69XBB/V/xvgD8rKv0E0bOXMJN00Fp+dF/
 7gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBC2bj0ZsMYdaOYchJ+KQOzARFJdiNOfjZkpl8qTfyk=;
 b=jZMUzMIAT+VliVZ09b67ctp7qHKd7wMVkOhZe6Mg/wA3f6/fhsDVts2GVSc2BkYOfA
 WHf80+P8pL+CLRWW/mrrQmG63war5hD4qzREijN38YcX7LCNwZCp5JyHhXHtTm5m4GUs
 buay2juEPjbbHSUAT4xCBRQ1sG773QIauOweAJVPoSwmr//BZFm+oSsPLN14kG9Qr2ky
 6XLcXJ3EKqVkDh1rVnSp+dON8sGKi8mrUszk2wuUbxaIBhl6hVgBhumGFGXYeWG5Tohp
 ghvhGl+rEFmFhiDpXctGV/wQvTpBNPkgJYB1+GVf4JcK7yJF6/uccdaRpyEAWJUl5rB6
 wJ6A==
X-Gm-Message-State: AOAM533wdJt2q3R0hao24SLuPz/yY/LvGv5IztLLxLiTJOMJmfvoa/+I
 pasjihRmS6p4/s54c6Nf7Bk=
X-Google-Smtp-Source: ABdhPJwE7cG1b/f1uG3aiOr+hsVZgWMcVpfJ0LZj/hPl/BCYFDe5UMC3laoY814b6TWn2uU27dWxJw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr3850449wrp.298.1619173468179; 
 Fri, 23 Apr 2021 03:24:28 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c16sm8145695wrt.83.2021.04.23.03.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 03:24:27 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] linux-user: Tidy TARGET_NR_rt_sigaction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b1aa174-140e-0b27-1fda-589329e157b6@amsat.org>
Date: Fri, 23 Apr 2021 12:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422230227.314751-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:02 AM, Richard Henderson wrote:
> Initialize variables instead of elses.
> Use an else instead of a goto.
> Add braces.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

