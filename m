Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB364590411
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:39:59 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBDy-00017k-82
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oMBBl-0007KF-1V
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oMBBh-0003IW-4W
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660235856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOS2Sotu9DqerDNA9hgMMio0QIs9vwAeh9S83vEZ4L4=;
 b=XZq6A90KLNuIdzbiZqesNbfElsEZaeSBmz58BXo9aix4w4s80q0W2U3LGSIC0XgkpJBt/x
 /JZcsd8eoxPozoDiUu3JhNg1w1t+yOjPlkAHP5/b6zOIZDv+z8DzJaMyexIE5xWGf8Ra01
 LsK9pxlhI3cD+i7AUVYW/5ExxjSoAWA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-SOnMpKQfNkeYbkEsFaODJA-1; Thu, 11 Aug 2022 12:37:34 -0400
X-MC-Unique: SOnMpKQfNkeYbkEsFaODJA-1
Received: by mail-wm1-f69.google.com with SMTP id
 131-20020a1c0289000000b003a52a0c70b0so7128599wmc.2
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 09:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=iOS2Sotu9DqerDNA9hgMMio0QIs9vwAeh9S83vEZ4L4=;
 b=mBY1iPycZZA/W9ShWTlnr/TMRN0oy12TK2ybRl6vsuTZc9E5x0HJoArCxndFQUiSIJ
 aZDYXpuE4fXEuZNk3vDBOvw8F1jHp4GvBqlykW+aQTE9CNqPux9ojV7cwCsbLrYtBnCi
 KClBH2KkdU7hP5w6BL4ZN20SlBX9Q28DUIbQOYwOoSrIjQ4ewM+MgkOj65DmdydDbaOs
 1+RwM2c+Lp3HL0Fk8KhBf5IJkPj2PSJqV1FHnrYcaBJ8aR1A8CAxL90vvpbu3D5M01xT
 3UwgFDqcFM9kDgzLqjexDfM9pgpQxnYcNon7EHY05yu81PA8IBuSxlWRXhZrJobvPTsT
 vpUA==
X-Gm-Message-State: ACgBeo1k17OVrq745mN9uE2BoNNwWKgmt1naeTesI8AmtYdVj4irHwoN
 Z9xG7ZJH13zbgzhSdSDMN5f2by9glEwvYqpH8W3A69H7FkI8Sf3CeSFIbhZrMciUYUl+jKi1aT6
 iFaZZpCxCsNxr5mU=
X-Received: by 2002:adf:ec92:0:b0:21f:f65:2e57 with SMTP id
 z18-20020adfec92000000b0021f0f652e57mr19905518wrn.95.1660235853607; 
 Thu, 11 Aug 2022 09:37:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ZRP7rF115Fjhili7YpAzVorx5OcgZN096bBYym344C+62OUrHwHnXHqM/KYYIYIudsEjB7Q==
X-Received: by 2002:adf:ec92:0:b0:21f:f65:2e57 with SMTP id
 z18-20020adfec92000000b0021f0f652e57mr19905494wrn.95.1660235853273; 
 Thu, 11 Aug 2022 09:37:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2e00:4009:47dc:d0e5:dcd2?
 (p200300cbc7082e00400947dcd0e5dcd2.dip0.t-ipconnect.de.
 [2003:cb:c708:2e00:4009:47dc:d0e5:dcd2])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a7bc057000000b003a3211112f8sm6311743wmc.46.2022.08.11.09.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 09:37:32 -0700 (PDT)
Message-ID: <1f6b9db6-69bc-b196-3abd-65ba7f9933b0@redhat.com>
Date: Thu, 11 Aug 2022 18:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 2/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220803125108.626995-2-Jason@zx2c4.com>
 <20220803171536.1314717-1-Jason@zx2c4.com>
 <20220803171536.1314717-2-Jason@zx2c4.com>
 <6ad7580d-ee43-d744-8eed-cd363c4fb911@redhat.com>
 <Yu0UtNzyb81O0ND2@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yu0UtNzyb81O0ND2@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 05.08.22 15:01, Jason A. Donenfeld wrote:
> Hi David,
> 
> On Fri, Aug 05, 2022 at 01:28:18PM +0200, David Hildenbrand wrote:
>> On 03.08.22 19:15, Jason A. Donenfeld wrote:
>>> In order to fully support MSA_EXT_5, we have to also support the SHA-512
>>> special instructions. So implement those.
>>>
>>> The implementation began as something TweetNacl-like, and then was
>>> adjusted to be useful here. It's not very beautiful, but it is quite
>>> short and compact, which is what we're going for.
>>>
>>
>> NIT: we could think about reversing the order of patches. IIRC, patch #1
>> itself would trigger a warning when starting QEMU. Having this patch
>> first make sense logically.
> 
> Good idea. Will do.
> 
>>> +static int kimd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
>>> +                       uint64_t *message_reg, uint64_t *len_reg, uint8_t *stack_buffer)
>>> +{
>>> +    enum { MAX_BLOCKS_PER_RUN = 64 }; /* This is arbitrary, just to keep interactivity. */
>>
>> I'd just use a #define outside of the function for that.
> 
> Why? What does leaking this into file-level scope do?
> 

I'd say common coding practice in QEMU, but I might be wrong ;)

>>
>>> +    uint64_t z[8], b[8], a[8], w[16], t;
>>> +    uint64_t message = message_reg ? *message_reg : 0, len = *len_reg, processed = 0;
>>> +    int i, j, reg_len = 64, blocks = 0, cc = 0;
>>> +
>>> +    if (!(env->psw.mask & PSW_MASK_64)) {
>>> +        len = (uint32_t)len;
>>> +        reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
>>> +    }
>>

[...]
> 
>>> +    for (i = 0; i < 8; ++i) {
>>> +        cpu_stq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), z[i], ra);
>>
>> I wonder what happens if we get an exception somewhere in the middle
>> here ... fortunately we can only involve 2 pages.
> 
> If this fails, then message_reg and len_reg won't be updated, so it will
> have to start over. If it fails part way through, though, then things
> are inconsistent. I don't think we want to hassle with trying to restore
> the previous state or something insane though. That seems a bit much.

Okay, but there could be scenarios where we mess up?

> 
>>> +    cc = kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
>>> +    if (cc) {
>>> +        return cc;
>>> +    }
>>
>> Doesn't kimd_sha512() update the length register? And if we return with
>> cc=3, we'd be in trouble, no?
> 
> cc=3 means partial completion. In that case, klmd also returns with a
> partial completion. That's good and expected! It means that the next
> time it's called, it'll keep going where it left off.
> 
> I've actually tried this with the Linux implementation, and it works as
> expected.
> 
>> One idea could be to simply only process one block at a time. Read all
>> inputs first for that block and handle it completely without any
>> register modifications. Perform all memory writes in a single call.
> 
> That *is* what already happens. Actually, the memory writes only ever
> happen at the very end of kimd_sha512.
> 
>> Further, I wonder if we should factor out the core of kimd_sha512() to
>> only work on temp buffers without any loading/storing of memory, and let
>> only kimd_sha512/klmd_sha512 perform all loading/storing. Then it's much
>> cleaner who modifies what.
> 
> That's not necessary and will complicate things ultimately. See the
> above; this is already working as expected.

I'll have a closer look and see if I might improve it in the upcomming
weeks. I'll be on vacation for ~1.5 weeks. And as history has shown, I
need some days afterwards to dig through my overflowing mailbox :)

-- 
Thanks,

David / dhildenb


