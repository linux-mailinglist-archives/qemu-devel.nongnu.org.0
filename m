Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB95F17B1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 02:55:59 +0200 (CEST)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeQnN-0006yn-Nr
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 20:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeQlM-0005N7-PD
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 20:53:52 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeQlL-0001jL-0O
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 20:53:52 -0400
Received: by mail-qk1-x72b.google.com with SMTP id g2so3838620qkk.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 17:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cjCt8qCjpdQblfrUkBpxCM37Ep8gzlsd05xzWAHmKxw=;
 b=D/Dur4wTRS8zPnKoJ2rZXxPWZ2DV9688ZN4G4DxcmibnvmzzPI6u1j01TFvs4qHOD/
 YD89QP3L1qv1vLAQDaHJXo2sTF/hUvbsUrBnexKpYhxTm+WToVNSAstzTUnzHc/BL4oj
 gxIzQ1Aq0KeQuUJRK5K+9UjKO5w7L3jLObzOZH+ImQO6xzWxbyv8rwH540LthAr0mmKh
 gh1Mlva9nViyOFkd/fAtkvczV8EdP//pGU+j0Yur6DYAMRorOS4UMC9iwY2eZWJWskBo
 TenH5ywS9LPBJnVhyRuTgV55wX0c0O0Ivtn3OEhSvSE7QmCTFakToEEC64hgdEJAJy1K
 iQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cjCt8qCjpdQblfrUkBpxCM37Ep8gzlsd05xzWAHmKxw=;
 b=aTCTaX69nEUkUND1+KEDREr8ATHDZjAu00Cdc64L5DcRaQWs83LDNCTcif13dI3fJR
 1U9jixM4LH7XXEcO76frs0pha1tZlHJlvaqCAb20W2BHdkdUMd9hyYLOsjqvtRWdyP8P
 bbx1F5SH1MEBlBHcafQsHWfatCR5kwmiP6CQriUNU/KeP1lHC1QkpjkrkVl2I+X67nVB
 UqlDJs2V2DK6HIKv8/GFYxE8P8QJBXF5/g+n/AoR6j0FGJXfYvGOifqY1HIEUz34QGfy
 CDxlc0wCq9vOVsCkJ0fZNQJy9EReDzUnzmcqSrgEF7V6wu7LaESb1XUXrKxxa/Tog6k5
 3Xhw==
X-Gm-Message-State: ACrzQf24VRw/EuvV91/s3cI40ZwLF5CFCQzB8ESeCi00WV/EM6miceME
 tlHMfiEGO0+ne6tbQFo57/KDZw==
X-Google-Smtp-Source: AMsMyM7H9klknBppGxOMJrk9E/hzJjFsMq/INuuyodWjAZfzV+McaSS45HHO1yHJ+31BkLkjhyVmQw==
X-Received: by 2002:a05:620a:430b:b0:6d2:5b2:a70e with SMTP id
 u11-20020a05620a430b00b006d205b2a70emr2506182qko.26.1664585626765; 
 Fri, 30 Sep 2022 17:53:46 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a1:5a60:c6e3:4455:151b:7512?
 ([2605:ef80:80a1:5a60:c6e3:4455:151b:7512])
 by smtp.gmail.com with ESMTPSA id
 de20-20020a05620a371400b006bbb07ebd83sm4763711qkb.108.2022.09.30.17.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 17:53:46 -0700 (PDT)
Message-ID: <e35b8951-8ce1-13a2-a3b7-651ea6060af5@linaro.org>
Date: Fri, 30 Sep 2022 17:53:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 17/23] target/i386: Create gen_jmp_rel
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-18-richard.henderson@linaro.org>
 <CABgObfaZ648tE9VNZ6Lis-m_oXBHApfMUE=K=7VAvjYray52gg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfaZ648tE9VNZ6Lis-m_oXBHApfMUE=K=7VAvjYray52gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/21/22 06:06, Paolo Bonzini wrote:
> On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create a common helper for pc-relative branches.
>> The jmp jb insn was missing a mask for CODE32.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> (Oops, my remark the previous patch should still have pointed to gen_jmp_tb).
> 
> In gen_jz_ecx_string, in the translation for LOOPNZ/LOOPZ/LOOP/JECXZ
> and in i386_tr_tb_stop there is:
> 
>> -    gen_jmp_tb(s, s->pc - s->cs_base, 1);
>> +    gen_jmp_rel(s, MO_32, 0, 1);
> 
> What happens if the instruction's last byte is at 0xffff? Wraparound
> in the middle of an instruction is generally undefined, but I think it
> should work if the instruction does not cross the 64K/4G limit (and on
> real hardware, which obeys segment limits unlike TCG, said limit must
> be 64K/4G of course).
> 
> In other words, why MO_32 and not "CODE32(s) ? MO_32 : MO_16"?

I believe it really should be s->dflag, which makes all users of the function pass dflag 
(the manual consistently talks about "operand size").  At which point this parameter goes 
away and gen_jmp_rel grabs the operand size from DisasContext.

Also, pre-existing bug vs CODE64 here -- operand size is always 64-bits for near jumps.


r~

