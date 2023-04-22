Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397846EB857
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 11:59:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqA0I-0001Q5-Ge; Sat, 22 Apr 2023 05:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqA0E-0001Pp-Ou
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 05:57:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqA0B-0007k5-Aq
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 05:57:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so17410355e9.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682157470; x=1684749470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wNZCiEACP4t1S/5zDnjT1Edz8N5HAJZ8c+QgI96O88c=;
 b=hw6EllVIi3/lSr57LbjMzHral/VkukvEJkWsop5taKjOltDt9iMlAuJLHRxh2RhqB0
 stO9AaMQzGxeX4C2YDSTl+X7RU4Uyfz0UfU0HxeP8CSuCoZZhTNOznagwqdEGp08sdxk
 I5BfWmQU/X9p5XYh89xSsDJvY/4IFmNKkB3ViId+XlhSpyVl//z9wyxS86PRIT5f7U72
 LfwSo5/yYnezZESyiXV4GbqtddQwNEbuXX7yLp4UIC2hwT5PbNT317BpK43d1Yylrdng
 NLQ2XJhw0+/1XaVtipr2QTdKAP8xW2/MHyIIMWpvdUYhk+Vd7b5ZY3n64JQZKklhPCdI
 KNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682157470; x=1684749470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wNZCiEACP4t1S/5zDnjT1Edz8N5HAJZ8c+QgI96O88c=;
 b=LVXX4n+AO/oe8r+BuU3G/6K4nUkme7+wq4DxcO8U8yWXAhQNb9mCVERn2X2rB2/Rta
 lWPwJwo+80JcC2F9hGIIHIXnLNYVdkGOGwnBgkyz95w/8Hd/IjtU2RJQPOAcEtTAQPBD
 uzuXf3PA+y0x8YHdft8/WFROMcWvDgktIQgBMcG+TMDI2CxXE5XH6omso3PF3BZXBcni
 +0UK5m7s0gXLrEyRaevqbb+fPVCHG8JKSIVH0TqakyIQk++9poEwe+YDvbbrp4Ppn+Sg
 fat8yBxN8lUHuFgOKoKE9BRo+s7cRjNmLVtjdoh4u9SaY6WazrX6Sys1iM6A8iKHtS9H
 NbAA==
X-Gm-Message-State: AAQBX9f1/fkFD29ZXi8V/K7tFT8m9ghXb2Y8xm9TgGEsSyW+wccCzpfX
 1k9dR+BDkb/cCpQL7G4PI1R12w==
X-Google-Smtp-Source: AKy350Z8mHb392PKCSLz74cXoLjEr0GT86B6mH2hYghaGwCUEi142tD0EtDmx4dqP6kCPwIwHfuYpQ==
X-Received: by 2002:a1c:7c18:0:b0:3f1:6f53:7207 with SMTP id
 x24-20020a1c7c18000000b003f16f537207mr3513274wmc.17.1682157470545; 
 Sat, 22 Apr 2023 02:57:50 -0700 (PDT)
Received: from [10.43.15.135] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b003ee9c8cc631sm10391258wms.23.2023.04.22.02.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 02:57:50 -0700 (PDT)
Message-ID: <cf72042a-ecb2-bdb6-d4a4-3b45ab9b3cd8@linaro.org>
Date: Sat, 22 Apr 2023 10:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/20] Migration 20230420 patches
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
 <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org>
 <87y1mke0hb.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1mke0hb.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/22/23 10:21, Juan Quintela wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
