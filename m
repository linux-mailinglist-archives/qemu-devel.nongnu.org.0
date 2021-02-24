Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26995323531
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:26:41 +0100 (CET)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEiwq-0006dZ-3l
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEisx-0004JA-DQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:22:39 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEisu-0000zM-Vb
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:22:39 -0500
Received: by mail-pf1-x429.google.com with SMTP id w18so199968pfu.9
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RKfCQJr1aidV6EobI0q8JFCZT43W9HIey+u7aOW9qhY=;
 b=zi4dP/lu07HpzvgoxngX2Qu+Gl3YSxgsQIxbCAM7/pkurwNtMX9JaCCYf69MuNMBpg
 K7ebcGc+waPdkieWcZyeKlgwzs6iRmSXTZgvd+1lGwqmq6M0iQbm85+r+lAU2dO3LoZO
 ocj9UQzs4N1nwNRBbqB5B90QXCrdp0EHkGMJtdCkqSQasN59UXXNSbs42AD5XoC6cM8D
 oWyL4GXNKzaa3nJuJ97+de0Vnohpknk9wiP5zM0NF6qSui/+nyODKZwj3UD1ORoLNmUn
 i9YAFtksWjW/3VDyS/J+m1Rbl7utpwuRY5z8hjB7mkVHTWCaTPn3kIqiis6jgfXILXIB
 dDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RKfCQJr1aidV6EobI0q8JFCZT43W9HIey+u7aOW9qhY=;
 b=Qtsrb/8qAYS+wZtMmNPSN0PL8SwcATyjgWoonBl63ZnvgSwdomTm8G+5yLQxpbyQOK
 R4Ez/W/pIP5tAJZfYVqmFLQA6x7loM+NJJXCWJrrAktb4NBvPnUtMZuhj1c24OvLJt5l
 6Lr3g0SPInU6pE+zus3/sh83Bh4z/npq0VwPrZIAvdvQmnpuK1evanobJocP7Nf6I2AN
 XFgun31Kw8bmybG4s1GUiOZd6FftBY7+v/16HD+BgPlyB5ovOoUcxuUtVix6aLG7+s0m
 818rVgnCiAieBhsYT/tcPtIQ+AxhubkPKvvkFqJnE3uMPwr1ef9ZvXmTwtqH9sHXODWQ
 g3aQ==
X-Gm-Message-State: AOAM533fhfTQbI+lE4UUuUoCquNMIYIl7OndL4MdrSj0FGuT/0FUbNMb
 0b2rE/vEcCXed8Q925GVM8BxNA==
X-Google-Smtp-Source: ABdhPJwYggjapMjKBRGNmZ62kI4rncj1+0ql3Mr0DwoMpp/MvoNLRTi71WgFbAfEUpOMObmDMMQUjA==
X-Received: by 2002:a62:6304:0:b029:1c0:d62d:d213 with SMTP id
 x4-20020a6263040000b02901c0d62dd213mr29124463pfb.79.1614129755165; 
 Tue, 23 Feb 2021 17:22:35 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id l15sm342419pjq.9.2021.02.23.17.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:22:34 -0800 (PST)
Subject: Re: [PATCH v3 04/10] target/mips: Pass instruction opcode to
 decode_opc_mxu()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <caca3eb5-96df-7bd8-5804-89d52360c973@linaro.org>
Date: Tue, 23 Feb 2021 17:22:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
> In the next commit we'll make decode_opc_mxu() match decodetree
> prototype by returning a boolean. First pass ctx->opcode as an
> argument.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

