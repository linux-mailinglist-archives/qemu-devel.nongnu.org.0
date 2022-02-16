Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8415D4B9293
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:43:58 +0100 (CET)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKR9Z-0002A5-78
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:43:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nKR7J-0000XH-Lz
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nKR6q-00072m-Ax
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645044066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLMudiywTVi+lYp2St98ZH5sYEoA5qi1FBjpkD9IpXs=;
 b=XNg3c9vC39oRe8wunh9Vzc2lpU98ptI1kseEX+PXZFczvrFTZ5VRmCtRM5n5j1kg6++9HJ
 lS1ezovrlG5BGoiau4QlcYbr3p2yugLrTVY24NjTEOljAGwQoJ1fP+NkVbiKZgKh9yZo81
 RoHfgXDV62PHBMpm2QtRqAO0gQd0PrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-MmL60RU3Mg21RW3k1CFzOA-1; Wed, 16 Feb 2022 15:41:04 -0500
X-MC-Unique: MmL60RU3Mg21RW3k1CFzOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B9DE1091DA1;
 Wed, 16 Feb 2022 20:41:03 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.195.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44C64101F6D4;
 Wed, 16 Feb 2022 20:40:35 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Portable inline asm to get address of TLS variable
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
Date: Wed, 16 Feb 2022 21:40:34 +0100
In-Reply-To: <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 (Stefan Hajnoczi's message of "Wed, 16 Feb 2022 20:28:47 +0000")
Message-ID: <877d9uzgsd.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi:

> On Wed, 16 Feb 2022 at 18:14, Florian Weimer <fweimer@redhat.com> wrote:
>>
>> * Stefan Hajnoczi:
>>
>> > I've been trying to make the inline asm that gets the address of a TLS
>> > variable for QEMU coroutines pass QEMU's GitLab CI.
>> > https://gitlab.com/stefanha/qemu/-/blob/coroutine-tls-fix/include/qemu/coroutine-tls.h#L89
>> >
>> > The code isn't -fPIC-friendly (R_X86_64_TPOFF32 relocations aren't
>> > allowed in -fPIC shared libraries) so builds fail with ./configure
>> > --enable-modules. While I was tackling this I stumbled on this:
>> >
>> >   void *dst_ptr;
>> >   asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var))
>> >
>> > What's nice about it:
>> > - It's portable, there are no arch-specific assembly instructions.
>> > - It works for both -fPIC and non-PIC.
>> >
>> > However, I wonder if the compiler might reuse a register that already
>> > contains the address. Then we'd have the coroutine problem again when
>> > qemu_coroutine_yield() is called between the earlier address calculation
>> > and the asm volatile statement.
>> >
>> > Thoughts?
>>
>> Sorry, I don't see why this isn't equivalent to a plain &tls_var.
>> What exactly are you trying to achieve?
>
> &tls_var, except forcing the compiler to calculate the address from scratch.

I think you can compute

  (void *) &tls_var - __builtin_thread_pointer ();

to get the offset.  On many targets, GCC folds away the thread pointer
load, but that doesn't change the outcome.  Then it boils down to
getting access to the thread pointer, and you can get that behind a
compiler barrier (in a separate function).

But going against ABI and toolchain in this way is really no long-term
solution.  You need to switch to stackless co-routines, or we need to
provide proper ABI-level support for this.  Today it's the thread
pointer, tomorrow it's the shadow stack pointer, and the day after that,
it's the SafeStack pointer.  And further down the road, it's some thread
state for garbage collection support.  Or something like that.

Thanks,
Florian


