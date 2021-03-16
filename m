Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EC33E1EB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:12:16 +0100 (CET)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIrH-0005wN-Ri
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIq1-0005Hk-Of
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:10:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIq0-0006Qj-Ad
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:10:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t9so8277958wrn.11
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cB095gjeX/waj/BKHA77jkqpftujRQWUzdJ9TtrR+Ns=;
 b=ZU6Y6m8/UvR7iJAfzZAQspDW9Yg69X0KxBk3P2BFaHSpqjxagoAq7TsF/tHBCbQ8NK
 PDCVwjnDw0ZohHWXL1+JvtX1Fg+BPMCF3RQxgkPsm8wGiHjDpGB1MNkJ/+A1LSYI4UwZ
 e8wnnRSWXY1iZa3No+7E6EFPL7L+2LMt5GDGe4hMUtmE4RX4A1km/OGLkPuzdqERfitv
 0DZN76/RgYaNqI/Tnwgeo/NaBYnk4DtxR7z9wDR6ZWt+4i5MfWIjhQMnrUeg8sPtZCN2
 fbON8v06EBLF9ovl6i8uNvaYqMgdGbs/24R0cncAJ6/J5YuiKP3vPhAnpb/jXO7xMd9i
 Nmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cB095gjeX/waj/BKHA77jkqpftujRQWUzdJ9TtrR+Ns=;
 b=l/tLY0LjCG7NUnYDqaE39+d7UmzxPjDt45lYv1GIhzQ1+h94LjsweMGKA//ONL5MxY
 jqD6ehDle5VLoXUksnqrDDfQYAiIlWAGgdd5xScAWEvFX7jng3pafYGnqGY2TssWsMyK
 ExwKYWk8yNh/fRRPVO8VCWjp2iSG4j1Z63Pfuoa+GCayF0p+HCxkduzELQmFN/7c2xZ3
 M8CabGrc4bddaFJdo/hwnhU+QNVUiZF2WjhwCy18mEaxcOvzWV1+hStIiwL+zvWjDdlB
 V15hgeIg3e+9m1pWg3afjz7/CrPgOYpXVxexipQAOJduFDjRvabccfE5m71rfHMbgTaP
 Iifg==
X-Gm-Message-State: AOAM532jJ4Gnr9lFXZADiICXtAcmzDXikcDxKOYmDbA+ECd2Ir4G8Hqb
 F8zRzvtm//86aJpMgUZfjdg=
X-Google-Smtp-Source: ABdhPJzIs8u//Op9UfusWBpc8usXj8IrtzMdUUYcN+cJ3P674w/OKLLz1sqtCekTEFahIqW54YPvQg==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr1317847wrv.194.1615936254544; 
 Tue, 16 Mar 2021 16:10:54 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p12sm23159212wrx.28.2021.03.16.16.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:10:54 -0700 (PDT)
Subject: Re: [PATCH v5 17/57] tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand
 to 32-bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <726afa2b-e1b3-0df6-f338-90829e3c05b7@amsat.org>
Date: Wed, 17 Mar 2021 00:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> We are currently using the "natural" size routine, which
> uses 64-bits on a 64-bit host.  The TCGMemOpIdx operand
> has 11 bits, so we can safely reduce to 32-bits.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c                | 8 ++++----
>  tcg/tci/tcg-target.c.inc | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

