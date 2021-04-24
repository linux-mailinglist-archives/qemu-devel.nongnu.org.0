Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F251036A26C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:46:31 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMMQ-0004nY-Fw
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMJZ-00048N-3o
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:43:33 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMJX-0005o9-0t
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:43:32 -0400
Received: by mail-pg1-x52d.google.com with SMTP id b17so319329pgh.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wd56VSwvj/tNeqr4ptM1LYK/Mk0QaejeGbSw5PfEjoE=;
 b=iworaepel8RLB1EYGrSVkhYp5ViqtUxIyjYsqBdZa+LyC0SG0YynAC2v76U1oitdcY
 h6uGNalgCbIr27byCo/A9tCOV6hFDjAhE5BpC9Bl4anbldGTC2i1gqw+Vh2v8XgpFLAd
 iXp2NvkHYk1Go9aWUzIJS8C/PDCgXYlZysxiaLOSLLJeQDFP9bu5opNAxsiUKsPcBREb
 0TgG7b08qlDXQb19sI9PFgJey8unox/NlvBTHo0a7CFpGxnH8+YHVfxhWsvRgicHZXel
 JRPL5Gp+a9Pc8P9nEBU98yJIhZuBoq2s+2HqTXhxPQrm+jUckArWncZIRaVc5uYXOgEK
 Btsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wd56VSwvj/tNeqr4ptM1LYK/Mk0QaejeGbSw5PfEjoE=;
 b=ZUKCsH59EPjRs7Fl1Nh9aMmiF6HuMQpHqu2K0++t88mYDI6RmtKxs2l8/owCr7cgWW
 nGg1RO1zB32wjGVsXozffGQewtCJtGO50UaH++lH2enJRDbl+RlRn0EbDSCYphw198f9
 UkG5FRJTa+RsZGjAijwcncDViSlghJ3ToKoxVNfU9BnK3tBJFM/EpiZ33V0TXtKL7CLz
 tB7JFUq1abssbB20XNftubvA221TvFySXczWl3S/+sMvVOKaLcK1WQtlNpZ9Wpk93pn0
 MUBU3CzIFnkq6TZxdvzO4NhJoINRKhfSgBtJ2NQBmBZz32WIztbLHpWlL4g6maMstrJa
 VQAg==
X-Gm-Message-State: AOAM530FQIN3Mny/ZsSaNHGAb8p+XsLJh85Rb4jWjbpjIEBxvdYp40Mf
 tDAS2FD6vUtSfibBlbC4xiDinQ==
X-Google-Smtp-Source: ABdhPJy0PSTawHCKEN7uVzFGglQfsdGZkWMPdHeqW+1bXjbiEXbrpwkp/6ygUVY1sxgahBudiUHYUQ==
X-Received: by 2002:a62:7642:0:b029:25c:7cdd:3cf4 with SMTP id
 r63-20020a6276420000b029025c7cdd3cf4mr9926149pfc.9.1619286208839; 
 Sat, 24 Apr 2021 10:43:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id r127sm7614818pfr.163.2021.04.24.10.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:43:28 -0700 (PDT)
Subject: Re: [PATCH v2 25/48] bsd-user: move x86 (i386 and x86_64) cpu_loop to
 target_arch_cpu.h
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-26-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45877c85-4e7c-7dad-1348-2ba1582237c4@linaro.org>
Date: Sat, 24 Apr 2021 10:43:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-26-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Move the x86 version of the cpu_loop to target_arch_cpu.h as
> target_cpu_loop. Create a cpu_loop that calls the target_cpu_loop function, but
> only for x86 for now. This is code-movement only commit.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_cpu.h | 177 +++++++++++++++++++++++++++++++-
>   bsd-user/main.c                 | 176 +------------------------------
>   2 files changed, 179 insertions(+), 174 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


