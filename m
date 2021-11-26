Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0F645EC78
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:21:55 +0100 (CET)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZIg-0007Iz-IZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZGr-0005qO-D5
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:20:01 -0500
Received: from [2a00:1450:4864:20::42f] (port=37449
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZGp-0002Jv-JC
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:20:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b12so17912089wrh.4
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4OKl01bOGIbyp4u55BVn47b+llH5FbyfeHC/mYV2utY=;
 b=pA4tL6ot7juJ73bNX4Eua4dP9n+bB9A9rPDljbkrw+80ZxgSthUXc2wIGOl2/oRoih
 Ahs2u/y9r13PVjVVxHac+z7ZpTH5ZGSUGoRWkIlWjNdpyzNVgqf+7F8gj6DmhLRKFxSQ
 O0HSqTejOrWjgPey502tKnx6qgTCEJPTNyn+X/vm5131Qv14DfKrIE5k4DnjOvdl3HWE
 Wwu2od0J/U2eHKBJ1Dn6rRuIjVu8e3G3fT65fOyB3O33voFu+yfFRzLzajWWhIOH58Bk
 bvgRvBlL0ujk8TT0jwEFbxQFb4mfG87RnBl6cuztRPdu8MZZD8wCpHOphQ4v2tZHcnuY
 A7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4OKl01bOGIbyp4u55BVn47b+llH5FbyfeHC/mYV2utY=;
 b=O+5sxYuUU9XDgkY98cE2ZYvW45ORLC4H3xcRYiDpG/CPPWo0CKcfF8pbUxP3S2+YF/
 T0sYJRe26axlBx1U+lRM1fvEsO4nuN93Vj36Kro2Q3EpHiVMQwjJE+j8yN+0w8TgOaY/
 /ZXtK/DP4LViDs06Bn94WObvIghIevgoNp+77wqHm48hLhWE72om3RiWCQ/nufsLPmOb
 lVzbRdecSkbJw1VaB+dwFoX19XSIvMM/U1sOv1J3HO6GA6mh1f/+IKqu0vVito7UxFU1
 dr1rElP1RbINxAFk71icTNTUxpoQ6xeekHWI0iE8pewPt/Nrn7dEwU0meLQQkrPtLDNs
 eh3w==
X-Gm-Message-State: AOAM533uAC27BElb+YDNpBwZPhfjc0SwiudKwDs1JncLDha0vWD/3L68
 cml3+OC5JUlZY2AYXdQzFhOktg==
X-Google-Smtp-Source: ABdhPJwD3tq41JZ+aG6Ej3Uw5EZvyM/RkjAcWHGLlcqLhR8MgphUjDWUoKBAd/Xy2l1LoTEUiyUlOw==
X-Received: by 2002:a5d:452c:: with SMTP id j12mr13129504wra.430.1637925598107; 
 Fri, 26 Nov 2021 03:19:58 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d9sm5253075wre.52.2021.11.26.03.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:19:57 -0800 (PST)
Subject: Re: [PATCH v5 01/22] target/riscv: Adjust pmpcfg access with mxl
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
 <20211125073951.57678-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0f578f7-63b3-691c-582b-0f79c5efba70@linaro.org>
Date: Fri, 26 Nov 2021 12:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125073951.57678-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 8:39 AM, LIU Zhiwei wrote:
> +static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
> +{
> +    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {

Let's make this != MXL_RV32.  I suppose real RV128 will extend this restriction to mod 4, 
but that is not yet documented.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

