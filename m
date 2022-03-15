Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260D4DA623
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 00:14:05 +0100 (CET)
Received: from localhost ([::1]:45864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUGMe-00073Q-C5
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 19:14:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUGHT-0005WV-NR; Tue, 15 Mar 2022 19:08:44 -0400
Received: from [2a00:1450:4864:20::52e] (port=40472
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUGHQ-0005Ed-Kw; Tue, 15 Mar 2022 19:08:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w4so686317edc.7;
 Tue, 15 Mar 2022 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GtQIgfqYVto/XeA47+QCX4Z4KGtMnxwSu1IDzZkQx8c=;
 b=e11zHRKnUc/qJatcvEO282jMQcrEAcirjRQA/FOBAzzfyiywvL4gEJO7Ly3xHbUThp
 z8NnJZsdDIQlLRx1DbuRk3i9S6P7Pf934I36yjNnUQ7MFroUqwlBmffWukWfrBZVZYNn
 qeOr3CRPgb4cIWPLTRyU7SksfYO9KFf0zdD/8pd8Y2oJoHXQbcpuXsGUq70ql2m3+rVc
 oF6TO0W8Ad8tUABuA7P8Yy0Ct4wEVgMsVFllUjKJb2LPNonu6wuN2avHAJ0/djTF3ynS
 OzGblbjaI9YIuej2BbNYLmOlf6BEJ0Ix2BQRvavmE9i4w2YcYEMaWwMhV/GPZ4Lyiql2
 zbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GtQIgfqYVto/XeA47+QCX4Z4KGtMnxwSu1IDzZkQx8c=;
 b=EC7BWgEW1R66nmnePgU7KL5L0zTJssW6JDNZN4Ovt6d2+QDouLkAwmSjB+xI1z+8Xe
 9PsLUPoy9DQPsJkAsKdaGROlg8iC7s6x9abiwOzbvNbHum9pY5HAghFi5EcItyoekvPE
 EmbEOcr9qzKPxxLDoceWtNOuJEgpRa2jvQPuo/uRAD7vWyv9OhohB117mTAoSzggfQIA
 R/mp81BA+PQE4EGOyZMtMy5wfgvR6HHNJHNqO4gydvhra/up2kIxcaJzUYdWkwI8rO+Z
 oH1dvmilPc0n1EtNaq0quOpyfaSM1vsasCZz/umwNR9/TZSznWXc6CG2lNlKECXj1gBU
 wVuw==
X-Gm-Message-State: AOAM5305X0ojAfChkkwuUSCZ6iPaBlLtwAagkWKrRDBSQwgas3ZrXEhX
 xSasfVje4/Zgx9OpmB9kuXc=
X-Google-Smtp-Source: ABdhPJwTC4kiywEJ9SfE0ou8cKrKtPX8UyfdEVmXcF6pHK6uAORM3KTXMAuof3HVga++p2MNqc9bZw==
X-Received: by 2002:a05:6402:42c6:b0:415:fe7d:4963 with SMTP id
 i6-20020a05640242c600b00415fe7d4963mr27519855edc.317.1647385718952; 
 Tue, 15 Mar 2022 16:08:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020a50cfce000000b00415b0730921sm147354edk.42.2022.03.15.16.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 16:08:38 -0700 (PDT)
Message-ID: <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
Date: Wed, 16 Mar 2022 00:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain> <YjCnss5W5MhZK1Hw@redhat.com>
 <YjC2+F2SkNEDOXTe@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjC2+F2SkNEDOXTe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: hreitz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 16:55, Daniel P. Berrangé wrote:
> Expecting maintainers to enforce a subset during code review feels
> like it would be a tedious burden, that will inevitably let stuff
> through because humans are fallible, especially when presented
> with uninspiring, tedious, repetitive tasks.
> 
> Restricting ourselves to a subset is only viable if we have
> an automated tool that can reliably enforce that subset. I'm not
> sure that any such tool exists, and not convinced our time is
> best served by trying to write & maintainer one either.

We don't need to have a policy on which features are used.  We need to 
have goals for what to use C++ for.  I won't go into further details 
here, because I had already posted "When and how to use C++"[1] about an 
hour before your reply.

> IOW, I fear one we allow C++ in any level, it won't be practical
> to constrain it as much we desire. I fear us turning QEMU into
> even more of a monster like other big C++ apps I see which take
> all hours to compile while using all available RAM in Fedora RPM
> build hosts.

Sorry but this is FUD.  There's plenty of C++ apps and libraries that do 
not "take hours to compile while using all available RAM".  You're 
probably thinking of the Chromium/Firefox/Libreoffice triplet but those 
are an order of magnitude larger than QEMU.  And in fact, QEMU is 
*already* a monster that takes longer to compile than most other 
packages, no matter the language they're written in.

Most of KDE and everything that uses Qt is written in C++, and so is 
Inkscape in GTK+ land.  LLVM and Clang are written in C++.  Hotspot and 
V8 are written in C++.  Kodi, MAME and DolphinEmu are written in C++. 
GCC and GDB have migrated to C++ and their compile times have not exploded.

> My other question is whether adoption of C++ would complicate any
> desire to make more use of Rust in QEMU ? I know Rust came out of
> work by the Mozilla Firefox crew, and Firefox was C++, but I don't
> have any idea how they integrated use of Rust with Firefox, so
> whether there are any gotcha's for us or not ?

Any Rust integration would go through C APIs.  Using Rust in the block 
layer would certainly be much harder, though perhaps not impossible, if 
the block layer uses C++ coroutines.  Rust supports something similar, 
but two-direction interoperability would be hard.

For everything else, not much.  Even if using C++, the fact that QEMU's 
APIs are primarily C would not change.  Changing "timer_mod_ns(timer, 
ns)" to "timer.modify_ns(ns)" is not on the table.

But really, first of all the question should be who is doing work on 
integrating Rust with QEMU.  I typically hear about this topic exactly 
once a year at KVM Forum, and then nothing.  We have seen Marc-André's 
QAPI integration experiment, but it's not clear to me what the path 
would be from there to wider use in QEMU.

In particular, after ~3 years of talking about it, it is not even clear:

- what subsystems would benefit the most from the adoption of Rust, and 
whether that would be feasible without a rewrite which will simply never 
happen

- what the plans would be for coexistence of Rust and C code within a 
subsystem

- whether maintainers would be on board with adopting a completely 
different language, and who in the community has enough Rust experience 
to shepherd us through the learning experience

The first two questions have answers in the other message if 
s/Rust/C++/, and as to the last I think we're already further in the 
discussion.

Thanks,

Paolo

