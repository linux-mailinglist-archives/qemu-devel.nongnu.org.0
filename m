Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5319E6EBE53
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:47:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWI8-00059n-Lk; Sun, 23 Apr 2023 05:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqWI6-00059L-1v
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:45:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqWI4-0006Jp-2Q
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682243150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qcfkR4a4JTt5UbGC0vQyZTmNaIGKPH+qMBba0OiuQ4Q=;
 b=fUAwoY4wdupJfg/Y3puQj1DXwMiNwFqmlkVzzrM1h6Xl4ZtUjvAkR7JUgQx/p1Lhm7BHtM
 1YYbtgqLTb7ioiAGGbNPKcL92vD4QBAKVz1JD3WhC9T/aYy+XsO3nXHjDAggAdaVaorGyO
 oc+2SNQdfzaItHDEitKIhYPBgGcxJW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-EtA_4lXhMpGTIJffKSU4Tw-1; Sun, 23 Apr 2023 05:45:48 -0400
X-MC-Unique: EtA_4lXhMpGTIJffKSU4Tw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f168827701so12050425e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682243147; x=1684835147;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcfkR4a4JTt5UbGC0vQyZTmNaIGKPH+qMBba0OiuQ4Q=;
 b=JnLi1zaXxbP94ZP3uAE12UlbCCOHMh3k3urBWf5y0oBRABC4DdAFlgcNb4nKXn8A74
 0oMZl0QJPcZi2sSwq3kq/bKVmc0X+cY6HHWO1lru1JKQapZFL/B0NlaAEyvHhEEkz429
 EogqWDOIUD7T6RS5OUflR8xg/RlCdgGn04ZgeXKeSKc2yTiPtfMx511vmSfHm4I3ENTJ
 JNBZ7Yy5KZhje8sq9wjerfdBbbfuHT6//QsXrt4hQEzzGwIeselrmK9gjWuIf6Z6XqOc
 nH8LuqnQIC6b1VrZqdGCMC647XNcR4rMS9VJQMthB7DnOg0qV1LTvMKXci5PhchBCJ4U
 Izgw==
X-Gm-Message-State: AAQBX9cQkWZg0Q3ln3LKIAMt8tJwLuI+qsmN/GeDIl1WMfsXx/kaipZU
 uxwAonwNlEzjyywoBCwWDVvfyCTeHDjs3bw6oB2KXqLUJpUidNvm+gPmRVUJOlqzO5yq6qW0yOF
 srpue6bkYwY3VaXs=
X-Received: by 2002:adf:f849:0:b0:2f4:b0d:c524 with SMTP id
 d9-20020adff849000000b002f40b0dc524mr7207473wrq.69.1682243147444; 
 Sun, 23 Apr 2023 02:45:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZfDoXce6FzQf17HHlYW81MhzHvYaaFyno1ZvLlV0T2/5NoIac0+8ar4XX3em9sDpgEPBRVGQ==
X-Received: by 2002:adf:f849:0:b0:2f4:b0d:c524 with SMTP id
 d9-20020adff849000000b002f40b0dc524mr7207464wrq.69.1682243147047; 
 Sun, 23 Apr 2023 02:45:47 -0700 (PDT)
Received: from redhat.com ([31.4.242.165]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4cc7000000b002fa5a73bf9bsm8265387wrt.89.2023.04.23.02.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 02:45:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 00/20] Migration 20230420 patches
In-Reply-To: <cf72042a-ecb2-bdb6-d4a4-3b45ab9b3cd8@linaro.org> (Richard
 Henderson's message of "Sat, 22 Apr 2023 10:57:47 +0100")
References: <20230420131751.28534-1-quintela@redhat.com>
 <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org>
 <87y1mke0hb.fsf@secure.mitica>
 <cf72042a-ecb2-bdb6-d4a4-3b45ab9b3cd8@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sun, 23 Apr 2023 11:45:44 +0200
Message-ID: <87pm7vdj93.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 4/22/23 10:21, Juan Quintela wrote:
>> Richard Henderson <richard.henderson@linaro.org> wrote:
>>> On 4/20/23 14:17, Juan Quintela wrote:

>> Hi Richard
>> First of all, I have no doubt that you know better that me in this
>> regard (*).
>> Once told that, it looks like one case of "my toolchain is better
>> than
>> yours":

Quotes were here for a reason O:-)

