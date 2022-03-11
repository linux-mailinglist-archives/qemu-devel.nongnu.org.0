Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17164D616D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:20:43 +0100 (CET)
Received: from localhost ([::1]:34618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSeG9-0004Gq-DY
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:20:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSeDN-00030O-19
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:17:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSeDI-0003YX-TI
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647001063;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bNfMvnAeVy6XZG0894Uywj6UiwGyLwY0qbyQYPTPTqw=;
 b=cukmVzTZjq15w05OtAPb4JUObxvVFBghZJWdr81Q4sTdnQMOlZhFk4pa4yLYZP825Dfh8r
 qEk+3oSGleOi86ulHxrvHFFjkooUMvMvBENuzfqXGejhU+GvpvczcJipO7gfJbkeJIjg3S
 3vAqv0UaEABCkfgE/qOSjP5a2xfIlNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-h2M4aDwMNZa0cQW6jRfp2w-1; Fri, 11 Mar 2022 07:17:37 -0500
X-MC-Unique: h2M4aDwMNZa0cQW6jRfp2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 306F31006AA5;
 Fri, 11 Mar 2022 12:17:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D44F4842D9;
 Fri, 11 Mar 2022 12:17:09 +0000 (UTC)
Date: Fri, 11 Mar 2022 12:17:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Message-ID: <Yis9wszzwwu2CGmZ@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
 <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
 <YisWGCF9oIkr5yeB@stefanha-x1.localdomain>
 <a92b23e8-e545-a43d-7283-6c6d215a10f8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a92b23e8-e545-a43d-7283-6c6d215a10f8@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 01:04:33PM +0100, Paolo Bonzini wrote:
> On 3/11/22 10:27, Stefan Hajnoczi wrote:
> > > Not quite voluntarily, but I noticed I had to add one 0 to make them run for
> > > a decent amount of time.  So yeah, it's much faster than siglongjmp.
> > That's a nice first indication that performance will be good. I guess
> > that deep coroutine_fn stacks could be less efficient with stackless
> > coroutines compared to ucontext, but the cost of switching between
> > coroutines (enter/yield) will be lower with stackless coroutines.
> 
> Note that right now I'm not placing the coroutine_fn stack on the heap, it's
> still allocated from a contiguous area in virtual address space. The
> contiguous allocation is wrapped by coroutine_stack_alloc and
> coroutine_stack_free, so it's really easy to change them to malloc and free.
> 
> I also do not have to walk up the whole call stack on coroutine_fn yields,
> because calls from one coroutine_fn to the next are tail calls; in exchange
> for that, I have more indirect calls than if the code did
> 
>     if (next_call() == COROUTINE_YIELD) {
>         return COROUTINE_YIELD;
>     }
> 
> For now the choice was again just the one that made the translation easiest.
> 
> Today I also managed to implement a QEMU-like API on top of C++ coroutines:
> 
>     CoroutineFn<int> return_int() {
>         co_await qemu_coroutine_yield();
>         co_return 30;
>     }
> 
>     CoroutineFn<void> return_void() {
>         co_await qemu_coroutine_yield();
>     }
> 
>     CoroutineFn<void> co(void *) {
>         co_await return_void();
>         printf("%d\n", co_await return_int())
>         co_await qemu_coroutine_yield();
>     }
> 
>     int main() {
>         Coroutine *f = qemu_coroutine_create(co, NULL);
>         printf("--- 0\n");
>         qemu_coroutine_enter(f);
>         printf("--- 1\n");
>         qemu_coroutine_enter(f);
>         printf("--- 2\n");
>         qemu_coroutine_enter(f);
>         printf("--- 3\n");
>         qemu_coroutine_enter(f);
>         printf("--- 4\n");
>     }
> 
> The runtime code is absurdly obscure; my favorite bit is
> 
>     Yield qemu_coroutine_yield()
>     {
>         return Yield();
>     }
> 
> :) However, at 200 lines of code it's certainly smaller than a
> source-to-source translator.  It might be worth investigating a bit more.
> Only files that define or use a coroutine_fn (which includes callers of
> qemu_coroutine_create) would have to be compiled as C++.

Unless I'm misunderstanding what you mean, "define a coroutine_fn"
is a very large number of functions/files

  $ git grep coroutine_fn | wc -l
  806
  $ git grep -l coroutine_fn | wc -l
  132

Dominated by the block layer of course, but tentacles spreading
out into alot of other code.

Feels like identifying all callers would be tedious/unpleasant enough,
that practically speaking we would have to just compile all of QEMU
as C++.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


