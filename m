Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A532E294F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 01:26:50 +0100 (CET)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksawT-0007mn-Oj
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 19:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ksav1-0007HR-6m
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 19:25:19 -0500
Received: from relay68.bu.edu ([128.197.228.73]:59413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ksauy-0007EE-Nn
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 19:25:18 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0BP0O95E006818
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 24 Dec 2020 19:24:12 -0500
Date: Thu, 24 Dec 2020 19:24:09 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH 4/4] fuzz: delay IO until they can't trigger the crash
Message-ID: <20201225002409.ia6o4jmbazy3m3ba@mozz.bu.edu>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB14920C8592A1D04D4A5685D9FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <20201221211704.qiai5j75fmcqrueo@mozz.bu.edu>
 <SYYP282MB150122E885AC35FD9E63E851FCDF0@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
 <20201222183013.k2zrmdyziv722lj3@mozz.bu.edu>
 <7df9cce0033de87f3f7e8b0019f71b4c0428e68c.camel@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df9cce0033de87f3f7e8b0019f71b4c0428e68c.camel@outlook.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "darren.kenny@oracle.com" <darren.kenny@oracle.com>,
 "bsd@redhat.com" <bsd@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201223 0920, Qiuhao Li wrote:
> On Tue, 2020-12-22 at 13:30 -0500, Alexander Bulekov wrote:
> > On 201222 1922, Qiuhao Li wrote:
> > > On Mon, 2020-12-21 at 16:17 -0500, Alexander Bulekov wrote:
> > > > On 201220 0256, Qiuhao Li wrote:
> > > > > Since programmers usually trigger an IO just before they need
> > > > > it.
> > > > > Try to
> > > > > delay some IO instructions may help us better understanding the
> > > > > timing
> > > > > context when debug.
> > > > >
> > > > > Tested with Bug 1908062. Refined vs. Original result:
> > > > >
> > > > > outl 0xcf8 0x8000081c            outl 0xcf8 0x0
> > > > > outb 0xcfc 0xc3                | outl 0xcf8 0x8000081c
> > > > > outl 0xcf8 0x80000804          | outb 0xcfc 0xc3
> > > > > outl 0xcfc 0x10000006          | outl 0xcf8 0x80000804
> > > > > write 0xc300001028 0x1 0x5a    | outl 0xcfc 0x10000006
> > > > > write 0xc300001024 0x2 0x10    | write 0xc300001028 0x1 0x5a
> > > > > write 0xc30000101c 0x1 0x01    | writel 0xc30000100c 0x2a6f6c63
> > > > > write 0xc300003002 0x1 0x0     v write 0xc300001024 0x2 0x10
> > > > > write 0x5c 0x1 0x10              write 0xc30000101c 0x1 0x01
> > > > > writel 0xc30000100c 0x2a6f6c63   write 0xc300001018 0x1 0x80
> > > > > write 0xc300001018 0x1 0x80      write 0x5c 0x1 0x10
> > > > > outl 0xcf8 0x0                   write 0xc300003002 0x1 0x0
> > > > >
> > > >
> > > > In this example, I can remove the outl 0xcf8 0x0, and I still see
> > > > the
> > > > crash, so maybe the 1st step in the minimizer is failing
> > > > somewhere..
> > >
> > > I think it might because of our one-time scan and remove strategy,
> > > which is not suitable for timing dependent instructions.
> > >
> > > For example, instruction A will indicate an address where the
> > > config
> > > chunk locates, and instruction B will make the configuration
> > > active. If
> > > we have the following instruction sequence:
> > >
> > > ...
> > > A1
> > > B1
> > > A2
> > > B2
> > > ...
> > >
> > > A2 and B2 are the actual instructions that trigger the bug.
> > >
> > > If we scan from top to bottom, after we remove A1, the behavior of
> > > B1
> > > might be unknowable, including not to crash the program. But we
> > > will
> > > successfully remove B1 later cause A2 and B2 will crash the process
> > > anyway:
> > >
> > > ...
> > > A1
> > > A2
> > > B2
> > > ...
> > >
> > > Now one more trimming will remove A1.
> > >
> > > As for the example I gave, the instructions before the delaying
> > > minimizer are like this:
> > >
> > > outl 0xcf8 0x8000081c
> > > outb 0xcfc 0xc3
> > > outl 0xcf8 0x0                <--- The A instruction, didn't be
> > > removed
> > > (outl 0xcfc 0x0)              <--- The B instruction, removed
> > > outl 0xcf8 0x80000804
> > > outl 0xcfc 0x10000006
> > > write 0xc300001024 0x2 0x10
> > > write 0xc300001028 0x1 0x5a
> > > write 0xc30000101c 0x1 0x01
> > > writel 0xc30000100c 0x2a6f6c63
> > > write 0xc300001018 0x1 0x80
> > > write 0x5c 0x1 0x10
> > > write 0xc300003002 0x1 0x0
> > >
> > > If we run the remove minimizer again, The A instruction outl 0xcf8
> > > 0x0
> > > will be removed.
> > >
> > > Since we only remove instructions, this iterative algorithm is
> > > converging. Maybe we can keep removing the trace until the
> > > len(newtrace) become unchanged.
> > >
> >
> > I found a bunch of work related to this "test-case minimization".
> > There
> > are algorithms such as "ddmin" that try to tackle this. There might
> > be
> > some interesting ideas there.
> 
> Thanks, I will have a look.
> 
> > I think in the perfect case, we would need to be able to remove A and
> > B
> > at the same time. You described the situation where B1 might lead to
> > a
> > bad state without A1, but there is also the possibility that A1 might
> > leave bad state around, without B1. And both of these might be true
> > at
> > the same time :) Probably not something we encounter very often,
> > though.
> 
> You are right, and even there can be three instructions which must be removed together ;) But for now, how about we just add a if(len(newtrace) == old_len) loop  around remove minimizer? No harm.
> 
Sounds good to me. Certainly an improvement over what we have now.

