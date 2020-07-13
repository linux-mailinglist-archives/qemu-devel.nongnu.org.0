Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD721D556
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 13:54:32 +0200 (CEST)
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jux2V-0001mp-Hq
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 07:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jux1M-0000yb-96
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 07:53:20 -0400
Received: from relay64.bu.edu ([128.197.228.104]:47061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jux1K-00048L-G5
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 07:53:19 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 06DBqe1d006532
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 13 Jul 2020 07:52:44 -0400
Date: Mon, 13 Jul 2020 07:52:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 3/3] fuzz: Add callbacks for dma-access functions
Message-ID: <20200713115240.dmfxvi42qfw7huhe@mozz.bu.edu>
References: <20200611055651.13784-1-alxndr@bu.edu>
 <20200611055651.13784-4-alxndr@bu.edu>
 <20200623141456.GK36568@stefanha-x1.localdomain>
 <20200709234855.lpto2yc5fanzgzjs@mozz.bu.edu>
 <20200713114110.GK28639@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713114110.GK28639@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 07:53:17
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 f4bug@amsat.org, darren.kenny@oracle.com, bsd@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200713 1241, Stefan Hajnoczi wrote:
> On Thu, Jul 09, 2020 at 07:48:55PM -0400, Alexander Bulekov wrote:
> > On 200623 1514, Stefan Hajnoczi wrote:
> > > On Thu, Jun 11, 2020 at 01:56:51AM -0400, Alexander Bulekov wrote:
> > > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > > ---
> > > >  exec.c                                | 17 ++++++++++++++++-
> > > >  include/exec/memory.h                 |  8 ++++++++
> > > >  include/exec/memory_ldst_cached.inc.h |  9 +++++++++
> > > >  include/sysemu/dma.h                  |  5 ++++-
> > > >  memory_ldst.inc.c                     | 12 ++++++++++++
> > > >  5 files changed, 49 insertions(+), 2 deletions(-)
> > > 
> > > Please rename dma_read_cb() to fuzz_dma_read_cb() so the purpose of the
> > > function is clear.
> > > 
> > > The ifdefs can be avoided by defining an empty function when CONFIG_FUZZ
> > > is undefined. In a header file:
> > > 
> > >   #ifdef CONFIG_FUZZ
> > >   void fuzz_dma_read_cb(size_t addr, size_t len);
> > >   #else
> > >   static inline void fuzz_dma_read_cb(size_t addr, size_t len)
> > >   {
> > >       /* Do nothing */
> > >   }
> > >   #endif
> > > 
> > 
> > If I understand correctly, this still has the problem that normal
> > qemu-system builds under --enable-fuzzing are broken. I'm not sure if
> > there is some nice solution for this. For example, a sort-of ugly
> > solution could add this to softmmu/main.c (ie something that is linked
> > for the qemu-system build, but not for qemu-fuzz).
> > 
> > #ifdef CONFIG_FUZZ
> > #include "something.h"
> > static void fuzz_dma_read_cb(size_t addr, size_t len)
> > {
> >     /* Do nothing */
> > }
> > #endif
> 
> Another ugly solution is using weak symbols in the main code and a
> strong symbol in the fuzzer target:
> https://en.wikipedia.org/wiki/Weak_symbol

Ok - I'll try that out. I think we'll also need a check in the actual
dma_read_cb function to confirm that we are actually the general-fuzzer.
We don't want to be hooking accesses while e.g. running the non-general
virtio-net fuzzer.

-Alex

> Stefan



