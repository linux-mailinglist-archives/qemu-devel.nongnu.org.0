Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89142CE4F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:34:27 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mampO-0004YU-AS
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mamnT-00039i-Pg
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 18:32:27 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mamnS-0000xU-41
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 18:32:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id kk10so3360207pjb.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 15:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=552Hf7L9o2Y8cHcQZpKeiRqBO0zhIx9uYw3umQfq/dU=;
 b=V2csutUEVbNGynsOj+tgn1XeJIG6d+mFir/ZZ0H3CHMhI01Gg7J+az285thlMdDfb2
 ED85Pp4AgkLkVc1DBCAk29G+Jd4cDUc36XB5FdhmHNXb6VKquYpS62q5eJazIrWSsd+7
 L50rhao/c0TPp/gUOeC50lMarGDF/GPmedbr+xIemc5coGy1487jq8LGtn1wwRr465uD
 UfB5VKzRxYIIZKyi+OPTQWIL/HzL12CAAEFAJKe4ihWGpv1OFauTBykUAWlwNWdkmMLF
 p1zXcfg7MlCVnZ9Z4DkveeKwUWNrRqZ3W6ewesFD4PbT35hdCxAbqra33ZxaT6UsOAgJ
 vAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=552Hf7L9o2Y8cHcQZpKeiRqBO0zhIx9uYw3umQfq/dU=;
 b=TrahvlLBN3m7nulwDxYsYc0XNgNEWtdJoK2zQUGQLCVR+J87LBM0gfo8Qxzh4Tibvz
 BZANncCds0m0YZKE2n731AMrqPiNCa0PFkDMgKt/L64+fRIt5Ca7W5Ta0Ysdw+/VOlMi
 qKKXTrQZU7IAlEaew7+Rw3/Qje9Ci3EcBNZlQkezHVoFCWyGCI0AKG9OQvCjPuxJhVfF
 emzt2EmwVTvDWLX9bSYwGsjSBJvfIQkCkecIOg9QBJY0O3ahxcTM5VM6WxsMT6anOkCx
 mhu7+kSRVAqnTU/O7G3NuwlolpfG4nfj2l58/ScCTgod4jMwxOEV6x90FqskZkUWT/8H
 U9Dg==
X-Gm-Message-State: AOAM530SeNXkipbPi4pHCRLK+JIS0Y75JrOfnwwiey3bcGszijLbBo07
 NcxmoYS/nQtjUCz55LgcHB7kzQ==
X-Google-Smtp-Source: ABdhPJyodH51ncsgVEDoMlGbAa/GkKIXCRIjHimGqwix/cRZEUtMPMMfmGQlbzRGfw3kMNJNN7f4bQ==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr2197543pjb.162.1634164343803; 
 Wed, 13 Oct 2021 15:32:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m12sm465211pjv.29.2021.10.13.15.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 15:32:23 -0700 (PDT)
Subject: Re: [RFC PATCH] target/mips: Fix DEXTRV_S.H DSP opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211013215652.1764551-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc55308c-2408-d23d-c682-bc611475941f@linaro.org>
Date: Wed, 13 Oct 2021 15:32:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013215652.1764551-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 2:56 PM, Philippe Mathieu-Daudé wrote:
> While for the DEXTR_S.H opcode:
> 
>    "The shift argument is provided in the instruction."
> 
> For the DEXTRV_S.H opcode we have:
> 
>    "The five least-significant bits of register rs provide the
>     shift argument, interpreted as a five-bit unsigned integer;
>     the remaining bits in rs are ignored."
> 
> While 't1' contains the 'rs' register content (the shift value
> for DEXTR_S.H), we need to load the value of 'rs' for DEXTRV_S.H.
> We can directly use the v1_t TCG register which already contains
> this shift value.
> 
> Fixes: b53371ed5d4 ("target-mips: Add ASE DSP accumulator instructions")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

