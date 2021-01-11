Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A922F122F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:16:43 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyw7m-0004U9-Kg
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw6L-0003wG-RI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw6J-0004ZS-9u
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610367310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJ+vZhptz1ikdT8UclAF8bDp/s03xHYEm3ipT2DdnQc=;
 b=Y4vNREAjdShYNC3ujKW1aGc7W1ISpg5EIyuGEnQRotcZnHSFBd+vdnb0RoToaIjH2STBKh
 6OePNo+OCqgxsUo8NVAOtDcymrvIIOExJBUWr3bnbsunVBlc660XCgWIlOual8XSVH7ZwT
 pOGvmqjNG/AvnI4QnS6FF/FwfREod+0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-xxE1OX5-NxaVYl6Wg74dsA-1; Mon, 11 Jan 2021 07:15:08 -0500
X-MC-Unique: xxE1OX5-NxaVYl6Wg74dsA-1
Received: by mail-ed1-f71.google.com with SMTP id e11so8188741edn.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LJ+vZhptz1ikdT8UclAF8bDp/s03xHYEm3ipT2DdnQc=;
 b=K9I6iZZ8rC8RLlTgdW3Decs2SOruU17DO6fSpS9m6Io8uCXlKop+189F6CN7AxhfVB
 JftZK13bIwqK2ZjB8bVIlfr28AO80NS804G5t8/AR+fWgxYAzW/RJNk8a4YFpKYMvYEq
 kRbBb9hk2z1XWv8Q18HlGbwdHDsfJ2sIra+cQpETcVzszH9jdfjAwVMsSf7Au6Xk99xZ
 IL198jAbJABtzmkBUk7vyeU0KuE0who9LdyEcnGhy655+ABmGOiLKaoDnDqaHmfpZsbb
 w+wmcOHTIoNVNo+wQiLvL2uih+lCWjTGId0uN4N5FT+FwBbftEw5WHBnBlrnlRe1AwcI
 x9Zg==
X-Gm-Message-State: AOAM531SCfF5RQKDrWOreqPxEhtMP0wjFr0qISuqw08SAL+4oIQPBjcU
 IhmolgeJqahlUDpVYgm+qKq2EFiZ0G6+MWmpnQsPh7mrKHeSsyCXZXQ26SJQQjDK8dfxfgy8jr7
 Zmfb7QQskNJ00wec=
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr10350623ejb.396.1610367307216; 
 Mon, 11 Jan 2021 04:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2GXUVHZxqbgWiPGWX6HQz2JZQ5btwVS/9zgKMjwi59rRYtQw6pzeIYHlhAeTS8MDqWzjkjQ==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr10350614ejb.396.1610367307010; 
 Mon, 11 Jan 2021 04:15:07 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id z24sm7625240edr.9.2021.01.11.04.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 04:15:06 -0800 (PST)
Subject: Re: [RHEL7 qemu-kvm PATCH 3/3] Fix tcg_out_op argument mismatch
 warning
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1610364304.git.mrezanin@redhat.com>
 <96033fbea8ab38a769c0ac9c23a217b4b5d32864.1610364304.git.mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4a1d82cd-6e18-8a68-ada7-c5f7b66d94d7@redhat.com>
Date: Mon, 11 Jan 2021 13:15:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <96033fbea8ab38a769c0ac9c23a217b4b5d32864.1610364304.git.mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> There's prototype mismatch between tcg/tcg.c and tcg/aarch/tcg-target.c.inc:
> 
> tcg.c:
> 
>     static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>                            const int *const_args);
> 
> tcg-target.c.inc:
> 
>     static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                            const TCGArg args[TCG_MAX_OP_ARGS],
>                            const int const_args[TCG_MAX_OP_ARGS])
> 
> This missmatch cause warnings on GCC 11:
> 
>     tcg/aarch64/tcg-target.c.inc:1855:37: error: argument 3 of type 'const TCGArg[16]' {aka 'const long unsigned int[16]'} with mismatched bound [-Werror=array-parameter=]
>     tcg/aarch64/tcg-target.c.inc:1856:34: error: argument 4 of type 'const int[16]' with mismatched bound [-Werror=array-parameter=]

TIL. Interesting, compilers are getting smarter :)

> Only architectures with this definition are aarch and sparc. Fixing both archs to use
> proper argument type.
> ---
>  tcg/aarch64/tcg-target.c.inc | 3 +--
>  tcg/sparc/tcg-target.c.inc   | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 26f71cb599..fe6bdbf721 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1852,8 +1852,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>  static tcg_insn_unit *tb_ret_addr;
>  
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                       const TCGArg args[TCG_MAX_OP_ARGS],
> -                       const int const_args[TCG_MAX_OP_ARGS])
> +                       const TCGArg *args, const int *const_args)

Doing this way we loose information (that the array pointed has
TCG_MAX_OP_ARGS elements). What about letting this prototype and
fix the other uses?

>  {
>      /* 99% of the time, we can signal the use of extension registers
>         by looking to see if the opcode handles 64-bit data.  */
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 6775bd30fc..976f0f05af 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -1294,8 +1294,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
>  }
>  
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                       const TCGArg args[TCG_MAX_OP_ARGS],
> -                       const int const_args[TCG_MAX_OP_ARGS])
> +                       const TCGArg *args, const int *const_args)
>  {
>      TCGArg a0, a1, a2;
>      int c, c2;
> 


