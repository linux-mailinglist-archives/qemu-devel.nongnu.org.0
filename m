Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987B13D9D7E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:14:56 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zJn-0008Kz-My
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zJ2-0007dx-97
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:14:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zJ0-0008KX-LL
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:14:07 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b7so5367829wri.8
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tl19FiuG081fdNAlNRj7Hzd8uuFxW2SXR3zfmvFQEUk=;
 b=NfDvzqgvCk1PFfc2fZMyzPvQmONg8yG147MZTubGl3wXBtiBbZrWVKtfDpgpK8MKYi
 Rn1yxZjqigStC+/VYIhAbYH0kBwSIrZ6Wo+G52g6SzVBb5gcz0ZbI6Za/SYMSacIzEIw
 N9ewj7kWw84sNTPWdXKwAeU/E01CSgL89XrSnQwkL/+seVH9Y32+FE2ohR4d4Kb3G2ZN
 XqE2BEup45d33tlTOKdzeIlY61fVbtqBWu7uuoi3ImhXgZN0r+MgzCAHzX4kDS82JmSQ
 9vepw75rSexUiQt7TTSd/NGVBVnMF1bOTulQj9p0JoKe8F0eU5VjgRKCWS4SaUcZVLty
 i/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tl19FiuG081fdNAlNRj7Hzd8uuFxW2SXR3zfmvFQEUk=;
 b=YHUAIeTzFgbvMXhUUwkd8MhwPBGrMQILRqvvTzOdwsX+3WTDHd427OnehgcPRbnDfL
 i2hSiFaK8zNW/I1TXd0smHn9yT1q+LniamiEo6AQlM9KiYnaGDm5e/6mTLi4sk9wck9m
 qGJB0hbMy9h+MUcT1ctm6RGCN3m+exD7q9Lsgf0BwbugzxVZ4dpgy6ufXKbgRgE8FihD
 9od5a5Kh9aEFXxm1wPDrYfkIR+Zu4gNjW0wvZrMYp+2CkBtM1rcgM8rAVTLZCEJEbC1E
 icEYEGYrXYI1P3egIO07XQnGwJ0GlGVWgrFSpoi1p+8Ih1aOq0lurJayYVzJ5aoRcGg1
 FvDA==
X-Gm-Message-State: AOAM533yZpTa2TICCAEumTyO1EWok/V1+0IFZU3EMReVagMDacp62V9S
 SZI8o7UpULJrWYQei19et30=
X-Google-Smtp-Source: ABdhPJzp8lA/vIA94rRlw02dU6XRyrLDfiDaJv36bJ7kmOgjnoeInSnG5NoChCQUHnEPeuysddhUuQ==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr2946846wrm.404.1627539245140; 
 Wed, 28 Jul 2021 23:14:05 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id m39sm4509430wms.28.2021.07.28.23.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:14:04 -0700 (PDT)
Subject: Re: [PATCH for-6.2 00/43] Unaligned accesses for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <128e21b5-da71-b1d2-c146-6d1038417786@amsat.org>
Date: Thu, 29 Jul 2021 08:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> This began with Peter wanting a cpu_ldst.h interface that can handle
> alignment info for Arm M-profile system mode, which will also compile
> for user-only without ifdefs.  This is patch 32.
> 
> Once I had that interface, I thought I might as well enforce the
> requested alignment in user-only.  There are plenty of cases where
> we ought to have been doing that for quite a while.  This took rather
> more work than I imagined to start.
> 
> So far only x86 host has been fully converted to handle unaligned
> operations in user-only mode.  I'll get to the others later.  But
> the added testcase is fairly broad, and caught lots of bugs and/or
> missing code between target/ and linux-user/.
> 
> Notes:
>   * For target/i386 we have no way to signal SIGBUS from user-only.
>     In theory we could go through do_unaligned_access in system mode,
>     via #AC.  But we don't even implement that control in tcg, probably
>     because no one ever sets it.  The cmpxchg16b insn requires alignment,
>     but raises #GP, which maps to SIGSEGV.
> 
>   * For target/s390x we have no way to signal SIGBUS from user-only.
>     The atomic operations raise PGM_SPECIFICATION, which the linux
>     kernel maps to SIGILL.
> 
>   * I think target/hexagon should be setting TARGET_ALIGNED_ONLY=y.
>     In the meantime, all memory accesses are allowed to be unaligned.

Now I better understand what you tried to explain me last with
TCGCPUOps. Since Claudio was also involved, Cc'ing him (not asking
for a review, just in case he wants to follow up).

