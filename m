Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE53B68B2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:49:23 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwJu-0004wO-6K
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxwHN-0002iZ-6p
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:46:45 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxwHL-0006AG-DK
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:46:44 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so406245wmf.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0pfi5UawWdOE6UXuRJRn3uZGhHlGD70yXnTKAyqyuHo=;
 b=q66+kDc/2SHxi0QtHPGG45Ue98HzJ+V6LNuuGzXCFcwqgB/ne00GfZ2tvO87+Vj8xz
 UKQVCQVhGyYXcZ7Qm/hTV82pDmtYRChC3/bSG7kE+bzu+TJTFMMKSKJWwaZIhYy16G9K
 xhKX2d6jwRAxQ9mS5BNFkZ9lbHNaLiEJhWxW1m4y8L4Q0uPlcJ6nvfkp0pch2HAECzQa
 UHn9PGOXOfru+h7GtZSQ0xqTHaVFEoAJGLtItAG3+pafaOTejSFqLnWQk989SEsrMugE
 CukAy1iGJUuOlb72MR2W1LAG+bpYT+BMZSuWXvSbRtcvrLrZDaWopTPfIzQtu/R8kQZa
 lqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0pfi5UawWdOE6UXuRJRn3uZGhHlGD70yXnTKAyqyuHo=;
 b=eWZ7WulU/dYa1C/JMT/gzD5fsfb7btdObuB9RhWtk3hACiGOmb83XosbFiZ7pJXLGO
 p0IGlWl4woz36kEHskQ72IgDTWkOfz4Egwfh7qbZKJoSnPh/Spt7c2ivYYfP5usQSUPx
 R6UY5Ae6hi3DsOKKciqGOAk1Ml19QtMpJSWwl3AtQccNLJxT5KCpcY2SH6/tdjg01JiE
 l4Qc8zalP3q2T6LvSi4GstOrbEQPDfGb0yjQWLFJqfPeKfGI5g1z7JOlgznDXOIdH9pz
 JFcHG8IX+DzkejG/+/JA7YyQ/GWl3YrabOP8BQt/X9xW0ElbAG6P9gZoroPcoE4jlGiV
 x+2w==
X-Gm-Message-State: AOAM531gE+pP2vtQxAxh57NJiE4KUGHUZHK++QNbqEBk5Sf8ge+T414O
 iG5DylQ1AdncVdKaCMdyFj0=
X-Google-Smtp-Source: ABdhPJzKMWs6lYDYYuDZcn7oDBTcU0wUA6vzjqErAMgz8T3pYA0Aoe5JnLvBWqUIhEsSj325h9woww==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr1355987wmh.145.1624906001619; 
 Mon, 28 Jun 2021 11:46:41 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z8sm15426788wrw.18.2021.06.28.11.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 11:46:40 -0700 (PDT)
Subject: Re: [PATCH 06/20] target/loongarch: Add main translation routines
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-7-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b3ad9db-ed86-1ef4-5653-1c7106bc5bfd@amsat.org>
Date: Mon, 28 Jun 2021 20:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624881885-31692-7-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 2:04 PM, Song Gao wrote:
> This patch add main translation routines and
> basic functions for translation.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/helper.h    |  10 +
>  target/loongarch/op_helper.c |  28 +++
>  target/loongarch/translate.c | 537 +++++++++++++++++++++++++++++++++++++++++++
>  target/loongarch/translate.h |  58 +++++
>  4 files changed, 633 insertions(+)
>  create mode 100644 target/loongarch/helper.h
>  create mode 100644 target/loongarch/op_helper.c
>  create mode 100644 target/loongarch/translate.c
>  create mode 100644 target/loongarch/translate.h

> +/* 128 and 256 msa vector instructions are not supported yet */
> +static bool decode_lsx(uint32_t opcode)
> +{
> +    uint32_t value = (opcode & 0xff000000);
> +
> +    if ((opcode & 0xf0000000) == 0x70000000) {
> +        return true;
> +    } else if ((opcode & 0xfff00000) == 0x38400000) {
> +        return true;
> +    } else {
> +        switch (value) {
> +        case 0x09000000:
> +        case 0x0a000000:
> +        case 0x0e000000:
> +        case 0x0f000000:
> +        case 0x2c000000:
> +        case 0x30000000:
> +        case 0x31000000:
> +        case 0x32000000:
> +        case 0x33000000:
> +            return true;
> +        }
> +    }
> +    return false;
> +}

Why not generate that with the decodetree script?

