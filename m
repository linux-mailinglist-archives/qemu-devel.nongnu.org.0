Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ECE6FDDCA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:26:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwirI-0006go-BZ; Wed, 10 May 2023 08:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pwiqq-0006Ql-VF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:23:25 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pwiqn-0007y7-1N
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:23:24 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6ab13810da6so997366a34.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683721399; x=1686313399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5WPxLFwoMFE8iBLyx/D+gilhfqvCEtUHAMrTKxNCkkE=;
 b=YWQvTAxcGYIMP9r/J+CLGH2xKERvsws6cMJxiVrVCCtUlkl5BDSm8dObuh/LA8IK+y
 hI0pxzTfmt2xao04Ie8OfNZjtrX/oA3BVRNKwoJOlcg8F0GkR1NsivYmdryOp5OKZNHH
 ui+JGUVacU3+0b48SoY/P64Kziy9bHGPPOEPFRPFQ5jRYDLOKwA0hnbwMf2WGf9omH2P
 +4ki93XTbKcUrW6DYNSwQ8nt8rkt3Ezac04veczDJw9aHG0ZZ3n+LrqHb9Ntpb6utOfu
 kDmk38RAIyJz0j6yuROU5UtIEs7rqNOCewx/KvQQBp5ST7e0MTKe8KUxU95pjvLGxZQB
 ej0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683721399; x=1686313399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WPxLFwoMFE8iBLyx/D+gilhfqvCEtUHAMrTKxNCkkE=;
 b=djBQhzGpafua3TeQvuBpz2ht/uLf4/ztEzE3TjTbmfVNCF+k9qyP7L+tQ2g3nPk3pB
 0ylP+QeHZ5NJ8bT8lnUUhT541pscMhTWA0UPMT/K7BHldbntY2IrYYavZOef8Cbfx7In
 GN0mK0Vl/G0JruybEH9ajzNKISL82fH4GXWQ7Lb4PmuAYUyuncslUKH7/BlRQDpOJV3e
 h+llvyg6I/VrlCFjEFkkAXnH2c1H3paukSadb3Kqno7m7286aZcbuQg1LwFsU+79W0qF
 55UfmlgC+1pKMwWYGi2TVh/h/ClOMVupjJDIAXL/vSFTjqTlkW+w9I5zDAw2o4HlWZiN
 +Diw==
X-Gm-Message-State: AC+VfDwtqB1V/2seqlTRMAuOfk4DvMT5KzvagV/oXZnZYmz9vUwrJ1o1
 7R9fvtpgPfyVHB89t7ygMJ+hvw==
X-Google-Smtp-Source: ACHHUZ4aYNHW1H0Vm5cu2M1nQyzANo8iJAJ96hjg9PxvkLmfd5L6dyIJGLPHyJjETL7qKiQX10yhIA==
X-Received: by 2002:a9d:6f07:0:b0:6a4:fab4:56a6 with SMTP id
 n7-20020a9d6f07000000b006a4fab456a6mr3084642otq.24.1683721399275; 
 Wed, 10 May 2023 05:23:19 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0568301d6300b006a643a2eeb5sm6161071oti.15.2023.05.10.05.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:23:18 -0700 (PDT)
Message-ID: <ab9c553e-7f38-e1c3-7ac9-4c4814d04ded@ventanamicro.com>
Date: Wed, 10 May 2023 09:23:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/riscv: Move zc* out of the experimental properties
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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



On 5/10/23 00:00, Weiwei Li wrote:
> Zc* extensions (version 1.0) are ratified.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..99ed9cb80e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1571,6 +1571,14 @@ static Property riscv_cpu_extensions[] = {
>   
>       DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>   
> +    DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
> +    DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
> +    DEFINE_PROP_BOOL("zcd", RISCVCPU, cfg.ext_zcd, false),
> +    DEFINE_PROP_BOOL("zce", RISCVCPU, cfg.ext_zce, false),
> +    DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),

I see that zcf has a different ordering in isa_edata_arr[]. Is this intended?

     ISA_EXT_DATA_ENTRY(zca, PRIV_VERSION_1_12_0, ext_zca),
     ISA_EXT_DATA_ENTRY(zcb, PRIV_VERSION_1_12_0, ext_zcb),
     ISA_EXT_DATA_ENTRY(zcf, PRIV_VERSION_1_12_0, ext_zcf),
     ISA_EXT_DATA_ENTRY(zcd, PRIV_VERSION_1_12_0, ext_zcd),
     ISA_EXT_DATA_ENTRY(zce, PRIV_VERSION_1_12_0, ext_zce),


Not related to this patch per se. Just wondered if there's some reason for the
different ordering between these arrays.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


> +    DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
> +    DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> +
>       /* Vendor-specific custom extensions */
>       DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
>       DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> @@ -1588,14 +1596,6 @@ static Property riscv_cpu_extensions[] = {
>       /* These are experimental so mark with 'x-' */
>       DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>   
> -    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
> -    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
> -    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
> -    DEFINE_PROP_BOOL("x-zce", RISCVCPU, cfg.ext_zce, false),
> -    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
> -    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
> -    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
> -
>       /* ePMP 0.9.3 */
>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),

