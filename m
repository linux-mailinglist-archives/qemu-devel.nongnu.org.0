Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0553D55D9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:49:19 +0200 (CEST)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wIY-0004ZH-Pl
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7wHB-0003BX-Lv
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7wH9-0002th-K2
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627289269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aP1cPA2/DkOODxdpVKYD4mPU5pFc4X4E4WVwENcjDS8=;
 b=WnUXb4pE4ZNSr4Xpc/Y2/BbUVpKpam+08gLYEpqZaWJbl88dMPuCLUeuFTeCHHrUy9oh79
 /7ovw1xjhsYM5hi2erYyP+U2amMsoIEM5ToGbhQAwRwlhmKt0LpORPuML+mBUAyKHGn0Yo
 hDSayIei0M8YnKqwaSZzWAE5ZFEpJTY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-KHH705jmNyGCdBtEc7MaYw-1; Mon, 26 Jul 2021 04:47:47 -0400
X-MC-Unique: KHH705jmNyGCdBtEc7MaYw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so605769wmj.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 01:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aP1cPA2/DkOODxdpVKYD4mPU5pFc4X4E4WVwENcjDS8=;
 b=MrNhbqy1CJ1irqmcCKX7MA9UjWX1zFCrEqjYK7R9hA9oN0UBUzmS2GqSx8AyumkHfA
 PnJSQ2luWFYF7w2aABIiZMhXf0QHPxesIGSussDP16jqB1/OstAP1wBIC7eDJWWbw8ae
 U8cfG5HWiN92tuwA88FyEDlO30Dgyodje4HYniiDNXatLXdVK8nocP7AwMjx3zCCQXU4
 1MdhhBHcq/hXqpLjp/BlEFMsQzliueTIYlVyQjE1/hijA5UNeOSZrjcqfsXb1vvAhJId
 +eAnRLQP7GI+BhyWmkXDwkpIBI8xL8X5GLe3bjBJQc2aX02PZr3NQ2htxz/VfDCPrED4
 QbCQ==
X-Gm-Message-State: AOAM530p0pGQSOnNjNQCRqg2Y3tYNCcKisEhofUcv3b81ubNfOrx7B39
 fEJoJf15xlrQuCsVpoEf5iH4z97Bu0kjK1iJCK7jlQIoDlF+GQJ9FMul/OtL8rjRnYeoHe6KP+s
 TCehM1+ZFWu06+V8=
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr18242085wrs.194.1627289266516; 
 Mon, 26 Jul 2021 01:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbxpd5e/8JTFE0ppkpaO5m90S9hKjjeUXgv80FM+MeYBVUDyc/0abFhzDuHTbm6W5rMCRvRg==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr18242058wrs.194.1627289266228; 
 Mon, 26 Jul 2021 01:47:46 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id p7sm36711408wmq.5.2021.07.26.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:47:45 -0700 (PDT)
Date: Mon, 26 Jul 2021 09:47:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Joe Mario <jmario@redhat.com>
Subject: Re: Prefetches in buffer_zero_*
Message-ID: <YP52r9ck8jmV/RkR@work-vm>
References: <YPlCJpMIOb2Umc+Z@work-vm>
 <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org>
 <YPnDdT1VYANI0Wzw@work-vm>
 <CA+c1WK7XCgdYTbG5FK3q=x9S1t2p2vxcreEwtiZf5L=rsg0i6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+c1WK7XCgdYTbG5FK3q=x9S1t2p2vxcreEwtiZf5L=rsg0i6g@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Joe Mario (jmario@redhat.com) wrote:
> On Thu, Jul 22, 2021 at 3:14 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
> wrote:
> 
> > * Richard Henderson (richard.henderson@linaro.org) wrote:
> > > On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:
> > > > Hi Richard,
> > > >    I think you were the last person to fiddle with the prefetching
> > > > in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
> > > > prefetching still made sense on modern CPUs, and that their hardware
> > > > generally figures stuff out better on simple increments.
> > > >
> > > >    What was your thinking on this, and did you actually measure
> > > > any improvement?
> > >
> > > Ah, well, that was 5 years ago so I have no particular memory of this.
> > It
> > > wouldn't surprise me if you can't measure any improvement on modern
> > > hardware.
> > >
> > > Do you now measure an improvement with the prefetches gone?
> >
> > Not tried, it just came from Joe's suggestion that it was generally a
> > bad idea these days; I do remember that the behaviour of those functions
> > is quite tricky because there performance is VERY data dependent - many
> > VMs actually have pages that are quite dirty so you never iterate the
> > loop, but then you hit others with big zero pages and you spend your
> > entire life in the loop.
> >
> >
> Dave, Richard:
> My curiosity got the best of me.  So I created a small test program that
> used the buffer_zero_avx2() routine from qemu's bufferiszero.c.

Thanks for testing,

> When I run it on an Intel Cascade Lake processor, the cost of calling
> "__builtin_prefetch(p)" is in the noise range .  It's always "just
> slightly" slower.  I doubt it could ever be measured in qemu.
> 
> Ironically, when I disabled the hardware prefetchers, the program slowed
> down over 33%.  And the call to "__builtin_prefetch(p)" actually hurt
> performance by over 3%.

Yeh that's a bit odd.

