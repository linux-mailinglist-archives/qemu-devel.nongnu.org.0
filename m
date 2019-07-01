Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05DC19010
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 20:13:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOnYJ-0003Ps-4D
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 14:13:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hOnXF-00031G-EZ
	for qemu-devel@nongnu.org; Thu, 09 May 2019 14:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hOnXE-0006Pr-8v
	for qemu-devel@nongnu.org; Thu, 09 May 2019 14:12:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hOnXE-0006Mv-2V
	for qemu-devel@nongnu.org; Thu, 09 May 2019 14:12:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EC6281F35;
	Thu,  9 May 2019 18:12:46 +0000 (UTC)
Received: from dhcp-17-231.bos.redhat.com (dhcp-17-231.bos.redhat.com
	[10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0309194A0;
	Thu,  9 May 2019 18:12:43 +0000 (UTC)
Date: Thu, 9 May 2019 14:12:42 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20190509181242.GB25147@dhcp-17-231.bos.redhat.com>
References: <20190503004130.8285-1-ehabkost@redhat.com>
	<20190503004130.8285-11-ehabkost@redhat.com>
	<20190508102824.ysts2k4xesxzmh67@sirius.home.kraxel.org>
	<20190508143953.GA32662@localhost.localdomain>
	<20190509044040.bgrzbzczqonbn24q@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509044040.bgrzbzczqonbn24q@sirius.home.kraxel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 09 May 2019 18:12:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 10/19] tests/boot_linux_console: increase
 timeout
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 09, 2019 at 06:40:40AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Tests can also timeout due to slow downloads of test kernels.
> > > Any chance to run the downloads without timeout?
> > 
> > I acknowledge this is an issue, and have thought about two possible
> > ways to solve it:
> > 
> >  1) Downloading/caching/checking all the test assets in a job "pre-tests"
> >     plugin.
> 
> >  2) Report the test phase (say, setUp()) to the test runner, which
> >     would allow the runner to:
> 
> > I'm very much interested in your opinion so we can evolve the idea into
> > implementation.
> 
> (1) is the better approach I think.  That way you can give better
> feedback to the user, along the lines of "download 2 of 5 in progress".
> Also it allows for better management of the assets, you can have tools
> to list them / fetch them / copy them from one to another test machine
> / find & cleanup obsolete assets (i.e. Fedora 28 kernel after switching
> tests to Fedora 29).
> 
> (2) is probably still useful, to report phases of longer running
> tests and maybe have separate timeouts for each phase.  But for
> assets I think approach (1) is better than a "download asset"
> phase.
>

I also think that approach #1 is simpler and saner, but thinking about
where we're going with the test runner development, I started to have
doubts about it.  The reason is that we're adding parallel and multi
environment (process, machine, container) execution capabilities to the
runner. Dogfood version is here:

  https://github.com/avocado-framework/avocado/pull/3111

By doing all download/caching before any single test starts, we may be
wasting a lot of CPU time that could be used for running tests, making
the overall job execution much longer.

And with regards to test phases, the runner could distinguish between
setup and test phases, possibly re-running the setup phase a number of
times until sucessfull completion, improving even further the
reliability of the *test* results (excluding the setup phase).

Anyway, this is only brainstorm at this point, so I'll let you know
when this moves forward.

> cheers,
>   Gerd
> 
> 

FIY: one of the new runner planned features, is based on a question
use case you mention, about how to run tests built into a minimal
image, such as an initrd.

Regards,
- Cleber.