>> $ ls qemu-system-mips
>> qemu-system-mips        qemu-system-mips64el.p/ qemu-system-mipsel.p/
>> qemu-system-mips64      qemu-system-mips64.p/   qemu-system-mips.p/
>> qemu-system-mips64el    qemu-system-mipsel
>> This is Fedora37 with updates.
>
> I'm sure it's not true that "my toolchain is better", because mips32
> simply does not have the ability.  (And of course mips64 does, but
> that's a different test.)

It was a kind of apology to say that I had really compiled mipsel.  I
compile everything that has a crosscompiler in fedora:

TARGET_DIRS=aarch64-softmmu alpha-softmmu arm-softmmu avr-softmmu
cris-softmmu hppa-softmmu i386-softmmu loongarch64-softmmu m68k-softmmu
microblazeel-softmmu microblaze-softmmu mips64el-softmmu mips64-softmmu
mipsel-softmmu mips-softmmu nios2-softmmu or1k-softmmu ppc64-softmmu
ppc-softmmu riscv32-softmmu riscv64-softmmu rx-softmmu s390x-softmmu
sh4eb-softmmu sh4-softmmu sparc64-softmmu sparc-softmmu tricore-softmmu
x86_64-softmmu xtensaeb-softmmu xtensa-softmmu aarch64_be-linux-user
aarch64-linux-user alpha-linux-user armeb-linux-user arm-linux-user
cris-linux-user hexagon-linux-user hppa-linux-user i386-linux-user
loongarch64-linux-user m68k-linux-user microblazeel-linux-user
microblaze-linux-user mips64el-linux-user mips64-linux-user
mipsel-linux-user mips-linux-user mipsn32el-linux-user
mipsn32-linux-user nios2-linux-user or1k-linux-user ppc64le-linux-user
ppc64-linux-user ppc-linux-user riscv32-linux-user riscv64-linux-user
s390x-linux-user sh4eb-linux-user sh4-linux-user sparc32plus-linux-user
sparc64-linux-user sparc-linux-user x86_64-linux-user
xtensaeb-linux-user xtensa-linux-user

And I still get this "build" failures.

> I'll note that mips32 and armv6 (that is, *not* debian's armv7 based
> armhf distro) are the only hosts we have that don't have an atomic
> 8-byte operation.

This is the kind of trouble that I don'k now what to do.  I am pretty
sure that nobody is goigng to migrate a host that has so much RAM than
needs a 64bit counter in that two architectures (or any 32 architectures
for what is worth).

A couple of minutes after sending the 1st email, I considederd sending
another one saying "my toolchain lies better than yours".

I moved the atomic operations that do the buildcheck and run make again:

$ rm -f qemu-system-mips*
$ time make

[....]

[2/5] Linking target qemu-system-mipsel
[3/5] Linking target qemu-system-mips
[4/5] Linking target qemu-system-mips64el
[5/5] Linking target qemu-system-mips64

So clearly my toolchain is lying O:-)

>> There are two posibilities here that came to mind, in order of
>> probability;
>> - myself with:
>> -    if (ram_counters.dirty_pages_rate && transferred > 10000) {
>> +    if (qatomic_read__nocheck(&ram_counters.dirty_pages_rate) &&
>> +        transferred > 10000) {
>
> I think it's this one...

O:-)

>> and why I used qatomic_*__nocheck() instead of the proper operations?
>> Because reading this:
>> #define qatomic_read__nocheck(ptr) \
>>      __atomic_load_n(ptr, __ATOMIC_RELAXED)
>> #define qatomic_read(ptr)                              \
>>      ({                                                 \
>>      qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
>>      qatomic_read__nocheck(ptr);                        \
>>      })
>> #define qatomic_set__nocheck(ptr, i) \
>>      __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
>> #define qatomic_set(ptr, i)  do {                      \
>>      qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
>>      qatomic_set__nocheck(ptr, i);                      \
>> } while(0)
>> I was complely sure that we will never get the qemu_build_assert().
>> I know, I know.
>
> :-)
>
>> And now that I have explained myself, what is the correct way of doing
>> this?
>> I declared the value as:
>> +    aligned_uint64_t dirty_bytes_last_sync;
>> -    int64_t remaining;
>> I just want to make sure that *all* ram_counters are atomic and then
>> I
>> can use them from any thread.  All the counters that use stat64 already
>> are.  But for this two to work, I would need to have a way to set and
>> old value.
>> And once that we are here, I would like ta have:
>> stat64_inc(): just add 1, I know, I can create a macro.
>> and
>> stat64_reset(): as its name says, it returns the value to zero.
>> I still miss a couple of stats in migration, where I need to reset
>> them
>> to zero from time to time:
>
> How critical are the statistics?  Are they integral to the algorithm
> or are they merely for diagnostics and user display?  What happens
> they're not atomic and we do race?
>
> If we really need atomicity, then the only answer is a mutex or spinlock.

I think we can extend Stat64 operations with at least stat64_reset()
operations.  What I don't want is that half of the counters need to be
updated with one spinlock and the other half with atomic operations, it
makes difficult to explain.

If I have the stat64_reset() operation, then stat64_set() becomes
stat64_reset() + stat64_add().  I put a wrapper and call it a day.  As
said, this one is not so speed critical.

Yes, other counters are speed critical, updated once for each transmited
page.  But others are only updated every time that we try to finish
migration or each iteration.  The two ones given trouble are in the last
kind.

>> ./ram.c:380:    uint64_t bytes_xfer_prev;
>> ./ram.c:747:    rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
>> ./ram.c:1183:        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
>> ./ram.c:1247:        rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
>> You can clame that this operation happens always on the migration
>> thread, but I have found that it is more difficult to document which
>> ones are atomic and which not, that make all of them atomic.  This
>> variable are get/set once a second, so performance is not one of the
>> issues.
>
> For access once per second, it sounds like a spinlock would be fine.

Ortogonality is more important to me that speed here.  I mill wait if
someone (hint, hint) cames with an implementaton of stat64_clear() that
also works for non ATOMIC64 machines O:-)

Later, Juan.


