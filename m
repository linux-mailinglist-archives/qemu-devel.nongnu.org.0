Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7676964CE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvUv-00042I-IK; Tue, 14 Feb 2023 08:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvUt-0003xK-S9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:37:27 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvUr-00079H-VV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:37:27 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 bv2-20020a0568300d8200b0068dc615ee44so4649489otb.10
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jxq45QuEFbHMNJ3fsLk1sA+YaGdqGSj5qFl05FbojDU=;
 b=RV0jP3I0Ar9GkKLiUaEHL9nhSqckZX0ddn0y3raPXO5Ws30ExTlCYxqVEO73Aq3mPm
 8HyDhBiXyOBnwwam1QHSSguko/4wDgBnyFFeYmCRk/5Nk11cIPnHUMVuhxHb0Q+PIu25
 pSoepLs6OHNUC6VVIGzjxzyYqmGwJSkiynbuUeKNLw1rr5DQU+4/LtkH2i+2oc6YEwDu
 wf7gXezvd5Qfm8xfIWEzipQlUFT+Bzxsnm3TTYTZKSPi0Hp0ye5+NQtQciNkUjgw6xdo
 tbZ3mzctn/0p3LgDsON+TX3W54y2S+a7YFjd5vu7nzBZVpuDZF1/8s0bRCozHCA+McL+
 FPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jxq45QuEFbHMNJ3fsLk1sA+YaGdqGSj5qFl05FbojDU=;
 b=LDO3nL6gc3fQIjlzfmNkWmBkECvMC22JC0wFFRseV9WqtRDTOQsWl2CxlPm8PaQQKZ
 X8grrrqb4Ad4AG8BHZj2j++XUsVdjQomR0gelONj2PD/vU48Ha7z+zqHkpDJ92ghKNdj
 WmZPKutcJz6E4zHH/2tYjzpqXXlTGSJ6kHJNm3Fqz16gKe73iqrmdeFUSTR7nHMItXcI
 YdK2GHe0dteFZxPDcWRtnXxJkoWulD6V63k5p2l0Z92YkZ7+VWvxscQAkPy25LCU5ZtB
 jXE85lyD256knA5sZpEVAgB4x2ZMsbbvxPOlSw74o/4jwwklCQwisHlblOjh2dwEI4sp
 cTZQ==
X-Gm-Message-State: AO0yUKXm6H9Ma3mavnDqVXkRlvyRFmT6/JH6q/iVZpevYY7ESVmDFoK1
 opg50TuluzN2e3bjNNrr9sHQpg==
X-Google-Smtp-Source: AK7set9oLS8XD1ypz1Z67f2OGqBZeXsl4zkx7sqwO6LLVhchyh511Fgt3xyDU2NbnVbVPOz6A4jNDg==
X-Received: by 2002:a05:6830:615:b0:688:4892:e1d3 with SMTP id
 w21-20020a056830061500b006884892e1d3mr1028276oti.8.1676381844784; 
 Tue, 14 Feb 2023 05:37:24 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a056830129300b0068bbb818c64sm6412584otp.25.2023.02.14.05.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:37:24 -0800 (PST)
Message-ID: <77307e37-6144-b8b3-ac6f-7ad3ae3aefa8@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:37:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 13/14] target/riscv: Simplify check for EEW = 64 in
 trans_rvv.c.inc
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-14-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-14-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/14/23 05:38, Weiwei Li wrote:
> Only V extension support EEW = 64 in these case: Zve64* extensions
> don't support EEW = 64 as commented

"as commented" where? In the previous patch?


> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

The code LGTM.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5dbdce073b..fc0d0d60e8 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1998,8 +1998,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
>        * are not included for EEW=64 in Zve64*. (Section 18.2)
>        */
>       return opivv_check(s, a) &&
> -           (!has_ext(s, RVV) &&
> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>   }
>   
>   static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
> @@ -2012,8 +2011,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
>        * are not included for EEW=64 in Zve64*. (Section 18.2)
>        */
>       return opivx_check(s, a) &&
> -           (!has_ext(s, RVV) &&
> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>   }
>   
>   GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
> @@ -2230,8 +2228,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
>        * for EEW=64 in Zve64*. (Section 18.2)
>        */
>       return opivv_check(s, a) &&
> -           (!has_ext(s, RVV) &&
> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>   }
>   
>   static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
> @@ -2242,8 +2239,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
>        * for EEW=64 in Zve64*. (Section 18.2)
>        */
>       return opivx_check(s, a) &&
> -           (!has_ext(s, RVV) &&
> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>   }
>   
>   GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)

