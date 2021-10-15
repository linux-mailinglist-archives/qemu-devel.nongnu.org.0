Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197042F9AF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 19:07:45 +0200 (CEST)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbQgK-0001oI-Fs
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 13:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbQea-00012H-73
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 13:05:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbQeY-0008HK-Ej
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 13:05:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c29so8909029pfp.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KpSYtUyJUbx7BMs0HQYgrDsqmxnlToNd6BDuEL1hVkI=;
 b=kt71I7iXzpYlwkbeObHKQ4DWg6pRNqmHT6W5OFN46lvnpdHBfbYFY6+/7LJCynlb0n
 QlSq32ifizE/g17YdMlmjYZ7Ssk6AD1Zp8dRkDZ0mKYo+CdaN7on9l1BPPtNyuGg89s+
 DE2SGBIUxLh/vmcZavumrlQMQzea2Ny/NarCWYYdL60TnSlOAGmqhRpUF51E7PrCiMgE
 sb77ItB8gWErQyjAyXkvJiBzuJ7OHl8EkQjpoFDklqykj4qWSZSR1lwthY79qcCVDPPJ
 AM4XVoVSaUWhkBXxBkMrWZEJhnTGAvPToKugycaCzMsgNCVOh/V4lFA0wjIdVX+G2aWb
 WhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KpSYtUyJUbx7BMs0HQYgrDsqmxnlToNd6BDuEL1hVkI=;
 b=S6F7KxSFZ0pt+9wASoAGrRLI9O851lVKheqpPZ4ZOjeBzjkpZeqHIGjpEGn4iNk4+8
 i4osgA1HrqJqhtIlCzp+L15+xXQcsf/S/DOqolVaPJbkKuGEMdj6iV8G2+hZLozRDugz
 eg9Aik07mJwf086CQ9psqyFPSJQEidg6ECr/3dzArFRc9yOE7agDe+M+DIlsfHMD46ND
 W4diBt151Wp7oDXY6a4C5v07xj5z/gfsvTjT3L9UsijOBYZtpHifz/rMubD8tJ8VRcbP
 J5+9+5jNyFTBaIxtV4covFQhMSuYTDwGomcTlS/d0leqzevRhx1IcY41tGfVSlXjSDDw
 KiQQ==
X-Gm-Message-State: AOAM531h4BE1t/OrlTibNYSvAMY8IiQHzoiTtqVdIBiYufcype6jyN6q
 bTMf6K9sUcftjvNGTZmCBjv2YQ==
X-Google-Smtp-Source: ABdhPJyiB2UJ7OEh8WDL5kVbHPOK7hpk9SkQQVinqbQz9P3ackxxiO8BsCyq+7grgEyNYGf99MWIgQ==
X-Received: by 2002:a62:2f07:0:b0:44c:e43e:be75 with SMTP id
 v7-20020a622f07000000b0044ce43ebe75mr12692410pfv.0.1634317552771; 
 Fri, 15 Oct 2021 10:05:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s7sm5867401pfu.139.2021.10.15.10.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 10:05:52 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
Date: Fri, 15 Oct 2021 10:05:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015065500.3850513-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Chih-Min Chao <chihmin.chao@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 11:54 PM, frank.chang@sifive.com wrote:
> From: Chih-Min Chao<chihmin.chao@sifive.com>
> 
> The sNaN propagation behavior has been changed since
> cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
> 
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> ---
>   target/riscv/fpu_helper.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 8700516a14c..1472ead2528 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>   {
>       float32 frs1 = check_nanbox_s(rs1);
>       float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
>   }

Don't you need to conditionalize behaviour on the isa revision?


r~

