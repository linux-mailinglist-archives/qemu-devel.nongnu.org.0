Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B26F4793
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:48:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsEP-0001lt-W4; Tue, 02 May 2023 11:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1ptsEN-0001lW-Vo
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:47:56 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1ptsEM-0001R6-Dk
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:47:55 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9CD1A21B67;
 Tue,  2 May 2023 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683042472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZddKKL1cGzpYWAeV/XO/1/Xtu87DJ4PStod2oClsBk0=;
 b=pN51aygyoYfx5By823FVruUFrr5+nR0ZETZ+5ESHxNveex6lWDedcX7+NVl7kk5rYOCUVg
 R/1kuCAlqZZkIihdP+hl8feqXZlQUs6dKH51evqCyRgQrsGxgyNeCDwVBPqJHu18ERLVmM
 qnV7gaZBfUri7ZkioNJcLOt4dyKlERI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683042472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZddKKL1cGzpYWAeV/XO/1/Xtu87DJ4PStod2oClsBk0=;
 b=MzkJtRQxSNrWeONbeAxwvZN5Ol5NvYVjad30HWAlDm7qtMGxvoD3vEMCpy4iZxTlXBVYSx
 8NUkV7BR3+N/FRDA==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 8AACB2C141;
 Tue,  2 May 2023 15:47:52 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 7A9724A0372; Tue,  2 May 2023 17:47:52 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: laurent@vivier.eu,  qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: Add /proc/cpuinfo handler for RISC-V
In-Reply-To: <mhng-387c6a65-31c0-4fcd-bf29-bd798c2a47f6@palmer-ri-x1c9>
 (Palmer Dabbelt's message of "Tue, 02 May 2023 07:58:03 -0700 (PDT)")
References: <mhng-387c6a65-31c0-4fcd-bf29-bd798c2a47f6@palmer-ri-x1c9>
X-Yow: I predict that by 1993 everyone will live in and around LAS VEGAS and
 wear BEATLE HAIRCUTS!
Date: Tue, 02 May 2023 17:47:52 +0200
Message-ID: <mvmttwu4tw7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=schwab@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mai 02 2023, Palmer Dabbelt wrote:

> On Tue, 02 May 2023 06:44:00 PDT (-0700), schwab@suse.de wrote:
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>>  linux-user/syscall.c | 30 ++++++++++++++++++++++++++++--
>>  1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 69f740ff98..c72456a34b 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8231,7 +8231,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>>  }
>>
>>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
>> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
>> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
>> +    defined(TARGET_RISCV)
>>  static int is_proc(const char *filename, const char *entry)
>>  {
>>      return strcmp(filename, entry) == 0;
>> @@ -8309,6 +8310,31 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>>  }
>>  #endif
>>
>> +#if defined(TARGET_RISCV)
>> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>> +{
>> +    int i, num_cpus;
>> +
>> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
>> +    for (i = 0; i < num_cpus; i++) {
>> +        dprintf(fd, "processor\t: %d\n", i);
>> +        dprintf(fd, "hart\t\t: %d\n", i);
>> +#if defined(TARGET_RISCV32)
>> +        dprintf(fd, "isa\t\t: rv32imafdc\n");
>> +        dprintf(fd, "mmu\t\t: sv32\n");
>> +#endif
>> +#if defined(TARGET_RISCV64)
>> +        dprintf(fd, "isa\t\t: rv64imafdc\n");
>> +        dprintf(fd, "mmu\t\t: sv57\n");
>
> Unless I'm misunderstanding something, we've got support for both non-sv57
> system (via sv* CPU properties)

The mmu type is not available in linux-user emulation.  This just
matches the default the system emulation would use.

> and non-GC systems (also via CPU properties).

None of the currently defined cpus are non-GC cpus (except sifive_e, but
that is not suitable for user-space anyway), and there doesn't appear to
be any properties defined for changing the supported extensions.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

