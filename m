Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01E42E5A7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:58:22 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBYD-0005SP-JQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBWR-0004TY-3e
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:56:31 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBWN-0003dF-8X
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:56:29 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e7so7097795pgk.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FyExKxk530mZiplIehIhZqmqueSNIJFpdsnAQVrCcfM=;
 b=NIW9lpd2vOoe3YIoq0Q3/GDjW0gxwHrgR1nvU/mQJvCioKA3p1/IRE/zNOH7DziXzO
 pRlY4ObZAxgS5he0zM022QTG7D1X3NfM4S9urEpjQn3fYXTfWt+rPtIV5Mp/hPa1QzqF
 h4+/uUnMPp97NQFQuNbaH/MUmGzPYF7J87K6VnswV8jlf5ydkWejznkT9CyvIWr48MEP
 bOsuczLPhJbWT7cmfH6Nwo1O7g7N6sVKkHYmPcoCQelyYSpIDuX6ABN8tXjORSt5TGmd
 Khr0wFZpP6y5yHU4NqsUuAMtQi+VgKl+NZDmk7rzG6af+JliN/wDQQlattasEbA5uZjO
 Fg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FyExKxk530mZiplIehIhZqmqueSNIJFpdsnAQVrCcfM=;
 b=Hh0KrLyhQJGDYiw3oR09G63uzF+cB+EC60b7630kbLoESoGuCJDnUY969s6kgvi8WE
 3Cdu1Lmv0+5kfE479hNehSbG+SzLtTnsGDeDGVHTywXomT243qdYH0C1ot5kanLgyS3G
 HjX77JtEHoWmBTKj61nqbVSVdjoLB2JeHudZcpbhlLyAwJVSJ0STOU2oXzkdYSL1L4EY
 TZkvX6MXXO87PYjl7R0Ib/a7Uks4N0ztGFJ8dheb4WzhV34n+OZSyj7ipyYbs8YTzhds
 ZDOc9GIGf3s7jrG+ZAyd2ER9O+RiIBDn+gogKRNCbJ3aXB6pRn9TrcSrlHyY4uCz9An9
 ILPw==
X-Gm-Message-State: AOAM530ibgSbtjYbDG96uvcYk9ogeX/bOwWgnp+KVdTeX+M6Rjled3nh
 UfOJGHlCxBYq+I57fmYv0Ff77w==
X-Google-Smtp-Source: ABdhPJyMF9CmgU8pf6mccthdO6yNpmiqHO0bUGGZ/RbFhhyy5U07UwCDxBkGT8iozr7XJyyFmkoQSQ==
X-Received: by 2002:a63:7d42:: with SMTP id m2mr6703698pgn.349.1634259385415; 
 Thu, 14 Oct 2021 17:56:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l19sm3380743pff.131.2021.10.14.17.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:56:24 -0700 (PDT)
Subject: Re: [PATCH v2] hw/elf_ops.h: switch to ssize_t for elf loader return
 type
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20211014194325.19917-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6198bfd1-9924-38f9-2162-75d07a71a42d@linaro.org>
Date: Thu, 14 Oct 2021 17:56:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014194325.19917-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 12:43 PM, Luc Michel wrote:
> Until now, int was used as the return type for all the ELF
> loader related functions. The returned value is the sum of all loaded
> program headers "MemSize" fields.
> 
> Because of the overflow check in elf_ops.h, trying to load an ELF bigger
> than INT_MAX will fail. Switch to ssize_t to remove this limitation.
> 
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Luc Michel<lmichel@kalray.eu>
> ---
> v2:
>    - Turn load_elf ret local variable to ssize_t [Stefano]
>    - Add Phil's R-B
> ---
>   include/hw/elf_ops.h | 27 ++++++++++----------
>   include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
>   hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
>   3 files changed, 75 insertions(+), 72 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

