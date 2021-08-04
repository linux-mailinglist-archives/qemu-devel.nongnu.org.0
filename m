Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F543E09C8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 23:02:52 +0200 (CEST)
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBO2N-0001sK-V9
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 17:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBO1R-00012e-6C
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:01:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBO1P-00085f-Ig
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:01:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso4766620wmq.3
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FZ3d+BTE7qUop2L+aM1UPhzF20Hi7+16d6zr957d/dY=;
 b=om9CzosDeWIL0NjZMqCKP9OPBZdtSliLlqLPHZUEOjmBZ3iWil3lMCZ4p2njM7Y37h
 oBywWsVabEuzE4MnPX1xj8k1XrMus/YN5k/2F/2Aoi3/uPThahopgvzodpOIJU8GMZ9d
 ZVHxwTDE4MD3hPLh46EE9odr8+43IFgryHUF+68fQZjXm7G6VfneYJaxosl3BCqUNvSq
 QgjEU7zwzeil6KVyg68xmeTBOYKqpLi0KqrHVVmHX4c9K60mGpZTNRUEhVZM+TSHBrrQ
 NsF/EDmzGK5GJNlLGptGwIut7sk02bJEzRxXwnPhiTxoKkdWQZ9Eiboq7d+tbtpMOVsS
 Yc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZ3d+BTE7qUop2L+aM1UPhzF20Hi7+16d6zr957d/dY=;
 b=qPvOwMfsA7/0cGJMaX/vr+qUNUpofOZEUm1HfLEMPCKBrGhaGc+ZH3UvgHX4HbKrnx
 JA3LgyPtQaxVbssnZ6bRedKlMmFDN4TRzOLQJLa82cjxTSyLubsbkqN7xM7777OZGhpG
 oXFmWG+sPw5YAZD4/qEhv+h9Y4HEaMLrjJDBnhdQA3Dy2cMlDSTcjvYSrYzUV2wgD0zm
 dQ+HLv6HFbaxTFu0cQtYvUHnr3y8qpECY3R3mXz9oeXGZCczSD8vo/N5i/KVBrdwBNZv
 ddkLADYX3pjXhVlG8vWjR3H8rDImQBQhtLORO92k4HylhCPGAgRV+JRv+DWGfFazfjW4
 AWiA==
X-Gm-Message-State: AOAM5332cAbPnkW50bB76DqcKGrSYWAs+XaCQDo9WqziDdcS1FYAFNa5
 vWLkfHR7dm83yjY5rcbhvsOuHufsHnLgDw==
X-Google-Smtp-Source: ABdhPJzfBXxqbkRb7z0QlZGg8uLbcWKqBdyMlE2Thu0qh/XyUcN/PRM4j69ZNmpVHzq9wde1kDDhzg==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr11963394wma.49.1628110909843; 
 Wed, 04 Aug 2021 14:01:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i10sm6970288wmq.21.2021.08.04.14.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:01:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/hppa: Clean up DisasCond
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708205807.827147-1-richard.henderson@linaro.org>
 <20210708205807.827147-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <521679fb-9295-284d-ef67-f8f459c178c9@amsat.org>
Date: Wed, 4 Aug 2021 23:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708205807.827147-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 10:58 PM, Richard Henderson wrote:
> The a0_is_n flag is redundant with comparing a0 to cpu_psw_n.

Preferably split as 2 patches:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> The a1_is_0 flag can be removed by initializing a1 to $0,
> which also means that cond_prep can be removed entirely.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hppa/translate.c | 43 +++++++++--------------------------------
>  1 file changed, 9 insertions(+), 34 deletions(-)

