Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175A76E1C84
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 08:19:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCkj-0001Ot-7l; Fri, 14 Apr 2023 02:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pnCkU-0001Ja-56
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 02:17:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pnCkS-0005VV-4e
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 02:17:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id i3so7051772wrc.4
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 23:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681453042; x=1684045042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INsvIld9m+fkPYFY3L4leu7Xox8qKMW5Jd2RJCsSqDk=;
 b=LrqFW/xq8oB52xAGa2Q46H96bSYIKCPcdCkHau9DdyrjCuTADxcCy1ZG3phHcP4jS9
 n5PfK3kIJy0+A4mxAmtPxiToF8x400EWUUkUlvs8V2OIBw8+Yp9Z7BkPBlL9b60rMG8a
 NM1UuIFbDZNyicH51Wx5l3W8bQUPgFWU5A4ApbqKL/sfqyQynXIm3PxrqzZ26Q7iJ/0y
 PB+Vk3Id7OPi0KNkQ02d/lhaLv54sSAZCDJLITBtlY2D9bZG+acOlhIWKMKJYpeOhFLT
 4527QPKuXy6v1dQUme6+D3K/0Ll/Pbzl0EZ4QW3EDD6RiYCtHIIuUhOilN9kIWXzgZVB
 rhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681453042; x=1684045042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INsvIld9m+fkPYFY3L4leu7Xox8qKMW5Jd2RJCsSqDk=;
 b=f8sCFWCTwpYbeg4/LmClJetxbuiITpMZd4SsB/bOEJ+4H1ovpnEpIz7Ovw4ZoYchYk
 qSJqqwr5EaWZiqu+nCi8a5qiBXHQd/R8OUaIky/qq0e7yGzDN06eOdHFwDYjL7tzT5HH
 17gJvp4f+0+AnXKY1K/dLPQhRf2EcOJWypNp5g7Siss9wp6oCI2gGhNkUgKQclHzpQLy
 +ZvxAnu4fdd/WzCG9uFjIsU9EwPVhgTCzkjXqrxHqIHVrcjU2W/oCKcOE6DLzRA+P30S
 hLIERCNq8YrXd2MG1EylI9WUlTKMrGCWwMxwKsKzFxtVAmqD96gVfQxYe55Rz9sXCvQz
 4ssg==
X-Gm-Message-State: AAQBX9d5B24bSs/PvZeJFIWyRhGqH/wopzB6Xx5VAwzRLjMCTEz8ADqR
 pvFAz386cilVfNPaBEERHwDShQ==
X-Google-Smtp-Source: AKy350YKMKz5M2sMJrloQdqPE6jzTeyVLl0BPQ5wHSMyh3weNw7yfZfV1fFRQVIzsRBIvjXLGdE+nA==
X-Received: by 2002:a5d:45c7:0:b0:2e5:1da2:2a06 with SMTP id
 b7-20020a5d45c7000000b002e51da22a06mr3144561wrs.5.1681453042372; 
 Thu, 13 Apr 2023 23:17:22 -0700 (PDT)
Received: from [10.1.0.53] ([62.72.67.132]) by smtp.gmail.com with ESMTPSA id
 m13-20020adffe4d000000b002efb139ce72sm2786029wrs.36.2023.04.13.23.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 23:17:22 -0700 (PDT)
Message-ID: <14177a5a-9af7-7d34-dc15-fe9204de710b@linaro.org>
Date: Fri, 14 Apr 2023 08:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 03/10] tcg: Use one-insn-per-tb accelerator property in
 curr_cflags()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-4-peter.maydell@linaro.org>
 <db294649-0b72-914e-d6eb-328a996912f7@linaro.org>
 <CAFEAcA80ON=OfSucYhfEY8PiYc1xvkb20rWUYJbFYPg8qiywNw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA80ON=OfSucYhfEY8PiYc1xvkb20rWUYJbFYPg8qiywNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
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

On 4/13/23 18:24, Peter Maydell wrote:
> On Mon, 3 Apr 2023 at 19:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/3/23 07:46, Peter Maydell wrote:
>>>    uint32_t curr_cflags(CPUState *cpu)
>>>    {
>>>        uint32_t cflags = cpu->tcg_cflags;
>>> +    TCGState *tcgstate = TCG_STATE(current_accel());
>>
>> As mentioned against the cover, this is a very hot path.
>>
>> We should try for something less expensive.  Perhaps as simple as
>>
>>       return cpu->tcg_cflags | tcg_cflags_global;
>>
>> where cpu->tcg_cflags is updated with cpu->singlestep_enabled.
> 
> I feel like that introduces atomicity issues. If I'm reading
> the code right, curr_cflags() is called without any kind
> of lock held. At the moment we get away with this because
> 'singlestep' is an int and is always going to be atomically
> updated. If we make tcg_cflags_global a value which might have
> multiple bits set or not set I'm not entirely sure what the
> right way is to handle the reads and writes of it.

qatomic_read() here, will dtrt for no tearing on the read.
(Not that we should have expected one anyway, for uint32_t.)

> I think we can assume we have the iothread lock at any
> point where we want to change either 'singlestep' or
> the 'nochain' option, at least.

Indeed, it can only be changed by the monitor, under user control, so even without a lock 
there's no real race there.

Using qatomic_set(&global, new_value) is sufficient to match the qatomic_read() for no 
tearing.  Concurrent threads will see the old value or the new value, but not garbage, 
which is just fine.

We probably need to kick all cpus, so that they come out of long-running TB chains to see 
the new value and re-translate.


r~

