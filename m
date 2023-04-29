Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818866F24B5
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:31:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjiN-0002qx-Tf; Sat, 29 Apr 2023 08:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjiG-0002qK-0o
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:30:04 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjiD-0007YD-8l
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:30:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so724692f8f.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682771399; x=1685363399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7uM2QDl7FlHLc1MGCb5udfA1AEP2ioMFNVoM3aGbii0=;
 b=uwVKVBQkRDthHYA2+0Tu1wolq2taoO3cyRLktVCOxgHVEjVwKI31vs20wxFltR5iVj
 gEw/lyBXDafwrAGTFq5VGZI54zMjFLYjH1k0p9UgWllcuF+JBb0CGAff0mp0Mwovdg7F
 vaq+CBXzevwnBDhUJ4p6/l7ifxXFcmv2OhVeo3FOTAC3PTix21HrULD7GfzPARn27UI8
 Rj+juog22YHG8oHX+Sk9lufGNRGM5vYC6Tz8bpEHHOr0A9JAezUzC5c9xgbBFgDfhKeb
 +0PCxD98ej/H9xX5nqRZAMoePs8joxPNFFDzIOWUGB3iwaGZcWwgtj9ZTrCyOTCNGdGC
 vlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682771399; x=1685363399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7uM2QDl7FlHLc1MGCb5udfA1AEP2ioMFNVoM3aGbii0=;
 b=lM+Xsoj+EghlMM9glqBNdtWNlspXmBKJ3qlUTp76PdFMwo+eZtdkLWaAmftoG9KekM
 bN8kEtFemGOrnQ43zJJQwKPS3SpiRR7e6DZ3mDL40ZQMjylm0Vy9eLSbL72yqCM+7rLS
 hB1frjZCWoGzHwvFRaoGCjSv7cbEbR0R3TcqeJW+9qqAnMV1L7+8R8D9zJbhUXTQXgr/
 bYWIILwOHjmq8fCKP6fBDSZjNJ34OP1tJ+zdPrvzXjCJPvRYKfczVlHSBk3hDSUXl/db
 elnWHBJ/U8OVgCPvrK5Okmhz/Ko5MPuzSuzNITBrMamzzTqpztRQwrpSK640srUb+6Ck
 IYaw==
X-Gm-Message-State: AC+VfDyV6TnezkiGUjz2SO6uJv2F+ItSAmTsD5zbsODeoBGik0CAM27X
 /mRjMwUAQ0hN0f7uEj8QlTi9qg==
X-Google-Smtp-Source: ACHHUZ6XMWJRUBOVGXlvSoMgTMWYjvvKnAxPvhuo5B8W0BbzADI7AppKuyJMugoFXBaOL1MBOxHfqA==
X-Received: by 2002:adf:ed04:0:b0:2cb:76d4:42ea with SMTP id
 a4-20020adfed04000000b002cb76d442eamr5977916wro.36.1682771399331; 
 Sat, 29 Apr 2023 05:29:59 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 w13-20020adff9cd000000b002cea9d931e6sm23569800wrr.78.2023.04.29.05.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:29:58 -0700 (PDT)
Message-ID: <ad6f28e8-e60e-ace4-5eaf-b754e8ac36c8@linaro.org>
Date: Sat, 29 Apr 2023 13:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 54/57] tcg/ppc: Remove unused constraints A, B, C, D
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-55-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-55-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 07:41, Richard Henderson wrote:
> These constraints have not been used for quite some time.
> 
> Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target-con-str.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
> index f3bf030bc3..9dcbc3df50 100644
> --- a/tcg/ppc/tcg-target-con-str.h
> +++ b/tcg/ppc/tcg-target-con-str.h
> @@ -10,10 +10,6 @@
>    */
>   REGS('r', ALL_GENERAL_REGS)
>   REGS('v', ALL_VECTOR_REGS)
> -REGS('A', 1u << TCG_REG_R3)
> -REGS('B', 1u << TCG_REG_R4)
> -REGS('C', 1u << TCG_REG_R5)
> -REGS('D', 1u << TCG_REG_R6)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Is the J constraint introduced in commit 3d582c6179
("tcg-ppc64: Rearrange integer constant constraints")
ever used?

