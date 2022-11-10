Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F3624071
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5B7-0001Ft-MI; Thu, 10 Nov 2022 05:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ot5B5-0001FV-Uw
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ot5B3-00080v-U8
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668077576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJlF4S4iLf7TX2cMc8TQma/lm38xGwVhqyvUsvpn8mI=;
 b=KWKQ14pcIlADQYhk2v1NKv87gySBjuFXkfsEo3xdISwasF2wWE+5MF3GUVbrXykMJXPTcg
 xpJ5BF/4kBkc60vnvFtRB1Q9Ixqx80Wa0nyuQ5p1MmJD4gYRAHxqzsEglxVtE6BYmS6vPS
 j3loLzscAqEYvwWqfS9G1h9dpyu/pPs=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-EcIlh1MvOlWCrt1p5yjgjw-1; Thu, 10 Nov 2022 05:52:55 -0500
X-MC-Unique: EcIlh1MvOlWCrt1p5yjgjw-1
Received: by mail-vs1-f70.google.com with SMTP id
 m186-20020a6726c3000000b0039b2e2e040dso128108vsm.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJlF4S4iLf7TX2cMc8TQma/lm38xGwVhqyvUsvpn8mI=;
 b=3aZuxDuOxkEwJKt31FxrjrQEGbYn9GF2Y4HF5Z7+GhIYOcD+QwVAuzKAw89LzqhvqQ
 9o9ao8fcD0Ckl0nDECZ5QQH5ebGao4Jx0LLJAoMf6zIyqGeyAhvdYQetfytDOwGYbVXn
 TcPwN/NzcXB6v84vpZLd/pBY6O31Q6JRPxJ06arrFNABToB/XMIbgo9Jwjv0uzO+tttT
 3pFVetIM3ibIkCVqBBn63L6UbGt9jm0eMS08fPU4ceacUzqqN5c0xKOiYYwg6+l38iT7
 hzYctBa37ONZwkFlinPz2UbFnQL4KRB9Q4EWkKrazBwyQ+ADS7ZlRvuGgzSkk/XONuhs
 aeFg==
X-Gm-Message-State: ACrzQf17g1UpCEAg6D1Ta/uhcVxpHO/D6RkI60WG0JKR6m3hv4OxTWgY
 qt+XN7lnBzkbhX3jMa4DhsTdAD+ygnpSFFAb38WNvBkb1FgPYK/J6sA4QwlADiGkfOxquWwAdt/
 XzZqlu3PXmo6fAuwDMEr5Txl+StVUnAY=
X-Received: by 2002:a05:6102:2c3:b0:3aa:1db1:8a22 with SMTP id
 h3-20020a05610202c300b003aa1db18a22mr34256291vsh.62.1668077574938; 
 Thu, 10 Nov 2022 02:52:54 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6BMDRbzNy8ZAuv7/VKgMoXpXmOP4DEFDZdrCA5mzW5VivbO1wUOaieloFuAaxSiGeuK+2TbDpWeoL+1++vjVM=
X-Received: by 2002:a05:6102:2c3:b0:3aa:1db1:8a22 with SMTP id
 h3-20020a05610202c300b003aa1db18a22mr34256278vsh.62.1668077574629; Thu, 10
 Nov 2022 02:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
 <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
 <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
In-Reply-To: <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 10 Nov 2022 11:52:43 +0100
Message-ID: <CABgObfazW2eiiyffz_odFmbQXx8-Yu7fi1RdDwxKOEzocp0Eeg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Alberto Faria <afaria@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Nov 9, 2022 at 1:24 PM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
> > > What I do know is that it's extremely confusing to understand if a
> > > function that is *not* marked as coroutine_fn is actually being called
> > > also from coroutines or not.

Agreed. This is a huge point in favor of pushing coroutine wrappers as
far up in the call stack as possible, because it means more
coroutine_fns and fewer mixed functions.

> > This is a lot better than our "coroutine_fn" sign, which actually do no
> > check (and can't do). Don't you plan to swap a "coroutine_fn" noop
> > marker with more meaningful IN_COROUTINE(); (or something like this,
> > which just do assert(qemu_in_coroutine())) at start of the function? It
> > would be a lot safer.
>
> CCing also Alberto and Paolo
>
> So basically I think what we need is something that scans the whole
> block layer code and puts the right coroutine_fn annotations (or
> assertions, if you want) in the right places.

coroutine_fn markers are done by Alberto's static analyzer, which I
used to add coroutine_fn pretty much everywhere in the code base where
they are *needed*. My rules are simple:

* there MUST be no calls from non-coroutine_fn to coroutine_fn, this is obvious

* there MUST be no blocking in coroutine_fn

* there SHOULD be no calls from coroutine_fn to generated_co_wrapper;
use the wrapped *_co_* function directly instead.

To catch the last one, or possibly the last two, Alberto added
no_coroutine_fn. In a perfect world non-marked functions would be
"valid either in coroutine or non-coroutine function": they would call
neither coroutine_fns nor no_coroutine_fns.

This is unfortunately easier said than done, but in order to move
towards that case, I think we can look again at vrc and extend it with
new commands. Alberto's work covers *local* tests, looking at one
caller and one callee at a time. With vrc's knowledge of the global
call graph, we can find *all* paths from a coroutine_fn to a
generated_co_wrapper, including those that go through unmarked
functions. Then there are two cases:

* if the unmarked function is never called from outside a coroutine,
call the wrapped function and change it to coroutine_fn

* if the unmarked function can be called from outside a coroutine,
change it to a coroutine_fn (renaming it) and add a
generated_co_wrapper. Rinse and repeat.

> However, it would be nice to assign this to someone and do this
> automatically, not doing it by hand. I am not sure if Alberto static
> analyzer is currently capable of doing that.

I think the first step has to be done by hand, because it entails
creating new generated_co_wrappers. Checking for regressions can then
be done automatically though.

Paolo


