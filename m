Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3744D88FD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:22:55 +0100 (CET)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnTC-0005PR-Dw
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:22:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTnRo-0004Uf-HP; Mon, 14 Mar 2022 12:21:28 -0400
Received: from [2a00:1450:4864:20::431] (port=39675
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTnRm-0004ey-IJ; Mon, 14 Mar 2022 12:21:28 -0400
Received: by mail-wr1-x431.google.com with SMTP id h15so24824757wrc.6;
 Mon, 14 Mar 2022 09:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qCW6hkFoFb5Hj6sPU4I78WU1/b87S6+mrQQzzCmyqA8=;
 b=bTECgoHYceKpRf8U8/fMCvtz+O3W97rkVoXn4bmml+fy103/GODMuUb1fNtra9uyAc
 CifIKy7hY39Ylm22f8mDDngUW53Z/xM+PpZZFNv5VPwbDyOXv74pscUA3WD8MCfv/Mi6
 FmD4A920GbGLz2oufCnxXZCmIouWh3p3rT1DQzN+A3+Ol8+j6E48Ilo2p09kqz9fqLxC
 alB3jayz0q6sTNHa0kbeYgHC0SkJjQInnMMU89CXDeSA8GlPYzOc5CRth68ZJVyL+/ww
 v0HzhW0Dmpx7LJfiRm1CGANWqW54Bhh1TASvt3ssf2eT7TcruxDLHQtuQ8EyJYaj6rvB
 /JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qCW6hkFoFb5Hj6sPU4I78WU1/b87S6+mrQQzzCmyqA8=;
 b=EcxWscL/O++CPdQ+Wn2JvcEa5t0464HdIgq5Z8rYn3SYx+WlShRnND3bSXwuxX1OBa
 ZiDA3ifSqfMEpkYTDPNfsDeGdI1n56VO7rkTOtxUhCvWE9e8v9JQAXeAOyJVwSRu6hMR
 Q1+cQeXptloT5Muet7yqcjyxLQ8mZq8pFXXJJRs/k2zby6LNN0LWHyB5x68NnAZlTdEM
 6y1PZW0mWVbDbCf8nW0dTSzfXRrQle+CeF0zBNngRWbX5Z+NAKcon8OPyp9r4aj0CVi7
 934czeFdWuwpZNRSNrZEn/UDLcwnrEWst4uKUNlVTqoiF1VmPyDXZvkZsIxAFFy/L+ZI
 1pJg==
X-Gm-Message-State: AOAM5322j+7liKWBLSeF0bluZlG3KnUhtwpaE/zmCRvCUoon4EyD/Uzl
 57YPwioj7LKxn/U21donf50=
X-Google-Smtp-Source: ABdhPJwGwJf/YoMCRPWmiKNIZ1SMV1YCQpAKBkAhaET45NNlgFtlt7YvwgyytBY7LwJXpWQJNUyPdg==
X-Received: by 2002:adf:ba05:0:b0:1ef:f640:ea0e with SMTP id
 o5-20020adfba05000000b001eff640ea0emr16946977wrg.59.1647274884244; 
 Mon, 14 Mar 2022 09:21:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 7-20020a05600c228700b00389865c646dsm24266757wmf.14.2022.03.14.09.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 09:21:23 -0700 (PDT)
Message-ID: <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
Date: Mon, 14 Mar 2022 17:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 15:07, Stefan Hajnoczi wrote:
> If we can reach a consensus about C++ language usage in QEMU then I'm in
> favor of using C++ coroutines. It's probably not realistic to think we
> can limit C++ language usage to just coroutines forever. Someone finds
> another C++ feature they absolutely need and over time the codebase
> becomes C++ - with both its advantages and disadvantages.
>
> [...] although you can write C in C++, it's not idiomatic modern C++.
> The language lends itself to a different style of programming that
> some will embrace while others will not.

Yes, this is an important aspect to discuss.  I think coroutines provide 
a good blueprint for how QEMU might use C++.

I totally agree that, if we go this way, the genie is out of the bottle 
and other uses of C++ will pop up with 100% probability.  But the 
important thing to note is that our dialect of C is already not standard 
C, and that some of our or GLib's "innovations" are actually based on 
experience with C++.  We can keep on writing "QEMU's C" if we think of 
C++ as a supercharged way of writing these quality-of-life improvements 
that we already write.  In some sense coroutines are an extreme example 
of this idea.

In fact, a C API would have to remain unless all source files are 
changed to C++, so QEMU would remain mostly a C project with C idioms, 
but that doesn't prevent _abstracting_ the use of C++ features (written 
in modern, idiomatic C++) behind an API that C programmers have no 
problems learning.  Again, coroutines are an example of this of keeping 
the familiar create/enter/yield API and hiding the "magic" of C++ 
coroutines (and when they don't, that had better be an improvement).

In the end, C++ is a tool that you can use if it leads to better code. 
For example, I don't see much use of C++ for devices for example, and 
the storage devices in particular do not even need coroutines because 
they use the callback-based interface.  But perhaps someone will try to 
use templates to replace repeated inclusion (which is common in 
hw/display) and others will follow suit.  Or perhaps not.

One example that was brought up on IRC is type-safe operations on things 
such as hwaddr (i.e. hwaddr+int is allowed but hwaddr-hwaddr gives back 
an int64_t and might even check for overflow).  These would be opt in 
(you get them just by changing a file from .c to .cc), but the actual 
C++ code would still look very much like C code that uses hwaddr with no 
type checking.  All the operator overloading gunk would be in include/.

A different topic is what would happen if all of QEMU could be compiled 
as C++, and could inform our selection of C++ idioms even long before we 
get there.  For example, I'm fine with GLib and our type-safe intrusive 
lists, so I don't have much interest in STL containers and I would 
prefer _not_ to use STL containers even in .cc files[1].  However, 
perhaps QEMU's home-grown lock guard might be replaced by something that 
uses C++ destructors instead of g_autoptr, so perhaps we should consider 
using std::lock_guard<>, or something like that, instead of 
QEMU_LOCK_GUARD.  It may be interesting to pass down lock_guards as 
arguments to enforce "this lock is taken" invariants.

But really, coroutines would be enough work so my dish would be full for 
some time and I wouldn't really have time to look at any of this. :)

Thanks,

Paolo

[1] One big advantage of STL containers for example is that 
std::vector<> automatically constructs objects instead of just filling 
memory with zero (or leaving it uninitialized).  But that doesn't really 
matter if we don't use classes with constructors.

