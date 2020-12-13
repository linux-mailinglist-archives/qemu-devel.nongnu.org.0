Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9D2D8B02
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 03:52:41 +0100 (CET)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koHV1-0002f2-Iw
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 21:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1koHU8-0002Fr-5n
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 21:51:44 -0500
Received: from relay68.bu.edu ([128.197.228.73]:56308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1koHU6-0006EX-9U
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 21:51:43 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0BD2pFb3020422
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Dec 2020 21:51:19 -0500
Date: Sat, 12 Dec 2020 21:51:15 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/9] fuzz: Make fork_fuzz.ld compatible with LLVM's LLD
Message-ID: <20201213025115.axkouhze5ilxqztb@mozz.bu.edu>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-2-dbuono@linux.vnet.ibm.com>
 <20201106145028.qlkng2l25b7ehvsb@mozz.bu.edu>
 <edfa9312-f2cf-7f6e-f77a-b63dde380d96@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edfa9312-f2cf-7f6e-f77a-b63dde380d96@linux.vnet.ibm.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.342, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201119 1706, Daniele Buono wrote:
> Thanks Alex,
> do you think you could also give it a try linking with LLD?
> 
> just add --extra-ldflags="-fuse-ld=lld"
> 
> I do see some small differences when moving from BFD ro LLD, but they should
> not be of importance. The position of the data.fuzz* is kept.
> 
> size -A on qemu-fuzz-i386, LTO DISABLED:
> 
> BFD
> section                  size       addr
> [...]
> .got                    10704   29849128
> .data                 1160800   29859840
> __sancov_pcs          3362992   31020640
> .data.fuzz_start       210187   34385920
> .data.fuzz_ordered     211456   34596352
> .bss                  9659608   34807808
> .comment                  225          0
> [...]
> 
> BFD
> section                  size       addr
> [...]
> .got                      816   27824632
> .got.plt                 9992   27825448
> .data                 1160808   27839536
> .data.fuzz_start       210187   29003776
> .data.fuzz_ordered     211456   29214208
> .data.fuzz_end              0   29425664
> .tm_clone_table             0   29425664
> __sancov_pcs          3362992   29425664
> .bss                  9659624   32788672
> 
> I tried running the fuzzer and didn't seem to have any issues, but I
> haven't tried a test-build with OSS-Fuzz. Is there a info somewhere
> on how to do that?
> 
> Thanks,
> Daniele
> 

Hi Daniele,
Sorry for the late response. I tried linking the fuzzer with lld, and
everything looks good. 

OSS-Fuzz just runs scripts/oss-fuzz/build.sh with some environment
variables set (CC, CXX, CFLAGS, LIB_FUZZING_ENGINE ...). To get this to
work with that script, we would just need to pass the corresponding
arguments to ./configure and find a way to locate and specify
llvm-ar-{11,12,...}.

So far I haven't noticed too much of a performance increase with -flto,
but I need to run some more tests. We probably spend too much time in
the kernel (fork()-ing for each input, etc) for the gains to show up.
-Alex

> On 11/6/2020 9:50 AM, Alexander Bulekov wrote:
> > On 201105 1718, Daniele Buono wrote:
> > > LLVM's linker, LLD, supports the keyword "INSERT AFTER", starting with
> > > version 11.
> > > However, when multiple sections are defined in the same "INSERT AFTER",
> > > they are added in a reversed order, compared to BFD's LD.
> > > 
> > > This patch makes fork_fuzz.ld generic enough to work with both linkers.
> > > Each section now has its own "INSERT AFTER" keyword, so proper ordering is
> > > defined between the sections added.
> > > 
> > 
> > Hi Daniele,
> > Good to know that LLVM now has support for "INSERT AFTER" :)
> > 
> > I compared the resulting symbols between __FUZZ_COUNTERS_{START,END}
> > (after linking with BFD) before/after this patch, and they look good. I
> > also ran a test-build with OSS-Fuzz container and confirmed that the
> > resulting binary also had proper symbols.
> > 
> > Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > 
> > Thanks
> > 
> > > Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> > > ---
> > >   tests/qtest/fuzz/fork_fuzz.ld | 12 +++++++++++-
> > >   1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/qtest/fuzz/fork_fuzz.ld b/tests/qtest/fuzz/fork_fuzz.ld
> > > index bfb667ed06..cfb88b7fdb 100644
> > > --- a/tests/qtest/fuzz/fork_fuzz.ld
> > > +++ b/tests/qtest/fuzz/fork_fuzz.ld
> > > @@ -16,6 +16,11 @@ SECTIONS
> > >         /* Lowest stack counter */
> > >         *(__sancov_lowest_stack);
> > >     }
> > > +}
> > > +INSERT AFTER .data;
> > > +
> > > +SECTIONS
> > > +{
> > >     .data.fuzz_ordered :
> > >     {
> > >         /*
> > > @@ -34,6 +39,11 @@ SECTIONS
> > >          */
> > >          *(.bss._ZN6fuzzer3TPCE);
> > >     }
> > > +}
> > > +INSERT AFTER .data.fuzz_start;
> > > +
> > > +SECTIONS
> > > +{
> > >     .data.fuzz_end : ALIGN(4K)
> > >     {
> > >         __FUZZ_COUNTERS_END = .;
> > > @@ -43,4 +53,4 @@ SECTIONS
> > >    * Don't overwrite the SECTIONS in the default linker script. Instead insert the
> > >    * above into the default script
> > >    */
> > > -INSERT AFTER .data;
> > > +INSERT AFTER .data.fuzz_ordered;
> > > -- 
> > > 2.17.1
> > > 
> > 

