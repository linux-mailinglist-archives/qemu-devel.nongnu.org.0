Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BF2CBAA4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:36:56 +0100 (CET)
Received: from localhost ([::1]:52044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPVH-0003QX-EQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkOSO-0002Ga-M2
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:29:52 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkOSN-0004YW-0A
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:29:52 -0500
Received: by mail-wr1-x441.google.com with SMTP id i2so2758459wrs.4
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1culVzoxRMB8/5+eCdUvPJzDnTJ5ksCiByUdhdtTBK8=;
 b=IXffyA8RAQ4bDf9ByKbq5nO9C/a+9wbI7PHj0+ahW14yiErbFSDAJP4XJRlbpXTgXI
 6U4ueJ3l+57OnBhmJVnUhkXMGxvn6wMjuv7GE+y+K7/PTpBlLhOFolsvRndZ340W2/Ff
 uYLXMktTikUmg2dhC+e+59IrF74SpIBWr4CjrkHjUspmouEzGqM9GKQ5kFvuuOOpSNvG
 IUDLB0J6JGL6Mlf0xg34Wp8NwfufHEVbzgHb0wcbuYIcYUtRIW5dmkS4bxuBGyCXXVSf
 vMxbvAljMsAc7OBRMdi7+IQJKe03WzatMzVDjlXOkje9C9sLv8tTdnFKZfIHTAJFk0xj
 iOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1culVzoxRMB8/5+eCdUvPJzDnTJ5ksCiByUdhdtTBK8=;
 b=VUXpspHG6LsTKI4qgz/ZRE4C5EavbbO8PCMfRzAovsQN3GSiA/Wqx2rnq2vrcaIL+f
 jSRF3WkDMgVW6yxdtOJKYd1U/uBthBvYZAc5JcBhFJV9NC69c1K8jmqDMewwKCC6E4cr
 VeCy6C3YdgPZTKeYqlGiZxExlZTyoyr+sY1iwJoBmuaSNtA+rdVScn5vYRnvhNU7Od9p
 qRZKnoAtEyuNabxjAIMos6UBbpvMR3FUfJEq5/JBwDLJEJSiQfF2cj0MTqgs1SJ+Dxzw
 ECCn8WAo40WeyPozj7WrCr0semEZ7lf9ZQytWRK2MVvJnjxsLilGtcwA6oBwjufrSuvx
 cJsw==
X-Gm-Message-State: AOAM532Rf8nKHRNYTdwJwp5xSP/+EGQGLen97SuZ/B6+q/XQESqtGmPp
 5HIaGVKalKaDP1gaCwcszhc=
X-Google-Smtp-Source: ABdhPJx2f2vYFEOHlDWJVirTuHf/NI7inrG1fFSJHXMve+UWAzpjjXzki4FAocl1OcjnfaeVfR/YMg==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr2346877wrw.200.1606901388244; 
 Wed, 02 Dec 2020 01:29:48 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id f4sm1196692wmb.47.2020.12.02.01.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:29:47 -0800 (PST)
Subject: Re: [PATCH v3 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
To: Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
References: <20201201192807.1094919-1-f4bug@amsat.org>
 <20201201192807.1094919-5-f4bug@amsat.org>
 <6d221a26-7d32-936d-3421-6848bd07e84c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb9a5c10-4b13-8d95-bb71-c33ec32552de@amsat.org>
Date: Wed, 2 Dec 2020 10:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6d221a26-7d32-936d-3421-6848bd07e84c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:15 AM, Richard Henderson wrote:
> On 12/1/20 1:28 PM, Philippe Mathieu-Daudé wrote:
>> ISA features are usually denoted in read-only bits from
>> CPU registers. Add the GET_FEATURE_REG_EQU() macro which
>> checks if a CPU register has bits set to a specific value.
>>
>> Use the macro to check the 'Architecture Revision' level
>> of the Config0 register, which is '2' when the Release 6
>> ISA is implemented.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/elfload.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index b7c6d30723a..9c475fa5f70 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -7,6 +7,7 @@
>>  
>>  #include "qemu.h"
>>  #include "disas/disas.h"
>> +#include "qemu/bitops.h"
>>  #include "qemu/path.h"
>>  #include "qemu/queue.h"
>>  #include "qemu/guest-random.h"
>> @@ -995,17 +996,25 @@ enum {
>>  #define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
>>      do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
>>  
>> +#define GET_FEATURE_REG_EQU(_reg, _start, _length, _val, _hwcap) \
>> +    do { \
>> +        if (extract32(cpu->env._reg, (_start), (_length)) == (_val)) { \
>> +            hwcaps |= _hwcap; \
>> +        } \
>> +    } while (0)
>> +
>>  static uint32_t get_elf_hwcap(void)
>>  {
>>      MIPSCPU *cpu = MIPS_CPU(thread_cpu);
>>      uint32_t hwcaps = 0;
>>  
>> -    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
>> +    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
> 
> You still get the magic 3.

TBH:

$ wc -l target/mips/cpu.h
1323 target/mips/cpu.h
$ egrep _MASK target/mips/cpu.h | wc -l
19

And mask definitions are not useful to use with extract/deposit:

$ egrep _MASK target/mips/cpu.h
#define MSACSR_FS_MASK  (1 << MSACSR_FS)
#define MSACSR_NX_MASK  (1 << MSACSR_NX)
#define MSACSR_CEF_MASK (0xffff << MSACSR_CEF)
#define MSACSR_RM_MASK  (0x3 << MSACSR_RM)
#define CP0PM_MASK 13
#define CP0SC_PA_MASK   (0x7FULL << CP0SC_PA)
#define CP0SC_AM_MASK   (0x7ULL << CP0SC_AM)
#define CP0SC_EU_MASK   (1ULL << CP0SC_EU)
#define CP0SC_C_MASK    (0x7ULL << CP0SC_C)
...

If you rather I can amend this snippet:

-- >8 --
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 23f8c6f96cd..2639b0ea06c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -844,6 +844,7 @@ struct CPUMIPSState {
 #define CP0C0_MT   7     /*  9..7  */
 #define CP0C0_VI   3
 #define CP0C0_K0   0     /*  2..0  */
+#define CP0C0_AR_LENGTH 3
     int32_t CP0_Config1;
 #define CP0C1_M    31
 #define CP0C1_MMU  25    /* 30..25 */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5a39a7dc021..a64050713f2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1021,7 +1021,8 @@ static uint32_t get_elf_hwcap(void)
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;

-    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
+    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
+                        2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
     GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
     GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
---

> This is where hw/registerfields.h would come in handy.  But that is certainly a
> large change to mips' cpu.h.  So I guess this is good enough for now.

Yes, that is my preference too, and I plan to get there eventually
(this is on my TODO list). But from here to there is a long way...

First I'd get rid of the cpu->env.insn_flags duplications.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Phil.