> My results are below, (only with the hardware prefetchers enabled).  The
> program is attached.
> Joe
> 
> # gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do
> ./a.out; done
> TSC 356144 Kcycles.
> TSC 356714 Kcycles.
> TSC 356707 Kcycles.
> TSC 356565 Kcycles.
> TSC 356853 Kcycles.
> # gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
> TSC 355520 Kcycles.
> TSC 355961 Kcycles.
> TSC 355872 Kcycles.
> TSC 355948 Kcycles.
> TSC 355918 Kcycles.

This basically agrees with the machines I've just tried your test on -
*except* AMD EPYC 7302P's - that really like the prefetch:

[root@virtlab720 ~]# gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do ./a.out; done
TSC 322162 Kcycles.
TSC 321861 Kcycles. 
TSC 322212 Kcycles. 
TSC 321957 Kcycles.
TSC 322085 Kcycles. 
 
[root@virtlab720 ~]# gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
TSC 377988 Kcycles. 
TSC 380125 Kcycles. 
TSC 379440 Kcycles.
TSC 379689 Kcycles. 
TSC 379571 Kcycles. 
 
The 1st gen doesn't seem to see much difference with/without it.

Probably best to leave this code as is!

Dave


> Dave
> > >
> > > r~
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >

> /*
>  * Simple program to test if a prefetch helps or hurts buffer_zero_avx2.
>  *
>  * Compile with either:
>  *  gcc -mavx buffer_zero_avx.c -O 
>  * or
>  *  gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH 
>  */
> 
> #include <immintrin.h>
> #include <stdio.h>
> #include <stdint.h>
> #include <stddef.h>
> #include <sys/mman.h>
> #include <string.h>
> 
> #define likely(x)       __builtin_expect((x),1)
> #define unlikely(x)     __builtin_expect((x),0)
> 
> static __inline__ u_int64_t start_clock();
> static __inline__ u_int64_t stop_clock();
> static int buffer_zero_avx2(const void *buf, size_t len);
> 
> /*
>  * Allocate a large chuck of anon memory, touch/zero it, 
>  * and then time the call to buffer_zero_avx2().
>  */
> int main() 
> {
>    long i;
>    size_t mmap_len = 2UL*1024*1024*1024;
>    char *ptr = mmap(NULL, mmap_len,
>        PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0L);
> 
>    if (ptr == MAP_FAILED) {
>        perror(" mmap");
>        exit(1);
>    }
> 
>    // Touch the pages (they're already cleared)
>    memset(ptr,0x0,mmap_len);
> 
>    u_int64_t start_rdtsc = start_clock();
> 
>    buffer_zero_avx2(ptr, mmap_len);
> 
>    u_int64_t stop_rdtsc = stop_clock();
>    u_int64_t diff = stop_rdtsc - start_rdtsc;
> 
>    printf("TSC %ld Kcycles. \n", diff/1000);
> 
> }
> 
> static int 
> buffer_zero_avx2(const void *buf, size_t len)
> {
>     /* Begin with an unaligned head of 32 bytes.  */
>     __m256i t = _mm256_loadu_si256(buf);
>     __m256i *p = (__m256i *)(((uintptr_t)buf + 5 * 32) & -32);
>     __m256i *e = (__m256i *)(((uintptr_t)buf + len) & -32);
> 
>     if (likely(p <= e)) {
>         /* Loop over 32-byte aligned blocks of 128.  */
>         do {
> #ifdef DO_PREFETCH
>              __builtin_prefetch(p);
> #endif
>             if (unlikely(!_mm256_testz_si256(t, t))) {
>                 printf("In unlikely buffer_zero, p:%lx \n",p);
>                 return 0;
>             }
>             t = p[-4] | p[-3] | p[-2] | p[-1];
>             p += 4;
>         } while (p <= e);
>     } else {
>         t |= _mm256_loadu_si256(buf + 32);
>         if (len <= 128) {
>             goto last2;
>         }
>     }
> 
>     /* Finish the last block of 128 unaligned.  */
>     t |= _mm256_loadu_si256(buf + len - 4 * 32);
>     t |= _mm256_loadu_si256(buf + len - 3 * 32);
> last2:
>     t |= _mm256_loadu_si256(buf + len - 2 * 32);
>     t |= _mm256_loadu_si256(buf + len - 1 * 32);
>   
>     // printf("End of buffer_zero_avx2\n");
>     return _mm256_testz_si256(t, t);
> }
> 
> static __inline__ u_int64_t 
> start_clock() {
>     // See: Intel Doc #324264, "How to Benchmark Code Execution Times on Intel...",
>     u_int32_t hi, lo;
>     __asm__ __volatile__ (
>         "CPUID\n\t"
>         "RDTSC\n\t"
>         "mov %%edx, %0\n\t"
>         "mov %%eax, %1\n\t": "=r" (hi), "=r" (lo)::
>         "%rax", "%rbx", "%rcx", "%rdx");
>     return ( (u_int64_t)lo) | ( ((u_int64_t)hi) << 32);
> }
> 
> static __inline__ u_int64_t 
> stop_clock() {
>     // See: Intel Doc #324264, "How to Benchmark Code Execution Times on Intel...",
>     u_int32_t hi, lo;
>     __asm__ __volatile__(
>         "RDTSCP\n\t"
>         "mov %%edx, %0\n\t"
>         "mov %%eax, %1\n\t"
>         "CPUID\n\t": "=r" (hi), "=r" (lo)::
>         "%rax", "%rbx", "%rcx", "%rdx");
>     return ( (u_int64_t)lo) | ( ((u_int64_t)hi) << 32);
> }
> 
> 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


