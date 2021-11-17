Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D692845429A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:27:02 +0100 (CET)
Received: from localhost ([::1]:44438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGHW-0004Si-0J
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:27:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGDc-0000G0-8Z
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:23:01 -0500
Received: from [2a00:1450:4864:20::32c] (port=46627
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGDZ-0001Ys-MF
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:22:59 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so1400436wmb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qoAN5X6M4yXZ1BvBVpwu5340EaLVd8zJ3C4Cip7VbFA=;
 b=nDt91EzkXU1pbYyh/kCXPxUaxBJ2OL2l+DtYFFiQIVNEfFWwqdES/lMIqx5Mw+XqFA
 3Qioy980MzKBbIBj98pkFqKTCxvwVD8HkTcApr2Kaio80f/hLOEGWa/xxX0GvtiOpQ+k
 uHSrcIYclR5S57nkGQfucK1wr+chkEg9YHc0QQpYtzpMG5Xi075RoauY4UOCXSEJlUgF
 lDI0blw6gAPlCOnaOoNjX9htVVtC2BgzfjV0LaJeSqGjatOyAhNv8hLaOtM7m61ZRPj4
 nxwWCeNA92sfGjy3+qxTiRR+NLr6l6F9JDckGkSj4GF30Ck+ZoGAP0468kaYIvYfe5yu
 jbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qoAN5X6M4yXZ1BvBVpwu5340EaLVd8zJ3C4Cip7VbFA=;
 b=Ai8oKUjzMoEOFZbxc2QUHRg66HsRRnt7ax32n5RR2n0Qg5F/4rab4MJbpQvhM39Pee
 DxKX7mgy/lrbCkftX8G16UB8mRCvWHpAt9dU9+4ox018tjomVMX74WmDHHVvSvTyefU2
 A1mqtIxAaOvjB3hWcUqt7Hm1joOsMKCtirh6dT8ZJnBr1cV0/2IBtOau9ev7xbp3u1l/
 zkw68Og3xB/dCnjlVFFG9GOKyxtrbsGNUSaDW1rYWYhUMie6BNvEfZl1tv9fBBCQ1my0
 5X/NkCEALEiuDx2gOaQ3LE1Anx2aIdhutSdFHBdpx09iPyW4sK2oPaZOsUeRzm3aJmpE
 XfsA==
X-Gm-Message-State: AOAM532YepDLwcJduhpjYPCVHaE7NHHaIDePffaZausrGf2hXVelGDmB
 IOHjjPaTcCx9tgqDdIx5D1CHpw==
X-Google-Smtp-Source: ABdhPJxavF50Kb+yTMeT3CgOhIo5r3AnsLnnUpRCdl64NZse6t+MQy59fK+CoIwJ4k/4pFii3wBurA==
X-Received: by 2002:a05:600c:1c20:: with SMTP id
 j32mr15147976wms.1.1637137376082; 
 Wed, 17 Nov 2021 00:22:56 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id z15sm19288447wrr.65.2021.11.17.00.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:22:55 -0800 (PST)
Subject: Re: [RFC PATCH v2 09/30] target/loongarch: Add TLB instruction support
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-10-git-send-email-yangxiaojuan@loongson.cn>
 <f1059243-06e9-d9d8-673a-55fc6e31b5cc@linaro.org>
 <a268c269-7a3d-b8c6-5e69-786fbd238b05@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22096fc3-859c-a795-16f4-e5c7dbe00e8d@linaro.org>
Date: Wed, 17 Nov 2021 09:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a268c269-7a3d-b8c6-5e69-786fbd238b05@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 8:29 AM, yangxiaojuan wrote:
> On 11/12/2021 02:14 AM, Richard Henderson wrote:
>> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>>> +static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
>>> +{
>>> +    gen_helper_check_plv(cpu_env);
>>> +    gen_helper_tlbwr(cpu_env);
>>> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>>> +    ctx->base.is_jmp = DISAS_EXIT;
>>> +    return true;
>>> +}
>>
>> I think you can skip the EXIT if paging is disabled, which it usually will be in the software tlb handler.  You'd be able to tell with the mmu_idx being the one you use for paging disabled.
> 
> The paging disabled only enabled at the bios startup, we can get the phys address directly, tlbwr instruction will not be used when paging enabled.

Paging is also disabled during TLBRENTRY exception (see section 6.2.4 Hardware Exception 
Handling of TLB Refil Exception).  It is this routine that will usually use tlbwr most 
often (although the kernel at PRV 0 is not prevented from doing so).

>>> +    default:
>>> +        do_raise_exception(env, EXCP_INE, GETPC());
>>
>> You can detect this during translation, and dispatch to the appropriate invtlb sub-function.
>>
> oh, sorry, I don't quiet understand this. detect during the translation sees more complicated.

It is not more complex at all.  Less complex, I would say.

static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
{
     TCGv rj = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv rk = gpr_src(ctx, a->rk, EXT_NONE);

     if (check_plv(ctx)) {
         return false;
     }

     switch (a->invop) {
     case 0:
     case 1:
         gen_helper_invtlb_all(cpu_env);
         break;
     case 2:
         gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(1));
         break;
     case 3:
         gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(0));
         break;
     case 4:
         gen_helper_invtlb_all_asid(cpu_env, rj);
         break;
     case 5:
         gen_helper_invtlb_page_asid(cpu_env, rj, rk);
         break;
     case 6:
         gen_helper_invtlb_page_asid_or_g(cpu_env, rj, rk);
         break;
     default:
         return false;
     }
     ctx->base.is_jmp = DISAS_STOP;
     return true;
}


r~

