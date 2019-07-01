Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCFF505EA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 11:39:09 +0200 (CEST)
Received: from localhost ([::1]:49274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfLRM-0002FD-9A
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 05:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58990)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hfLPi-0001Ye-KD
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hfLPg-0001Rj-CD
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:37:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35281)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hfLPg-0000xQ-5a
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:37:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E50A7308FC4D
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 09:37:00 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D89721001B04;
 Mon, 24 Jun 2019 09:36:57 +0000 (UTC)
Date: Mon, 24 Jun 2019 10:36:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190624093655.GE17698@redhat.com>
References: <20190620114116.27254-1-imammedo@redhat.com>
 <87blynv1lu.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87blynv1lu.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 24 Jun 2019 09:37:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] [PATCH] deprecate -mem-path fallback to
 anonymous RAM
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 10:17:33AM +0200, Markus Armbruster wrote:
> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > Fallback might affect guest or worse whole host performance
> > or functionality if backing file were used to share guest RAM
> > with another process.
> >
> > Patch deprecates fallback so that we could remove it in future
> > and ensure that QEMU will provide expected behavior and fail if
> > it can't use user provided backing file.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > PS:
> > Patch is written on top of
> >   [PATCH v4 0/3] numa: deprecate '-numa node,  mem' and default memory distribution
> > to avoid conflicts in qemu-deprecated.texi
> >
> >  numa.c               | 4 ++--
> >  qemu-deprecated.texi | 8 ++++++++
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/numa.c b/numa.c
> > index 91a29138a2..53d67b8ad9 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -494,8 +494,8 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
> >              if (mem_prealloc) {
> >                  exit(1);
> >              }
> > -            error_report("falling back to regular RAM allocation.");
> > -
> > +            warn_report("falling back to regular RAM allocation. "
> > +                        "Fallback to RAM allocation is deprecated.");
> 
> Can we give the user clues on how to avoid the deprecated fallback?

There's nothing a user can do aside from ensuring they have sufficient
free memory before launching QEMU to satisfy the huge pag request.

Probably just needs changing to do.

    "This is deprecated, future QEMU releases will exit when
     huge pages cannot be allocated"

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

