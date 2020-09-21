Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D79272895
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 16:44:47 +0200 (CEST)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKN3e-0005wi-LI
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 10:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kKN1s-0004jH-2e
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 10:42:56 -0400
Received: from relay68.bu.edu ([128.197.228.73]:52948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kKN1o-0005vL-Rz
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 10:42:55 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 08LEfdj4011443
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Sep 2020 10:41:44 -0400
Date: Mon, 21 Sep 2020 10:41:39 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 03/16] fuzz: Add PCI features to the general fuzzer
Message-ID: <20200921144139.r424ql3ck2dvih2m@mozz.bu.edu>
References: <20200921022506.873303-1-alxndr@bu.edu>
 <20200921022506.873303-4-alxndr@bu.edu>
 <407cc86f-a705-115d-dd75-2d1c899811cd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <407cc86f-a705-115d-dd75-2d1c899811cd@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 10:34:35
X-ACL-Warn: Detected OS   = Linux 2.6.x
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, darren.kenny@oracle.com, bsd@redhat.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200921 0744, Philippe Mathieu-Daudé wrote:
> On 9/21/20 4:24 AM, Alexander Bulekov wrote:
> > This patch compares TYPE_PCI_DEVICE objects against the user-provided
> > matching pattern. If there is a match, we use some hacks and leverage
> > QOS to map each possible BAR for that device. Now fuzzed inputs might be
> > converted to pci_read/write commands which target specific. This means
> > that we can fuzz a particular device's PCI configuration space,
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> > ---
> >  tests/qtest/fuzz/general_fuzz.c | 81 +++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/tests/qtest/fuzz/general_fuzz.c b/tests/qtest/fuzz/general_fuzz.c
> > index bf75b215ca..7c4c1398a7 100644
> > --- a/tests/qtest/fuzz/general_fuzz.c
> > +++ b/tests/qtest/fuzz/general_fuzz.c
> > @@ -24,6 +24,7 @@
> >  #include "exec/ramblock.h"
> >  #include "exec/address-spaces.h"
> >  #include "hw/qdev-core.h"
> > +#include "hw/pci/pci.h"
> >  
> >  /*
> >   * SEPARATOR is used to separate "operations" in the fuzz input
> > @@ -35,12 +36,17 @@ enum cmds {
> >      OP_OUT,
> >      OP_READ,
> >      OP_WRITE,
> > +    OP_PCI_READ,
> > +    OP_PCI_WRITE,
> >      OP_CLOCK_STEP,
> >  };
> 
> As there is no versioning, does adding new commands
> invalidates the corpus?
> 
> [...]
>

Yes. I think there are a few approaches:
1.) Write a separate OP parser/converter in python that will convert the
corpus to a newer version. Each time we change the code:
    a. write a converter
    b. download corpus from oss-fuzz
    c. convert the corpus
    d. commit new corpus to the seed corpus repo (we don't have one
    right now)
2.) Same as (1) but instead of corpus_v1 -> corpus_v2, 
try to convert corpus_v1 -> qtest commands -> corpus_v2
3.) Use 1st byte to pick corpus format version. I think this could lead
to a lot of code-bloat and could hurt fuzzing performance (fuzzer
mutations could make new inputs that still use old corpus versions)...
4.) Do nothing and wait..

Do you have any suggestion?
-Alex

