Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3942C6F7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:56:51 +0200 (CEST)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahYg-0006bD-8t
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahWH-0005XY-CJ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:54:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahWF-0003Ai-Ki
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:54:21 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y1so2243618plk.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MTwihn6VdL+ozLUxPgBlDNm0y1Kepq+JRx01DAi7ghY=;
 b=bjHFEEdsO6nW6YCKed33GfcAt4VhJoofAJIyMD7mnCJy9JhmPyT5iZkc6RJoTCraea
 4mNoKlt/tglz/S8NA173jbfxRSwmEDlJMtTgrmfgxJ/CJKnND8SlsKSGgIl/cJQgGKZD
 ivLiNtDBVmA4KERjTl4VSodSGDvIBqUiZNlFgTwI2bq67EvYAF14ztLkNEcTOntRLyKP
 qMoknJSLUGdZoyrCB7LwFrk/hFmJc/KSWh4eMmTHlUsSX2EOAjabUImyUYShuU5Zs4YU
 2nLyoNWkvoS+deUY3YctUrSICxRyL4CcrD/ExjMvdLikIHSnCN/9E5R5beRB6/kgrln/
 bSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MTwihn6VdL+ozLUxPgBlDNm0y1Kepq+JRx01DAi7ghY=;
 b=pnheuWp1QVsNZLV3MKGD/SrDClrpiBjWanYr3qw3XXLPbHKyhCnqTZoWoTiDCxDxrJ
 UPW6IAcYxzoK6gOiynCRQim49D17FJf+7BEPbsdLRlguFSP9fm07w0HxolbFN7Y4bDbS
 abH6mS5m2hpPdhGZLoEAaY8gjNCvmo1zCKbSfEAxaenvbLoKApisk1vIZd8BuYjONW9p
 Aa9VtU8D4hiPa99/z3TgRX4pSfealWx3J6Kl0sMZ5T1LfVptLa0EsH5Jjg3I4g+ZR03H
 KXt856ckqWH1pZ5rVRUPAVCLQorbp1FOIEHicMH0PYEWDgI24abSNZvfBvUSRtuvoYP3
 JYOA==
X-Gm-Message-State: AOAM53068wfm6xBO3e4WoZaR1hcsD6SAs6xpAZ/ndWvDKnBM4WRBo/zx
 rV8cbp9tJJiVusBcqE3mR34WHg==
X-Google-Smtp-Source: ABdhPJyVHJgfmdQrRqdCzV6NCQ0YmDkP/YDS8B+ouD14kyGmsHIHvbpjRjjeBWGjWk6mQLd7cEXGTg==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr201873plr.69.1634144058129; 
 Wed, 13 Oct 2021 09:54:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o189sm61847pfd.203.2021.10.13.09.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:54:17 -0700 (PDT)
Subject: Re: [PATCH 04/13] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-5-richard.henderson@linaro.org>
 <7faa13cd-c0ed-e34e-a77a-6fedd6d01ac9@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc1e2ce3-683a-7377-dd98-366d269ffdf2@linaro.org>
Date: Wed, 13 Oct 2021 09:54:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7faa13cd-c0ed-e34e-a77a-6fedd6d01ac9@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org,
 fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 9:46 AM, Frédéric Pétrot wrote:
> Hello,
> 
> Le 07/10/2021 à 19:47, Richard Henderson a écrit :
>> Shortly, the set of supported XL will not be just 32 and 64,
>> and representing that properly using the enumeration will be
>> imperative.
>>
>> Two places, booting and gdb, intentionally use misa_mxl_max
>> to emphasize the use of the reset value of misa.mxl, and not
>> the current cpu state.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/cpu.h            |  9 ++++++++-
>>   hw/riscv/boot.c               |  2 +-
>>   semihosting/arm-compat-semi.c |  2 +-
>>   target/riscv/cpu.c            | 24 ++++++++++++++----------
>>   target/riscv/cpu_helper.c     | 12 ++++++------
>>   target/riscv/csr.c            | 24 ++++++++++++------------
>>   target/riscv/gdbstub.c        |  2 +-
>>   target/riscv/monitor.c        |  4 ++--
>>   8 files changed, 45 insertions(+), 34 deletions(-)
> 
> 
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> @@ -522,7 +522,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>   
>>       dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
>>               ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>> -    if (riscv_cpu_is_32bit(env)) {
>> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
>>           mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>>       } else {
>>           mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> 
> I believe we miss the settings of the SXL and UXL fields that are needed
> by cpu_get_xl
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9c0753bc8b..c4a479ddd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int
> csrno,
>           mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>       } else {
>           mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> +        /* SXL and UXL fields are for now read only */
> +        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> +        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>       }
>       env->mstatus = mstatus;

Yes, I missed that.  I was relying too much on the UXL patch set which I did not 
incorporate here.  This is a good minimal addition to keep things bisectable.


r~

