Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7484094B5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:33:54 +0200 (CEST)
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPn1t-0007CZ-KH
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmRb-0001RK-Dn
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:56:23 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmRY-0004yz-6Y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:56:22 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so6613568pjc.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M1cFjKHx/TzYQaXC24w6/ALuksE5RIkE0mIiGgfGRdE=;
 b=E07hpBZ/mNsePnObUOxRNGphjdPlndadeHfzFuehsjRrG5UVIIVZRJprQYaW8qZs2K
 h+eotoztF38mhM057UVxlIV7Hu29GROfNFxSZYXylVwdk2Lqk/Ng5IJ2R6dn2LHDmOSO
 PW8YDeW1oef7o1Eht3X6+Jk8UxxJpcCMHyO0V3T4EXp7imECO5+qBe417voHzjLswN3H
 fVEuIf0ZZd+lCna6CMofZTEQH2BW70Lglnl7YgWEd0tHONGI+olUUshZ0c7Y9a1c907W
 mQPmt61s7AMAma3D0vfQnXg+rZy3UPpcRREJx6dS1zUSrTpZNBRV25rqThGjofBCSmLW
 /yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M1cFjKHx/TzYQaXC24w6/ALuksE5RIkE0mIiGgfGRdE=;
 b=rYeNNoM9Y1P83u9pE0QwqgY1JjL7GWHtQTs2TYGfMgM1uhFplIgd1Sn4sN9T7x2wlL
 VZ/hRxnlWDaSm3hjCFhuxoQc69SRDRd5VKwGF5D9aGen5059uJRyl7I46NrHh4dfFtBz
 M7ZmcTU2MCGnNaXVAyIX/LAUMrdpG9idsKayqhE4g35s0XtwVm1GrcWhgrbh3I6wYKvb
 jBblYedbqVi1d3YGV2vnVcE83nA/iobSoa7o+6QX3UlIqRRhyRxVReK8Tlk3057NQkM2
 VKdAMFh4eTHqu33Cld66b/Jf20ouzmsNTtSrzk92tcXQQjrW9zwfiOxbi6jslTzytPhc
 XE6Q==
X-Gm-Message-State: AOAM531RtC+XHthc2QoDBM+YLGQs9ARwNEjFdcTyzmJP3Y7LxVFHbxFA
 nq4z3UDgHIan6jRpI+5U1xGuZg==
X-Google-Smtp-Source: ABdhPJzwMJQW70h6Ca22du2JsfxW04aoRG+W7GV/nm8fzVi3xq50ulIJONbpv424delnT9/f8rskiA==
X-Received: by 2002:a17:902:654c:b0:13a:505d:6a04 with SMTP id
 d12-20020a170902654c00b0013a505d6a04mr10778191pln.82.1631541378556; 
 Mon, 13 Sep 2021 06:56:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v190sm7330025pfv.166.2021.09.13.06.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:56:18 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate
 forms
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
Date: Mon, 13 Sep 2021 06:56:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 2:54 AM, Peter Maydell wrote:
> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
> +{
> +    /*
> +     * We get here with a negated shift count, and we must handle
> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
> +     */
> +    shift = -shift;

You've already performed the negation in do_2shift_vec.

> +    if (shift == (8 << vece)) {
> +        shift--;
> +    }
> +    tcg_gen_gvec_sari(vece, dofs, aofs, shift, oprsz, maxsz);
...
> +    if (shift == (8 << vece)) {
> +        tcg_gen_gvec_dup_imm(vece, dofs, oprsz, maxsz, 0);
> +    } else {
> +        tcg_gen_gvec_shri(vece, dofs, aofs, shift, oprsz, maxsz);
> +    }


Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical 
error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.

r~

