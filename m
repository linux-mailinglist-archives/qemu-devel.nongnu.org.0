Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD25FA137
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:38:09 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohur2-0002jU-2c
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohue4-0004Wq-Lp
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:24:44 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohue2-0005w3-5I
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:24:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id h12so4368778pjk.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q76feo79376eqY42+RVUJCbG0sZjDO/iv/58tl1NbWM=;
 b=Fv5beHLQ4xrNfXErYlETrdAH78i1lGjxxHWV3k5MbyGvLhPPeK0Zy8dAtdUk2W7rrT
 ix4YTfS8L73eEaVdra1+mDTyxcoqgYxYQdORMb19UGXiXUquQrwWB3SPtNue0WA6TC4l
 8WgxiDE+6DDWKQ2DGoTfweYy9WVxo6jjvRiovNTYiZ+w3DnlCBUpxiwjusQC1cntlBhV
 73BmXMz9AcDkAW9vWWAcyvgcRzH/+gq/ooI88sLY1dza95OuXRfj1b6JO1z7wRPLeO0X
 L/9NM2lkB/qaIT2emVMHP/u1KE5tN0vscS0pQ85tEr+cu39xoQLiof7O6U7VXk4FTPP3
 mPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q76feo79376eqY42+RVUJCbG0sZjDO/iv/58tl1NbWM=;
 b=kjOE2WQLz6+IAspWhC08nLaKJmIZMltmZksAslIYFnUD5b6LhnUKDBM1mwNkiU1p2x
 USKKu2Ifa8X8JRgwimPGn9HiROqpfjCCWLHwfcw/DngHZ6zjNdT30vMKlJM8d9a4AW/5
 7cyIAAf3+yPtgvdcXAFTKaMI9oFP7CgnnTfovwuTgdwdZpMBZpcYL63XgykxpfT+6Hp3
 TTCRGXwMZhSkG8UQhcnh10xfT2T5YrR8O2pnCNsfgIaSYCNBXZ4qGdx5iziB1fwbk3DR
 ydoaDJLfzmO+YlsYo8yAHJ6+QvGMzifme7K2By2nNllJOrS2LDlezBMbFfRNFMUgK0ze
 OtDQ==
X-Gm-Message-State: ACrzQf36SiaGE0h77EJP0F6A1zedGdWE9Ce0ZtibGLOJ1/qqIVlRq79X
 +z1xpzZX1rb1M1CEnSQaVy9SlQ==
X-Google-Smtp-Source: AMsMyM7e8zmltrxNwO7ZbRvGB1tb857MBYBH56tlT+k8MoMKhYnm7up30zki+DFRqTvY2VFbDm+Brw==
X-Received: by 2002:a17:902:d2ce:b0:178:7b5:c070 with SMTP id
 n14-20020a170902d2ce00b0017807b5c070mr19357245plc.58.1665415480590; 
 Mon, 10 Oct 2022 08:24:40 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b001750792f20asm6717625plq.238.2022.10.10.08.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 08:24:39 -0700 (PDT)
