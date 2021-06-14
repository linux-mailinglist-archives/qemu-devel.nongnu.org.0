Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C013A5F30
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:33:18 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiy5-0003Uf-QM
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsiwE-0002NI-Aa
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:31:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsiw9-0008Ij-4I
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:31:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id c5so13741857wrq.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MF26M2Am1z5Oymg12e03KYavHpajxmfVm3tdFtKZpPs=;
 b=TcoyonD5mKmYEGXDGUJ/LnbjrWLcDYcyKIbfAvpkj1RmO+eSTHzT0NFSwMqWvwJkJO
 BAeNGYOQt3ktdQPdJFkFzcOOEk8sRtxdP2tFceXV83rmooaAlEcKOcVkCkCsAn+BGuA6
 uBX8h8wW60AOwCqFDgtWG4p/ae89n+DWcjsnEi2B++RmZvw265H/+KKFAwnpr6EuWKBj
 TOnisT3JAVcZc0VfstEtTkhaTlH770mWkhk/bG5npXPa8wQ41gyW3i3DK6G6o1sP04Qu
 AaMRkSr83BtTdRgWdMAr0QVfER51TBXOw8OLfAUxL9fImRBEnCjdXVBGvJBxzCaLX+lb
 UQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MF26M2Am1z5Oymg12e03KYavHpajxmfVm3tdFtKZpPs=;
 b=bFitUQXsSxR+NlC/cuL/tMm0oXIAE9YBzGi4Vc/Z00Us9XgoW+Bwp+mFhsLLLFIm2X
 kiMRA9wQUd6jl9uwl/U7JZDFj4QT8gXvb/3/L883UZnmh36Ea8/qkdYb9vUExEuHjakJ
 axrS4dBW6g/gTAgJOup1ZD96XdvRo64TpilCODQVoTxXucAg5fWb4FdLdEeTYzU9OIX2
 jv/jEfWxhwwlBemK5aVr7xyaTGss0coE362Xc/l3jhfFXtsvbzp+LBXnRUsbdE6V+pbL
 cJVL00Izk/XjaEVUfJvEwQBmUQithiJh1C+E6DvoTFCc6vh/NLDIaQBjW8mu5acIj9IX
 vxUg==
X-Gm-Message-State: AOAM53336wvLXkwGAbZ3QaFqYTMQKsLAkULNR//uirVt2BLaMOtGXLjK
 e/S5YsQv3GMrrpOM7J11NdOcInY6766sbQ==
X-Google-Smtp-Source: ABdhPJwEAzNSFCRPA3At5qXxt5YNHeYO4LqndpKKuaJxOO4n2ogM1p0YIatla3gemMrVyb12AuoDVQ==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr17892085wrs.298.1623663075297; 
 Mon, 14 Jun 2021 02:31:15 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s62sm19902347wms.13.2021.06.14.02.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:31:14 -0700 (PDT)
Subject: Re: [PATCH 14/28] tcg/mips: Support bswap flags in tcg_out_bswap32
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <398ea97d-9149-84a5-0fb1-8ad2bafc1bd1@amsat.org>
Date: Mon, 14 Jun 2021 11:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> Merge tcg_out_bswap32 and tcg_out_bswap32s.  Use the flags
> in the internal uses for loads and stores.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)

> -static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg)
> +static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
>  {
>      if (use_mips32r2_instructions) {
>          tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
>          tcg_out_opc_sa(s, OPC_ROTR, ret, ret, 16);
> +        if (flags & TCG_BSWAP_OZ) {
> +            tcg_out_opc_bf(s, OPC_DEXT, ret, ret, 31, 0);

Maybe mention the rotr -> ext32u mips32r2 simplification?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