> Do you think this kind of dependence will exist in bits of the write/out commands? How about adding if(num_bits(data) == old_num) loop around the setting zero minimizer?
> 

It may be, however, I am worried about the peformance penalty of
bit-wise minimization. If the penalty is too great, it might make sense
to make bit-wise minimzation optional (argv or env variable).

As a side note, I think I just minimized one of the largest reproducers
reported by OSS-Fuzz so-far (by qtest command count):
https://bugs.launchpad.net/qemu/+bug/1909261/comments/2

It's 320k bytes (6500 QTest instructions). The current script got it
down to 61k (2846 instructions), and it probably took 2+ hours.
This might be a good benchmark for testing improvements to the script
both in terms of time to minimize, and degree of minimization :)
-Alex

> > > > Is the Refined one better? To me the original one read as:
> > > > "Do a bunch of PCI configuration to map an MMIO BAR, then
> > > > interact
> > > > with
> > > > the MMIO range and trigger some DMA activity". I also know
> > > > exactly
> > > > the
> > > > line that will trigger the DMA activity and access 0x5c. With the
> > > > refined one, I'm not so sure. Which line now causes the DMA read
> > > > from
> > > > 0x5c? writel 0xc30000100c? write 0xc300001018?
> > > > Is there another example where this type of reordering makes the
> > > > result
> > > > easier to read?
> > > >
> > > > > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > > > > ---
> > > > >  scripts/oss-fuzz/minimize_qtest_trace.py | 21
> > > > > +++++++++++++++++++++
> > > > >  1 file changed, 21 insertions(+)
> > > > >
> > > > > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > > index f3e88064c4..da7aa73b3c 100755
> > > > > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > > @@ -214,6 +214,27 @@ def minimize_trace(inpath, outpath):
> > > > >
> > > > >      assert(check_if_trace_crashes(newtrace, outpath))
> > > > >
> > > > > +    # delay IO instructions until they can't trigger the crash
> > > > > +    # Note: O(n^2) and many timeouts, kinda slow
> > > >
> > > > Maybe do a binary search instead of a linear scan for the optimal
> > > > position
> > > > to save some time?
> > > > Also, if you re-run this multiple times, you can end up with
> > > > different
> > > > results, since some lines might not really be tied to a position
> > > > (e.g.
> > > > the outl cf8 0x0 in your example). Maybe it's not a problem, but
> > > > i'm
> > > > still not sure that this is making the result easier to read.
> > > > -Alex
> > >
> > > I'm not familiar with the PCI configuration and DMA mechanism in
> > > QEMU.
> > > This patch is just random thinking based on empiricism. Maybe I
> > > should
> > > add the "RFC" tag :). In version 2, I won't post this patch.
> > >
> > > BTW, may I ask where I can learn about these IO emulations? How do
> > > you
> > > know the address corresponding to the PCI bar and DMA?
> >
> > On PCs, the PCI configuration space is accessed using two I/O ports:
> > 0xcfc and 0xcf8. To interact further with a  PCI device, you have to
> > configure its BARs (i.e. the Port IO and memory ranges that will map
> > to
> > device registers).
> > https://en.wikipedia.org/wiki/PCI_configuration_space#Bus_enumeration
> >
> > So we can look at the trace again. First there are no virtio-vga
> > MMIO/PIO
> > ranges accessible, so the only thing the fuzzer can do is interact
> > with
> > its PCI configuration space using 0xCF8/CFC:
> >
> > outl 0xcf8 0x8000081c
> > outb 0xcfc 0xc3
> > ^^^ The above two lines write the value 0xc3 to PCI config address
> > 0x1c
> > for the vga device. You can confirm this by running the testcase with
> > -trace pci\*. 0x1c is the location of the PCI register that
> > represents
> > BAR #3 for the device.
> > outl 0xcf8 0x80000804
> > outb 0xcfc 0x06
> > ^^^ These two lines write to the PCI command register (0x04) to allow
> > the device to respond to memory accesses.
> >
> > write 0xc300001024 0x2 0x0040
> > write 0xc300001028 0x1 0x5a
> > write 0xc30000101c 0x1 0x01
> > writel 0xc30000100c 0x20000000
> > write 0xc300001016 0x3 0x80a080
> > write 0xc300003002 0x1 0x80
> > ^^^ Now we start to see what looks like MMIO accesses. And if we look
> > at
> > the output of -trace pci\* we will find that the 0xc3 value we wrote
> > above, configured an MMIO range at 0xc300000000. That is why the MMIO
> > accesses are close to that address.
> >
> > write 0x5c 0x1 0x10
> > ^^^ This I am guessing is a DMA command. Usually I know this simply
> > by
> > looking at the [DMA] annotations in the input file to
> > reorder_fuzzer_qtest_trace.py. This just means that the device tried
> > to
> > read from this location in memory, so the fuzzer placed some data
> > there.
> >
> > Beyond just broadly seeing that there are some initial PCI
> > configurations on registers 0xCF8/0xCFC, some accesses to addresses
> > that
> > look like an MMIO range, and one line that probably puts one byte at
> > address 0x5c in ram, I can't really tell anything else just by
> > looking
> > at the trace. To write the descriptions above, I had to look at
> > PCI-related resources. Im not convinced that reordering the accesses
> > will really help much with this. Probably the best aid I found for
> > understanding traces are good trace events (when they exist).
> >
> > -Alex
> 
> Thank you so much for such a detailed and patient explanation! I will use tracing to analyze IO events in the future.
> 
> The delaying minimizer seems not constructive. I won't post it in version 2.
> 
> Thanks again :)
> 
> > > > > +    i = len(newtrace) - 1
> > > > > +    while i >= 0:
> > > > > +        tmp_i = newtrace[i]
> > > > > +        if len(tmp_i) < 2:
> > > > > +            i -= 1
> > > > > +            continue
> > > > > +        print("Delaying ", newtrace[i])
> > > > > +        for j in reversed(range(i+1, len(newtrace)+1)):
> > > > > +            newtrace.insert(j, tmp_i)
> > > > > +            del newtrace[i]
> > > > > +            if check_if_trace_crashes(newtrace, outpath):
> > > > > +                break
> > > > > +            newtrace.insert(i, tmp_i)
> > > > > +            del newtrace[j]
> > > > > +        i -= 1
> > > > > +
> > > > > +    assert(check_if_trace_crashes(newtrace, outpath))
> > > > > +    # maybe another removing round
> > > > > +
> > > > >
> > > > >  if __name__ == '__main__':
> > > > >      if len(sys.argv) < 3:
> > > > > --
> > > > > 2.25.1
> > > > >

