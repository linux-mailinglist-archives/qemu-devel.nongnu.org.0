Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0B5B6C1F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 13:00:25 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3eS-0006ft-9j
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 07:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3Xk-00083z-Ar
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:53:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3Xi-0001Rf-Dv
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:53:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id t7so20092083wrm.10
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3LYK8jGREANOjj5Xvz91DxnkbdGKiUjaI3Nz/Lzd2PY=;
 b=hIHu8SwRN4xGcZXhyydT84ESsaaEx6R6tiIv9lL5NDihxnz8VUm1l5Ci3aNqmR0Iih
 sQlQruWkDcY94QmbbeZlxq3HPmbklx4mDmMyVtYDxOYgYmyX4WB4OzNERTmD/Me42XEa
 ErOPo0hK9D7z5VttgI++HOujZ/J3EcF4fIO/gWtFYCOowboszLmzWafn2aq/UsxnVSaa
 +iHDeznvTHhAM1yvjit4CR1TLs+wJme3k7I9hkUlWMwbFiw/QnZkqS46fDm24NDgrgrZ
 WDahPW5cd4GOID2gwPkI+Nru31NNG4R20umki09bW5nk8snjVTqIajmjdqX6xP5THPB6
 PHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3LYK8jGREANOjj5Xvz91DxnkbdGKiUjaI3Nz/Lzd2PY=;
 b=SL4R7Z6O/2F3u4vErAmN21Cc5hjzb5/ww+4TjKXGWf4Xx+MJOd3DqUnX+cExMrMpz8
 HLm7m1ExljHzRBtNqHeQurta7CM0ed0EB/Du5qwt67rS10t4gVSlDhI/sm7aNIwGJuJ4
 GYE4f3v0FZuZy0BNjOwRzEGLl03dPfUniw//+kPmXtjG/BM+D2cZsTvjR9utd8s4ffIQ
 6KHtxreE/n1yInuzM6EGkvPFjQYslTUxoH9DcO1dcTs/l0xkX+953Bk/zrWaIMLm87XM
 e0lSYlZLJj5xzihm5Q1700T5DtppJS5QXYYSvx2HJ95hO9tpI62tGTCDCOZ2E9cTIVnM
 o8DQ==
X-Gm-Message-State: ACgBeo0GUeUMKFWsDjgeZ5J4+RaPjlocsfcMrXYhQdn4yRggV2Re/FBH
 lijglclkJVYEzCiEG3K1fXdy2Q==
X-Google-Smtp-Source: AA6agR7OD7cialmjBYp+j0Rs+JbFB2TuBVzr4PwTH3RaBMaRG0l6qnoE9el/8+P53ef2Nm+vdFntiw==
X-Received: by 2002:adf:de83:0:b0:228:d8ad:c0c6 with SMTP id
 w3-20020adfde83000000b00228d8adc0c6mr17430050wrl.500.1663066404520; 
 Tue, 13 Sep 2022 03:53:24 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600000c800b002205cbc1c74sm10138080wrx.101.2022.09.13.03.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:53:24 -0700 (PDT)
Message-ID: <c16ba95c-6a97-92cd-ee01-67f5fd0a65ff@linaro.org>
Date: Tue, 13 Sep 2022 11:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: qemu-x86_64 runs out of memory
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
References: <mvmczbzty5j.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <mvmczbzty5j.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

On 9/13/22 10:35, Andreas Schwab wrote:
> $ cat mmap.c
> #include <stdio.h>
> #include <sys/mman.h>
> 
> int
> main (void)
> {
>    void *A;
>    size_t L = 0, U, Max = 0;
>    for (U = 1; ; U *= 2)
>      {
>        A = mmap (0, U, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
>        if (A == (void *) -1)
> 	break;
>        else
> 	munmap (A, U);
>      }
>    while (L + 1 < U)
>      {
>        size_t M = L + (U - L) / 2;
>        A = mmap (0, M, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
>        if (A == (void *) -1)
> 	U = M;
>        else
> 	{
> 	  Max = M;
> 	  munmap(A, M);
> 	  L = M;
> 	}
>      }
>    printf ("%zx\n", Max);
> }
> $ cc -O2 -g -Wall -std=gnu11 -g     mmap.c   -o mmap
> $ ./mmap
> 7f672e5ff000
> $ qemu-x86_64 ./mmap
> Killed
> 

I suspect this is the same as

   https://gitlab.com/qemu-project/qemu/-/issues/290

Needs a reorg of memory region tracking for {linux,bsd}-user.


r~

