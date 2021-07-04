Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1633BAE64
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:46:52 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m078l-00015d-Bh
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m076o-00082B-QM
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:44:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m076n-0001vN-As
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:44:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id w13so9889095wmc.3
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H3hTUy9Mmk47MIUoSh2T37smtPYRdLPhPuuRyUR3QMU=;
 b=qR8lEOJFw7Rw9TzTfeY8ln0qwXVfFgFOzSGx8/ld8BMmF7lf+tA+ngNQl0azlkA+a6
 owOe7/2Qhfji8MDRXo6ja9NmlGWgvOoWq+hV61UOGXdZd1zB2wQJgxTWJV/9Suv3M0z4
 xWDM1ajSF1IKaCP3Yye9bIovD+Kzrd988KWJcYgqskkzsbuq7+HwyC7vMPrIw8tStt9m
 gFfNJh0XSh+GwqD+PjeHMaTVsj8sKb5jdrtKMXUrSRNCCGaTdKpRO5l7OTgCASlAQJIB
 dBQLrNXW8ROUIjwnqfYxr9YrAGlXrieCzgNV9cuEwQLuF2vAEp4eeDqRCPjU6mtMng/y
 9ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3hTUy9Mmk47MIUoSh2T37smtPYRdLPhPuuRyUR3QMU=;
 b=fBuXM4LqG2KgoREcaEtYMkaCiegJSTQqwp0CviQjop2mBZsS37p1FNTfVpSGjZzPf9
 QVNfGQ6+59jtTdrGIH7nsuM48YuHU+LToeUk0L4RdWDBHdJae1OUIZ0UUIoUg+fr/f9f
 //5SjBTxwp4Bpk81ljrcBbr7kUtMqK/k6L0V4jwlxasfT5ZvRoEF0iUHJ4QbxGWqJ1wm
 hDHAWZOIFZqv1dwwGft6B65pPWpbwYRdSJo6aXmJYKvOdUqOBv7SDhQENf6FmajxuQmZ
 SeKIpUohQ5V0Ro2KlJMFXVNNsMx7Ok3CP2gmgg1cEMKH4ESGluGYY38UncVQ/72MAVhu
 MwPA==
X-Gm-Message-State: AOAM531ov88rkvZm8i64kTdMfCXs3gQaIZhkpG6eqPX68efdZezQvwly
 Drs1l//9WivQ7s265IULYlA=
X-Google-Smtp-Source: ABdhPJzjxYkw1NtR2OmP+mf0yrQjH/S6+oOGlHIwYnW+9tK0Kp/1nUlTi52yJGE/QQ/75vR21m1E9g==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr11290233wms.166.1625424287129; 
 Sun, 04 Jul 2021 11:44:47 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s5sm19479370wmh.46.2021.07.04.11.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 11:44:46 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/mips: Rewrite UHI errno_mips() using GHashTable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210704170736.617895-1-f4bug@amsat.org>
 <20210704170736.617895-4-f4bug@amsat.org>
 <1c9979ed-35f0-54bf-071e-9141ae708144@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4ed986fa-f8b7-cd1a-31e2-e3bb3c5b3497@amsat.org>
Date: Sun, 4 Jul 2021 20:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1c9979ed-35f0-54bf-071e-9141ae708144@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Leon Alrae <leon.alrae@imgtec.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 8:38 PM, Thomas Huth wrote:
> On 04/07/2021 19.07, Philippe Mathieu-Daudé wrote:
>> Linking on Haiku OS fails:
>>
>>   
>> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>
>>    error:
>> libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is
>> too large (0xffff405a bytes)
>>   
>> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>
>>    final link failed: memory exhausted
>>    collect2: error: ld returned 1 exit status
>>
>> This is because the host_to_mips_errno[] uses errno as index,
>> for example:
>>
>>    static const uint16_t host_to_mips_errno[] = {
>>        [ENAMETOOLONG] = 91,
>>        ...
>>
>> and Haiku defines [*] ENAMETOOLONG as:
>>
>>     12 /* Error baselines */
>>     13 #define B_GENERAL_ERROR_BASE              INT_MIN
>>     ..
>>     22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE
>> + 0x6000)
>>    ...
>>    106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE
>> + 4)
>>    ...
>>    211 #define ENAMETOOLONG                     
>> B_TO_POSIX_ERROR(B_NAME_TOO_LONG)
>>
>> so the array ends up beeing indeed too big.
>>
>> Since POSIX errno can't be use as indexes on Haiku,
>> rewrite errno_mips() using a GHashTable.
>>
>> [*]
>> https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130
>>
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/tcg/sysemu/mips-semi.c | 62 ++++++++++++++++++++++--------
>>   1 file changed, 45 insertions(+), 17 deletions(-)

>> +static void uhi_errno_init(void)
>> +{
>> +    gboolean ret = TRUE;
>> +
>> +    uhi_errno_hash_table = g_hash_table_new(NULL, NULL);
>> +
>> +    /*
>> +     * Unified Hosting Interface (rev 1.1.6)
>> +     * Appendix A. "Error values"
>> +     */
>> +    uhi_errno_insert(ENAMETOOLONG,  91);
>>   #ifdef ELOOP
>> -    [ELOOP]        = 92,
>> +    uhi_errno_insert(ELOOP,         92);
>>   #endif
>> -};
>> +#ifdef EOVERFLOW
>> +    uhi_errno_insert(EOVERFLOW,     139);
>> +#endif
>> +    assert(ret == TRUE);
>> +}
>>     static int errno_mips(int host_errno)
>>   {
>> -    if (host_errno < 0 || host_errno >=
>> ARRAY_SIZE(host_to_mips_errno)) {
>> -        return EINVAL;
>> -    } else if (host_to_mips_errno[host_errno]) {
>> -        return host_to_mips_errno[host_errno];
>> -    } else {
>> -        return host_errno;
>> +    gpointer uhi_errno;
>> +
>> +    if (uhi_errno_hash_table == NULL) {
>> +        uhi_errno_init();
>>       }
>> +
>> +    if (host_errno == 0) {
>> +        return 0;
>> +    }
>> +    if (g_hash_table_lookup_extended(uhi_errno_hash_table,
>> +                                     GINT_TO_POINTER(host_errno),
>> +                                     NULL, &uhi_errno)) {
>> +        return GPOINTER_TO_INT(uhi_errno);
>> +    }
>> +    return EINVAL; /* Not reachable per the specification */
>>   }
> 
> Why not simply use a switch-case statement instead? ... that's simpler
> and still allows to compiler to optimize if the errno values are in a
> compact range.

I was expecting the #ifdef'ry to be ugly, but there isn't that many
actually. Sigh :(

