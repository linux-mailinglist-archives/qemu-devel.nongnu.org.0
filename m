Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A204966680C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaG-0007TM-9h; Wed, 11 Jan 2023 19:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaE-0007TD-GU
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:42 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaC-0001fh-R2
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:42 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so21868103pjj.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CeTMTTVNnQKb1HCCglqBARVyPNNw8fotLbJxCYUxTlY=;
 b=Q4QKAw34fyamuUjlJk6cNPAHRV/GXppBjX4AeQRbdi9JN5q9AbNRPftcmQYNgRanDe
 PQhVexgCChBUN08Ra4ibNLpPwu8y1f5XL9nb6c/aid2j8pWjeBQX9Sb2LXelRn7bdmLu
 KpbdFAFKQLXmzVWbNfv4Vg0LxDWmJPWBT//2pl4eXTRv103ACRKBt0tuUWxZp0JCPMWu
 HVhKd0T9QU4lKDb4RyuLPv4E9Wl0oL/6YQI5SJJGXY0osTqoB9g5BU2g+NmozgZX1TVf
 HwTXSYJ7BHAz5qFj611vdaaPhJ0WB68VLpe5yJO/f2YVWczmjFEezEIihD4t//nsbZyt
 /zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CeTMTTVNnQKb1HCCglqBARVyPNNw8fotLbJxCYUxTlY=;
 b=MxejD923m4SxKH6Sa7IyDFw9qXp2yfh1jeRoHoaZOQdK3bq3a1ke101DVz6/ALEE+n
 feKSDDQYJxP3tJIUFz6MgjUQzH853RP1sDC2KHHSOLP0kMck05WSJkq7xUv97OK8vqQo
 rsZFh+qBj1xRTtRXJ44w9BZpKYkKF5VZOs7lY8qLhGkSWU5BpeOM8GbOzblxnmQF4riz
 VDwK5nf/51iE7s+28sfz4bTAadmgBa/EmRg4sXhkhSloJu9eKIDRF1NZta2N+lJaaLUD
 JwZhVduw1BYvyo/qqVkG+hKFRoAtoeM7tTQXTRYNgbUhTjYdMViGRtdGWDsb6iea4R1M
 mr3g==
X-Gm-Message-State: AFqh2koS2dKbnEZebQSjjrbkHQ3JZcwyy74MnaHaJLMqpgFODR66zbJH
 8L0KxcGPHgnU3MSJZpRgLhmJpA==
X-Google-Smtp-Source: AMrXdXtylTm51O4WToxd5qObCFnXpYhdCHdzGhFsoyCMYo5ckSSoXoq6v9DWgi+3v8e+C7AiOKvzIA==
X-Received: by 2002:a17:90b:110a:b0:223:2001:4ee8 with SMTP id
 gi10-20020a17090b110a00b0022320014ee8mr76762134pjb.27.1673483799233; 
 Wed, 11 Jan 2023 16:36:39 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 qe12-20020a17090b4f8c00b00218fba260e2sm11153409pjb.43.2023.01.11.16.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:38 -0800 (PST)
Message-ID: <d05ae248-a3e1-3a14-aabf-4625378f3fb4@linaro.org>
Date: Wed, 11 Jan 2023 09:10:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 21/26] util/qht: use striped locks under TSAN
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 09:39, Alex Bennée wrote:
> From: Emilio Cota<cota@braap.org>
> 
> Fixes this tsan crash, easy to reproduce with any large enough program:
> 
> $ tests/unit/test-qht
> 1..2
> ThreadSanitizer: CHECK failed: sanitizer_deadlock_detector.h:67 "((n_all_locks_)) < (((sizeof(all_locks_with_contexts_)/sizeof((all_locks_with_contexts_)[0]))))" (0x40, 0x40) (tid=1821568)
>      #0 __tsan::CheckUnwind() ../../../../src/libsanitizer/tsan/tsan_rtl.cpp:353 (libtsan.so.2+0x90034)
>      #1 __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) ../../../../src/libsanitizer/sanitizer_common/sanitizer_termination.cpp:86 (libtsan.so.2+0xca555)
>      #2 __sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >::addLock(unsigned long, unsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:67 (libtsan.so.2+0xb3616)
>      #3 __sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >::addLock(unsigned long, unsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:59 (libtsan.so.2+0xb3616)
>      #4 __sanitizer::DeadlockDetector<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >::onLockAfter(__sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >*, unsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:216 (libtsan.so.2+0xb3616)
>      #5 __sanitizer::DD::MutexAfterLock(__sanitizer::DDCallback*, __sanitizer::DDMutex*, bool, bool) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector1.cpp:169 (libtsan.so.2+0xb3616)
>      #6 __tsan::MutexPostLock(__tsan::ThreadState*, unsigned long, unsigned long, unsigned int, int) ../../../../src/libsanitizer/tsan/tsan_rtl_mutex.cpp:200 (libtsan.so.2+0xa3382)
>      #7 __tsan_mutex_post_lock ../../../../src/libsanitizer/tsan/tsan_interface_ann.cpp:384 (libtsan.so.2+0x76bc3)
>      #8 qemu_spin_lock /home/cota/src/qemu/include/qemu/thread.h:259 (test-qht+0x44a97)
>      #9 qht_map_lock_buckets ../util/qht.c:253 (test-qht+0x44a97)
>      #10 do_qht_iter ../util/qht.c:809 (test-qht+0x45f33)
>      #11 qht_iter ../util/qht.c:821 (test-qht+0x45f33)
>      #12 iter_check ../tests/unit/test-qht.c:121 (test-qht+0xe473)
>      #13 qht_do_test ../tests/unit/test-qht.c:202 (test-qht+0xe473)
>      #14 qht_test ../tests/unit/test-qht.c:240 (test-qht+0xe7c1)
>      #15 test_default ../tests/unit/test-qht.c:246 (test-qht+0xe828)
>      #16 <null> <null> (libglib-2.0.so.0+0x7daed)
>      #17 <null> <null> (libglib-2.0.so.0+0x7d80a)
>      #18 <null> <null> (libglib-2.0.so.0+0x7d80a)
>      #19 g_test_run_suite <null> (libglib-2.0.so.0+0x7dfe9)
>      #20 g_test_run <null> (libglib-2.0.so.0+0x7e055)
>      #21 main ../tests/unit/test-qht.c:259 (test-qht+0xd2c6)
>      #22 __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58 (libc.so.6+0x29d8f)
>      #23 __libc_start_main_impl ../csu/libc-start.c:392 (libc.so.6+0x29e3f)
>      #24 _start <null> (test-qht+0xdb44)
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> Message-Id:<20230109224954.161672-5-cota@braap.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   util/qht.c | 101 +++++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 87 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

