Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72AF6CF42A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:13:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phcAE-00051r-SR; Wed, 29 Mar 2023 16:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phcA3-00050e-JJ
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:12:51 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc9y-0000DR-6N
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:12:47 -0400
Received: by mail-oi1-x230.google.com with SMTP id q27so11818404oiw.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0MW6oW5X2zISsQ0SlvtLf4aBKpFW5ruCVIzb0O3R2sY=;
 b=TAOCe6RiIHJVme9NKlAhzMXWyLi471ixdyLy+lkiIMJ/JFJg4gzy4yPFnEfDvM3353
 tQjwQlf2PDcTeHrgY81D56BR928pUV+50IJr56NaQfTtIo2Q4DrlhExqHPXFvwoArzco
 1bBBAnWKLkY/Pv/NnrbVhJ3gk7wn8XUr6qc3o7z7FfYNeLcSOEwb+DWH2BTDIN6WqYv1
 85QFyJEqt0JLkB31FJMTyMXwl60e3QSqATlfDKdVvcXzT8sQwISzVlevR9k3SdhWzrL1
 GxJy4e/KE5Ji02k0+nemB3MDAZjO4Oh+oC1xslrcto9CvRImpDgxRdEwEwJw9FhqmV8P
 v9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MW6oW5X2zISsQ0SlvtLf4aBKpFW5ruCVIzb0O3R2sY=;
 b=tTpXyc3TpibvMxxiK5lp8oNeWDjQ0lCNGnDEq3W38/F3fnAJ4vTsuLIk9Dcdr3elag
 oYLwY8hs4Z132TnUfHiSRiBFFGedCdlqp4eZLtAK6O/ljdlUBcpBAUPhTfL33muMQ5bz
 DvEcY7fbV2ip/st8VJ7Q1QQGK3zLuDqdLvt0C/whlF8rsuA7sIwckbuJbMGkktFK7nUm
 uMWvRScrFjDbbYMPKjZuGJ6lFBd6tAIKxF40Yh/7Q3VKpmHMgO+T2sh9mC3/9Y301go9
 rtnq9X7yiPxKzOe7qbpSB6/kvP80RpgLw51b4hh7wm5bgOFj7CqOSR66qo2I9nj9WtlF
 Da7w==
X-Gm-Message-State: AO0yUKWRRx4+xTuOlgIF+Twj3CtjlUkVrAP8jQBYY0FPgviGZuPQgreZ
 d/YgNH63GzkHKeVnvNLdJNGqy5do1x6vZ0rEN8E=
X-Google-Smtp-Source: AK7set+kSm/gNnMF2spjUlhso1FApiMq3cnfxj/TU8lhvH7W2fJp5OyL5KXiqp2Yw5gs9H+m0HnuNA==
X-Received: by 2002:a05:6808:6c4:b0:387:2f8e:fd56 with SMTP id
 m4-20020a05680806c400b003872f8efd56mr8086705oih.33.1680120760770; 
 Wed, 29 Mar 2023 13:12:40 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v47-20020a4a9772000000b0053479edbc17sm14130845ooi.33.2023.03.29.13.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 13:12:39 -0700 (PDT)
Message-ID: <0514327b-0733-39ee-4c1e-aa2f8b495603@ventanamicro.com>
Date: Wed, 29 Mar 2023 17:12:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 0/9] target/riscv: rework CPU extensions validation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 3/29/23 17:08, Daniel Henrique Barboza wrote:
> Hi,
> 
> This series contains changes proposed by Weiwei Li in v5.
> 
> All patches are acked.

I forgot to mention: this series is based on:

"[PATCH v3 00/20] remove MISA ext_N flags from cpu->cfg"


Daniel

> 
> Changes from v5:
> - patch 9:
>    - remove ext_ifencei setting from rv64_thead_c906_cpu_init()
> - v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06740.html
> 
> Daniel Henrique Barboza (9):
>    target/riscv/cpu.c: add riscv_cpu_validate_v()
>    target/riscv/cpu.c: remove set_vext_version()
>    target/riscv/cpu.c: remove set_priv_version()
>    target/riscv: add PRIV_VERSION_LATEST
>    target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
>    target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
>    target/riscv/cpu.c: validate extensions before riscv_timer_init()
>    target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
>    target/riscv: rework write_misa()
> 
>   target/riscv/cpu.c | 330 +++++++++++++++++++++++++++------------------
>   target/riscv/cpu.h |   3 +
>   target/riscv/csr.c |  47 +++----
>   3 files changed, 221 insertions(+), 159 deletions(-)
> 

