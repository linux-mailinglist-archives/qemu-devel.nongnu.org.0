Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE646CCA7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:16:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phEmd-000311-DN; Tue, 28 Mar 2023 15:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEmb-00030B-55
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:15:01 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEmZ-0001a3-JG
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:15:00 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso12150964pjz.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680030898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZliNxt4hnS0pNxzoANK6cuOR+xoqHzaDKucxWxI0CE=;
 b=ii1GNu72Htr9BN7YsKFCdz6NdoCAjUVx3QgUM4s9iVmmNBiiZexjAlq/beIWUB/icq
 e7FUwh8a2EvEFxXAZPVdMSxNmqXJB2Chpa4r4ND9Kg2fO6c0adFijFHxomhnu1Q12MGq
 hcy5osCfhs83QpMTaUecYhIrzRvP4i6HB4acV7EFAA6U9cjuMyzAxoIUgr5gWjD38xQ6
 DSKy+9ViO95gxrUF+nNK48fdL23IBdsTyCw51t/QozmbNCkNWUWkgrpH9eyHDuHeWWRp
 Mg6LyJDddOr/jeYLZWy2CWKGEPx+NGOTBhSI34L3XXEvIKV0ksSEoOA4V0fcGO3wEqPK
 X4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680030898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZliNxt4hnS0pNxzoANK6cuOR+xoqHzaDKucxWxI0CE=;
 b=X1FXpEFOYXiWPXfcoefh41QjUsTXhaYHo7rXOTLVuwBrPyxQ/8cOz6WmGxhi5eBCe6
 MvNplRzaHk2krfG0BCXQTMUOAulDJ9WfHoKOtMxzhW4Df34I0sazjPPx2xCQ0C5uniaN
 qA03m0aFMUFSHElkyzLds+mYSfq9AG8gZ2qf9bURDXvgJ6Ax7S4Dhvb2MweqEARP3eAm
 Farkz5+qtg0KZYOsH1CDXXas131hYiYU0IxY6BLdNkHVcvj6nxz1Zo65G3kh1qf1pAkn
 3ELmsvt3iWIHeVNxfdlmDcXAKOIb5OCF6ZbnVS4Vf6ZPu5dkyvSp2NYH8lBFC7QGNZIe
 SDfQ==
X-Gm-Message-State: AAQBX9efEXbTZC0mpomFZCO6KKzmL7MAEsa+/BTWCxyK0ZaWUnZKwn3p
 YBlpJ180SByDbuY9ErhiIeKzvA==
X-Google-Smtp-Source: AKy350aAR2lW5pMB3eWhJdWNutkDrwXBkL/zlyjP4OuCTQbEqtFWZCj8MOPS4mFh4QH/JZNpmo87AQ==
X-Received: by 2002:a17:903:234c:b0:1a1:b9e6:28a8 with SMTP id
 c12-20020a170903234c00b001a1b9e628a8mr20557076plh.45.1680030898030; 
 Tue, 28 Mar 2023 12:14:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170902869800b001a20b30e8b0sm9779520plo.243.2023.03.28.12.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:14:57 -0700 (PDT)
Message-ID: <5975067e-81bd-c67e-4ba6-01f0f3c6613b@linaro.org>
Date: Tue, 28 Mar 2023 12:14:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
 <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
 <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 3/28/23 11:27, Peter Maydell wrote:
> On Tue, 28 Mar 2023 at 18:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/28/23 09:28, Peter Maydell wrote:
>>> +            /*
>>> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
>>> +             * but since we're conditionally branching over it, we want
>>> +             * to retain the existing value.
>>> +             */
>>> +            old_is_jmp = s->base.is_jmp;
>>>                gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
>>> +            s->base.is_jmp = old_is_jmp;
>>
>> A third solution is to simply set is_jmp = DISAS_NEXT here.
> 
> I wasn't confident enough that the previous is_jmp had
> to be DISAS_NEXT to do that -- there are a lot of
> different values and it's not clear to me which are ones you
> might find lying around in is_jmp at the start of an insn.

At the very start of an insn, you will *only* find DISAS_NEXT.
Anything else will have exited the TB for the previous insn.


r~

