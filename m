Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D5673FFE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 18:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIYlm-0007Pr-4E; Thu, 19 Jan 2023 12:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1pIYlk-0007PH-Fe
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 12:32:08 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1pIYli-00086S-Dp
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 12:32:08 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so2577061wrv.7
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 09:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9/8RyCp6xQQMZyu0KriXIlB9H3Z3mhZfcOyZOi7Nz4Q=;
 b=FvKvlZ30vMVXZP7FnKItJ1Ayex2x3jnJtuz3PZ3FS6J1qw+c0n7lZLHMh7V1Ga2qM0
 8DYUj+rM0GRp2PFXgHcH8o6Xany7CjJo5lIis2ZUcv+j5fNbO51Tfhr2IZtaMsbT/IKb
 Pr7TBLyafC7ya5GU2/WXIT18/ThmUWOhXzktkG/uHu3fTaZv98DbwfWcXnSbYFWy25dM
 5Jj/2qf6pVxHleWQEov3gDwLpt1r96Jx1Tgj1pUEfOSoLFjMKm15SC/A+seg8mj+EiQD
 qWRk2JdM5cWOYePp3P5/eXoutdb67+Bk2LtlsO3ZwTZZOwcxhs+uSCmdg2mqBLP7tEjB
 pbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/8RyCp6xQQMZyu0KriXIlB9H3Z3mhZfcOyZOi7Nz4Q=;
 b=qjVGdpNoghHqFgnyyxPUccIr5Y58ScrNU/Wt2RQHfzSoL3pA+nzLv2nW7nDI1jN0WB
 GY76oMHL3U7zxWA6Uu/A1ZZdKyG8LE8g+MAc17dEgIjiWIHyigCl5uOs0CFfYr8d7+Ek
 V7kKu5kXX0t/5ZXDnxwGk6mE5tbUxUAuy5v5EAiRGG2p35nirzzjWijH35yPBEuJd+yE
 TDfguCBsXJg7zbWYn9bfNnERYQpQpQa0P+IssRfLJdje8VOwkE6lmqsImkTjzNq5R40K
 KkGxBKC+Tmze7CkWDLtEVs9RoV9Fu0rA5c781uvQsjiGBcWF6PSE/DXCtj2CT3CZaFG+
 cykw==
X-Gm-Message-State: AFqh2kqPf/PVR/3mrL+/ANWKi4PuzrmvlCQgJltDPRwjR6OPP6hzZVZv
 Xvl6EFO/JtpPE+8cKaGok+A=
X-Google-Smtp-Source: AMrXdXuAq61j/WDqCRBPLo7NIxZ6yQeUb6HPvFsYUjGIBN25Hflw4KH0kwHIA1PpUHW2URwO5E+/FQ==
X-Received: by 2002:a5d:6f03:0:b0:2bb:e896:5a09 with SMTP id
 ay3-20020a5d6f03000000b002bbe8965a09mr11911118wrb.66.1674149524169; 
 Thu, 19 Jan 2023 09:32:04 -0800 (PST)
Received: from [192.168.0.162] (bzq-109-64-151-196.red.bezeqint.net.
 [109.64.151.196]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b002426d0a4048sm35055405wrn.49.2023.01.19.09.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 09:32:03 -0800 (PST)
Message-ID: <827d6859-164f-a1f9-71fd-5cd9ba892a33@gmail.com>
Date: Thu, 19 Jan 2023 19:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] tcg: Mark tcg helpers noinline to avoid an issue with LTO
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230119165006.742073-1-richard.henderson@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
In-Reply-To: <20230119165006.742073-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/01/2023 18:50, Richard Henderson wrote:
> Marking helpers __attribute__((noinline)) prevents an issue
> with GCC's ipa-split pass under --enable-lto.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1454
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Idan, please give this a try.  By inspection, it fixes the issue
> with s390x's helper_divs32 function.
> 
> 
> r~

This resolves the issue:

000000000023f9b0 <helper_divs32>:
   23f9b0:       48 83 ec 08             sub    rsp,0x8
   23f9b4:       85 d2                   test   edx,edx
   23f9b6:       74 22                   je     23f9da <helper_divs32+0x2a>
   23f9b8:       48 89 f0                mov    rax,rsi
   23f9bb:       48 63 ca                movsxd rcx,edx
   23f9be:       48 99                   cqo
   23f9c0:       48 f7 f9                idiv   rcx
   23f9c3:       48 89 97 10 03 00 00    mov    QWORD PTR [rdi+0x310],rdx
   23f9ca:       48 63 d0                movsxd rdx,eax
   23f9cd:       48 39 c2                cmp    rdx,rax
   23f9d0:       75 08                   jne    23f9da <helper_divs32+0x2a>
   23f9d2:       48 89 d0                mov    rax,rdx
   23f9d5:       48 83 c4 08             add    rsp,0x8
   23f9d9:       c3                      ret
   23f9da:       48 8b 54 24 08          mov    rdx,QWORD PTR [rsp+0x8]
   23f9df:       be 09 00 00 00          mov    esi,0x9
   23f9e4:       e8 a7 df ff ff          call   23d990 <tcg_s390_program_interrupt>

Thanks!

Tested-by: Idan Horowitz <idan.horowitz@gmail.com>

> ---
>  include/exec/helper-proto.h | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 

