Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9838545A733
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:08:31 +0100 (CET)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYLO-0007C1-N3
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mpYJ1-0004eY-P8; Tue, 23 Nov 2021 11:06:03 -0500
Received: from relay64.bu.edu ([128.197.228.104]:32903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mpYIz-0000LH-Pz; Tue, 23 Nov 2021 11:06:03 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1ANG5CXw006361
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 23 Nov 2021 11:05:15 -0500
Date: Tue, 23 Nov 2021 11:05:12 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 v3 2/2] tests/qtest/fdc-test: Add a regression
 test for CVE-2021-20196
Message-ID: <20211123160512.xulyumsp3avfscby@mozz.bu.edu>
References: <20211118120635.4043197-1-philmd@redhat.com>
 <20211118120635.4043197-3-philmd@redhat.com>
 <1cca5391-18e9-8e29-9c8b-0d44010cdecd@redhat.com>
 <e4e69416-35f4-c9d7-1628-a9e45c64b4c6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4e69416-35f4-c9d7-1628-a9e45c64b4c6@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211123 1449, Philippe Mathieu-Daudé wrote:
> On 11/23/21 14:42, Hanna Reitz wrote:
> > On 18.11.21 13:06, Philippe Mathieu-Daudé wrote:
> >> From: Alexander Bulekov <alxndr@bu.edu>
> >>
> >> Without the previous commit, when running 'make check-qtest-i386'
> >> with QEMU configured with '--enable-sanitizers' we get:
> >>
> >>    AddressSanitizer:DEADLYSIGNAL
> >>    =================================================================
> >>    ==287878==ERROR: AddressSanitizer: SEGV on unknown address
> >> 0x000000000344
> >>    ==287878==The signal is caused by a WRITE memory access.
> >>    ==287878==Hint: address points to the zero page.
> >>        #0 0x564b2e5bac27 in blk_inc_in_flight
> >> block/block-backend.c:1346:5
> >>        #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
> >>        #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
> >>        #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
> >>        #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
> >>        #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
> >>
> >> Add the reproducer for CVE-2021-20196.
> >>
> >> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> >> Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
> >> [PMD: Rebased, use global test_image]
> >> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>   tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
> >>   1 file changed, 21 insertions(+)
> > 
> > Not sure if I’m doing something wrong, but:
> > 
> > Using the global test_image brings a problem, namely that this test
> > fails unconditionally (for me at least...?), with the reason being that
> > the global QEMU instance (launched by qtest_start(), quit by
> > qtest_end()) still has that image open, so by launching a second
> > instance concurrently, I get this:
> > 
> > qemu-system-x86_64: Failed to get "write" lock
> > Is another process using the image [/tmp/qtest.xV4IxX]?
> 
> Hmm I had too many odd problems running qtests in parallel so I
> switched to 'make check-qtest -j1' more than 1 year ago, which
> is probably why I haven't noticed that issue.
> 
> Using another 'test_image' seems against code reuse principle,
> but at this point in release, duplicating it is simpler. Someone
> will clean that later =)

Maybe it makes sense to run this with -snasphot ?

> 
> > So either we need to use a different image file, or we need to quit the
> > global instance before using it (e.g. putting a qtest_end() at the
> > beginning of test_cve_*()), although the latter just seems wrong.
> > 
> > Second, I can’t make this test fail.  When I apply this patch first (to
> > master) and run it, I don’t get a SIGSEGV.
> 
> Is your QEMU built with --enable-sanitizers ?
> 

