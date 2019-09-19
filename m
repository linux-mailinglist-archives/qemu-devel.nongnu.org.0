Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505EB7F7F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 18:58:00 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAzkl-0002Ci-8C
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iAzjW-0001a4-3X
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:56:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iAzjU-0004HB-BL
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:56:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38454)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iAzjU-0004GY-2A
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:56:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 612AE8A1C92;
 Thu, 19 Sep 2019 16:56:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-8.rdu2.redhat.com [10.10.123.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1085D9CD;
 Thu, 19 Sep 2019 16:56:34 +0000 (UTC)
Date: Thu, 19 Sep 2019 12:56:32 -0400
From: Cleber Rosa <crosa@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Problems with MIPS Malta SSH tests in make check-acceptance
Message-ID: <20190919165632.GA5821@localhost.localdomain>
References: <20190918071654.GK2440@umbus.fritz.box>
 <20190919011452.GA23168@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919011452.GA23168@localhost.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 19 Sep 2019 16:56:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: philmd@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 18, 2019 at 09:14:58PM -0400, Cleber Rosa wrote:
> On Wed, Sep 18, 2019 at 05:16:54PM +1000, David Gibson wrote:
> > Hi,
> > 
> > I'm finding make check-acceptance is currently useless for me as a
> > pre-pull test, because a bunch of the tests are not at all reliable.
> > There are a bunch which I'm still investigating, but for now I'm
> > looking at the MIPS Malta SSH tests.
> > 
> > There seem to be at least two problems here.  First, the test includes
> > a download of a pretty big guest disk image.  This can easily exhaust
> > the 2m30 timeout on its own.
> >
> 
> You're correct that successes and failures on those tests depend
> largely on bandwith.  On a shared environment I used for tests
> the download of those images take roughly 400 seconds, resulting
> in failures.  On my own machine, around 60, and the tests pass.
> 
> There's a conceptual and conflicting problem in that the environment
> for tests to run should be prepared beforehand.  The conflicting
> solutions can be:
> 
>  * extensive bootstrapping of the test execution environment, such
>    as the installation of guests from ISOs or installation trees, or
>    the download of "default" images wether the tests will use it or
>    not (this is what Avocado-VT does/requires)
> 
>  * keeping test assets in the tree (Avocado allows this if you have
>    a your_test.py.data/ directory), but it's not practical for large
>    files or files that can't or shouldn't be redistributed
> 
> > Even without the timeout, it makes the test really slow, even on
> > repeated runs.  Is there some way we can make the image download part
> > of "building" the tests rather than actually running the testsuite, so
> > that a) the test themselves go faster and b) we don't include the
> > download in the test timeout - obviously the download speed is hugely
> > dependent on factors that aren't really related to what we're testing
> > here.
> >
> 
> On Avocado version 72.0 we attempted to minimize the isse by
> implementing a "vmimage" command.  So, if you expect to use Fedora 30
> aarch64 images, you could run before your tests:
> 
>  $ avocado vmimage get --distro fedora --distro-version 30 --arch aarch64
> 
> And to list the images on your cache:
> 
>  $ avocado vmimage list
> 
> Unfortunately, this test doesn't use the vmimage API.  Actually that
> is fine because not all test assets map nicely to the vmimage goal,
> and should keep using the more generic (and lower level) fetch_asset().
> 
> We're now working on various "asset fetcher" improvements that should
> allow us to check/cache all assets before a test is executed.  Also,
> we're adding a mode in which the "fetch_asset()" API will default to
> cancel (aka SKIP) a test if the asset could not be downloaded.
> 
> If you're interested in the card we're using to track that new feature:
> 
>   https://trello.com/c/T3SC1sZs/1521-implement-fetch-assets-command-line-parameter
> 
> Another possibility that we've prototyped, and we'll be working on
> further, is to make a specific part of the "test" code execution
> (really a pre-test phase) to be executed without a timeout and even be
> tried a number of times before bailing out and skipping the test.
> 
> > In the meantime, I tried hacking it by just increasing the timeout to
> > 10m.  That got several of the tests working for me, but one still
> > failed.  Specifically 'LinuxSSH.test_mips_malta32eb_kernel3_2_0' still
> > timed out for me, but now after booting the guest, rather than during
> > the image download.  Looking at the avocado log file I'm seeing a
> > bunch of soft lockup messages from the guest console, AFAICT.  So it
> > looks like we have a real bug here, which I suspect has been
> > overlooked precisely because the download problems mean this test
> > isn't reliable.
> >
> 
> I've schedulled a 100 executions of `make check-acceptance` builds, with
> the linux_ssh_mips_malta.py tests having a 1500 seconds timeout.  The
> very first execution already brought interesting results:
> 
>  ...
>  (15/39) /home/cleber/src/qemu/tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta32eb_kernel3_2_0: PASS (198.38 s)
>  (16/39) /home/cleber/src/qemu/tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64el_kernel3_2_0: FAIL: Failure message found in console: Oops (22.83 s)
> 
> I'll let you know about my full results.  This should also serve as a
> starting point to a discussion about the reliability of other tests,
> as you mentioned before.

Out of the 100 executions on a ppc64le host, the results that contain
failures and errors:

15-/home/cleber/src/qemu/tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta32eb_kernel3_2_0
  - PASS: 92
  - INTERRUPTED: 4
  - FAIL: 4
16-/home/cleber/src/qemu/tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64el_kernel3_2_0
  - PASS: 95
  - FAIL: 5

FAIL means that self.fail() was called, which means 'Oops' was found
in the console.  INTERRUPTED here means that the test timeout kicked
in, and I can back David's statements about soft lockups.

Let me know if anyone wants access to the full logs/results.

- Cleber.

> 
> In my experience, and backed by the executions on Travis, most tests
> have been really stable on x86_64 hosts.  Last week I've worked in
> ppc64 and aarch64 hosts, and posted a number of patches addressing
> the failures I found.  I'll compile a list of the posted patches and
> their status.
> 
> Thanks for reporting those issues.
> - Cleber.
> 
> > Any thoughts on how to improve the situation?
> > 
> > -- 
> > David Gibson			| I'll have my music baroque, and my code
> > david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> > 				| _way_ _around_!
> > http://www.ozlabs.org/~dgibson
> 
> 

