Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64A4D6139
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:06:55 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSe2n-0006yg-Ti
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSe0d-000574-QY; Fri, 11 Mar 2022 07:04:40 -0500
Received: from [2a00:1450:4864:20::331] (port=45882
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSe0b-0000Vd-Fo; Fri, 11 Mar 2022 07:04:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so5187296wms.4; 
 Fri, 11 Mar 2022 04:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ShrARH2abhZbHf9tj6f/Z8wOjM0AnYn4HN0mxm8Oseg=;
 b=VQjeFvpHfvMNFfp8aLBMZMf2r7l5pNlKUkuj6+N93tuzrodwLo66E2XvqRySvg3pKb
 CCGKVPIQkA6UyJS1qJSjJcDp152ZQk6MxYzHEHga8nO8b6WmtfpGJB3riMmIfa/H9B8u
 aXpim8O5jk8xTwHeH3wM6CkcN+YlngfuqWmtfBSC9BM+V/UiS6VKZmpQEln7H7rQuzwQ
 qE3f2bV4wfC+4DnqvFaxbV4gVc9ADEfAVW98p9I7FICgl7lGCPWqf8GvEm+Ryt2aotOe
 pUacfmNgsE5dGa47Umc33eM/RTY0/DkfzNini5KUYdaO/JLJzta80ew1Q4E/eyGiJ2DF
 tzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ShrARH2abhZbHf9tj6f/Z8wOjM0AnYn4HN0mxm8Oseg=;
 b=KGntGqesfYP4pgKxBvZ8xJ3Ju6lkmA8sAd9FEd6LomZ2WOMRnQtxilzLv42/eVpD1g
 P0DbrsbQRYuOPu50XDgHA32GUNB4G7WAh8iAh4+pxzNmlCe/2DRqhUpQYhz6EXbfeb9/
 YRWH5ezJNmB0vD0To4LkxYKsyZs6iXL9lqNKu+KTcZrf0TpN5iLPOS3TAoHiCP4MmAs3
 eyw0jJ0bg5ZHZXot6PdAzE4Bk1vOaTKVTW1IueoQErsNVPPjirRNRI/eOWY44BvlWHNY
 2X3cSePgzRHJ9hlNamtOARfZ73/GjEaPswkRCaroqndw0mF2BQAB2ZBZXO++iiwrNvDJ
 p7SA==
X-Gm-Message-State: AOAM533lAvp7Xqgzsy4ofZu8pI1zJR8/xYeAMPUYVGssWgVMi8PAXIYP
 vc6Fkg2FL7wyEY5CarK57Fo=
X-Google-Smtp-Source: ABdhPJwf1sz9M6qF4eIkT+DjeymtRDN+sWwDCj4MW70lCAvFkUVjiC0xRpC8md+OJqHHyPuAvunO5g==
X-Received: by 2002:a05:600c:34c4:b0:389:a4c3:c4b1 with SMTP id
 d4-20020a05600c34c400b00389a4c3c4b1mr7160073wmq.65.1647000275519; 
 Fri, 11 Mar 2022 04:04:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm6939485wmh.31.2022.03.11.04.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 04:04:34 -0800 (PST)
Message-ID: <a92b23e8-e545-a43d-7283-6c6d215a10f8@redhat.com>
Date: Fri, 11 Mar 2022 13:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
 <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
 <YisWGCF9oIkr5yeB@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YisWGCF9oIkr5yeB@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/22 10:27, Stefan Hajnoczi wrote:
>> Not quite voluntarily, but I noticed I had to add one 0 to make them run for
>> a decent amount of time.  So yeah, it's much faster than siglongjmp.
> That's a nice first indication that performance will be good. I guess
> that deep coroutine_fn stacks could be less efficient with stackless
> coroutines compared to ucontext, but the cost of switching between
> coroutines (enter/yield) will be lower with stackless coroutines.

Note that right now I'm not placing the coroutine_fn stack on the heap, 
it's still allocated from a contiguous area in virtual address space. 
The contiguous allocation is wrapped by coroutine_stack_alloc and 
coroutine_stack_free, so it's really easy to change them to malloc and free.

I also do not have to walk up the whole call stack on coroutine_fn 
yields, because calls from one coroutine_fn to the next are tail calls; 
in exchange for that, I have more indirect calls than if the code did

     if (next_call() == COROUTINE_YIELD) {
         return COROUTINE_YIELD;
     }

For now the choice was again just the one that made the translation easiest.

Today I also managed to implement a QEMU-like API on top of C++ coroutines:

     CoroutineFn<int> return_int() {
         co_await qemu_coroutine_yield();
         co_return 30;
     }

     CoroutineFn<void> return_void() {
         co_await qemu_coroutine_yield();
     }

     CoroutineFn<void> co(void *) {
         co_await return_void();
         printf("%d\n", co_await return_int())
         co_await qemu_coroutine_yield();
     }

     int main() {
         Coroutine *f = qemu_coroutine_create(co, NULL);
         printf("--- 0\n");
         qemu_coroutine_enter(f);
         printf("--- 1\n");
         qemu_coroutine_enter(f);
         printf("--- 2\n");
         qemu_coroutine_enter(f);
         printf("--- 3\n");
         qemu_coroutine_enter(f);
         printf("--- 4\n");
     }

The runtime code is absurdly obscure; my favorite bit is

     Yield qemu_coroutine_yield()
     {
         return Yield();
     }

:) However, at 200 lines of code it's certainly smaller than a 
source-to-source translator.  It might be worth investigating a bit 
more.  Only files that define or use a coroutine_fn (which includes 
callers of qemu_coroutine_create) would have to be compiled as C++.

Paolo

