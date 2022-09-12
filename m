Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E238B5B5935
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:19:46 +0200 (CEST)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhTd-0006ac-Jo
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhHi-0006bh-Hk
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:07:30 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhHh-0006M2-0o
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:07:26 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 v2-20020a056830090200b006397457afecso5563742ott.13
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0huXsxZHEoRxMHQUQ5r3eKLrIKpDUmeFPcMe79/5DUg=;
 b=P9/mpbRhN75eKJb3VBYoYq23hGWxnyK9EaVzi3/QJM+tvmvHguW9KhoPpe1+KQbw49
 v5lOMI27XMuwNAhoZlbkzgilWIGfSaKL8L1fCqoXDyijn4UsLdlQR8CJU8il4Jnw/XU2
 qGdnLOrWG9o3SeVEnqSaKZJZhTW2dvNsqiSycS3/fmsGbdt6Tvff+BcDO9c1hzlQ14kv
 U3OoNlqVvWL3JqRNE8Xac58Zm29oOVgBL0LPU+yL18F3sax/zzJ18B/EZTU+WFWxoa5t
 EiRm9Gl0MAnQR/exzJIoXq85uuQfmPWRMcml/dLTmPzuKlrVIw1JwOTWHua/2dtuwznD
 V/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0huXsxZHEoRxMHQUQ5r3eKLrIKpDUmeFPcMe79/5DUg=;
 b=VrHCVbdZ7HIsbjQhL5z5JM0pCy7WdraaUtepd0EEXjd0VBcaWh4XMoXZK2acurZbCe
 WvVwRJReJqbxnssBp2/i6uqOdhAjvJqpi+4TktNVXDyvsBhPoBkF37kxHT5jNVBSazCr
 g6oYu80XqqxP9JQWZEKVmZyigvx/IoGQS1My80tZ/ThqzXpdUyorbNXbbes5SQ4Y9Hj/
 T6MMDMcW4T1mAcIZms+2HxY9QMEFCpxrJI2gZr75jUboynwEC5GS/DSEb4JuPWZ8oBxB
 52CWL+YYBs8g+bx0UI/RjfDQw5qt9nsxGvsPIZCpZj1n9QJocSTAGg4izGdlJN2qx00O
 g4VA==
X-Gm-Message-State: ACgBeo0JpMv8U8u4UPdJWqpgbK6CdTMaRffIIZdByjQZQOK9iE8QHogS
 imL2f3GwMpOLBYQ82GB/6DMrlw==
X-Google-Smtp-Source: AA6agR4YXBH0tsw9ficTu09KHFafh0Xxc0IrcTJfMf1iaD4gLawHc6k+yRnkipvUEmY0mFEZP86GqA==
X-Received: by 2002:a05:6830:114f:b0:655:bd97:7a9b with SMTP id
 x15-20020a056830114f00b00655bd977a9bmr4424089otq.287.1662980843682; 
 Mon, 12 Sep 2022 04:07:23 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 cc3-20020a05683061c300b00636d0984f5asm4362891otb.11.2022.09.12.04.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:07:23 -0700 (PDT)
Message-ID: <a9fab614-99cf-3d6d-f0d2-1b624ffa00b4@linaro.org>
Date: Mon, 12 Sep 2022 12:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/37] target/i386: add scalar 0F 38 and 0F 3A instruction
 to new decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-13-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-13-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> Because these are the only VEX instructions that QEMU supports, the
> new decoder is entered on the first byte of a valid VEX prefix, and VEX
> decoding only needs to be done in decode-new.c.inc.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc |  59 +++++++
>   target/i386/tcg/emit.c.inc       | 261 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |  49 +-----
>   3 files changed, 323 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

