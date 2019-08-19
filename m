Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309589247F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 15:16:37 +0200 (CEST)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzhWV-0002O2-Ro
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 09:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1hzgt9-0004Qb-85
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hzgt8-0006cE-0m
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:35:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hzgt5-0006ZG-9c; Mon, 19 Aug 2019 08:35:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED88D30089A1;
 Mon, 19 Aug 2019 12:35:49 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC00859CE;
 Mon, 19 Aug 2019 12:35:45 +0000 (UTC)
Message-ID: <ba8e9afd066d65099a897b5c515a73ab2c64625d.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>
Date: Mon, 19 Aug 2019 15:35:44 +0300
In-Reply-To: <414e8dab-b19b-fd47-52eb-db43ae75ec07@redhat.com>
References: <20190814202219.1870-1-mlevitsk@redhat.com>
 <d0635a23-7f99-9cf7-500c-af668e8ca370@redhat.com>
 <20190815091039.GA7415@linux.fritz.box> <87y2zuy0k7.fsf@dusky.pond.sub.org>
 <2561ace5297c93cee597c776230dcb8f457a8561.camel@redhat.com>
 <414e8dab-b19b-fd47-52eb-db43ae75ec07@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 19 Aug 2019 12:35:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 00/13] RFC: luks/encrypted qcow2 key
 management
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
Cc: Fam Zheng <fam@euphon.net>,
 Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2019-08-15 at 10:00 -0500, Eric Blake wrote:
> On 8/15/19 9:44 AM, Maxim Levitsky wrote:
> 
> > > > > Does the idea of a union type with a default value for the discriminator
> > > > > help?  Maybe we have a discriminator which defaults to 'auto', and add a
> > > > > union branch 'auto':'any'.  During creation, if the "driver":"auto"
> > > > > branch is selected (usually implicitly by omitting "driver", but also
> > > > > possible explicitly), the creation attempt is rejected as invalid
> > > > > regardless of the contents of the remaining 'any'.  But during amend
> > > > > usage, if the 'auto' branch is selected, we then add in the proper
> > > > > "driver":"xyz" and reparse the QAPI object to determine if the remaining
> > > > > fields in 'any' still meet the specification for the required driver branch.
> > > > > 
> > > > > This idea may still require some tweaks to the QAPI generator, but it's
> > > > > the best I can come up with for a way to parse an arbitrary JSON object
> > > > > with unknown validation, then reparse it again after adding more
> > > > > information that would constrain the parse differently.
> > > > 
> > > > Feels like this would be a lot of code just to allow the client to omit
> > > > passing a value that it knows anyway. If this were a human interface, I
> > > > could understand the desire to make commands less verbose, but for QMP I
> > > > honestly don't see the point when it's not trivial.
> > > 
> > > Seconded.
> > 
> > 
> > But what about my suggestion of adding something like:
> > 
> > { 'union': 'BlockdevAmendOptions',
> > 
> >   'base': {
> >       'node-name':         'str' },
> > 
> >   'discriminator': { 'get_block_driver(node-name)' } ,
> 
> Not worth it. It makes the QAPI generator more complex (to invoke
> arbitrary code instead of a fixed name) just to avoid a little bit of
> complexity in the caller (which is assumed to be a computer, and thus
> shouldn't have a hard time providing a sane 'driver' unconditionally).
> An HMP wrapper around the QMP command can do whatever magic it needs to
> omit driver, but making driver mandatory for QMP is just fine.

All right! I kind of not agree with that, since I think even though QMP is a machine language,
it still should be consistent since humans still use it, even if this is humans that code some
tool that use it.

I won't argue with you though, let it be like that.

Best regards,
	Maxim Levitsky

> 



