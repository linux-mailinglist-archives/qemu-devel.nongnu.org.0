Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B62CF445
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 19:48:04 +0100 (CET)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klG7e-0005Ew-RC
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 13:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEWS-0005vb-0g
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:05:37 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEVm-0004ux-30
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:05:15 -0500
Received: by mail-oo1-xc44.google.com with SMTP id y3so1538221ooq.2
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hTPg26qSlQ0Wt4a7Q2DVHA9ywXVsdidYmAYQESPvOpc=;
 b=yUfH4HLnaPLj/bj23j6PlInUtfkiPhPRrQfHrsd3Sw3xsdx7QwhKI4HCdD79yncGCT
 YNwJA0jjAazJLC6oGKBKL6YoLmnoFlaTE+vmmJx50H9GXy6wheWn/Nd3r1VkKZOfO+4o
 aw/WQoeCUQVR0nj1W5AUPlYT/9/jeoQJ5akiDwA0KdBD7CCT5Oth6nm/7E/5RO9gDnAm
 zAO/+sJvIihd8jvDD/jeW3zlcfC9PuCG3Y4QCk6MecrBxbAZVOsvH+UacP7naqCnoigu
 KnRd2oVIiSCtyb5S1UM+RjU8nSi3M5J6UZoX3D8Raq+u4uUf+3KaeJJ4nZ0R3EReIRsg
 PbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hTPg26qSlQ0Wt4a7Q2DVHA9ywXVsdidYmAYQESPvOpc=;
 b=AdwwLL5PNgY/nfh3SbNQ/+ggxS921lPBxYWemrytF16dxx9YSNqQurWPVtP6yymoin
 6iaND+txglpuHUil/oiWHKfQO1k6zvtulWIosDjh5Ys/X0JiDFY759flNvR6Q+wXyfK0
 N0WmcTF2iOxhrnjBFtWlCHqysvmJTuuLXLw7HXGuGDwMVsckBl/QSioW6sBDzhz8UArJ
 Ar4kdy+5JEAQFFCPs8X7mpOIE6Y7+Q90Nkq/lppVauhZVKWvbE0umRFBDMhSm+LZEoqn
 W/ASO3ZGq8YBKgPOoGg9UdKSZzwLOLam1xz4IOpIPDUwO8TnuS3bSeE1aOkcHpgK+qnu
 Wkbg==
X-Gm-Message-State: AOAM531p/ykVRzxwiBtZrCE2+xen8EE7Ckbfgrx6eOuCUZwYsFjK9pE1
 i4ZjapfvW6wPDtLlhhL9H/GeeA==
X-Google-Smtp-Source: ABdhPJy4q3B4QJYlZT7E1LAtFwmT8C+d9xLTbZiCqg4LrHUEaa160NBMRONNgpJdKcksd4W5kDflAg==
X-Received: by 2002:a4a:e972:: with SMTP id i18mr4165976ooe.17.1607101464886; 
 Fri, 04 Dec 2020 09:04:24 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o63sm757962ooa.10.2020.12.04.09.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:04:24 -0800 (PST)
Subject: Re: [PATCH 9/9] target/mips: Explode gen_msa_branch() as
 gen_msa_BxZ_V/BxZ()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42cae1ae-46aa-1207-dac7-1076b3422a7f@linaro.org>
Date: Fri, 4 Dec 2020 11:04:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> +static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
> +{
> +    check_msa_access(ctx);
> +
> +    if (ctx->hflags & MIPS_HFLAG_BMASK) {
> +        generate_exception_end(ctx, EXCP_RI);
> +        return true;
> +    }
> +
> +    gen_check_zero_element(bcond, df, wt);
> +    if (if_not) {
> +        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
> +    }

Since gen_check_zero_element already produces a boolean, this is better as

  tcg_gen_xori_tl(bcond, bcond, if_not);

where tcg_gen_xori_tl already contains the if.

>      case OPC_BNZ_D:
> -        gen_check_zero_element(bcond, df, wt);
> -        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
> +        gen_msa_BxZ(ctx, df, wt, s16, true);

... oops, that'd be for a follow-up patch, to make this patch just code movement.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

