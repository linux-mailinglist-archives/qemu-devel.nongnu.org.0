Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89943655A60
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 15:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p95mo-0005Zp-P3; Sat, 24 Dec 2022 09:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p95mk-0005ZG-Mf
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 09:46:03 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p95mi-0006R0-UK
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 09:46:02 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so7362267pjd.0
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 06:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qB/s00W2pJ0Txsdc2sbVF6t5CdAf8WdzFkoAKT7ygZQ=;
 b=Y5ocu+7JjQMUNb3VPffwN+VASQxqB0e7OLJmMlvY3Kb14zYd2Jeq+LIkNfeTux7lfD
 GoWpSOuAk+x09Jty4YcE1Oy+yv1qhDau7Ue1l17oURqckEkgV47tlN1vDRIHIKZAwNDK
 vR7ddPurUFmCy5nB0OWDfJPvihsxkVDfWUWNTz1NMOqKEj6OB1UXdB0bjlld7nq3NIFM
 HFb0Dn52MHDmkmmc7zKka83J5bmKDJS5Q96CnUn4UtURyDLwmIv0pZZ5p4qO1bPOWKb+
 aExeU9GaxmEJouDNQC8A4Sdkrxr4OHb8NPRPYZkd5vSyKnW+IK+Gq33AB0GC4sp4zLus
 4zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qB/s00W2pJ0Txsdc2sbVF6t5CdAf8WdzFkoAKT7ygZQ=;
 b=MiQb+dGV2x+dJvDHwwTYGZFGat1a+zjFVRQCAIdsERKrNiHWaChGGheC2ziPUth7NX
 0FYG4e7mNRSQR2A9Ncpjld2peCMnzVRMkkqC/3iz3mC0LuIu6xbSZm8ob93omcRcrZIq
 ErbV8L1EVY02IPE64AAUVrW2XsPvGJFJbzTqQ/vn26hr+2eeRwgk3TiITWqnbxm39A2/
 EQEa7vGBz649zaJ8YWj8hyXTWzIvElICVcvd76PENgRgMw2au/egkUf3NEvM6PtfBspU
 BHz6fwhSNnqceXeNQVY8caGA7TqtK2jOQySTqHnP00z3Evy9iDkE3e5f6W+oo8iEtgT2
 ulVQ==
X-Gm-Message-State: AFqh2kpVERE/McNUYIhaUPOGmo6xiN4mLMew5eaVYpI+5rJS9OzPtH0o
 ++Iuglwzjo9Tgk+O56ILXp1F4w==
X-Google-Smtp-Source: AMrXdXtLc4Gxjvqp3QBQdV9dlAX3YN4O8l1yo4nxPlha3z8QpdxlEHaHjbJm7ObSCBn+Iu6pZMfyFA==
X-Received: by 2002:a17:902:f24c:b0:189:7d30:7623 with SMTP id
 j12-20020a170902f24c00b001897d307623mr13489212plc.30.1671893158931; 
 Sat, 24 Dec 2022 06:45:58 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902d2ce00b00189a7fbff33sm4159025plc.170.2022.12.24.06.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 06:45:58 -0800 (PST)
Message-ID: <ee90a980-98b7-4eaf-3230-7efac0336cde@linaro.org>
Date: Sat, 24 Dec 2022 06:45:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL v2 07/14] accel/tcg: Use interval tree for user-only page
 tracking
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
 <20221221050313.2950701-8-richard.henderson@linaro.org>
 <20221223143239.t47nod56iu7p4xbg@heavy>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221223143239.t47nod56iu7p4xbg@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/23/22 06:32, Ilya Leoshkevich wrote:
>> +    mmap_lock();
>> +    p = pageflags_find(address, address);
>> +    mmap_unlock();
> 
> How does the code ensure that p is not freed here?
> 
>> +    return p ? p->flags : 0;

Yep, need to use g_free_rcu.

>> +    while (true) {
>> +        PageFlagsNode *p = pageflags_find(start, last);
> 
> We can end up here without mmap_lock if we come from the syscall code.
> Do we need a retry like in page_get_flags()?

Yep, need to retry.


> Speaking of which: does lock_user() actually guarantee that it's safe
> to access the respective pages until unlock_user()? If yes, doesn't
> this mean that mmap_lock must be held between the two? And if no, and
> the SEGV handler is already supposed to gracefully handle SEGVs in
> syscall.c, do we need to call access_ok_untagged() there at all?

No, it doesn't, really guarantee anything.  We can't hold a lock across a blocking 
syscall, so lock_user() can't really lock.  We do need to page_unprotect writable pages, 
which is the main thing accomplished by the access_ok check.

>> +        if (qemu_host_page_size <= TARGET_PAGE_SIZE) {
>> +            start = address & TARGET_PAGE_MASK;
>> +            len = TARGET_PAGE_SIZE;
>> +            prot = p->flags | PAGE_WRITE;
>> +            pageflags_set_clear(start, start + len - 1, PAGE_WRITE, 0);
>> +            current_tb_invalidated = tb_invalidate_phys_page_unwind(start, pc);
> 
> When we come from page_check_range(), pc == 0 and the assertion in
> tb_invalidate_phys_page_unwind() fires.

Yep, the assertion is wrong.


> Should we pass
> current_cpu->cc->get_pc() to page_unprotect() instead of 0, so that
> current_tb is resolved to the TB that invoked the syscall?

It's not a guest pc, but the host unwind pc, so, no.


r~

