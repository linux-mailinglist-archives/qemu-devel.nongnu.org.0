Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A133E24B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:42:42 +0100 (CET)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJKj-0005I8-PV
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJHz-00040v-6s
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:39:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJHx-0002YI-6h
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:39:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so298475wmj.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QQXm/gjpeHW7PPrLWbY4tjxeeIVqdCMuDtxUvrCgNi0=;
 b=lOViABkRNaKC0otUY4jIWIAlmMI5QdAx8brnMf7J3YNTD6eRdw1GAxvcL10ieIYAF1
 o2/1OOGz5Qxk24AMyX7DbK7k9mF+szJjosOq44v/52816KqYM2GD3BtK4+IuVK4XIzl6
 ENtf7Hxfcr09nVMSKUdk3DG0xxoDKjHSO4aSXYj9kAA5Hufmi2RIpmUP/BNiVtVCbvnB
 Jtpmi9s66GOxPuZqEzRX7Ox3lRJB2Z5UerkSNJnSZj97LskFkXYHRSfGsKJ5dxNMiZFr
 hdEBDFicWEEm912VqngZ5D5z9sUzGRwWp1mVhCNRQAqNSZsuUx1bP4K2yo+k4dE/qX9b
 pF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQXm/gjpeHW7PPrLWbY4tjxeeIVqdCMuDtxUvrCgNi0=;
 b=jvBP0kJTHLciSxW0wKPTBkN9Ep6TmtIZci+CbRy2P3xTfwfiNfWrKOpoeTOOblGQ//
 azYHEkva8dcHZS/kDL1q3P59lt/q9m91GbePNp3jv9tqJB6dylXTOR6MWCdEQtvOKK9u
 iZ9NvNQIopgPnXFVfUnQAVKiBzmchVrCMlKE69J+uyJfaAdPbbFWnC7B5fjUlQlNmqwp
 xoxwZYVwWjNxhG8CzuZOIef+TDVnv3HOOhRCuHJFKrL/hEIbF6WOTLsAg9F+QZp9wgNZ
 ve7rJcyGMKYQe/uIihXKCsXcQPsyZMXdO/6aCp0T6Z2jE5CKyatgwH9kTipGFfos+PgH
 HWyA==
X-Gm-Message-State: AOAM530NZsh5pWDUdnppMCQTXEaKuuaBQ3Xpp3NPoAeYw2NeltqOw/Cr
 Cc14B62IYI5IOv2WvwuXjE4=
X-Google-Smtp-Source: ABdhPJwI0oKfN8CSSfcu8lp15xTzwSUiv1ifjVvuRk4E2uuwfOkYHGV1I6mJiQP2Ml5uHvMrhK2xSg==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr1047499wmr.110.1615937986832; 
 Tue, 16 Mar 2021 16:39:46 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h9sm716751wmb.35.2021.03.16.16.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:39:46 -0700 (PDT)
Subject: Re: [PATCH v5 42/57] tcg/tci: Split out tcg_out_op_r[iI]
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-43-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <867ed16e-2457-c237-d349-fc56541e90ad@amsat.org>
Date: Wed, 17 Mar 2021 00:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-43-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

"And support mov_i64 on 32-bit host"?

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 50 ++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  static void tcg_out_movi(TCGContext *s, TCGType type,
> -                         TCGReg t0, tcg_target_long arg)
> +                         TCGReg ret, tcg_target_long arg)
>  {
> -    uint8_t *old_code_ptr = s->code_ptr;
> -    uint32_t arg32 = arg;
> -    if (type == TCG_TYPE_I32 || arg == arg32) {
> -        tcg_out_op_t(s, INDEX_op_tci_movi_i32);
> -        tcg_out_r(s, t0);
> -        tcg_out32(s, arg32);
> -    } else {
> -        tcg_debug_assert(type == TCG_TYPE_I64);
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
> +        break;
>  #if TCG_TARGET_REG_BITS == 64
> -        tcg_out_op_t(s, INDEX_op_tci_movi_i64);
> -        tcg_out_r(s, t0);
> -        tcg_out64(s, arg);
> -#else
> -        TODO();
> +    case TCG_TYPE_I64:
> +        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
> +        break;
>  #endif
> +    default:
> +        g_assert_not_reached();
>      }
> -    old_code_ptr[1] = s->code_ptr - old_code_ptr;
>  }
>  
>  static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
> 

