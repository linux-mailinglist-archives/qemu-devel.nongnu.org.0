Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FAF42A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 12:25:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLPwz-0007FG-AP
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 06:25:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hLPpk-0001PR-T5
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hLPjK-0006sJ-Ee
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:11:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hLPjI-0006qr-PW
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:11:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAB17C0578FA
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 10:11:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31BC3100164A;
	Tue, 30 Apr 2019 10:11:11 +0000 (UTC)
Date: Tue, 30 Apr 2019 11:11:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190430101109.GB6818@redhat.com>
References: <20190423212246.3542-1-ehabkost@redhat.com>
	<2b1d825f-8bd3-ba25-3e1b-8415aeec8ce6@redhat.com>
	<20190424181049.GF18406@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190424181049.GF18406@habkost.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 30 Apr 2019 10:11:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] Export machine type deprecation info
 through QMP
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mprivozn@redhat.com, Thomas Huth <thuth@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 24, 2019 at 03:10:49PM -0300, Eduardo Habkost wrote:
> On Wed, Apr 24, 2019 at 09:56:53AM +0200, Thomas Huth wrote:
> > On 23/04/2019 23.22, Eduardo Habkost wrote:
> > > This series adds machine type deprecation information to the
> > > output of the `query-machines` QMP command.  With this, libvirt
> > > and management software will be able to show this information to
> > > users and/or suggest changes to VM configuration to avoid
> > > deprecated machine types.
> > > 
> > > Eduardo Habkost (3):
> > >   qapi: SupportStatusInfo struct
> > >   machine: Use SupportStatusInfo for deprecation info
> > >   qmp: Add deprecation information to query-machines
> > > 
> > >  qapi/common.json                   | 24 ++++++++++++++++++++++++
> > >  qapi/misc.json                     |  5 ++++-
> > >  include/hw/boards.h                |  7 ++++---
> > >  hw/i386/pc_piix.c                  |  4 +++-
> > >  hw/ppc/prep.c                      |  4 +++-
> > >  vl.c                               | 19 +++++++++++++++----
> > >  tests/acceptance/query_machines.py | 27 +++++++++++++++++++++++++++
> > >  7 files changed, 80 insertions(+), 10 deletions(-)
> > >  create mode 100644 tests/acceptance/query_machines.py
> > 
> > Good idea, but some questions come to my mind:
> > 
> > - What about devices? IIRC Gerd wrote a patch series last year that does
> >   something similar for devices... It would be good to synchronize the
> >   work, so that we do not have two completely interfaces between devices
> >   and machines here in the end...
> 
> My plan is to support this on devices, too.  I even had a version
> where documentation of SupportStatusInfo mentioned device types,
> but I decided to leave that out until we actually implement a
> device deprecation info API.

We need it on CPU models, and on CPU features too potentially. Essentially
we should consider it applicable to anything we report in QMP.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

