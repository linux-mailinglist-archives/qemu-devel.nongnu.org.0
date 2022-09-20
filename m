Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CED5BE4D6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:43:56 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabfP-0002Hs-CW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaaTT-0005ah-EP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaaTQ-0003pw-Ab
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663669647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iF76SviXI50XkeFkhFp090en5LGWO5TSWy1Fm1qQQPg=;
 b=J/FIkpBV1VYlBmkAo9BIIiIRlOsZrdFB1jErXDqNkkUsF+slc2ARs73+pjHUxVF6UffJ0N
 pne1Rz27mguXqpeknk+HqVfICdlO3YMKUrHRU+Bt0ARd8UQsUcRc5EAvJZKuZNjnEherRB
 P4pRSTZ0vzoxhM0+846GqTBW7aurYbc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-u9n83ABaM0u59KsbhtGaRQ-1; Tue, 20 Sep 2022 06:27:26 -0400
X-MC-Unique: u9n83ABaM0u59KsbhtGaRQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i29-20020adfa51d000000b00228fa8325c0so962001wrb.15
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iF76SviXI50XkeFkhFp090en5LGWO5TSWy1Fm1qQQPg=;
 b=NNVNfDsN7PxFe1myQoMAMO6f1irAL5yWeLpqYEe756YITftmuUfgDjDEANFHmzjPgc
 wTf2yTZTwKqraLN8R9hTMyw8Ob5o0DEO0oYRKytKqv8CQgAdz/KHss2A1V10NXBG9Mcs
 OoR0HQ01Pem82PgY411NOtRaEMmikwDiQD6ofhywMIiNiwKUDhjR4ZkBj/ZDAuqPdtRt
 R6pmqB7uILiQNuqDF3UnNt6uSLinuoqx+xxYqL9j0oajr9LeJ1zdBndjIto/EU3qQ7NF
 F1rCBI4BoIxRB/mKW5VHVsM4JwffkQKCQanFA0vtElDC/fwfro5QJ3nrcOSToFZV1BoF
 jiBg==
X-Gm-Message-State: ACrzQf3IekOvGmdrvDFApQGC1TXr35P48rPegU5oC3Lvz5UZqWRRfzxS
 sCcK2azcAny+aOpQ8bh5dXaQbuS9X7Q3qvHypTeqv7HgAoE+NyozRUaCFlMm2uuWz3VwLvBaf1S
 +Ty0ISu04iNOuB3o=
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id
 f9-20020a05600c154900b003b48fd70af4mr1768665wmg.100.1663669645274; 
 Tue, 20 Sep 2022 03:27:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FOlTLVs7NgXpS3p1rKr/PWdndvTa0EjlxsmX5euYvw+1k+rsKfmmj9ZABcXgw4M0KjlpRCg==
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id
 f9-20020a05600c154900b003b48fd70af4mr1768640wmg.100.1663669645010; 
 Tue, 20 Sep 2022 03:27:25 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-8.web.vodafone.de. [109.43.177.8])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a05600c4e1400b003b33de17577sm1975701wmq.13.2022.09.20.03.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 03:27:24 -0700 (PDT)
Message-ID: <d64c7c75-8393-19ad-0ce1-950624ba01c3@redhat.com>
Date: Tue, 20 Sep 2022 12:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL v3 00/20] tcg patch queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 06/09/2022 10.37, Richard Henderson wrote:
> v2: Fix incorretly resolved rebase conflict in patch 16.
> v3: Work around clang preprocessor bug in patch 3.
> 
> 
> r~
> 
> 
> The following changes since commit fd28528ece590dc709d1a893fce2ff2f68ddca70:
> 
>    Merge tag 'pull-or1k-20220904' of https://github.com/stffrdhrn/qemu into staging (2022-09-05 18:01:02 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220906
> 
> for you to fetch changes up to 00c07344fa245b22e895b363320ba4cd0ec1088a:
> 
>    target/riscv: Make translator stop before the end of a page (2022-09-06 08:04:26 +0100)
> 
> ----------------------------------------------------------------
> Respect PROT_EXEC in user-only mode.
> Fix s390x, i386 and riscv for translations crossing a page.
> 
> ----------------------------------------------------------------
> Ilya Leoshkevich (4):
>        linux-user: Clear translations on mprotect()
>        accel/tcg: Introduce is_same_page()
>        target/s390x: Make translator stop before the end of a page
>        target/i386: Make translator stop before the end of a page
> 
> Richard Henderson (16):
>        linux-user/arm: Mark the commpage executable
>        linux-user/hppa: Allocate page zero as a commpage
>        linux-user/x86_64: Allocate vsyscall page as a commpage
>        linux-user: Honor PT_GNU_STACK
>        tests/tcg/i386: Move smc_code2 to an executable section
>        accel/tcg: Properly implement get_page_addr_code for user-only
>        accel/tcg: Unlock mmap_lock after longjmp
>        accel/tcg: Make tb_htable_lookup static
>        accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
>        accel/tcg: Use probe_access_internal for softmmu get_page_addr_code_hostp
>        accel/tcg: Document the faulting lookup in tb_lookup_cmp
>        accel/tcg: Remove translator_ldsw
>        accel/tcg: Add pc and host_pc params to gen_intermediate_code
>        accel/tcg: Add fast path for translator_ld*
>        target/riscv: Add MAX_INSN_LEN and insn_len
>        target/riscv: Make translator stop before the end of a page

  Hi Richard!

Since your pull request has been merged, the Travis CI now constantly shows 
a failure, see:

  https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/255231855

The previous runs were all green, so I assume this has been introduced by 
one of the patches in here. Could you please have a look?

  Thanks,
   Thomas


