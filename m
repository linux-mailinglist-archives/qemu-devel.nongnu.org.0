Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAA411B42
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:55:25 +0200 (CEST)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMZf-0003Vj-QU
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMG2-00012y-Mb
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:35:06 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMG1-0005Dz-2e
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:35:06 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s11so17911556pgr.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZU4p4oe0wpBL8Z8StOLsWUQiWTpqiAQ/J1rH3w2Nblw=;
 b=na6fCx5TJRe/hMYOZpImBMarMZFCtv+b0WZBU6FMKSjUNaVEa9WBKROENDwP+cktcf
 lfUM4OnUvP69o6F5yJ3gf93sdmeN5CAnHZoi3hceMnztRIClMjR60EW9uj++Ou9Bc679
 y3jvN0KSnjeAZrNPtweEuPk1lPxR+sGfY/eASSJs8fVH3/DVulc5Mrxzq8C3Uw60ehuY
 SnucDHzpQOC3Pa+CBKFyifkpt0B/jbVou7Fe9FxVxwy1Lv030DOgeA6gnk7izJNU4KEu
 GqGvTz2o+UY/kGKTOoxmPB0S8pgPi0qJKX1zxv4EaAAi7RXZbxVdaKqPZnPoJK5rny2r
 0Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZU4p4oe0wpBL8Z8StOLsWUQiWTpqiAQ/J1rH3w2Nblw=;
 b=IK67jSUxJszJ4a9CUog1Z/KS4YyeiAf89X4Gk95z3EGu3KKN13G82dpNxcL2E/1wdQ
 5icqEUoG/z/0p5Q9bZegJ3l0yhcz+jRn86Z4n68nzSeLDJXr/b+XYSZwdgQn2UOWV4e8
 sQhqtUhqzv6LUSqToQoOmiUcw+HiUhtvrdn3/I8DiV+X8qMNqNmiCBJxNxUgFXvSlX9v
 ad9qNYJLVz90rLDU5kih3I8BTiZRrikxssjOCK23JqmwUeF8EHDbQnuymaG9jKxBO5qx
 23SRe49vAnke8VKm6N+hl0cmk8zEViFbMe4cuRkvsMFb6r8Ce5w409QlfMx99uQrMDMX
 vAVw==
X-Gm-Message-State: AOAM533GEcsn0eHOSukhTS/Bbi0kvEG4sWETiIrGY8wDS41fP+VUDuO/
 g4ELk383Cj2HZ0HLuiW4mmkQx+cctRrH/g==
X-Google-Smtp-Source: ABdhPJyR2psRh2habc3q5z+tS6sL3yzoV5Xf4hu8H1UhPT1s08y+24ahX5Ws8F2660ctqczEuY8G5A==
X-Received: by 2002:a63:5902:: with SMTP id n2mr24400132pgb.305.1632155703542; 
 Mon, 20 Sep 2021 09:35:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x15sm16184101pgt.34.2021.09.20.09.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:35:03 -0700 (PDT)
Subject: Re: [PATCH 21/30] tcg/loongarch: Implement tcg_out_call
From: Richard Henderson <richard.henderson@linaro.org>
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-22-git@xen0n.name>
 <0176e1cb-faaf-ca08-a35d-879811c18670@linaro.org>
Message-ID: <9c4f7220-1c6a-03f4-f265-b337909583e5@linaro.org>
Date: Mon, 20 Sep 2021 09:35:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0176e1cb-faaf-ca08-a35d-879811c18670@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 9/20/21 9:31 AM, Richard Henderson wrote:
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>> +    } else if (TCG_TARGET_REG_BITS == 32 || offset == (int32_t)offset) {
>> +        /* long jump: +/- 2GiB */
>> +        tcg_out_opc_pcaddu12i(s, TCG_REG_TMP0, 0);
>> +        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, 0);
>> +        ret = reloc_call(s->code_ptr - 2, arg);
>> +        tcg_debug_assert(ret == true);
> 
> Just inline reloc_call here, so that you can provide the correct offsets to the pcadd and 
> jirl instructions directly.  The assert will vanish, because you've already done the range 
> check with "offset == (int32_t)offset".

Actually, don't you want offset == sextract64(offset, 0, 34), and use pcaddu18i? 
Depending on the memory map of qemu, those extra bits could make the difference in 
directly reaching the main executable.


r~

