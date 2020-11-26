Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14732C4D9D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 04:04:41 +0100 (CET)
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki7aK-0003gM-P9
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 22:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ki7ZG-0003Ep-2P
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 22:03:34 -0500
Received: from relay64.bu.edu ([128.197.228.104]:53785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ki7ZE-0004vZ-BP
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 22:03:33 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0AQ330S8002048
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 25 Nov 2020 22:03:04 -0500
Date: Wed, 25 Nov 2020 22:03:00 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Doug Evans <dje@google.com>
Subject: Re: [DISCUSSION] Running one qtest test: how?
Message-ID: <20201126030300.xeb5quqizc3ia7gj@mozz.bu.edu>
References: <CADPb22TfGZjr85z=5+Vc9fNqooGq5JTTos1h-rta8d3eG0SQew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADPb22TfGZjr85z=5+Vc9fNqooGq5JTTos1h-rta8d3eG0SQew@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201125 1539, Doug Evans wrote:
> Hi.
> 
> I can run a subset of qtest tests with "make check-qtest-TARGET", but
> that's the limit of the granularity that I can find. Why would one want
> more granularity? When adding a test one wants the edit/test cycle as short
> as possible and needlessly running other tests is a pain.
> 
> It'd be really nice to be able to specify one test via make check. I
> realize I can pass V=1 and get some help to dig further. And if I grep for
> my test in Makefile.mtest I can reduce the number of tests down to just the
> test binary I want (e.g., "make run-test-229" to run qtest-i386/qos-test,
> the 229 will vary tree to tree). I don't mind the 229, it's
> machine generated but it's easy to find and will be reasonably stable in
> one build (though ideally one could pass the test name to "make" instead of
> NNN). But I still want more granularity. What I really want is:
> 
> $ make run-test-229 TEST_OPTS="-p /foo/bar"
> 
> so that only test /foo/bar is run (see the output of qos-test --help).
> qos-test binaries can contain dozens of tests, I just want one of them.
> 
> Am I missing something? What do others do when adding a test?

I usually build only what I need and run it manually:
make qemu-system-TARGET
make tests/qtest/qos-test
QEMU_PATH=./qemu-system-TARGET ./tests/qtest/qos-test -p /foo/bar
?
That cuts down on the edit/test cycle, but it probably would be nicer if
there were some way to select a specific test for "make check-qtest".
-Alex

> 
> I'm happy to work on a patch to let one pass additional parameters to the
> test binary as in the above example. Guidance for what will be acceptable
> appreciated. Different test binaries will take different parameters: A
> general mechanism to pass arbitrary additional parameters to the test
> binary (.test.cmd.NNN in mtest-speak) would be quite useful.

