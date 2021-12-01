Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A54653B3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 18:13:07 +0100 (CET)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msTAI-0006hQ-Ii
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 12:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1msT0z-00030T-FJ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:03:29 -0500
Received: from relay68.bu.edu ([128.197.228.73]:52984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1msT0w-0001YW-L9
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:03:28 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1B1H21dQ022318
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 1 Dec 2021 12:02:09 -0500
Date: Wed, 1 Dec 2021 12:02:01 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: dhbbb <504224090@qq.com>
Subject: Re: Questiones About MORPHUZZ (the generic-fuzzer)
Message-ID: <20211201170201.t2imhfbtwf7vseij@mozz.bu.edu>
References: <tencent_1A6434526FC197B3C69462D8C51937A9DB09@qq.com>
 <20211126151736.3zvqoy6ebvzrg4le@mozz.bu.edu>
 <tencent_93343B2E633C75994C76AA1BB8519682D206@qq.com>
 <20211201041838.mkgq72vdurrl5yrb@mozz.bu.edu>
 <tencent_4282D21D3B35A32FF5838C42AA1C387D1606@qq.com>
 <20211201165950.v55p4bubcxgm2tom@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211201165950.v55p4bubcxgm2tom@mozz.bu.edu>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.447,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211201 1537, dhbbb wrote:
> Hello Alex，
> Thanks for your kind reply,it really helped me a lot! I am more
> familiar with AFL than libfuzzer，and i noticed that you said "This
> minimal init/exec interface is also supported by other fuzzers, such
> as AFL[++]".But your project seems to be highly integrated with
> QEMU,so if I want to use other fuzzers as&nbsp;QMORPHUZZ's
> &nbsp;fuzzing-backend&nbsp;, could you please tell me where to start?
 
Sure. (I am cc-ing the qemu-mailing list, as others are interested in
this as well.)

Here's how the execution looks for something like
./qemu-fuzz- --fuzz_target=generic-fuzz -jobs=2 -workers=2

  LLVMFuzzerInitialize
        |
        |
        |
        v
    qemu_init

        |
        +-------------- fork ----------+
      fork                             |
        v                              v
     worker1                        worker2
        |                              |
        |                              |
        v                              v
      RunOne                         RunOne
        |                              |
        |                              |
        v                              v
     pre_fuzz                       pre_fuzz
(init shared memory)           (init shared memory)
        |                              |
        |                              |
        v                              v
  generic_fuzz ---fork-+         generic_fuzz ---fork-+
        |              |               |              |
        |              |               |              |
        |              v               |              v
        |       (run the input)        |       (run the input)
        |              |               |              |
        v              v               v              v
      wait           exit            wait           exit
        |                              |
        |                              |
        v                              v
     RunOne                         RunOne
       |                              |
       |                              |
       v                              v
 generic_fuzz ---fork-+         generic_fuzz ---fork-+
       |              |               |              |
       |              |               |              |
       |              v               |              v
     ...             ...            ...             ...

LibFuzzer essentially provides two main interfaces that we use.
The first, LLVMFuzzerInitialize, runs a single time when you first run
./qemu-fuzz-...
It is defined in tests/qtest/fuzz/fuzz.c
Most of the code is there so we can specify which --fuzz-target we want
to run, and select the corresponding qemu arguments that we would
normally pass to ./qemu-system-i386. Then we call qemu_init, which
initializes the VM correspondingly. None of this should be very
libfuzzer specific.

The second interface, LLVMFuzzerTestOneInput, is the one that LibFuzzer
calls for every single input. This is also defined in fuzz.c.
Importantly, in between FuzzerInitialize and FuzzerTestOneInput,
libFuzzer might fork the process multiple times in order to create
additional workers (if --jobs and --workers arguments are specified).
Since we hacked on our own forkserver onto LibFuzzer, and this requires
separate shared memory for each worker, we also run some initialization
code a single time in each worker. This is the "!pre_fuzz_done &&
fuzz_target->pre_fuzz" part. For the generic fuzzer, here we also do all
of the generic-fuzz-specific initialization (such as finding all of the
MemoryRegions we want to fuzz). I think the only thing specific to
LibFuzzer here should be the call to counter_shm_init(), which we use to
establish the LibFuzzer-specific shared memory regions (since LibFuzzer
has no built-in fork-server feature).

The final important libFuzzer-specific part is that in the actual fuzz()
function (aka generic_fuzz for the generic-fuzzer, which is called for
each input), we manually fork() the process and re-establish timers for
the timeout. For other fuzzers, which have built-in forkservers,
presumably, we wouldn't need this.

I think AFL++ provides interoperability with the
LLVMFuzzerInitialize/LLVMFuzzerTestOneInput interface. So in order to
use AFL++ we would need to strip out the libfuzzer-specific shm and
fork-server parts, and see how we can integrate AFL++' built-in
forkserver. I am happy to help more with this if you are interested in
adding AFL++ support, upstream.

-Alex

