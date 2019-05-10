Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF11975B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 06:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOx5W-0001pv-Q1
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 00:24:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOx4X-0001ZC-HC
	for qemu-devel@nongnu.org; Fri, 10 May 2019 00:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOx4W-0007jb-G5
	for qemu-devel@nongnu.org; Fri, 10 May 2019 00:23:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hOx4W-0007j7-AQ
	for qemu-devel@nongnu.org; Fri, 10 May 2019 00:23:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E6DF3DE0E;
	Fri, 10 May 2019 04:23:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA08600C7;
	Fri, 10 May 2019 04:23:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8645BA1E1; Fri, 10 May 2019 06:23:43 +0200 (CEST)
Date: Fri, 10 May 2019 06:23:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Message-ID: <20190510042343.6lmjnlnsprflquz5@sirius.home.kraxel.org>
References: <20190508085645.11595-1-kraxel@redhat.com>
	<afb9fa7b-64df-74e6-86b4-e6254d82555e@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afb9fa7b-64df-74e6-86b4-e6254d82555e@gmx.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 10 May 2019 04:23:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 00/13] tests/vm: serial console autoinstall,
 misc fixes.
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 09, 2019 at 08:52:23PM +0200, Kamil Rytarowski wrote:
> On 08.05.2019 10:56, Gerd Hoffmann wrote:
> > This patch series changes the way virtual machines for test builds are
> > managed.  They are created locally on the developer machine now.  The
> > installer is booted on the serial console and the scripts walks through
> > the dialogs to install and configure the guest.
> > 
> > That takes the download.patchew.org server out of the loop and makes it
> > alot easier to tweak the guest images (adding build dependencies for
> > example).
> > 
> > The install scripts take care to apply host proxy settings (from *_proxy
> > environment variables) to the guest, so any package downloads will be
> > routed through the proxy and can be cached that way.  This also makes
> > them work behind strict firewalls.
> > 
> > There are also a bunch of smaller tweaks for tests/vm to fix issues I
> > was struggling with.  See commit messages of individual patches for
> > details.
> > 
> > Known issue:  NetBSD package install is not working for me right now.
> > It did work a while ago.  Not sure what is going on here.
> > 
> 
> Error log? What is the command? pkgin install?

Looked like a dependency problem, the error log complained that it
couldn't find a new enough tcl version for tk.

"fixed" that by installing git-base instead of git, which drop the tk
dependency of git.

cheers,
  Gerd


