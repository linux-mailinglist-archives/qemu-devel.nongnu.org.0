Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6B64FBDA
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:56:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6cLb-0007os-MC; Sat, 17 Dec 2022 13:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6cLZ-0007oZ-Cz
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:55:45 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6cLX-0000up-Jp
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:55:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so5404219pjo.3
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ow42CB6qnIzkC6L9lZMNM2FzKBRY66+pZy1lRlzEL1Q=;
 b=H6ue3KUQ4zLOYtOGQvPbSasBw9C2E8M/cU5jelv6M2lSlZtVQV/cbbSDoJNUoATPRN
 e0/9JvsgyW3Tl8hGrYXT4aMyV6imMrSGiLKRuZuILtM5C7YnJ/Dyk2L4YukeogqpIT0a
 F0mSxqkSUSbICkveBJaS+VeWIjeJ5UzxtAbmJRg18x16TCUfrie5FsKIwiAycEQBrxUo
 yqFhS0NkDZWHSS56UnXEPY6FTkeMjhjH4Q2kpNcGn7EKhWbptX2arp71fs1geXvU4Fn9
 UQGmLwyXSFHNk5Il7VH5UlSXgwDH7KhgjfNLf6fp0qsL0ao2FSN3YgsakgkLq4Wmre17
 LWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ow42CB6qnIzkC6L9lZMNM2FzKBRY66+pZy1lRlzEL1Q=;
 b=T1qoFZNjJoAlRN1R+3V4q0KHgprkb94UW43dg+5dRUN0xn/OrqkPt2jbupAJElpE1M
 +Pezk2r1ilSuGuCZGbVx/KnkmaZtVHVPdK93nOP6adwZgsnBYI8FH0OkP74MRPbiKC+C
 Dqa4ZOJUC18gEPYLdVWLNvgf24l1z1JNyXYRv3MVWCIt23StJySqsG1Wvj2JfPb37u8L
 NX2Fh5MKg4ds/vW1m+DY9g6NEQa2L0Oy6B7crlx3UaI63L9vXK/DLr0vpIhh94gUFrCt
 WFw/+7S0b7mqwloOFpZExS4qj6nNC8pdyIJzYTxUX978xpY+D1azsnnmzppG/I8MHP9t
 LSnQ==
X-Gm-Message-State: AFqh2kp0PWJoWR0p8Y12vBsgX6Gg3FETxlvXMj1uniGMeUO7beUVfo0U
 RhkqsbgwU1UoDHi3kSQNWD0v0w==
X-Google-Smtp-Source: AMrXdXsZKavHI9EPE7xH42WB8ToEZZOCyjBt8QFMkqAQQzVLMPwex10jr3VRhRdSxT0aGzbj1a5zsQ==
X-Received: by 2002:a17:90b:345:b0:219:5b39:9120 with SMTP id
 fh5-20020a17090b034500b002195b399120mr3161052pjb.41.1671303342062; 
 Sat, 17 Dec 2022 10:55:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a08c300b0021937b2118bsm6507938pjn.54.2022.12.17.10.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:55:41 -0800 (PST)
Message-ID: <acb1cb18-ba3e-33b7-606b-e58d31a95b98@linaro.org>
Date: Sat, 17 Dec 2022 10:55:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] linux-user: fix getgroups/setgroups allocations
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20221217093127.3085329-1-mjt@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217093127.3085329-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/17/22 01:31, Michael Tokarev wrote:
> linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
> used alloca() to allocate grouplist arrays, with unchecked gidsetsize
> coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
> is common for an application to allocate NGROUPS_MAX for getgroups()),
> this means a typical allocation is half the megabyte on the stack.
> Which just overflows stack, which leads to immediate SIGSEGV in actual
> system getgroups() implementation.
> 
> An example of such issue is aptitude, eg
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811087#72
> 
> Cap gidsetsize to NGROUPS_MAX (return EINVAL if it is larger than that),
> and use heap allocation for grouplist instead of alloca().  While at it,
> fix coding style and make all 4 implementations identical.
> 
> Try to not impose random limits - for example, allow gidsetsize to be
> negative for getgroups() - just do not allocate negative-sized grouplist
> in this case but still do actual getgroups() call.  But do not allow
> negative gidsetsize for setgroups() since its argument is unsigned.
> 
> Capping by NGROUPS_MAX seems a bit arbitrary, - we can do more, it is
> not an error if set size will be NGROUPS_MAX+1. But we should not allow
> integer overflow for the array being allocated. Maybe it is enough to
> just call g_try_new() and return ENOMEM if it fails.
> 
> Maybe there's also no need to convert setgroups() since this one is
> usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
> this is apparently a kernel-imposed limit for runtime group set).
> 
> The patch fixes aptitude segfault mentioned above.
> 
> Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
> ---
> v2:
>   - remove g_free, use g_autofree annotations instead,
>   - a bit more coding style changes, makes checkpatch.pl happy
> 
>   linux-user/syscall.c | 99 ++++++++++++++++++++++++++++++--------------
>   1 file changed, 68 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

