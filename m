Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06A2D5C8E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:58:16 +0100 (CET)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMSV-0004Tv-6N
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1knMQ4-0002gO-TU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:55:46 -0500
Received: from relay68.bu.edu ([128.197.228.73]:58099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1knMQ2-00059B-SI
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:55:44 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0BADsx8e007631
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 10 Dec 2020 08:55:03 -0500
Date: Thu, 10 Dec 2020 08:54:59 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] fuzz: map all BARs and enable PCI devices
Message-ID: <20201210135459.w6o7chqwmrorrrmz@mozz.bu.edu>
References: <20201209201054.391408-1-alxndr@bu.edu> <m2im99ao4m.fsf@oracle.com>
 <114d98b5-5c4e-6315-d91d-92c6baf49d09@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <114d98b5-5c4e-6315-d91d-92c6baf49d09@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.344, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201210 1411, Philippe Mathieu-Daudé wrote:
> On 12/10/20 12:36 PM, Darren Kenny wrote:
> > Hi Alex,
> > 
> > On Wednesday, 2020-12-09 at 15:10:54 -05, Alexander Bulekov wrote:
> >> Prior to this patch, the fuzzer found inputs to map PCI device BARs and
> >> enable the device. While it is nice that the fuzzer can do this, it
> >> added significant overhead, since the fuzzer needs to map all the
> >> BARs (regenerating the memory topology), at the start of each input.
> >> With this patch, we do this once, before fuzzing, mitigating some of
> >> this overhead.
> >>
> >> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > 
> > In general this looks good, I've a small comment/nit below, but nothing
> > serious, so:
> > 
> > Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> > 
> >> ---
> >>  tests/qtest/fuzz/generic_fuzz.c | 23 +++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> >> index 07ad690683..d95093ee53 100644
> >> --- a/tests/qtest/fuzz/generic_fuzz.c
> >> +++ b/tests/qtest/fuzz/generic_fuzz.c
> >> @@ -16,6 +16,7 @@
> >>  
> >>  #include "hw/core/cpu.h"
> >>  #include "tests/qtest/libqos/libqtest.h"
> >> +#include "tests/qtest/libqos/pci-pc.h"
> >>  #include "fuzz.h"
> >>  #include "fork_fuzz.h"
> >>  #include "exec/address-spaces.h"
> >> @@ -762,6 +763,22 @@ static int locate_fuzz_objects(Object *child, void *opaque)
> >>      return 0;
> >>  }
> >>  
> >> +
> >> +static void pci_enum(gpointer pcidev, gpointer bus)
> >> +{
> >> +    PCIDevice *dev = pcidev;
> >> +    QPCIDevice *qdev;
> >> +
> >> +    qdev = qpci_device_find(bus, dev->devfn);
> >> +    g_assert(qdev != NULL);
> >> +    for (int i = 0; i < 6; i++) {
> >> +        if (dev->io_regions[i].size) {
> >> +            qpci_iomap(qdev, i, NULL);
> >> +        }
> >> +    }
> >> +    qpci_device_enable(qdev);
> >> +}
> >> +
> >>  static void generic_pre_fuzz(QTestState *s)
> >>  {
> >>      GHashTableIter iter;
> >> @@ -810,6 +827,12 @@ static void generic_pre_fuzz(QTestState *s)
> >>          exit(1);
> >>      }
> >>  
> >> +    QPCIBus *pcibus;
> > 
> > NIT: I'm not a huge fan of defining variables in the middle of code,
> >      call me old-fashioned if you will, but I tend to prefer them at the
> >      top of the function, or block ;)
> 
> This is barely tolerated in for(;;) loops.
> 
> See commit 7be41675f7c ("configure: Force the C standard to gnu99")
> and QEMU CODING_STYLE.rst:
> 
>  Declarations
>  ============
> 
>  Mixed declarations (interleaving statements and declarations within
>  blocks) are generally not allowed; declarations should be at the
>  beginning of blocks.
> 
>  Every now and then, an exception is made for declarations inside a
>  #ifdef or #ifndef block: if the code looks nicer, such declarations can
>  be placed at the top of the block even if there are statements above.
>  On the other hand, however, it's often best to move that #ifdef/#ifndef
>  block to a separate function altogether.
> 
> Regards,
>

Sounds good - I'll send out a v2.
Thanks
-Alex

> Phil.
> 

