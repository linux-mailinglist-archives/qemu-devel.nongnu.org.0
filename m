Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328DBB5353
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 18:47:38 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAGdd-0006Nl-7U
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 12:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAGTM-0005yH-QR
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAGTL-00031W-Ix
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:37:00 -0400
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:52730)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAGTL-00030n-Ba
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:36:59 -0400
Received: from player772.ha.ovh.net (unknown [10.109.160.11])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 2BA93141E07
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 18:36:57 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 84BF69E615EE;
 Tue, 17 Sep 2019 16:36:21 +0000 (UTC)
Date: Tue, 17 Sep 2019 18:36:20 +0200
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190917183620.044e980d@bahia.lan>
In-Reply-To: <20190917132412.6610576c.cohuck@redhat.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871569396.196432.12307975838741351907.stgit@bahia.lan>
 <20190917132412.6610576c.cohuck@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 839639857592310210
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.111.220
Subject: Re: [Qemu-devel] [PATCH 10/17] s390x/css: Pass local error object
 pointer to error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Sep 2019 13:24:12 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 17 Sep 2019 12:21:34 +0200
> Greg Kurz <groug@kaod.org> wrote:
> 
> > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/s390x/s390-ccw.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> Can also take this via the s390 tree, let me know what would work best.

I guess it would be easier to merge if each individual patch goes
through the corresponding sub-maintainer tree. But Eric mentioned
in another mail that the whole whole series could maybe go through
Markus' error tree... so, I don't know which is best. :)

