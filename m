Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19E4CB42
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:45:04 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdtct-0006sH-Hg
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hdtE8-0003Wi-DY
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 05:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hdt6A-0005dU-Fa
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 05:11:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57718)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hdt6A-0005cK-9W
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 05:11:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 41239316290E
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 09:11:08 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB1618966;
 Thu, 20 Jun 2019 09:11:07 +0000 (UTC)
Date: Thu, 20 Jun 2019 11:11:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Message-ID: <20190620111103.297277bc@redhat.com>
In-Reply-To: <20190619132924.GA32240@localhost.localdomain>
References: <20190618142931.1694-1-imammedo@redhat.com>
 <20190619132924.GA32240@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 20 Jun 2019 09:11:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qmp: make qmp-shell work with python3
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
Cc: armbru@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jun 2019 09:29:24 -0400
Cleber Rosa <crosa@redhat.com> wrote:

> On Tue, Jun 18, 2019 at 10:29:31AM -0400, Igor Mammedov wrote:
> > python3 doesn't have raw_input(), so qmp-shell breaks.
> > Use input() instead and override it with raw_input()
> > if running on python2.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  scripts/qmp/qmp-shell | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> > index 7776c7b141..8c49b39afa 100755
> > --- a/scripts/qmp/qmp-shell
> > +++ b/scripts/qmp/qmp-shell
> > @@ -308,7 +308,11 @@ class QMPShell(qmp.QEMUMonitorProtocol):
> >          @return True if execution was ok, return False if disconnected.
> >          """
> >          try:
> > -            cmdline = raw_input(prompt)
> > +            try: # attempt to set Python2 override
> > +               import __builtin__;
> > +               getattr(__builtin__, 'raw_input', input)
> > +            except ModuleNotFoundError: pass  
> 
> Something like:
> 
>    if sys.version_info[0] == 2:
>        input = raw_input
> 
> Also does the job, and may be considered simpler and easier to read.

that causes scope issues on python3

> 
> - Cleber.
> 
> > +            cmdline = input(prompt)
> >          except EOFError:
> >              print()
> >              return False
> > -- 
> > 2.18.1
> >   
> 


