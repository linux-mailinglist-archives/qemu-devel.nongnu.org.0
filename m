Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBC3BAE4B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:27:31 +0200 (CEST)
Received: from localhost ([::1]:48314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m06q3-0005Tj-1i
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m06oP-0003rN-Se
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:25:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m06oO-0006tU-6a
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:25:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id p8so19243262wrr.1
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x6SnwcvRt72H9mLpMFCfi9upErvkS58Rckvfzg1TPZA=;
 b=l7adcBhLCK6R9sg0yUaVbPzHY3DqZ/W+Kup/jhtS6Rk9mgySA5EYl80ci1hLxj3Wq5
 TqtFoLJ7k5dhSFpTCZ4ZuseaXNOAfcnnHQSXLJFGLtEjn/iJg3rRshldgJqkjAVziqqq
 Ue50YMEXv5izHkUU/4rnZdVuTX3oUC7TERvkbTFNQuvAyWjkRbTPV64EemgI68ADa/jx
 qXoTEMoXgeZvggSYzGOkweapH7DKhqLIjWVEicHK9vkpH5qXtHAztVM4uBygrH8YZsLs
 LWxU9HyH263q16hcyTeqbuoTZk6mC5CSWmZoeICfBK73PhxPs7bhQQBy+vpGE/lfe7WN
 dDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x6SnwcvRt72H9mLpMFCfi9upErvkS58Rckvfzg1TPZA=;
 b=VYau3iV5fXuDYPEyEXCEYHU0DVAWOH3D1Jcgvk+/w/LaBentgXE0bnGSvc9KYVwDOW
 eQSeZAxbtQL2c/bA9hS22wny9zKm9qPEyUT9hI0MhozrNOMxXsWq6Pzu152gGsBUJnhQ
 fBrzhM0IqAak2a4Dp+npDA2D+z9BKI74SsoH4cBWKkYJFIl+0z1RtJPACGHChqr7aVFZ
 6iFqTcH7wYTfKc/lZtC91YRFepR/RY3K9q/GkOa8/W0MD8kASdZVXKcrau8MYRKnIOHL
 QXSYJyQBOpbLeknONjXxH2YkRxzLcMYhcNX+0/p5Fn0u31/5WxMi2DpX3vs1YkzhhkzL
 iHEA==
X-Gm-Message-State: AOAM532jvUjJzvoqiX9SgBy9OL5h9+cU29f+uAbNWjPqO/2S2+RyZZKs
 bpcQv5nyrkoUh/5sKnmUkdM=
X-Google-Smtp-Source: ABdhPJxZx2Y7hGO/F+oI8yRUArncfroNyjOIEgn69TChR0UZ20os6RH96WK9N7Fkw4+fawcR80UBWA==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr11198482wrf.32.1625423146902; 
 Sun, 04 Jul 2021 11:25:46 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 16sm9650945wmk.18.2021.07.04.11.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 11:25:46 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/mips: Rewrite UHI errno_mips() using GHashTable
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210704170736.617895-1-f4bug@amsat.org>
 <20210704170736.617895-4-f4bug@amsat.org>
 <CAFEAcA8nqWfOchWL-t5cdf_gshbBqryMvZCtg=6XF0Z4po+O_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d0de39e-3591-3f3a-5d1d-0e224a246632@amsat.org>
Date: Sun, 4 Jul 2021 20:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8nqWfOchWL-t5cdf_gshbBqryMvZCtg=6XF0Z4po+O_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Leon Alrae <leon.alrae@imgtec.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 7:25 PM, Peter Maydell wrote:
> On Sun, 4 Jul 2021 at 18:07, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Linking on Haiku OS fails:
>>
>>   /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>   error: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is too large (0xffff405a bytes)
>>   /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>   final link failed: memory exhausted
>>   collect2: error: ld returned 1 exit status
>>
>> This is because the host_to_mips_errno[] uses errno as index,
>> for example:
>>
>>   static const uint16_t host_to_mips_errno[] = {
>>       [ENAMETOOLONG] = 91,
>>       ...
>>
>> and Haiku defines [*] ENAMETOOLONG as:
>>
>>    12 /* Error baselines */
>>    13 #define B_GENERAL_ERROR_BASE              INT_MIN
>>    ..
>>    22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE + 0x6000)
>>   ...
>>   106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE + 4)
>>   ...
>>   211 #define ENAMETOOLONG                      B_TO_POSIX_ERROR(B_NAME_TOO_LONG)
>>
>> so the array ends up beeing indeed too big.
>>
>> Since POSIX errno can't be use as indexes on Haiku,
>> rewrite errno_mips() using a GHashTable.
>>
>> [*] https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/tcg/sysemu/mips-semi.c | 62 ++++++++++++++++++++++--------
>>  1 file changed, 45 insertions(+), 17 deletions(-)
> 
>>  static int errno_mips(int host_errno)
>>  {
>> -    if (host_errno < 0 || host_errno >= ARRAY_SIZE(host_to_mips_errno)) {
>> -        return EINVAL;
>> -    } else if (host_to_mips_errno[host_errno]) {
>> -        return host_to_mips_errno[host_errno];
>> -    } else {
>> -        return host_errno;
>> +    gpointer uhi_errno;
>> +
>> +    if (uhi_errno_hash_table == NULL) {
>> +        uhi_errno_init();
>>      }
>> +
>> +    if (host_errno == 0) {
>> +        return 0;
>> +    }
>> +    if (g_hash_table_lookup_extended(uhi_errno_hash_table,
>> +                                     GINT_TO_POINTER(host_errno),
>> +                                     NULL, &uhi_errno)) {
>> +        return GPOINTER_TO_INT(uhi_errno);
>> +    }
>> +    return EINVAL; /* Not reachable per the specification */
> 
> Per whose specification? This function is passed the errno as set
> by various host OS functions like open(), lseek(), read(). POSIX allows
> those functions to set errno to any value, so this "we don't know
> a guest errno value for that" code is definitely reachable.

You are right, it is reachable. What I meant is other errnos are
not expected, and returning EINVAL for them doesn't seem ideal,
but the spec doesn't define a particular errno for unsupported
errnos. I'll reword as "Unsupported errno is not specified, use EINVAL".

