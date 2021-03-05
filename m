Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E73232ED74
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:50:32 +0100 (CET)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBmh-0003Us-7v
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lIBlC-0002C2-P1
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:58 -0500
Received: from relay68.bu.edu ([128.197.228.73]:42043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lIBlA-0007Lx-WA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:58 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 125EmBjo017753
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 5 Mar 2021 09:48:17 -0500
Date: Fri, 5 Mar 2021 09:48:11 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: About libfuzzer in qemu
Message-ID: <20210305144811.r4nctgugxpjrc7ge@mozz.bu.edu>
References: <CAB7jVHGXcAdYg+z=Dgwb5LBhTxjWG_BALdwh+0CvUUucTzFehg@mail.gmail.com>
 <20210304152326.6fqgrncqgsvlrxhc@mozz.bu.edu>
 <SYCPR01MB3502665CD5F77329DD5EF672FC969@SYCPR01MB3502.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SYCPR01MB3502665CD5F77329DD5EF672FC969@SYCPR01MB3502.ausprd01.prod.outlook.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Yan Zhiqiang <yanz3q@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210305 1551, Qiuhao Li wrote:
> On Thu, 2021-03-04 at 10:23 -0500, Alexander Bulekov wrote:
> > On 210304 1843, Yan Zhiqiang wrote:
> > > Hello Alex,
> > > I'm learning the fuzz in QEMU recently, I review the fuzz code
> > > under
> > > /tests/qtest/fuzz which is written by you.
> > > I learn a lot from it, but I stuck when I want to debug the fuzz
> > > code.
> > > I use the gdb with command as follows:
> > > 
> > > >  gdb -q --args ./qemu-fuzz-i386 --fuzz-target=generic-fuzz-
> > > > virtio-vga
> > > > ./fuzz-output
> > > 
> > > and set breakpoint at generic_fuzz.c:generic_fuzz.
> > > It acctually stop when hit the breakpoint. But the function
> > > argument Size
> > > is zero and then goto _Exit(0). (try many times but always the
> > > same)
> > 
> > Hi Zhiqiang,
> > Happy to have more people look at the fuzzing code.
> > We run each input in a forked process. Maybe you need to run 
> > "set follow-fork-mode child" in gdb?
> 
> Hi Alex,
> 
> Just curious why you choose to use the libfuzzer at first instead of
> AFL and its descendants like AFL++ since they use a forkserver by
> design, and the performance also seems better [1].
> 
> [1] https://www.fuzzbench.com/reports/2021-02-13-paper/index.html

Hi Qiuhao,
It was a primary goal to run the fuzzers on OSS-Fuzz, and at the time,
AFL++ was not an option on OSS-Fuzz. Because I didn't find any great
way to reset QEMU between inputs, we hacked-in a forkserver.
It still seems that OSS-Fuzz is primarily designed around libfuzzer, but
now that there seems to be AFL++ support, it would be nice to start
using AFL++ as well. I just haven't had the time to look into it ;)

I've seen the fuzz-bench results - It will be interesting to see the
performance for an enormous target like QEMU. There are also some things
that AFL++ doesn't do as well as libfuzzer - some: examples here: 
https://github.com/AFLplusplus/fuzzer-challenges/tree/main/libfuzzer

-Alex

> 
> Thank you.
>   Qiuhao Li
> 
> 
> 

