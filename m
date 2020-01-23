Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37566146BBA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:49:32 +0100 (CET)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iudnW-0007eA-N0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iuc35-0007se-Uy
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:57:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iuc34-0001Uh-L8
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:57:27 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:37365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iuc34-0001Ko-8K
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=V5oqMEoflPhykTavsM38Rv40v7UC+z7FceKe2WoAKgg=; b=uDbKRPXUVMbkdTUTksCAoRsF6b
 wBUITNoDM1fMxOzunvkROrDS4tmAx3UlMwvH2+d44fJi5VXiOu6PaY8nFWu/f95TTW3c7Z3EcF26O
 lc1A1E/zlBNl30OrFT9YxAdbq2KkzEeWRdjhmGgtU4end94Ln3/ui0QEyL+AF0RAUhWvienATHVSk
 roThtK0rB7x6ch7jbgKv4xwI9pv5F+kzKe7iwvuGAykbKNU/Lj9h01EheqgckLx6Kq1yl3SkwWG31
 G6p2HN8065sctxWMslQdHlJLuWradY/W+oiFIHoS0DWlWcnTwMKvhMSdyPf89ztjET9eB01j5OHjN
 vrMSfPBacfvI0isr6IN356DE5SQj6pUYBMsIFKLpeCaVGJguvydP5U7Rge8Gkx2KLsKh1A8z5qUYM
 hfKWyMDSL/xXM50Z68o6WfUXU7DwEuKT9pzM9PS3FOaFbzxjvPVohqFkM0evqWMigzk7AIJM4QWqk
 wW3QrtFWf3XauSZ6M1HHgCFcoXPmYPRfHZgUfPhTh2HMo7s7uOn8og7T46uqf4z8BnWwslwHL8npr
 s/RX4VBulUBl2hLWJzz357BaDvp9Y5V7hHDc0CaMtHo+LF5FutCuaEdc/iWsQ6e1sr5VA0Gj7g6vd
 wwaM1n9SOeOQhYPSEB9eaFxV695tb/N9oj5hcGTUY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 10/11] 9pfs: T_readdir latency optimization
Date: Thu, 23 Jan 2020 13:57:23 +0100
Message-ID: <2409946.W8UoNLAh9x@silver>
In-Reply-To: <20200123123342.0b69008b@bahia.lan>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
 <cbd48794ab09613589719b37b147589cda5af6dd.1579567020.git.qemu_oss@crudebyte.com>
 <20200123123342.0b69008b@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 23. Januar 2020 12:33:42 CET Greg Kurz wrote:
> On Tue, 21 Jan 2020 01:30:10 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Make top half really top half and bottom half really bottom half:
> > 
> > Each T_readdir request handling is hopping between threads (main
> > I/O thread and background I/O driver threads) several times for
> > every individual directory entry, which sums up to huge latencies
> > for handling just a single T_readdir request.
> > 
> > Instead of doing that, collect now all required directory entries
> > (including all potentially required stat buffers for each entry) in
> > one rush on a background I/O thread from fs driver, then assemble
> > the entire resulting network response message for the readdir
> > request on main I/O thread. The fs driver is still aborting the
> > directory entry retrieval loop (on the background I/O thread) as
> > soon as it would exceed the client's requested maximum R_readdir
> > response size. So we should not have any performance penalty by
> > doing this.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Ok so this is it. Not reviewed this huge patch yet but I could at
> least give a try. The gain is impressive indeed:

Tseses, so much scepticism. :)

> [greg@bahia qemu-9p]$ (cd .mbuild-$(stg branch)/obj ; export
> QTEST_QEMU_BINARY='x86_64-softmmu/qemu-system-x86_64'; make all
> tests/qtest/qos-test && for i in {1..100}; do tests/qtest/qos-test -p
> $(tests/qtest/qos-test -l | grep readdir/basic); done) |& awk '/IMPORTANT/
> { print $10 }' | sed -e 's/s//' -e 's/^/n+=1;x+=/;$ascale=6;x/n' | bc
> .009806
> 
> instead of .055654, i.e. nearly 6 times faster ! This sounds promising :)

Like mentioned in the other email, performance improvement by this patch is 
actually far more than factor 6 since you probably just dropped the n-square 
driver hack in your benchmarks (which tainted your benchmark results):

Unoptimized readdir, with n-square correction hack:
Time client spent for waiting for reply from server: 0.082539s [MOST 
IMPORTANT]

Optimized readdir, with n-square correction hack:
Time 9p server spent on synth_readdir() I/O only (synth driver): 0.001576s
Time 9p server spent on entire T_readdir request: 0.002244s [IMPORTANT]
Time client spent for waiting for reply from server: 0.002566s [MOST 
IMPORTANT]

So in this particular test run performance improvement by around factor 32, 
but I also observed factors around 40 before in my tests.

> Now I need to find time to do a decent review... :-\

Sure, take your time! But as you can see, it is really worth it.

And it's not just the performance improvement. This patch also reduces program 
flow complexity significantly, e.g. there is just one lock and one unlock; 
entry name allocation is immediately freed without any potential branch in 
between, and much more. In other words: it adds safety.

Best regards,
Christian Schoenebeck