Message-ID: <dfe4e819-3fd7-c6f9-f7c7-fa72daeb4bfa@linaro.org>
Date: Mon, 10 Oct 2022 08:24:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RISU PATCH 5/5] loongarch: Add block 'safefloat' and nanbox_s()
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-6-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917074317.1410274-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 00:43, Song Gao wrote:
> Some LoongArch instructions don't care the high 32bit,
> so use nanbox_s() set the high 32bit 0xffffffff.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   loongarch64.risu       | 119 +++++++++++++++++++++++++++--------------
>   risugen                |   2 +-
>   risugen_loongarch64.pm |  30 +++++++++++
>   3 files changed, 110 insertions(+), 41 deletions(-)
> 
> diff --git a/loongarch64.risu b/loongarch64.risu
> index d059811..d625a12 100644
> --- a/loongarch64.risu
> +++ b/loongarch64.risu
> @@ -62,7 +62,7 @@ mulw_d_wu LA64 0000 00000001 11111 rk:5 rj:5 rd:5 \
>       !constraints { $rk != 2 && $rj != 2 && $rd != 2; }
>   
>   #div.{w[u]/d[u]} rd,rj,rk
> -# the docement 2.2.13,  rk, rj, need in 32bit [0x0 ~0x7FFFFFFF]
> +# div.w{u}, mod.w[u]  rk, rj, need in [0x0 ~0x7FFFFFFF]
>   # use function set_reg_w($reg)
>   div_w LA64 0000 00000010 00000 rk:5 rj:5 rd:5 \
>       !constraints { $rk != 2 && $rj != 2 && $rd != 2; } \
> @@ -436,47 +436,68 @@ crcc_w_d_w LA64 0000 00000010 01111 rk:5 rj:5 rd:5 \
>   #
>   # Floating point arithmetic operation instruction
>   #
> -fadd_s LA64 0000 00010000 00001 fk:5 fj:5 fd:5
> +fadd_s LA64 0000 00010000 00001 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fadd_d LA64 0000 00010000 00010 fk:5 fj:5 fd:5
> -fsub_s LA64 0000 00010000 00101 fk:5 fj:5 fd:5
> +fsub_s LA64 0000 00010000 00101 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fsub_d LA64 0000 00010000 00110 fk:5 fj:5 fd:5
> -fmul_s LA64 0000 00010000 01001 fk:5 fj:5 fd:5
> +fmul_s LA64 0000 00010000 01001 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmul_d LA64 0000 00010000 01010 fk:5 fj:5 fd:5
> -fdiv_s LA64 0000 00010000 01101 fk:5 fj:5 fd:5
> +fdiv_s LA64 0000 00010000 01101 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fdiv_d LA64 0000 00010000 01110 fk:5 fj:5 fd:5
> -fmadd_s LA64 0000 10000001 fa:5 fk:5 fj:5 fd:5
> +fmadd_s LA64 0000 10000001 fa:5 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmadd_d LA64 0000 10000010 fa:5 fk:5 fj:5 fd:5
> -fmsub_s LA64 0000 10000101 fa:5 fk:5 fj:5 fd:5
> +fmsub_s LA64 0000 10000101 fa:5 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmsub_d LA64 0000 10000110 fa:5 fk:5 fj:5 fd:5
> -fnmadd_s LA64 0000 10001001 fa:5 fk:5 fj:5 fd:5
> +fnmadd_s LA64 0000 10001001 fa:5 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fnmadd_d LA64 0000 10001010 fa:5 fk:5 fj:5 fd:5
> -fnmsub_s LA64 0000 10001101 fa:5 fk:5 fj:5 fd:5
> +fnmsub_s LA64 0000 10001101 fa:5 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fnmsub_d LA64 0000 10001110 fa:5 fk:5 fj:5 fd:5
> -fmax_s LA64 0000 00010000 10001 fk:5 fj:5 fd:5
> +fmax_s LA64 0000 00010000 10001 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmax_d LA64 0000 00010000 10010 fk:5 fj:5 fd:5
> -fmin_s LA64 0000 00010000 10101 fk:5 fj:5 fd:5
> +fmin_s LA64 0000 00010000 10101 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmin_d LA64 0000 00010000 10110 fk:5 fj:5 fd:5
> -fmaxa_s LA64 0000 00010000 11001 fk:5 fj:5 fd:5
> +fmaxa_s LA64 0000 00010000 11001 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmaxa_d LA64 0000 00010000 11010 fk:5 fj:5 fd:5
> -fmina_s LA64 0000 00010000 11101 fk:5 fj:5 fd:5
> +fmina_s LA64 0000 00010000 11101 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmina_d LA64 0000 00010000 11110 fk:5 fj:5 fd:5
> -fabs_s LA64 0000 00010001 01000 00001 fj:5 fd:5
> +fabs_s LA64 0000 00010001 01000 00001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fabs_d LA64 0000 00010001 01000 00010 fj:5 fd:5
> -fneg_s LA64 0000 00010001 01000 00101 fj:5 fd:5
> +fneg_s LA64 0000 00010001 01000 00101 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fneg_d LA64 0000 00010001 01000 00110 fj:5 fd:5
> -fsqrt_s LA64 0000 00010001 01000 10001 fj:5 fd:5
> +fsqrt_s LA64 0000 00010001 01000 10001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fsqrt_d LA64 0000 00010001 01000 10010 fj:5 fd:5
> -frecip_s LA64 0000 00010001 01000 10101 fj:5 fd:5
> +frecip_s LA64 0000 00010001 01000 10101 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   frecip_d LA64 0000 00010001 01000 10110 fj:5 fd:5
> -frsqrt_s LA64 0000 00010001 01000 11001 fj:5 fd:5
> +frsqrt_s LA64 0000 00010001 01000 11001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   frsqrt_d LA64 0000 00010001 01000 11010 fj:5 fd:5
> -fscaleb_s LA64 0000 00010001 00001 fk:5 fj:5 fd:5
> +fscaleb_s LA64 0000 00010001 00001 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fscaleb_d LA64 0000 00010001 00010 fk:5 fj:5 fd:5
> -flogb_s LA64 0000 00010001 01000 01001 fj:5 fd:5
> +flogb_s LA64 0000 00010001 01000 01001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   flogb_d LA64 0000 00010001 01000 01010 fj:5 fd:5
> -fcopysign_s LA64 0000 00010001 00101 fk:5 fj:5 fd:5
> +fcopysign_s LA64 0000 00010001 00101 fk:5 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fcopysign_d LA64 0000 00010001 00110 fk:5 fj:5 fd:5
> -fclass_s LA64 0000 00010001 01000 01101 fj:5 fd:5
> +fclass_s LA64 0000 00010001 01000 01101 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fclass_d LA64 0000 00010001 01000 01110 fj:5 fd:5
>   
>   #
> @@ -490,43 +511,59 @@ fcmp_cond_d LA64 0000 11000010 cond:5 fk:5 fj:5 00 cd:3 \
>   #
>   # Floating point conversion instruction
>   #
> -fcvt_s_d LA64 0000 00010001 10010 00110 fj:5 fd:5
> +fcvt_s_d LA64 0000 00010001 10010 00110 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fcvt_d_s LA64 0000 00010001 10010 01001 fj:5 fd:5
> -ftintrm_w_s LA64 0000 00010001 10100 00001 fj:5 fd:5
> -ftintrm_w_d LA64 0000 00010001 10100 00010 fj:5 fd:5
> +ftintrm_w_s LA64 0000 00010001 10100 00001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
> +ftintrm_w_d LA64 0000 00010001 10100 00010 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   ftintrm_l_s LA64 0000 00010001 10100 01001 fj:5 fd:5
>   ftintrm_l_d LA64 0000 00010001 10100 01010 fj:5 fd:5
> -ftintrp_w_s LA64 0000 00010001 10100 10001 fj:5 fd:5
> -ftintrp_w_d LA64 0000 00010001 10100 10010 fj:5 fd:5
> +ftintrp_w_s LA64 0000 00010001 10100 10001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
> +ftintrp_w_d LA64 0000 00010001 10100 10010 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   ftintrp_l_s LA64 0000 00010001 10100 11001 fj:5 fd:5
>   ftintrp_l_d LA64 0000 00010001 10100 11010 fj:5 fd:5
> -ftintrz_w_s LA64 0000 00010001 10101 00001 fj:5 fd:5
> -ftintrz_w_d LA64 0000 00010001 10101 00010 fj:5 fd:5
> +ftintrz_w_s LA64 0000 00010001 10101 00001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
> +ftintrz_w_d LA64 0000 00010001 10101 00010 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   ftintrz_l_s LA64 0000 00010001 10101 01001 fj:5 fd:5
>   ftintrz_l_d LA64 0000 00010001 10101 01010 fj:5 fd:5
> -ftintrne_w_s LA64 0000 00010001 10101 10001 fj:5 fd:5
> -ftintrne_w_d LA64 0000 00010001 10101 10010 fj:5 fd:5
> +ftintrne_w_s LA64 0000 00010001 10101 10001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
> +ftintrne_w_d LA64 0000 00010001 10101 10010 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   ftintrne_l_s LA64 0000 00010001 10101 11001 fj:5 fd:5
>   ftintrne_l_d LA64 0000 00010001 10101 11010 fj:5 fd:5
> -ftint_w_s LA64 0000 00010001 10110 00001 fj:5 fd:5
> -ftint_w_d LA64 0000 00010001 10110 00010 fj:5 fd:5
> +ftint_w_s LA64 0000 00010001 10110 00001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
> +ftint_w_d LA64 0000 00010001 10110 00010 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   ftint_l_s LA64 0000 00010001 10110 01001 fj:5 fd:5
>   ftint_l_d LA64 0000 00010001 10110 01010 fj:5 fd:5
> -ffint_s_w LA64 0000 00010001 11010 00100 fj:5 fd:5
> -ffint_s_l LA64 0000 00010001 11010 00110 fj:5 fd:5
> +ffint_s_w LA64 0000 00010001 11010 00100 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
> +ffint_s_l LA64 0000 00010001 11010 00110 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   ffint_d_w LA64 0000 00010001 11010 01000 fj:5 fd:5
>   ffint_d_l LA64 0000 00010001 11010 01010 fj:5 fd:5
> -frint_s LA64 0000 00010001 11100 10001 fj:5 fd:5
> +frint_s LA64 0000 00010001 11100 10001 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   frint_d LA64 0000 00010001 11100 10010 fj:5 fd:5
>   
>   #
>   # Floating point move instruction
>   #
> -fmov_s LA64 0000 00010001 01001 00101 fj:5 fd:5
> +fmov_s LA64 0000 00010001 01001 00101 fj:5 fd:5 \
> +    !safefloat { nanbox_s($fd); }
>   fmov_d LA64 0000 00010001 01001 00110 fj:5 fd:5
>   fsel LA64 0000 11010000 00 ca:3 fk:5 fj:5 fd:5
>   movgr2fr_w LA64 0000 00010001 01001 01001 rj:5 fd:5 \
> -    !constraints { $rj != 2; }
> +    !constraints { $rj != 2; } \
> +    !safefloat { nanbox_s($fd); }
>   movgr2fr_d LA64 0000 00010001 01001 01010 rj:5 fd:5 \
>       !constraints { $rj != 2; }
>   movgr2frh_w LA64 0000 00010001 01001 01011 rj:5 fd:5 \
> @@ -549,7 +586,8 @@ movcf2gr LA64 0000 00010001 01001 10111 00 cj:3 rd:5 \
>   #
>   fld_s LA64 0010 101100 si12:12 rj:5 fd:5 \
>       !constraints { $rj != 0 && $rj != 2; } \
> -    !memory { reg_plus_imm($rj, sextract($si12, 12)); }
> +    !memory { reg_plus_imm($rj, sextract($si12, 12)); } \
> +    !safefloat { nanbox_s($fd); }
>   fst_s LA64 0010 101101 si12:12 rj:5 fd:5 \
>       !constraints { $rj != 0 && $rj != 2; } \
>       !memory { reg_plus_imm($rj, sextract($si12, 12)); }
> @@ -561,7 +599,8 @@ fst_d LA64 0010 101111 si12:12 rj:5 fd:5 \
>       !memory { reg_plus_imm($rj, sextract($si12, 12)); }
>   fldx_s LA64 0011 10000011 00000 rk:5 rj:5 fd:5 \
>       !constraints { $rj != 0 && $rj != $rk && $rk != 2 && $rj != 2; } \
> -    !memory { reg_plus_reg($rj, $rk); }
> +    !memory { reg_plus_reg($rj, $rk); } \
> +    !safefloat { nanbox_s($fd); }
>   fldx_d LA64 0011 10000011 01000 rk:5 rj:5 fd:5 \
>       !constraints { $rj != 0 && $rj != $rk && $rk != 2 && $rj != 2; } \
>       !memory { reg_plus_reg($rj, $rk); }
> diff --git a/risugen b/risugen
> index e690b18..fa94a39 100755
> --- a/risugen
> +++ b/risugen
> @@ -43,7 +43,7 @@ my @pattern_re = ();            # include pattern
>   my @not_pattern_re = ();        # exclude pattern
>   
>   # Valid block names (keys in blocks hash)
> -my %valid_blockname = ( constraints => 1, memory => 1 );
> +my %valid_blockname = ( constraints => 1, memory => 1, safefloat =>1 );
>   
>   sub parse_risu_directive($$@)
>   {
> diff --git a/risugen_loongarch64.pm b/risugen_loongarch64.pm
> index 693fb71..8ab598b 100644
> --- a/risugen_loongarch64.pm
> +++ b/risugen_loongarch64.pm
> @@ -66,6 +66,28 @@ sub set_reg_w($)
>       return $reg;
>   }
>   
> +sub write_orn_rrr($$$)
> +{
> +    my($rd, $rj, $rk)=@_;
> +    # $rd = $rj | (~$rk)
> +    insn32(0x160000 | $rk << 10 | $rj << 5 | $rd);
> +}
> +
> +sub nanbox_s($)
> +{
> +    my ($fpreg)=@_;
> +
> +    # Set $fpreg register high 32bit ffffffff
> +    # use r1 as a temp register
> +    # r1 = r1 | ~(r0)
> +    write_orn_rrr(1, 1, 0);

Better to use write_mov_ri(1, -1) instead of inventing another helper.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

