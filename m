Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522004203B9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:26:50 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX78J-00067m-Da
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX76x-0005HW-Jb
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:25:23 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX76w-0001rV-1B
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:25:23 -0400
Received: by mail-qk1-x731.google.com with SMTP id p4so14464581qki.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rL2RpSuZREZ1gJgyKq+mV8/IFBsO/CCJhSzTC1fObLs=;
 b=lHzRzIqRQNgUq8FsHPzGKiHPBzJHAHKTLP7qLcdIsL8sPb6YYXT5bYMObjVIR4/RW4
 ihpfVtRvmY2YbvqHAsKxTuTYYcG0D0j3Xijbff+rxluZaSFhue+pDdUJSpRbUgWKfuWr
 V/S4rqZxnF6Jre3PVYA0aqAvXr194IXdrFx+AO06lPlIpVrQghA4R5/hFS6uDvReGLhq
 7EUCtEqwHDLG2p6S8Y2zRF8eMT6jFYYTF0b6JGRzrwWcFJ1X3qsqZv/kMJVwwJDTkdLm
 4DPXtlH0cjGrMlMwS0n8jcjGMKT7mFX/Y2DfQ2H3z7eibMtX3YPoLwSEfnUJGC+MDkkL
 wwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rL2RpSuZREZ1gJgyKq+mV8/IFBsO/CCJhSzTC1fObLs=;
 b=JGH+PWdzAnOS4XQtG70itVDtGFEM+nuVaWQM5DKdke76lJWP003/mKf0Ra9AqRT2XX
 BFaaBru4qB6UMkVjgKXunDSSn8iFeaYUM2z2zz7hXK1V6htbCltXGmqDprZgOJHlJC9e
 IGheDEKI2JlCRJqJoEnh3GCEawPbV1Zj/a2zIJkHGmEjaLrM28bWXxcgWITK4b/ei2V5
 4/Zm3CD2KQpo8Q0yK4fONoaG9Ngkarm4ax5fuc4gaarZZu1k4GzGFZnIj/nQ/4tDmZC8
 6rAkq11AsLgqM3Ye28ShVjRU+vrDF5dKf+3HPEJ/TNJ/pSWPQxCFRf4P3Tv4sYXVtJou
 j9RA==
X-Gm-Message-State: AOAM532An8UxUou5osKixtVrRMNnNxMk7mC6X++W3aCki1CUvjR1Pxc6
 c2e7x2XHEjr0hfVEUASbhh4Atw==
X-Google-Smtp-Source: ABdhPJzkWGcI0XYVHsT1uO5ZJ52RCrRWsbMSOKMB10hDtWojARtRAfaFLTlFJ4UDu7Hs+CzrO7Lnsw==
X-Received: by 2002:a37:6487:: with SMTP id y129mr6957836qkb.419.1633289120540; 
 Sun, 03 Oct 2021 12:25:20 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id b14sm6685792qkl.81.2021.10.03.12.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:25:20 -0700 (PDT)
Subject: Re: [PATCH 2/8] target/mips: Use tcg_constant_i32() in
 gen_msa_elm_df()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90665637-4bd1-f0e5-8d9b-f69b9a3a8161@linaro.org>
Date: Sun, 3 Oct 2021 15:25:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
> Data Format is a 2-bit constant value.
> Avoid using a TCG temporary by moving it to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

