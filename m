Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1684671DC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 07:26:53 +0100 (CET)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt21z-0005by-56
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 01:26:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1mt203-0004vH-S1; Fri, 03 Dec 2021 01:24:51 -0500
Received: from smtp2-g21.free.fr ([212.27.42.2]:43354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1mt1zz-0004WA-Ng; Fri, 03 Dec 2021 01:24:50 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:923:3150:6f60:5f78:f08b:c504])
 (Authenticated sender: sergesanspaille@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8DB862003E8;
 Fri,  3 Dec 2021 07:24:15 +0100 (CET)
Date: Fri, 3 Dec 2021 07:24:14 +0100
From: Serge Guelton <sguelton@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v2 1/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <20211203062414.GA1106@sguelton.remote.csb>
References: <20211201170120.286139-1-stefanha@redhat.com>
 <20211201170120.286139-2-stefanha@redhat.com>
 <CAFEAcA-QU_PERcLCf3WpTc_mTU6LymEaHqVJTtahGRD8H6oT9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-QU_PERcLCf3WpTc_mTU6LymEaHqVJTtahGRD8H6oT9A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: softfail client-ip=212.27.42.2;
 envelope-from=serge.guelton@telecom-bretagne.eu; helo=smtp2-g21.free.fr
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 02:44:42PM +0000, Peter Maydell wrote:
> On Wed, 1 Dec 2021 at 17:19, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Compiler optimizations can cache TLS values across coroutine yield
> > points, resulting in stale values from the previous thread when a
> > coroutine is re-entered by a new thread.
> >
> > Serge Guelton developed an __attribute__((noinline)) wrapper and tested
> > it with clang and gcc. I formatted his idea according to QEMU's coding
> > style and wrote documentation.
> 
> > +#ifdef QEMU_CO_TLS_ADDR
> > +#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                    \
> > +    __thread type co_tls_##var;  \
> > +    static inline type get_##var(void)                          \
> > +    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return *p; }  \
> > +    static inline void set_##var(type v)                        \
> > +    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); *p = v; }     \
> > +    static inline type *get_ptr_##var(void)                     \
> > +    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return p; }
> > +#else
> > +#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                    \
> > +    static __thread type co_tls_##var;                          \
> > +    static __attribute__((noinline, unused)) type get_##var(void)       \
> > +    { return co_tls_##var; }                                    \
> > +    static __attribute__((noinline, unused)) void set_##var(type v)     \
> > +    { co_tls_##var = v; }                                       \
> > +    static __attribute__((noinline, unused)) type *get_ptr_##var(void)  \
> > +    { return &co_tls_##var; }
> > +#endif
> 
> My compiler-developer colleagues present the following case where
> 'noinline' is not sufficient for the compiler to definitely
> use different values of the address-of-the-TLS-var across an
> intervening function call:
> 
>   __thread int i;
> 
>   __attribute__((noinline)) long get_ptr_i()
>   {
>     return (long)&i;
>   }
> 
>   void switcher();
> 
>   int g()
>   {
>     long a = get_ptr_i();
>     switcher();
>     return a == get_ptr_i();
>   }

You can also force an extra mov through `volatile` as in
https://godbolt.org/z/hWvdb7o9G

