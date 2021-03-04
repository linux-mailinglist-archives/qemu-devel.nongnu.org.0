Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3531532D67A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:25:36 +0100 (CET)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpr4-0002Et-Sm
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lHppo-0001g2-Su
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:24:16 -0500
Received: from relay68.bu.edu ([128.197.228.73]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lHppm-0006pT-Th
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:24:16 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 124FNQke008507
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 4 Mar 2021 10:23:29 -0500
Date: Thu, 4 Mar 2021 10:23:26 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Yan Zhiqiang <yanz3q@gmail.com>
Subject: Re: About libfuzzer in qemu
Message-ID: <20210304152326.6fqgrncqgsvlrxhc@mozz.bu.edu>
References: <CAB7jVHGXcAdYg+z=Dgwb5LBhTxjWG_BALdwh+0CvUUucTzFehg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB7jVHGXcAdYg+z=Dgwb5LBhTxjWG_BALdwh+0CvUUucTzFehg@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210304 1843, Yan Zhiqiang wrote:
> Hello Alex,
> I'm learning the fuzz in QEMU recently, I review the fuzz code under
> /tests/qtest/fuzz which is written by you.
> I learn a lot from it, but I stuck when I want to debug the fuzz code.
> I use the gdb with command as follows:
> 
> >  gdb -q --args ./qemu-fuzz-i386 --fuzz-target=generic-fuzz-virtio-vga
> > ./fuzz-output
> 
> and set breakpoint at generic_fuzz.c:generic_fuzz.
> It acctually stop when hit the breakpoint. But the function argument Size
> is zero and then goto _Exit(0). (try many times but always the same)

Hi Zhiqiang,
Happy to have more people look at the fuzzing code.
We run each input in a forked process. Maybe you need to run 
"set follow-fork-mode child" in gdb?

> Then input `c` to continue.
> However, it never hit the breakpoint after that. Just as the picture showed.
> [image: 1614854239086.jpg]
> I tried the qtest debug method, but failed.
> I want to know the real process state to learn the QEMU fuzz and add a new
> fuzzer for QEMU.
> Could you tell me what's the right method to debug the fuzz code? Thank you!

For debugging crash, I usually build QEMU with --enable-sanitizers
(ASAN), and I convert the crash to a "QTest" reproducer, so it can be
debugged in a normal build of qemu. There's an RFC that has instructions
for how to do this:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06035.html

Let me know if I can provide any more info.
-Alex

> 
> Regards,
> Zhiqiang Yan