>> On 4/20/23 14:17, Juan Quintela wrote:
>>> The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:
>>>     Open 8.1 development tree (2023-04-20 10:05:25 +0100)
>>> are available in the Git repository at:
>>>     https://gitlab.com/juan.quintela/qemu.git
>>> tags/migration-20230420-pull-request
>>> for you to fetch changes up to
>>> cdf07846e6fe07a2e20c93eed5902114dc1d3dcf:
>>>     migration: Pass migrate_caps_check() the old and new caps
>>> (2023-04-20 15:10:58 +0200)
>>> ----------------------------------------------------------------
>>> Migration Pull request
>>> This series include everything reviewed for migration:
>>> - fix for disk stop/start (eric)
>>> - detect filesystem of hostmem (peter)
>>> - rename qatomic_mb_read (paolo)
>>> - whitespace cleanup (李皆俊)
>>>     I hope copy and paste work for the name O:-)
>>> - atomic_counters series (juan)
>>> - two first patches of capabilities (juan)
>>> Please apply,
>>
>> Fails CI:
>> https://gitlab.com/qemu-project/qemu/-/jobs/4159279870#L2896
>>
>> /usr/lib/gcc-cross/mipsel-linux-gnu/10/../../../../mipsel-linux-gnu/bin/ld:
>> libcommon.fa.p/migration_migration.c.o: undefined reference to symbol
>> '__atomic_load_8@@LIBATOMIC_1.0'
> 
> Hi Richard
> 
> First of all, I have no doubt that you know better that me in this
> regard (*).
> 
> Once told that, it looks like one case of "my toolchain is better than
> yours":
> 
> $ ls qemu-system-mips
> qemu-system-mips        qemu-system-mips64el.p/ qemu-system-mipsel.p/
> qemu-system-mips64      qemu-system-mips64.p/   qemu-system-mips.p/
> qemu-system-mips64el    qemu-system-mipsel
> 
> This is Fedora37 with updates.

I'm sure it's not true that "my toolchain is better", because mips32 simply does not have 
the ability.  (And of course mips64 does, but that's a different test.)

I'll note that mips32 and armv6 (that is, *not* debian's armv7 based armhf distro) are the 
only hosts we have that don't have an atomic 8-byte operation.


> There are two posibilities here that came to mind, in order of
> probability;
> - myself with:
> 
> -    if (ram_counters.dirty_pages_rate && transferred > 10000) {
> +    if (qatomic_read__nocheck(&ram_counters.dirty_pages_rate) &&
> +        transferred > 10000) {

I think it's this one...

> - paolo:
> 
>   PostcopyState  postcopy_state_get(void)
>   {
> -    return qatomic_mb_read(&incoming_postcopy_state);
> +    return qatomic_load_acquire(&incoming_postcopy_state);

... because this one was already atomic, with different barriers.

> and why I used qatomic_*__nocheck() instead of the proper operations?
> Because reading this:
> 
> #define qatomic_read__nocheck(ptr) \
>      __atomic_load_n(ptr, __ATOMIC_RELAXED)
> 
> #define qatomic_read(ptr)                              \
>      ({                                                 \
>      qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
>      qatomic_read__nocheck(ptr);                        \
>      })
> 
> #define qatomic_set__nocheck(ptr, i) \
>      __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
> 
> #define qatomic_set(ptr, i)  do {                      \
>      qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
>      qatomic_set__nocheck(ptr, i);                      \
> } while(0)
> 
> I was complely sure that we will never get the qemu_build_assert().
> 
> I know, I know.

:-)

> And now that I have explained myself, what is the correct way of doing
> this?
> 
> I declared the value as:
> 
> +    aligned_uint64_t dirty_bytes_last_sync;
> -    int64_t remaining;
> 
> I just want to make sure that *all* ram_counters are atomic and then I
> can use them from any thread.  All the counters that use stat64 already
> are.  But for this two to work, I would need to have a way to set and
> old value.
> 
> And once that we are here, I would like ta have:
> 
> stat64_inc(): just add 1, I know, I can create a macro.
> 
> and
> 
> stat64_reset(): as its name says, it returns the value to zero.
> 
> I still miss a couple of stats in migration, where I need to reset them
> to zero from time to time:

How critical are the statistics?  Are they integral to the algorithm or are they merely 
for diagnostics and user display?  What happens they're not atomic and we do race?

If we really need atomicity, then the only answer is a mutex or spinlock.

> ./ram.c:380:    uint64_t bytes_xfer_prev;
> ./ram.c:747:    rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
> ./ram.c:1183:        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
> ./ram.c:1247:        rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
> 
> You can clame that this operation happens always on the migration
> thread, but I have found that it is more difficult to document which
> ones are atomic and which not, that make all of them atomic.  This
> variable are get/set once a second, so performance is not one of the
> issues.

For access once per second, it sounds like a spinlock would be fine.


r~

