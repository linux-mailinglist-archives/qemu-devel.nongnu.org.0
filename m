Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB1589944
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:27:57 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWCy-00076y-Uv
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJVwd-000170-Vv
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJVwZ-0001fI-Nk
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659600658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S86/SvOANPHYq1diAeJuBUCaBbGivvqLxEhD/92p/98=;
 b=bRGyQWhhdoTWoEGrR2pVzZbcWtE85e9dzNvy8UZLAYnuG72QTBNdsae1B4S1EroYpViYfX
 P82niptHQF5VpLz0z/1rrR+DxRjtvw7bDbLQF/ep3tYOU6+r0C38gqUuS4AS1JFpj5Lm+3
 DiA6bnTjlD0D1Ct8Ry5Abbf5TQcFHyg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-8Ex0IyhTOkqmMVor8EUGGg-1; Thu, 04 Aug 2022 04:10:54 -0400
X-MC-Unique: 8Ex0IyhTOkqmMVor8EUGGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d6-20020adfa346000000b002206e4c29caso1863556wrb.8
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=S86/SvOANPHYq1diAeJuBUCaBbGivvqLxEhD/92p/98=;
 b=AMs1O/kSSitdO0Vd99TfblCfV9/dSQcilcWwew7ociLpvWvPeA/omshHS8qjbyv4pW
 S1Uq9VqP78OYkgEwd7PgYUCBZv+WYOiikkHczVUHCbFxgRA9LKVRB2hge7wHze+hdcf1
 TwbUzyjp7CC4FprFppQBqYtPutslVi2f9KZQmS8mkA+XrtVYAx0SoC8VFGjZl8U+/q6v
 8TtkF99TB55V/0Yzv2XeR1cFN+lcrEn0i5yc0xT/mpUoFfowBUacDxkQDrGlGtYHKVKD
 4G/NPwkLq/bmYZco906/lY4K9OcKCWcWbxxiZg3Lw5hdqVxgPvtK+xV5Ixlw2a5dctZU
 jwvQ==
X-Gm-Message-State: ACgBeo251Ux+H2lDX4N9OixhKpZsy9M0Bq8bRKzyMrtKS3NTnYcjbqpU
 V2ODLpf85AqyzdDTkneWXgfDqQLIyLZTB79ugadWsq8x40CSeA5rI0CUNfZXdCCzeB57TLocweV
 yVf74mqn3w0SwhAU=
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr570192wrz.379.1659600653770; 
 Thu, 04 Aug 2022 01:10:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tc7/wnKYi7Y1fTlvahbhCHItV9hstIFTYDl1/Xk8zibqjiR8dic6JO5L7V4yb75v9/Fp7ng==
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr570173wrz.379.1659600653443; 
 Thu, 04 Aug 2022 01:10:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:8900:2c18:b992:1fa1:f88b?
 (p200300cbc70689002c18b9921fa1f88b.dip0.t-ipconnect.de.
 [2003:cb:c706:8900:2c18:b992:1fa1:f88b])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b003a2d47d3051sm532303wmr.41.2022.08.04.01.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 01:10:53 -0700 (PDT)
Message-ID: <60ae0ada-a99b-f6a8-93c3-f55db2480458@redhat.com>
Date: Thu, 4 Aug 2022 10:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: freude@linux.ibm.com, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Holger Dengler <dengler@linux.ibm.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
 <YupmwgYFShLfP8Xd@zx2c4.com> <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
In-Reply-To: <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.22 08:51, Harald Freudenberger wrote:
> On 2022-08-03 14:14, Jason A. Donenfeld wrote:
>> Hi David,
>>
>> On Wed, Aug 03, 2022 at 01:55:21PM +0200, David Hildenbrand wrote:
>>> On 02.08.22 21:00, Jason A. Donenfeld wrote:
>>>> In order to fully support MSA_EXT_5, we have to also support the SHA-512
>>>> special instructions. So implement those.
>>>>
>>>> The implementation began as something TweetNacl-like, and then was
>>>> adjusted to be useful here. It's not very beautiful, but it is quite
>>>> short and compact, which is what we're going for.
>>>>
>>>
>>> Do we have to worry about copyright/authorship of the original code or
>>> did you write that from scratch?
>>
>> I actually don't really remember how much of that is leftover from
>> tweetnacl and how much I've rewritten - I've had some variant of this
>> code or another kicking around in various projects and repos for a long
>> time. But the tweetnacl stuff is public domain to begin with, so all
>> good.
>>
>>> Are we properly handling the length register (r2 + 1) in the
>>> 24-bit/31-bit addressing mode?
>>> Similarly, are we properly handling updates to the message register 
>>> (r2)
>>> depending on the addressing mode?
>>
>> Ugh, probably not... I didn't do any of the deposit_64 stuff. I guess
>> I'll look into that.
>>
>>> It's worth noting that we might want to implement (also for 
>>> PRNO-TRNG):
>>>
>>> "The operation is ended when all
>>> source bytes in the second operand have been pro-
>>> cessed (called normal completion), or when a CPU-
>>> determined number of blocks that is less than the
>>> length of the second operand have been processed
>>> (called partial completion). The CPU-determined
>>> number of blocks depends on the model, and may be
>>> a different number each time the instruction is exe-
>>> cuted. The CPU-determined number of blocks is usu-
>>> ally nonzero. In certain unusual situations, this
>>> number may be zero, and condition code 3 may be
>>> set with no progress."
>>>
>>> Otherwise, a large length can make us loop quite a while in QEMU,
>>> without the chance to deliver any other interrupts.
>>
>> Hmm, okay. Looking at the Linux code, I see:
>>
>>         s.even = (unsigned long)src;
>>         s.odd  = (unsigned long)src_len;
>>         asm volatile(
>>                 "       lgr     0,%[fc]\n"
>>                 "       lgr     1,%[pba]\n"
>>                 "0:     .insn   rre,%[opc] << 16,0,%[src]\n"
>>                 "       brc     1,0b\n" /* handle partial completion */
>>                 : [src] "+&d" (s.pair)
>>                 : [fc] "d" (func), [pba] "d" ((unsigned long)(param)),
>>                   [opc] "i" (CPACF_KIMD)
>>                 : "cc", "memory", "0", "1");
>>
>> So I guess that means it'll just loop until it's done? Or do I need to
>> return "1" from HELPER(msa)?
>>
>> Jason
> 
> Hm, you don't really want to implement some kind of particial complete.
> Qemu is an emulation and you would have to implement some kind of
> fragmenting this based on machine generation.

Do we?

"The
CPU-determined number of bytes depends on the
model, and may be a different number each time the
instruction is executed. The CPU-determined number
of bytes is usually nonzero. In certain unusual situa-
tions, this number may be zero, and condition code 3
may be set with no progress. However, the CPU pro-
tects against endless recurrence of this no-progress
case.
"

I read that as "do what you want, even on a given model it might be random."

-- 
Thanks,

David / dhildenb


