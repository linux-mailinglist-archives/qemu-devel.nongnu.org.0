Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20F6F41FA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:51:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnae-0006kb-NU; Tue, 02 May 2023 06:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnad-0006kM-Ey
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:50:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnab-0006SG-TP
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:50:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2180750f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683024631; x=1685616631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4g0muGBynH3jPeppO3ovACuWM9a3srxUm4nwY74N5sA=;
 b=aa3sagP87h3WCo1p238cM0A3GU23JoZdsOyaaVabM8Idw6Xxm5IEOFtkR7wJ3E95ww
 Mk/IN7NEL/o+yQ5MAefyaEiBisHZknYNhCtksUjXDHjAPLkytb1LTuNeLcH0Eu07Vkke
 g9SlKZgQW11YWmKhwsatvrs/2i7EB6SAYqlp/wwW/1h1ig8X6pscJloP/kwH7wtsFlph
 ibTczOuQ2CpYRHDs4XuhxxRkPEFiKhyiEk1hgqoQiPYMd+tTmOKQiTT4//NPMo8pO7a3
 RQ+mKol/zJ3V0TnzmVH8rhboeQmrGypL/UYWvMpWgVwV2AG3+O8zwmyRYR1US3mEkleJ
 Y9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683024631; x=1685616631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4g0muGBynH3jPeppO3ovACuWM9a3srxUm4nwY74N5sA=;
 b=Py8Z8KuLdQC6hg3adHeZ/tjc7FRRUGPkj8QTmbgOZmiqENL0gyq68gDs3/ll95kiLr
 skmMTqSQWfDWhXDnG6EyBiYFC++q2rOxEeQ9KnnLos1fc+EYaW8bB5Ut3/RqE26v3GGJ
 N7E8BkmJI5Ez+3D5Ex2Cn5Vn3T+kcf+TYchT8UdCXw0Q4gxQFEAJ4a2aYBwgfbDAPJeU
 mpQ9XUwU1pzh4yjIpW/zJqQRUupCaQw2yMqTpYCGQ64md02I0fTVEN9gEQM2fLvugF3X
 rjVE7AcNpyasnKFtkNOFo5pUzKB/xs1CLKgEUznntpeQ6kCKSYo1EmQ2Et9uKuvzneP5
 PWdg==
X-Gm-Message-State: AC+VfDwJacqGAFnvXLtls9qlpkfR/UzyLF5DIr9tvyn6xQaP0QH2Ue4E
 6IxjbmHveAVEDaMYtw5Spsktcw==
X-Google-Smtp-Source: ACHHUZ5ZlXThyqjsq+nVcbs2yoTjwcobZGxL5M9Nrd53wcUk0v5ppNykjHLZx0Evj89F4ywykh7qAw==
X-Received: by 2002:a5d:4103:0:b0:306:2db9:cc30 with SMTP id
 l3-20020a5d4103000000b003062db9cc30mr3690898wrp.13.1683024631299; 
 Tue, 02 May 2023 03:50:31 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adfdd07000000b003062db9cc21sm4907100wrm.92.2023.05.02.03.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 03:50:30 -0700 (PDT)
Message-ID: <f6a17341-7c12-82cc-9d4b-650745a1c9de@linaro.org>
Date: Tue, 2 May 2023 11:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] tcg: ppc64: Fix mask generation for vextractdm
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, philmd@linaro.org,
 danielhb413@gmail.com, lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: john_platts@hotmail.com, qemu-devel@nongnu.org
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/13/23 20:01, Shivaprasad G Bhat wrote:
> In function do_extractm() the mask is calculated as
> dup_const(1 << (element_width - 1)). '1' being signed int
> works fine for MO_8,16,32. For MO_64, on PPC64 host
> this ends up becoming 0 on compilation. The vextractdm
> uses MO_64, and it ends up having mask as 0.
> 
> Explicitly use 1ULL instead of signed int 1 like its
> used everywhere else.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>   target/ppc/translate/vmx-impl.c.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 112233b541..c8712dd7d8 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -2058,7 +2058,7 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
>   static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
>   {
>       const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece,
> -                   mask = dup_const(vece, 1 << (elem_width - 1));
> +                   mask = dup_const(vece, 1ULL << (elem_width - 1));

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

