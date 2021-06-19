Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829F3ADB35
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:04:04 +0200 (CEST)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufK6-0000er-Rp
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufHj-0006Qu-TB
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:01:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufHf-0001zL-Ti
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:01:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso7725329wms.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yAUFGuPb6n98HnfjF1Zm+hIKh58TPDXxaTG86joIBu0=;
 b=OJBVOUtNImwFCJ2RWd+ooqAOCohir182bSk6eukfGGD57ucefJigWcZRMV9qoqeCLy
 W6EUby1CW6ighXz9+3dLEa5xWS4zV65tQmZ9LoHjPOmh8q2DszN58j20IOKV1IIlcjQg
 uXpPrhknFh0ori5vUtjYzp95zhCkMwcgjYLX4J8h7zVAp1dRAHt8McDismCN7UDFoGal
 rT8vUr0QDNt0wMGR19VqEzm1q1bx3wZHRACQj5EtxPJrb0G7HIgjoh/ajjbDXaqqP3a7
 IrRlz/eypyr+avWXEJW0wqJ3ecah4jhhJGKwSwq0Y+lIU+ad3KzSzZO1CQ05vRXTeF/X
 Nb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yAUFGuPb6n98HnfjF1Zm+hIKh58TPDXxaTG86joIBu0=;
 b=AQ+edNF1EiJZ9YTkNxV2id97K7aO0EbU6IFImKOaOicisJUaPqn5L0hD6wySGwXiIp
 bVP0FNkWUqIZ64YDPlBBljR0LvRtAdYC65c7NmovdxsvveWfMUf4a07cWKsLNB5x75h5
 yRlJxbBt2kmtLmqVd6FXbd7T7h4uF0lXzkL9v22WONeEyG2GriNjFfTVeBWjjifZNZzv
 IUfWUKc01FAkyrL3fFWs7cUz0379SYOOeC73mQ/1JA2nBJrs2zJzVhzdWFAhrOZPSpIX
 5pnj5Sh/Cm71vfc+HTP7eQCR8YHGQfFARRJs+556ZYBUza4C1L5NcahwKayEcjz7cOuC
 ssKQ==
X-Gm-Message-State: AOAM532nXhclK/KD1ywz4UQt/gD0X6PmeeezfUmlUYP2SKwWrJng9iLA
 7R/AiV5GYBHQNY0EbsWrDec=
X-Google-Smtp-Source: ABdhPJxkBglqglcaeKsAjoyGu/dRIf/XYzvUEkz006U7pcF9kBmk7IarJu1SM+1pm/TYIZAMdXDrMA==
X-Received: by 2002:a1c:7204:: with SMTP id n4mr11862539wmc.104.1624125690068; 
 Sat, 19 Jun 2021 11:01:30 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s7sm12410411wru.67.2021.06.19.11.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:01:29 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Raise exception when DINSV opcode used with
 DSP disabled
To: qemu-devel@nongnu.org
References: <20210529165443.1114402-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <526fce82-b5fb-8f93-9469-3a0b64edf53b@amsat.org>
Date: Sat, 19 Jun 2021 20:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210529165443.1114402-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Jia Liu <proljc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/21 6:54 PM, Philippe Mathieu-Daudé wrote:
> Per the "MIPS® DSP Module for MIPS64 Architecture" manual, rev. 3.02,
> Table 5.3 "SPECIAL3 Encoding of Function Field for DSP Module":
> 
>   If the Module/ASE is not implemented, executing such an instruction
>   must cause a Reserved Instruction Exception.
> 
> The DINSV instruction lists the following exceptions:
> - Reserved Instruction
> - DSP Disabled
> 
> If the MIPS core doesn't support the DSP module, or the DSP is
> disabled, do not handle the '$rt = $0' case as a no-op but raise
> the proper exception instead.
> 
> Cc: Jia Liu <proljc@gmail.com>
> Fixes: 1cb6686cf92 ("target-mips: Add ASE DSP bit/manipulation instructions")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to mips-next.

