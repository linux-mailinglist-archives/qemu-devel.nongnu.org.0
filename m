Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FD841408E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:26:46 +0200 (CEST)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStqG-0003Ix-OB
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStoq-0002WF-ER
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:25:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStoo-00059G-W8
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:25:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id dw14so1145491pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CexT/r0fHm90zamNCKz/ocV4g8Wv8T1WIqCQeXP1ptA=;
 b=x2PmRly0wN9ss/qXP5XBGgd92xjAlaeJpzgKhhN9bpqbnFSprt2c9yGQiMvr0d5hnv
 Iu0V3xWfH3lwiuSABZG9MLAJ2CdP9HVS0ZrMwQihyU6cqrIbghuF78jSbRd35rwzjOx4
 ZvhIdx5fHNletOzi0jIuuaVYPa2ruOxU3e3cMfEqduPLnNTnJBz1UmkT0CnBxjAF5/Zq
 Wkf7mHvRnD2xFUBJDdlfyPIRuEbXX4VHiLx10TPfwZp46K+0TMKpWALFLdy+30cKS3VF
 GvL3+fWlnQU42Dd3dBxh2q8pKX8EptpHP2uk26s4wbVdXG9rQhTc5w95B9agJiBoZ1nA
 47iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CexT/r0fHm90zamNCKz/ocV4g8Wv8T1WIqCQeXP1ptA=;
 b=SRxcUGyAmwRPN/jpphajvKdstjAWpMz+S2Trz8tdnPbuyy5OB46LAtcaahqPvGMyHL
 pBs8U9Jsii0nNWhzQ3JzMnSzIg+ju08DMqsEtAzPa1wol4BF1z1EstqfWAE+gBXTEUtu
 pMBgnzLu60O00CMR6qhezDJ4NRLOmnK23C49PLAdB9+guG45v6rtQzJUHzoIY19QmjuP
 m7sPXACuaUfJxYGSZB7S0+S6fgc1pdrBiqJ+UVsq+L3Bc167mldXY0PiZKJpFJW9QdGm
 e2Das1FpryztOAEesmRfHcryw0OzLvMx0koaI0NXQCnn+ZBW1L5YEs9nzGRNOysFhUhW
 f2fA==
X-Gm-Message-State: AOAM530AC9d/UPi7PyM8b22ZitRFIsqak3kb2lFSByIPeiBUkJ5Ih6PA
 ZHKYEGU5HKg/X7ugEMUfzOwvROlH52UQTQ==
X-Google-Smtp-Source: ABdhPJzkezU71QHsZ1gu7fLFau78f1FGohbrSQkt0p0FFjfJcQqrjo4mqNhaSdT+0KqIWfDr3xsWJw==
X-Received: by 2002:a17:90a:3ec5:: with SMTP id
 k63mr9078729pjc.185.1632284712941; 
 Tue, 21 Sep 2021 21:25:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p189sm631113pfp.167.2021.09.21.21.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 21:25:12 -0700 (PDT)
Subject: Re: [PATCH v2 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-10-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0717a7de-7c41-990d-ec7a-51b44f49724e@linaro.org>
Date: Tue, 21 Sep 2021 21:25:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-10-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> +    /* Test for PC-relative values that can be loaded faster.  */
> +    intptr_t pc_offset = val - (uintptr_t)s->code_ptr;

This isn't quite right for split r^x code buffer.
You should have seen this with --enable-debug-tcg...

You need pc_offset = tcg_pcrel_diff(s, (void *)val).

> +    if (pc_offset == (int32_t)pc_offset) {
> +        tcg_target_long lo = sextreg(pc_offset, 0, 12);
> +        tcg_target_long hi = pc_offset - lo;
> +        tcg_out_opc_pcaddu12i(s, rd, hi >> 12);

And... this doesn't quite work, right at the edges.  If lo is negative, hi can overflow 
out of range.  There are a number of ways to fix this.  One is to extract the pieces and 
re-assemble to see if it matches.  Another is to rearrange the arithmetic just a little 
and use PCALAU12I.

> +    tcg_target_long upper = (val >> 12) & 0xfffff;
> +    tcg_target_long higher = (val >> 32) & 0xfffff;

Better to use extract64(val, 12, 20) and extract64(val, 32, 30).


r~

