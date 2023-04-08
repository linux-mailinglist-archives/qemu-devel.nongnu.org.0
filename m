Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B76DBC87
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:04:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDqr-00083c-0t; Sat, 08 Apr 2023 15:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDqp-00083T-C3
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:03:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDqn-0001FM-Tz
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:03:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id g3so2085701pja.2
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lCOGffkJ9udoQuNAxRT/WmESW7NFn4kmRN4xeVpjtEo=;
 b=WVlBTIWpuJGoIQHjCGjkRgTYeZ3eEdlYXwF/qB3Mc1D5fdO+a4rQMUPKGUuxtO2l5c
 mtqh1uQr64OCTSBWzCgyCUO64TE72THfUBavzpp/v7VTWXyacuT1aFqOeVkY0mc/FUar
 2l9SQW8X345IMvNNWhEgyRvqpsJegIripVHcUloCrhlVBz5v+cOg04blp9yPmaoo4Ysf
 PTcq8/O93WnNWcNauV7yDWG70+b9a36VDajR2JAi8tdJaqcUrCcJjEuQKQ+JZw4PYo19
 JeHcQjjc3HHDyR93IxIqFatEdF2rTT2Y7W9s8zTT9ObxVlWN52O6XgzuaR0f1o6+srw2
 o7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lCOGffkJ9udoQuNAxRT/WmESW7NFn4kmRN4xeVpjtEo=;
 b=0ybNl3PGIUJhwZ4Mt4tQPKwlZomv/XEs3/y3WrCq8mOaEtzJHd/qS+/gMvQUn+/N9W
 ybDENamUFAzsSky+q+qb1rLnYQbc8CeTWSXHV4otFZ96FEyNhVWtb7+IFmw7vIvNbPdO
 UX6FrUr2dKhvmi6Kb3hJ1UxSz6tAw3ZgUOkmFvlfk2hHvroXL/LYOvsPiKRMhfBJrC34
 Ol/MoF7qcY6DL2u+YrKF8kYlQAT89IkCu2ERnOsAnKWKlPF3EImm0lgDW0n3H2NWybhU
 jWb+puC/2ehFUjYaJU9f0DOWQHtI+3U2Ohv4Sr+O9/j8FhNR4GfBBAHbtszSgrNFFGFg
 05xw==
X-Gm-Message-State: AAQBX9ewVqoYViL4mkya4Zd9a3OGAgi4CrhB6CfsOUeE05AwpD6I7XTx
 x2Sdl4EJp1AKLyl3aHmWidRVF2A1V0judYSf4ZQ=
X-Google-Smtp-Source: AKy350Zu3jXcTdxOYLLAT3OEW7zGiWnIlqEreHL3iAywu+fsV6wBbkq2KwKf+FB3b0kDgAXnEHvQLw==
X-Received: by 2002:a17:902:d1ca:b0:1a4:fe85:ab1a with SMTP id
 g10-20020a170902d1ca00b001a4fe85ab1amr5621330plb.44.1680980628331; 
 Sat, 08 Apr 2023 12:03:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170902b09100b001a3e8020348sm2502228plr.3.2023.04.08.12.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:03:47 -0700 (PDT)
Message-ID: <5641b16a-7b98-1896-6ba7-0a7c71e942f5@linaro.org>
Date: Sat, 8 Apr 2023 12:03:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/16] bsd-user: Cleanup style.
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 4/5/23 14:35, Warner Losh wrote:
> The only diffs between bsd-user fork and qemu upstream is style. Make
> mmap.c pass checkpatch.pl.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 91 ++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 60 insertions(+), 31 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

