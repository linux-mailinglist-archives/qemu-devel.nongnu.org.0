Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398F2EA144
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 01:07:19 +0100 (CET)
Received: from localhost ([::1]:42070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZsb-0006ng-IC
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 19:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZqR-0006G4-Iu
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 19:05:03 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZqP-0005LX-QK
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 19:05:03 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v1so621224pjr.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 16:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j5sy9PW4PsxnGraa1YqfhSzalXmT7mKjtdGcpB3ZCjs=;
 b=K3xcOug4lxi+UpdnS2WZ+GieHVXlqAxB5klX/KBGLMfI1xuJyM5KrdgRdTIJwIW2Xq
 BrJVEwxCfRluEIo+iXe8RuHjp+oZn694gR9E1OuQrEMVwghoW1oYy3rQL42ImiNYCyGR
 Yrsm0PBxCqBLs/m9GKxpODLwpA+v+1BKM6sm0om/T50jtxzHnvs982A6F0xn8gRDfBd2
 BN0LKRNXhsDspbBZQQunTVbOWCZeTMf0GIoIwoVb9wj7wiTyNGn7DoIDKn2zaqUQ54qI
 j51zZRz9wVa3eo2/ityeuQEc698oY+Te0IMgrxENo+gzS20nye1arvZggaHZtdNOJoJq
 bmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5sy9PW4PsxnGraa1YqfhSzalXmT7mKjtdGcpB3ZCjs=;
 b=QcI/YmJi9Ev/PsOvFPCWY7PZ0MdQ/TxomNf6W+9E1ga7nuCeF3sWon/H6l+UQW6Uqi
 dxnyorbq3hZ/AGB0iupTxj9jiv5RQcefX0SH6UI6MToWg3Obl48Iv6dowKm3ECHKiKX2
 Qyj2qE0FKzH7hYKqbMXbuUYsZuQJEDLXzqkhmmMuYkKjHBrfR+OViAg/ZL7s2WSDmDlM
 QV9iSFRknAse+pHhGDdCfCID40+/ujvLFXG7lqWY528bDvMhQBf37j+wqgcM+BQbqA7Y
 Y8iIj28tRhmMvzwvwi9hfHoJqRYFHW0yThJWVl/8JiiVTEmF6a2+xGjC/N+SNDZzCc6i
 90ow==
X-Gm-Message-State: AOAM532BXmCZQlRivyVs0oV/oZho9e9PoEe5QGBLWKsimRRvdEoP61Zg
 sFti3HU7Dy6w1QoAVR3/dLF0kQ==
X-Google-Smtp-Source: ABdhPJzfow8uYS4YRhmfUupGow/udJYlLNilKj/nLsBb9uSsdQiQgwDnamqYY30tWN4XrAPojukaUA==
X-Received: by 2002:a17:902:5997:b029:da:a1cd:3cc2 with SMTP id
 p23-20020a1709025997b02900daa1cd3cc2mr51572312pli.80.1609805100272; 
 Mon, 04 Jan 2021 16:05:00 -0800 (PST)
Received: from [10.25.18.35] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id c10sm469198pjn.22.2021.01.04.16.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 16:04:59 -0800 (PST)
Subject: Re: [PATCH 0/2] tcg: Eliminate scratch regs from i386 backend
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20201211011453.475155-1-richard.henderson@linaro.org>
Message-ID: <3c231e00-9ddf-295b-9eaa-b87bbdf3b8fa@linaro.org>
Date: Mon, 4 Jan 2021 14:04:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211011453.475155-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 12/10/20 3:14 PM, Richard Henderson wrote:
> Eliminating these cleans up the backend a bit, allows the
> code generator more freedom to properly place the inputs.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>   tcg/i386: Adjust TCG_TARGET_HAS_MEMORY_BSWAP
>   tcg: Introduce INDEX_op_qemu_st8_i32
> 
>  include/tcg/tcg-opc.h     |   5 ++
>  tcg/aarch64/tcg-target.h  |   1 +
>  tcg/arm/tcg-target.h      |   1 +
>  tcg/i386/tcg-target.h     |   6 +-
>  tcg/mips/tcg-target.h     |   1 +
>  tcg/ppc/tcg-target.h      |   1 +
>  tcg/riscv/tcg-target.h    |   1 +
>  tcg/s390/tcg-target.h     |   1 +
>  tcg/sparc/tcg-target.h    |   1 +
>  tcg/tci/tcg-target.h      |   1 +
>  tcg/optimize.c            |   1 +
>  tcg/tcg-op.c              |   6 +-
>  tcg/tcg.c                 |   4 ++
>  tcg/README                |   5 ++
>  tcg/i386/tcg-target.c.inc | 138 ++++++++++++++++----------------------
>  15 files changed, 91 insertions(+), 82 deletions(-)
> 


