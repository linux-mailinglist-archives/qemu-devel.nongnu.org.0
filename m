Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA65266C3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:10:52 +0200 (CEST)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXsR-0006rw-Kd
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npXcj-0005al-Da
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npXcg-0001dO-8q
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnAYrzLDeyFVnlzykTanpYmaADszSWs6mD1wcojC0rI=;
 b=DumLwf4GBNIvkzxwcpTNwRPJF3RYCMxVMMxHsIbdMcLnmYdrJnz9Y5TapAFtAtWCegsXw9
 EHcotVX6Vx+rwSLoFTbvacJhcr3Q6SzL6cDHB0WfbAAizvKe/d2krp2ftn7ViVjsh+Hscj
 t0a8vJKpBEkvQiNAdGhrhZqkq4uqQR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-xp6F_jcOOT6SbVtTtbcn7Q-1; Fri, 13 May 2022 11:54:30 -0400
X-MC-Unique: xp6F_jcOOT6SbVtTtbcn7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29EB5811E75;
 Fri, 13 May 2022 15:54:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69EFC42B943;
 Fri, 13 May 2022 15:54:29 +0000 (UTC)
Date: Fri, 13 May 2022 17:54:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 11/13] coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
Message-ID: <Yn5/NJ7bnTeO4kKL@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
 <20220504142522.167506-12-kwolf@redhat.com>
 <CAFEAcA-bsFEpw-eqKo2pGcXxGRxpiE1_wG6u64mxxCAN-ay5=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-bsFEpw-eqKo2pGcXxGRxpiE1_wG6u64mxxCAN-ay5=w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.05.2022 um 17:27 hat Peter Maydell geschrieben:
> On Wed, 4 May 2022 at 15:34, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> >
> > Thread-Local Storage variables cannot be used directly from coroutine
> > code because the compiler may optimize TLS variable accesses across
> > qemu_coroutine_yield() calls. When the coroutine is re-entered from
> > another thread the TLS variables from the old thread must no longer be
> > used.
> >
> > Use QEMU_DEFINE_STATIC_CO_TLS() for the current and leader variables.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Message-Id: <20220307153853.602859-2-stefanha@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  util/coroutine-ucontext.c | 38 ++++++++++++++++++++++++--------------
> >  1 file changed, 24 insertions(+), 14 deletions(-)
> >
> > diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> > index ed368e1a3e..ddc98fb4f8 100644
> > --- a/util/coroutine-ucontext.c
> > +++ b/util/coroutine-ucontext.c
> > @@ -25,6 +25,7 @@
> >  #include "qemu/osdep.h"
> >  #include <ucontext.h>
> >  #include "qemu/coroutine_int.h"
> > +#include "qemu/coroutine-tls.h"
> >
> >  #ifdef CONFIG_VALGRIND_H
> >  #include <valgrind/valgrind.h>
> > @@ -66,8 +67,8 @@ typedef struct {
> >  /**
> >   * Per-thread coroutine bookkeeping
> >   */
> > -static __thread CoroutineUContext leader;
> > -static __thread Coroutine *current;
> > +QEMU_DEFINE_STATIC_CO_TLS(Coroutine *, current);
> > +QEMU_DEFINE_STATIC_CO_TLS(CoroutineUContext, leader);
> 
> Hi; Coverity complains about this change (CID 1488745):
> 
> # Big parameter passed by value (PASS_BY_VALUE)
> # pass_by_value: Passing parameter v of type CoroutineUContext
> # (size 304 bytes) by value, which exceeds the medium threshold
> # of 256 bytes.

The macro defines functions get_leader()/set_leader(), which would
indeed have this problem, but they are never called. Not sure if it's
worth having a separate macro that avoids generating these unused
functions for cases like this, but in practice it's a false positive.

Kevin


