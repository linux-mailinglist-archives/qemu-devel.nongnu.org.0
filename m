Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA84BA443
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:25:06 +0100 (CET)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKieX-0002GC-L6
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:25:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1nKiIl-0004c9-N3
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:02:36 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:48410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1nKiIc-0005og-0O
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:02:33 -0500
Received: from localhost (unknown [89.217.187.128])
 (Authenticated sender: sergesanspaille@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 73E5E5FFCF;
 Thu, 17 Feb 2022 16:02:17 +0100 (CET)
Date: Thu, 17 Feb 2022 16:02:16 +0100
From: Serge Guelton <sguelton@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
Message-ID: <20220217150216.GD11782@sguelton.remote.csb>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <1a17e6e5-fd03-a01b-9692-4dd9d7bffcb0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a17e6e5-fd03-a01b-9692-4dd9d7bffcb0@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: softfail client-ip=212.27.42.5;
 envelope-from=serge.guelton@telecom-bretagne.eu; helo=smtp5-g21.free.fr
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 12:40:40PM +0100, Paolo Bonzini wrote:
> On 2/17/22 10:28, Stefan Hajnoczi wrote:
> >>But going against ABI and toolchain in this way is really no long-term
> >>solution.  You need to switch to stackless co-routines, or we need to
> >>provide proper ABI-level support for this.  Today it's the thread
> >>pointer, tomorrow it's the shadow stack pointer, and the day after that,
> >>it's the SafeStack pointer.  And further down the road, it's some thread
> >>state for garbage collection support.  Or something like that.
> >
> >Yes, understood :(. This does feel like solving an undefined behavior
> >problem by adding more undefined behavior on top!
> 
> Yes, this is the kind of thing that I generally despise when I see
> other programs do it...  it's easy to dig ourselves in the same
> hole.
> 
> >I took a quick look at C++20 coroutines since they are available in
> >compilers but the primitives look hard to use even from C++, let alone
> >from C.
> 
> They're C++ only in GCC, too.  I really think that QEMU should be
> compilable in C++, but I'm not sure how easy a sell it is.

It's perfectly fine to have one compilation unit written in C++ with a few
symbol in `extern "C"`. No need to touch the other part of the project.

