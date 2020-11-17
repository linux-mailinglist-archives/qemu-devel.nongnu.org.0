Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C542B6EBC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:34:25 +0100 (CET)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6kC-0001TJ-EM
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6hf-0000cN-OU
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:31:47 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:53427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6hd-0005af-UY
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:31:47 -0500
Received: by mail-pj1-x1041.google.com with SMTP id gv24so1018211pjb.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YmMwDUJOjVzvjInAFciw2UH0pSNsvv6drOfJF5Dp8wk=;
 b=pyQHAOz884VVxf/RqXr4ssAJgFO11YvBFf8f1dDx8WV841/xsVqinSJ7r1txhaiyHZ
 xQzwxmRYymRizeaOt1sAR3gn6JJYUK+x/TvIWb80pPkasA7rveeItxyT9FB6N3zgFRik
 pPyHfQp9TjJFBIIA0N/SJnYni6cPrHywUuwLqj21owEFjUGbSYqAt+9l37eo5ptTGvx5
 cJhtjQY8/DOYhuTpDxUpHkhfMZ7RzS+2BaSJkSdY11UiYdnIjX9BuahbbJrQlt8mjN88
 /vVEaA9Nz+DtTeJBN9BH2pAkdi4xDpZhtqs6TqlVDVJLJCsccDTR7OJP30z9MPCPLaFN
 uSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YmMwDUJOjVzvjInAFciw2UH0pSNsvv6drOfJF5Dp8wk=;
 b=fxHdpae6XUE6iWXRT+v2wEV4cLbS3gOBPM3tb9JcHk4FMtgVeLmxkarINbA6dnlSZR
 /eUcJUpA+JLywu9ucoNZ/7iAs1sJQzIbzyK1Wsh6ZQiOc281I4Qtv1JHujjDtA1X8eBQ
 tde32yOpMA4WFaC2X7wliLVh7bsBSEADb+V+xQsO814ft4h3kdIMUY+4AdeFb81s2RLK
 aQ+juz0hH3FtGq9vAafvRV5nzeZ0sA+WmJNcaFhiSayHod5xqtAF1GXjwmigbwV9ZFR0
 Z1oIg+yKsZqzy8rIqvIDS2RbwSp6Ds1N+UKoZUkcXZuw6BTafZwedi0YrqT+YkSxcQQ5
 5t7A==
X-Gm-Message-State: AOAM532PLk+PDAEinEe6WyAQA++r/xd8perTEqN0YJAHbe8Bz6zxeApk
 2seMtQxd+Kn2ECqBlc9mX1XKr3SemQOMOg==
X-Google-Smtp-Source: ABdhPJyMY0TgYv/BRZlWrIbaKLbTjmUkbi9wuml6KMhz2Mu9pVxPLBX/9jUcgGGR44wfB16CzetfjA==
X-Received: by 2002:a17:902:7004:b029:d8:fc7c:4fef with SMTP id
 y4-20020a1709027004b02900d8fc7c4fefmr594285plk.75.1605641504272; 
 Tue, 17 Nov 2020 11:31:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e6sm22084788pfn.190.2020.11.17.11.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:31:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/15] target/arm: Implement VSCCLRM insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-5-peter.maydell@linaro.org>
Message-ID: <698b908c-0406-cdb9-4bdf-253693a85655@linaro.org>
Date: Tue, 17 Nov 2020 11:31:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> +    aspen = load_cpu_field(v7m.fpccr[M_REG_S]);
> +    sfpa = load_cpu_field(v7m.control[M_REG_S]);
> +    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
> +    tcg_gen_subi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);

xori would be clearer, i think.

> +    /* Zero the Sregs from btmreg to topreg inclusive. */
> +    zero64 = tcg_const_i64(0);
> +    zero32 = tcg_const_i32(0);
> +    if (btmreg & 1) {
> +        write_neon_element32(zero32, btmreg >> 1, 1, MO_32);
> +        btmreg++;
> +    }
> +    for (; btmreg + 1 <= topreg; btmreg += 2) {
> +        write_neon_element64(zero64, btmreg >> 1, 0, MO_64);
> +    }
> +    if (btmreg == topreg) {
> +        write_neon_element32(zero32, btmreg >> 1, 0, MO_32);
> +        btmreg++;
> +    }

I hadn't implemented MO_32 for write_neon_element64 because there were no
users.  Better to just add the case there using tcg_gen_st32_i64, then you
don't need a 32-bit zero.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

