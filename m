Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAB5A5748
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 00:55:51 +0200 (CEST)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSnfa-0005B3-FJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 18:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSndy-0003py-IB
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 18:54:10 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSndw-0004xt-SS
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 18:54:10 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so10095189pjg.2
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 15:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=whcdy4WKp3VhQKIU3L5UgjWN84HXLLpoXKdoQ9Qa2lY=;
 b=UpLLO9hmRgi98xukbcz7Z+PE1L1h9xvpfeXBeHBYx9cS9kvM6vSognyU6rylBt4e+G
 BWvdecYZgHhKIEk5+m8OxGh1u0+ado33hqptNELWu8yqtQ5CTJJF4+u6hsph091qNFNT
 itol6c6z7UGtUEC6qgOBo+pzyEaZskFH/WQEZKt25/ijuuKl50orScsQHTLfZ6qB44vB
 MsvwXrIe4tltyv4cADtNgrnKA4MjGgF2qI/eK5GcAcKFZKLdD5fkkjO3bXtaL5bnFZOy
 EIER6t0183uwt6LHKFlASF5wPHpCvWNFoZKBNvLOwO6bxxIg3nNLeCWXdhtJiTuSzbVc
 UvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=whcdy4WKp3VhQKIU3L5UgjWN84HXLLpoXKdoQ9Qa2lY=;
 b=BNNocd/CYEGAy0OR7IFuCK1pBw0jf2eiAxSgxEsipPIABqklidzNRipTjnCK54e8dT
 eZwMGRVo9q3skFLcMvcritNvNuFEjSbeRDsgQ4DvTdCiGoJZoVJzllWPFyBFM9DvkhNG
 H0EVBnUe+G8IfHBvk+xUaF89Uf1z0N9YUkzrnUyCDFjD5yfI8kLm3YxH971RsEcrsPHu
 wdUj8OxSs04zuhgxmM6ozVgAxvJ3lw9AFyjpdSoeZH5EZcutSbT9+zHDz7sVTXA/TmjC
 /LCFDxWKxtnM8bx7DBk1K3lruWyHHjxqRvSNqbUZjNsVHrJJ5WDbCOxagQRIUfs+DAjM
 jnUg==
X-Gm-Message-State: ACgBeo1UX+VsLVOMwLUnvaLHO+f/rhIF4Kv3G/5G7n3xA3Ieu+Ea0RzF
 jaiCxSmLra/2Q7t3JaysMkE0ZA==
X-Google-Smtp-Source: AA6agR5ahHlpQAbXGB+HHJKa7t2r2+pzNp1FLFyE1zEAaU2ZX0NIOk3nTzV+D2P+a7f1mcXCR/8wXQ==
X-Received: by 2002:a17:90a:4008:b0:1fd:9c55:fdfb with SMTP id
 u8-20020a17090a400800b001fd9c55fdfbmr12105889pjc.89.1661813647328; 
 Mon, 29 Aug 2022 15:54:07 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:ecdc:4f14:189e:85b3?
 ([2602:47:d49d:ec01:ecdc:4f14:189e:85b3])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a1709026b4300b0016eef326febsm8068964plt.1.2022.08.29.15.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 15:54:06 -0700 (PDT)
Message-ID: <fda2702b-5bf2-91c4-3a96-5a51e9438e20@linaro.org>
Date: Mon, 29 Aug 2022 15:54:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] target/i386: Raise #GP on unaligned m128 accesses
 when required.
Content-Language: en-US
To: Ricky Zhou <ricky@rzhou.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20220829142326.39562-1-ricky@rzhou.org>
 <20220829142326.39562-2-ricky@rzhou.org>
 <a0972b9f-7fbc-8403-6db6-cb30b741d247@linaro.org>
 <CAFoVXjgHBPs8XhOqLN9BpD1-GN7Amsor5o660WOmBdQ54dxW5w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFoVXjgHBPs8XhOqLN9BpD1-GN7Amsor5o660WOmBdQ54dxW5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/22 13:46, Ricky Zhou wrote:
> Thanks for taking a look at this - did you see the bit in the cover
> letter where I discuss doing this via alignment requirements on the
> memory operation? My logic was that the memop alignment checks seem to
> be more oriented towards triggering #AC exceptions (even though this is
> not currently implemented),

I missed that in the cover.  However... implementing #AC is pretty hypothetical.  It's not 
something that I've ever seen used, and not something that anyone has asked for.

> One slightly more involved way to use alignment on the MemOp could be to
> arrange to pass the problematic MemOp to do_unaligned_access and
> helper_unaligned_{ld,st}. Then we could allow CPUs to handle
> misalignment of different MemOps differently (e.g. raise #GP/SIGSEGV for
> certain ops and #AC/SIGBUS for others). For this change to x86, we could
> maybe get away with making MO_ALIGN_16 and above trigger #GP/SIGSEGV and
> everything else trigger #AC/SIGBUS. If that's a little hacky, we could
> instead add some dedicated bits to MemOp that distinguish different
> types of unaligned accesses.

There's another related problem that actually has gotten a bug report in the past: when 
the form of the address should raise #SS instead of #GP in system mode.

My initial thought was to record information about "the" memory access in the per-insn 
unwind info, until I realized that there are insns with  multiple memory operations 
requiring different treatment.  E.g. "push (%rax)", where the read might raise #GP and the 
write might raise #SS.  So I think we'd need to encode #GP vs #SS into the mmu_idx used 
(e.g. in the lsb).

However, I don't think there are any similar situations of multiple memory types affecting 
SSE, so #AC vs #GP could in fact be encoded into the per-insn unwind info.

As for SIGBUS vs SIGSEGV for SSE and user-only, you only need implement the 
x86_cpu_ops.record_sigbus hook.  C.f. the s390x version which raises PGM_SPECIFICATION -> 
SIGILL for unaligned atomic operations.


r~

