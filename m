Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1F33E2ED
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:40:07 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKEH-0003y3-Sq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMKCn-0003Tk-U3
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:38:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMKCl-0003lT-De
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:38:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2427658wmy.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ItHbVM0DiAUUCPa7v9cFEWEDPoCGAFDpX4fPOf5/POM=;
 b=crbBarWo+QUcYbnYWufOlj2ZzFXHHwYsC/SJ5+L63C0bde29521TE4P+A+87G25xTw
 STRfgsczL7EQDmVY/G0C+A8SRBo+XAaBf9eU6wKXkbBBLKjQ2NKRUaGqrsKeWSwA4/62
 ayirk75AkEczO1YltGrHI8DVNw7KPQzyqfg1LGtmDPFhPhvzsU1ZkOAl+npIyB2Mhd0o
 5T6rwG/Rtd596E40Imf7I5nqmcwSEflVPp16F31j/E6m/OKqX9l0ZnLau64HGrvGDvon
 LOAWqo0DialQFB1q499JxPasxT0fYDu2rrMxKIx8aaH94ODTLgtcHChI8cdQNqM0YYud
 1B/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ItHbVM0DiAUUCPa7v9cFEWEDPoCGAFDpX4fPOf5/POM=;
 b=N3j5aMHz4WkLqP0/pszMVIu4vRVeA26sO4EWk4FN4PvyL5uIjS7zwBTCCQ9gfb9zsC
 SYVnWvvUnD8/Yo6w9Se/s04TMjRzU+pvujpNyo3oYuHVtkBgIaopV+xrwyuA10c0lUQI
 bwhiRgQgEYTlPKlDHdWpEnbYY2K9rF+Oui7P7ehgxE6JV4DIeAufACc9FOE+2+tXXH2H
 l8onweDeZ4UCCEyZeOPW7h8srCzVBd8iEPpSx24axV3BYhkiKVJOhPub745vC97k1eOY
 SDsQiwl9W95+NnP5g/wdLVFzbYAQUw133aT44HAuvqqcSgP5cN6sMb+j7ZMCfcGMVz7K
 3rrg==
X-Gm-Message-State: AOAM530/Ir5mt4TmRE+PCQ2N6nS7enQZRtQEV9ifkLZ+BCGh9I+sL40P
 OEasL0mdQr+pE6RMG/QbxhA=
X-Google-Smtp-Source: ABdhPJwyxXAEZMG7rNhs3oVgocEpsFecqjZxX9fLHd9aKMVWuMy840JlaEj6y+ADgUTDheiCOtW6IA==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr1226488wmo.36.1615941509757; 
 Tue, 16 Mar 2021 17:38:29 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z7sm24147017wrt.70.2021.03.16.17.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:38:29 -0700 (PDT)
Subject: Re: [PATCH v5 21/57] tcg/tci: Implement the disassembler properly
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fa08114b-408f-f648-b6dc-8041ee6439ba@amsat.org>
Date: Wed, 17 Mar 2021 01:38:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Actually print arguments as opposed to simply the opcodes
> and, uselessly, the argument counts.  Reuse all of the helpers
> developed as part of the interpreter.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build           |   2 +-
>  include/tcg/tcg-opc.h |   2 -
>  disas/tci.c           |  61 ---------
>  tcg/tci.c             | 283 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 284 insertions(+), 64 deletions(-)
>  delete mode 100644 disas/tci.c

> +#if TCG_TARGET_REG_BITS == 32
> +    case INDEX_op_setcond2_i32:
> +        tci_args_rrrrrc(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &c);
> +        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
> +                           op_name, str_r(r0), str_r(r1), str_r(r2),
> +                           str_r(r3), str_r(r4), str_c(c));
> +        break;
> +
> +    case INDEX_op_brcond2_i32:
> +        tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &c, &ptr);
> +        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%p",
> +                           op_name, str_r(r0), str_r(r1),
> +                           str_r(r2), str_r(r3), str_c(c), ptr);
> +        break;
> +
> +    case INDEX_op_mulu2_i32:
> +        tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
> +        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
> +                           op_name, str_r(r0), str_r(r1),
> +                           str_r(r2), str_r(r3));
> +        break;
> +
> +    case INDEX_op_add2_i32:
> +    case INDEX_op_sub2_i32:
> +        tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
> +        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
> +                           op_name, str_r(r0), str_r(r1), str_r(r2),
> +                           str_r(r3), str_r(r4), str_r(r5));
> +        break;
> +#endif

One single comment, I'd add one space after each comma in
format arguments to make output less compact. Matter of
taste probably.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

