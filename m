Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D468433A970
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 02:55:06 +0100 (CET)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLcRl-0007eP-FD
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 21:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLcQm-0007Di-Iy
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 21:54:04 -0400
Received: from relay64.bu.edu ([128.197.228.104]:34135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLcQk-0000Mv-D4
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 21:54:03 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12F1r7kw013690
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 14 Mar 2021 21:53:10 -0400
Date: Sun, 14 Mar 2021 21:53:07 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] fuzz: check machine, before PC-specific code
Message-ID: <20210315015307.sbygibvigptoiq25@mozz.bu.edu>
References: <20210314231015.29166-1-alxndr@bu.edu>
 <20210314231312.q7oykvk7ijoqj6oj@mozz.bu.edu>
 <205d92e8-3a4d-ba81-ed84-c37ceec11b27@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <205d92e8-3a4d-ba81-ed84-c37ceec11b27@amsat.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210315 0031, Philippe Mathieu-Daudé wrote:
> On 3/15/21 12:13 AM, Alexander Bulekov wrote:
> > On 210314 1910, Alexander Bulekov wrote:
> >> We enumerate PCI devices on PC machines, but this breaks the fuzzer for
> >> non-PC machines and architectures. Add checks to avoid this.
> >>
> >> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> >> ---
> >>  tests/qtest/fuzz/generic_fuzz.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> >> index ee8c17a04c..d2b74028fe 100644
> >> --- a/tests/qtest/fuzz/generic_fuzz.c
> >> +++ b/tests/qtest/fuzz/generic_fuzz.c
> >> @@ -784,6 +784,7 @@ static void generic_pre_fuzz(QTestState *s)
> >>      MemoryRegion *mr;
> >>      QPCIBus *pcibus;
> >>      char **result;
> >> +    const char* machine_type;
> >>  
> >>      if (!getenv("QEMU_FUZZ_OBJECTS")) {
> >>          usage();
> >> @@ -827,9 +828,13 @@ static void generic_pre_fuzz(QTestState *s)
> >>          exit(1);
> >>      }
> >>  
> >> -    pcibus = qpci_new_pc(s, NULL);
> >> -    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> >> -    qpci_free_pc(pcibus);
> >> +    machine_type = object_get_typename(qdev_get_machine());
> >> +    if(fuzzable_pci_devices->len && strstr(machine_type, "pc") == machine_type)
> >                                   Should at least be "pc-" --^
> > Maybe there's a more cannonical way to do this..
> 
> This doesn't scale with tests/qtest/libqos/pci-spapr.h :(

True - though the existing code wouldn't work for that anyway.

> 
> Maybe use the QOSOps structures?
> 
> > -Alex
> > 
> >> +    {
> >> +        pcibus = qpci_new_pc(s, NULL);
> >> +        g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> >> +        qpci_free_pc(pcibus);
> >> +    }
> >>  
> >>      counter_shm_init();
> >>  }
> >> -- 
> >> 2.27.0
> >>
> > 

