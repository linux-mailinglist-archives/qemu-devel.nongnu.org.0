Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA324DA1A1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:54:31 +0100 (CET)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBNO-0001if-Lo
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:54:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUBJY-0007iF-HK; Tue, 15 Mar 2022 13:50:33 -0400
Received: from [2a00:1450:4864:20::536] (port=33658
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUBJW-000665-QU; Tue, 15 Mar 2022 13:50:32 -0400
Received: by mail-ed1-x536.google.com with SMTP id r23so2788291edb.0;
 Tue, 15 Mar 2022 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r5G0T24ARFItOfc5m5tESdVun+TcM4tTeuzUzh6x4QU=;
 b=qUrlkzaWsbNU221mnC2aG3Ja2Ykojtw0n5p6MD3KxraI4QsLe+kP9MYI8P7TbRAFf4
 rLMHtxYnaN5yZ7joCjX118UYeKvO7pQ3zlTo6r88H7MFCzHeS//8rAu/rIzGXSY7KOw6
 8E2YdhQ04KIFyMvSok+dqHxN3bf0Tlf7GIcx9C82vTXdxa49lUq0ZmiJ1C+MEWkqpERh
 BWlTk1n5vfAg2bILin3UJNn8Ceo/xi2sfPZTOinZ63jB576RhBTeaDRal/bOh7dZtV3f
 7fpg8EW5UFB+8f05QM3mGshC3gdgKE9gW4LUCPZLqGtM7v0bSr5X4E95O7Q6rNw1ntrX
 bfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r5G0T24ARFItOfc5m5tESdVun+TcM4tTeuzUzh6x4QU=;
 b=26WAutVVUM/jAGhYipfyKstqoXdNHyiMx389B6fdx63AmnDDtwQ1/q/qhVl7DCVzLe
 gi7cV4RWq1h/Cp88P8eCExNI284f3DP/sLmqVwJejPQgLI5Ml7qfKN2GMk4CeJoqX7LN
 OX1WEaNEowwI62b3aCNWNX4LAGP5tLqwI8/uwTaTZVERvRw1deeHkcrAB3dNqp6QiEQ0
 zxJx5ubuY4VnE/CxrhPJdD394U19racwXkI8jC1JKWz8vSOoprjnkh/rfQ0bc2FYeQH3
 z6M7j8WlNzI+5nNSS/jZaSk4unACdxzLcivZUhSDHbhDOPMcAjzHI+cMvrN94+DqO0zB
 V6Rw==
X-Gm-Message-State: AOAM530Kj85f5x8aD6KhzB+Pe1XXZxmYnSOeUDX+58VbQPXnsMHkrRhF
 CiF82ksJWxNDG7AEEBIsPnc=
X-Google-Smtp-Source: ABdhPJxmUKewU9mJp69osBLnDcNrhweISAZhwqJ4TlDOcFcHMaEIsk2T7MatDyNc9Zv/tdFokczQow==
X-Received: by 2002:a05:6402:2753:b0:416:a97:e962 with SMTP id
 z19-20020a056402275300b004160a97e962mr5481817edd.315.1647366628935; 
 Tue, 15 Mar 2022 10:50:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 c14-20020a170906340e00b006ce98f2581asm8366407ejb.205.2022.03.15.10.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:50:28 -0700 (PDT)
Message-ID: <480950c3-b83a-f421-a3d1-0369a69aa70b@redhat.com>
Date: Tue, 15 Mar 2022 18:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <YjC7sorD36xWfhHD@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjC7sorD36xWfhHD@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 17:15, Daniel P. Berrangé wrote:
> Bear with me as I suggest something potentially/probably silly
> given my limited knowledge of C++ coroutines.
> 
> Given a function I know about:
> 
>    void coroutine_fn qio_channel_yield(QIOChannel *ioc,
>                                        GIOCondition condition);
> 
> IIUC, you previously indicated that the header file declaration,
> the implementation and any callers of this would need to be in
> C++ source files.
> 
> The caller is what I'm most curious about, because I feel that
> is where the big ripple effects come into play that cause large
> parts of QEMU to become C++ code. [...]
> I presume there is something special about the CoroutineFn<void>
> prototype preventing that from working as needed, thus requiring
> the caller to be compiled as C++ ? IIUC compiling as C++ though
> is not neccessarily the same as using C++ linkage.

Yes, the CoroutineFn<void> function must either be passed to 
qemu_coroutine_create() or called as "co_await f()".  If you call it as 
"f()" it does nothing except leak the memory needed by its stack frame, 
so that only leaves passing the function to qemu_coroutine_create().

I suppose you could do some games with typedefs, like

#ifdef __cplusplus
typedef CoroutineFn<void> VoidCoroutine
#else
typedef struct VoidCoroutine VoidCoroutine;
#endif

to be able to declare a function that returns CoroutineFn<void> but I'm 
not sure of the advantage.

> So I'm assuming the caller as C++ requirement is not recursive,
> otherwise it would immediately mean all of QEMU needs to be C++.

Right, qemu_coroutine_create() must be called from C++ but the caller of 
qemu_coroutine_create() can be extern "C".  In the particular case of 
the block layer, callers of qemu_coroutine_create() include 
callback-based functions such as bdrv_aio_readv(), and synchronous 
functions such as bdrv_flush().  Both of these can be called from C.

> IOW, can we get it such that the C++ bit is just a thin shim
> "C -> C++ wrapper -> C++ CoroutineFn -> C", enabling all the
> C++ bits to be well encapsulated and thus prevent arbitrary
> usage of C++ features leaking all across the codebase ?

No, unfortunately not.  But in particular, even though the block layer 
would be C++, device models that use it would not.

Paolo

