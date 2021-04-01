Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E157351F42
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 21:07:44 +0200 (CEST)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS2fP-0001pC-JA
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 15:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lS2d9-0000PX-FS
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 15:05:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lS2d3-0007i3-Tz
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 15:05:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id x13so2800523wrs.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8WByKP4BhigSIv7qwnR4ZuMwND/wT6u9UYnnYnrzVqw=;
 b=sERxjlTWhFMcnL8ZOv3lc378Q5hEteqbb2GV/wGS8IIPspGolfTD664iKzclzCKgII
 MzUnmeB0QiZrJ+BiaE4ruMe8n3+WKCIaPgRzmA5n5Hlv8hIjFVZ2Vb5SRRx1doR6tM0R
 tvVQY1sR6FL13pcXXe+JKu0cD2MmMR7a3srnrhpuvUj6LXhWgp92Vui6LA9Bbx02sQwx
 IATPvS28MM/pQZB9CNtoJqk7Milj8ON9dwHGSkYw6IA2lhTW0+yKB53VvsIQd/7Kiqa9
 WR2OGZckThe5ouGxAVGXGGg273u8G/rtbbw3pt5IZRAHUOzLPkfl50on4tDeMc4vTsZP
 lUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8WByKP4BhigSIv7qwnR4ZuMwND/wT6u9UYnnYnrzVqw=;
 b=O7w2zGPnDjRUqCRx0GOOjtomSfLtpFlvwzCqkssmlwE8dDdU7qxPCXdqEMw1efLutc
 t9uj0hT6NLdjWQMELy7oyftRy2nCcD61rWIKgQf8vVzYBIUl9F2mnzsc/yqWkSLtXUUB
 QXbXcxIfC00niV10jORjXQK/V6g1ULJxiQlq7ppre1v4ggwDWJB+yc55N8XtzwOt0guT
 GLuM2LYXD9YUwoS6jbHYJwp0aMAYllH6f1ffZIoXJ9YHEq8BYeDE+ySne0ohkCKRHdcJ
 gk9a8BignUwFp5zgEF68U+pdtv9/dRd5AeC6xnnOu2KZ+GHJWjhs9p8Vj+iMbt33+6f1
 IbBQ==
X-Gm-Message-State: AOAM531DG3Tsf2s0uHRgVHnD65mcRgCohY+PfP+rwzNx4IHsGmpWx+tI
 MMr60W8Ku1bcDHnYacWfIas=
X-Google-Smtp-Source: ABdhPJyI8arUuBZX6VqmiZ1ftwTKxsVZGgLartyM49mV/yUAoEHbfjrpBLI3msKeoBzqvD5zDIElZQ==
X-Received: by 2002:adf:fac1:: with SMTP id a1mr11689966wrs.98.1617303915855; 
 Thu, 01 Apr 2021 12:05:15 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s8sm10943849wrn.97.2021.04.01.12.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 12:05:14 -0700 (PDT)
Subject: Re: [1/1] tcg/mips: Fix SoftTLB comparison on mips backend
To: Kele Huang <kele.hwang@gmail.com>, qemu-devel@nongnu.org,
 Jin Guojie <jinguojie@loongson.cn>, Yunqiang Su <ysu@wavecomp.com>
References: <20210401100457.191458-1-kele.hwang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9fa65fbd-8fb5-7a30-99ab-47c95db9a97b@amsat.org>
Date: Thu, 1 Apr 2021 21:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401100457.191458-1-kele.hwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 12:04 PM, Kele Huang wrote:
> The addrl used to compare with SoftTLB entry should be sign-extended
> in common case, and it will cause constant failing in SoftTLB
> comparisons for the addrl whose address is over 0x80000000 on the
> emulation of 32-bit guest on 64-bit host.

Apparently missed in commit f0d703314ec
("tcg-mips: Adjust qemu_ld/st for mips64").

> 
> This is an important performance bug fix. Spec2000 gzip rate increase
> from ~45 to ~140 on Loongson 3A4000 (MIPS compatible platform).
> 
> Signed-off-by: Kele Huang <kele.hwang@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tcg/mips/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 8738a3a581..8b16726242 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1201,13 +1201,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
>             load the tlb addend for the fast path.  */
>          tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
>      }
> -    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
>  
>      /* Zero extend a 32-bit guest address for a 64-bit host. */
>      if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
>          tcg_out_ext32u(s, base, addrl);
>          addrl = base;
>      }
> +    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
>  
>      label_ptr[0] = s->code_ptr;
>      tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
> 

