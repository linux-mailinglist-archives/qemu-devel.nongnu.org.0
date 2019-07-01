Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703CB1ECE6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 13:03:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQrgc-0007JU-4L
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 07:03:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hQrc7-00048b-Mm
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hQrWV-0004yh-RN
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:52:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hQrWV-0004xa-Kq
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:52:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EABE7308620A;
	Wed, 15 May 2019 10:52:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 992EC5D706;
	Wed, 15 May 2019 10:52:33 +0000 (UTC)
Date: Wed, 15 May 2019 12:52:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20190515125229.1784f586@redhat.com>
In-Reply-To: <20190515081854.kcpjm4zd2bzc7f6o@kamzik.brq.redhat.com>
References: <20190418092841.fzrcegkbal7dpfcy@kamzik.brq.redhat.com>
	<20190418112610.GO13773@redhat.com>
	<877ebrmch2.fsf@dusky.pond.sub.org>
	<20190513184237.i2ha3ixvhjqzkn5q@kamzik.brq.redhat.com>
	<87bm05ab6c.fsf@dusky.pond.sub.org>
	<20190514090225.vel4xm4x743o4rge@kamzik.brq.redhat.com>
	<20190514164838.48fc7603@Igors-MacBook-Pro>
	<20190515081854.kcpjm4zd2bzc7f6o@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 15 May 2019 10:52:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] How do we do user input bitmap properties?
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
Cc: peter.maydell@linaro.org,
	"Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	dgilbert@redhat.com, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 May 2019 10:18:54 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Tue, May 14, 2019 at 04:48:38PM +0200, Igor Mammedov wrote:
> > On Tue, 14 May 2019 11:02:25 +0200
> > Andrew Jones <drjones@redhat.com> wrote:  
> > > My thought is primarily machines. If a human wants to use the command
> > > line and SVE, then I'm assuming they'll be happy with sve-max-vq or
> > > figuring out a map they like once and then sticking to it.  
> > 
> > maybe naive question, but why not use a property/bit as user facing interface,
> > in line with what we do with CPUID bits. (that's assuming that bits have
> > fixed meaning).
> > Yes, it's verbose but follows current practice and works fine with -cpu and
> > -device.
> > (I really hate custom preprocessing of -cpu and we were working hard to remove
> > that in favor of canonical properties at the expense of more verbose CLI).
> >  
> 
> Are you asking if we should do something like the following?
> 
>   -cpu host,sve1=on,sve=2=on,sve3=off,sve4=on
> 
> (Where the numbers represent the number of vector quadwords supported.)

something like this, but why not replace 1,2,... with more meaning full
 sve-encrypt/sve-something-else/...
since using magic numbers is not very descriptive
(but if there is some spec where they come from that we could point users to
it might be acceptable too, but I'd reserve number approach for values only).

> Naturally that would work, but it would be super verbose and require
> adding tons of properties.
yep, it's not very (human) user friendly but that's what mgmt applications
are for and well users always can prepare a script for long CLI and use
whatever abstractions they could think of.

> Or maybe you meant something else. If so,
> please provide an example.
> 
> Thanks,
> drew


