Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B76411771
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:48:15 +0200 (CEST)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKac-0003NN-Iu
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKOz-0001fb-3P
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:36:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKOx-0005e7-Cz
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:36:12 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so102306pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0HhE2iALx8R3G/PrJiS18qBHP2+yrQdMMPxY08spqeM=;
 b=dGViKojmekak+xxIzF17cT+xBrmMb5zdxSsucAx/8c4O/gNa3KNrV3ES4g8nUVB7A5
 A9gMjBF4T8FetwA9LcsrzAQHCMBKPWCiAOOq6YdFRVrChMo0gwBZ+Z4U7nrCXYdrFcC3
 yQKsUfWvfF+XUVv/XHTQXF19onl4QsCI/Wvgn6T402IVzuB+nRQ6VdqYZmw+BJNZoxat
 sz5bN/G50r0mTR3kWd/w3CskiwvDDkLdahF7UWy2uHXZRWZNZJvTeD5DtGoO02dHUvaw
 hmHdcJHqBTRucVMXLZxz9pcFeCTb8j5ifk1mm5x58akmSSD8bsR+Czmy7RfThUF47CLr
 qEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0HhE2iALx8R3G/PrJiS18qBHP2+yrQdMMPxY08spqeM=;
 b=xFgw3wkHzwukWxPjZTOmluA8XIjMqrmym7Tngo/XPrB0OH2dhQ+N//PQh7wbh1k2XK
 mSOwYJNhE11XXTCqLlV21tadW03o24BuN1w7bsNuW1Ehmn3G0LCRyyWFZzarkDEktMnU
 obEPB0R4MMsbcbrf+1ASsU5VysO0dv/3XZXTctSF/JjslqPizf9jzVXtGgoR0ECZP+Im
 wU1oxU0dxyKw1rEBc0gi4+hfZSeXASU3esq2yaL/0Yzn84fDzLGLeTFrxw8u8HnhWoWC
 BPDJYip1dKZyW29Og3e1xP+RHiMAlpdxywCSVmmdhuFI/d4HBtBooZmLRyZsKfG17MSz
 K7rA==
X-Gm-Message-State: AOAM531O9kUFElx491uMGn8OH5pgRDSTS4/SIuEC8DDAFeV9LV1bF2nr
 l8Qylp148ClCNCobCtHSx5u6+tGrpjjNhw==
X-Google-Smtp-Source: ABdhPJyBFy8tFTl/Nisnk8SngyAYOg2AlgPZOM+7IU6Xt/sujr224675RbWJTDmXiSFO19fuaOXl3g==
X-Received: by 2002:a17:90a:8b8e:: with SMTP id
 z14mr37439745pjn.127.1632148569473; 
 Mon, 20 Sep 2021 07:36:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o2sm16138011pgc.47.2021.09.20.07.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:36:09 -0700 (PDT)
Subject: Re: [PATCH 07/30] tcg/loongarch: Implement necessary relocation
 operations
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-8-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00e99b7d-7769-bba3-355c-34cef320da1e@linaro.org>
Date: Mon, 20 Sep 2021 07:36:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-8-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
> +{
> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
> +    int32_t lo = sextreg(offset, 0, 12);
> +    int32_t hi = offset - lo;
> +
> +    tcg_debug_assert((offset & 2) == 0);
> +    if (offset == hi + lo) {
> +        hi >>= 12;
> +        src_rw[0] |= (hi << 5) & 0x1ffffe0; /* pcaddu12i's Sj20 imm */
> +        lo >>= 2;
> +        src_rw[1] |= (lo << 10) & 0x3fffc00; /* jirl's Sk16 imm */
> +        return true;
> +    }
> +
> +    return false;
> +}

This doesn't seem to belong as a "reloc".
Certainly it doesn't seem like something that can simply be allowed to fail.


r~

