Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38312526D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 20:57:27 +0100 (CET)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihfRm-00009X-MO
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 14:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ihfQH-0007gl-Bi
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ihfQD-0004tx-Kw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:55:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22791
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ihfQC-0004js-Sw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576698947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q80SRlQ9rgIgs6XFezZvfwhm8W7y3+dMUJT6IhmmN4I=;
 b=UtAVyPPEN40URtEbSjSCf3/iRxioYG0NIIkqAqybczn4KbQtAURH/b1pbfbUCbpKkC/tof
 l6tzFmyIfR4dvx/IK/jciNPM7RRcv2EeY7DioYvoRJTn/SvqzpQaudo1iAXkewS3nJ5Ukb
 rjeFr+572J2v7K6C4vyU17/6CMtK5Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-X12Ohn0mMJOGBbJLR8bdjw-1; Wed, 18 Dec 2019 14:55:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B9A718B6401;
 Wed, 18 Dec 2019 19:55:42 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F44310016DA;
 Wed, 18 Dec 2019 19:55:41 +0000 (UTC)
Date: Wed, 18 Dec 2019 19:55:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [Patch v2 0/6] migration/postcopy: enable compress during postcopy
Message-ID: <20191218195538.GW3707@work-vm>
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
 <20191216023502.GA21865@richard>
MIME-Version: 1.0
In-Reply-To: <20191216023502.GA21865@richard>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: X12Ohn0mMJOGBbJLR8bdjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> Would this one be picked up in this version?

I think that one is on Juan's list for the pull he's going to do soon.

Dave


> On Thu, Nov 07, 2019 at 08:39:01PM +0800, Wei Yang wrote:
> >This patch set tries enable compress during postcopy.
> >
> >postcopy requires to place a whole host page, while migration thread mig=
rate
> >memory in target page size. This makes postcopy need to collect all targ=
et
> >pages in one host page before placing via userfaultfd.
> >
> >To enable compress during postcopy, there are two problems to solve:
> >
> >    1. Random order for target page arrival
> >    2. Target pages in one host page arrives without interrupt by target
> >       page from other host page
> >
> >The first one is handled by counting the number of target pages arrived
> >instead of the last target page arrived.
> >
> >The second one is handled by:
> >
> >    1. Flush compress thread for each host page
> >    2. Wait for decompress thread for before placing host page
> >
> >With the combination of these two changes, compress is enabled during
> >postcopy.
> >
> >---
> >v2:
> >     * use uintptr_t to calculate place_dest
> >     * check target pages belongs to the same host page
> >
> >Wei Yang (6):
> >  migration/postcopy: reduce memset when it is zero page and
> >    matches_target_page_size
> >  migration/postcopy: wait for decompress thread in precopy
> >  migration/postcopy: count target page number to decide the
> >    place_needed
> >  migration/postcopy: set all_zero to true on the first target page
> >  migration/postcopy: enable random order target page arrival
> >  migration/postcopy: enable compress during postcopy
> >
> > migration/migration.c | 11 -------
> > migration/ram.c       | 67 +++++++++++++++++++++++++++++++++----------
> > 2 files changed, 52 insertions(+), 26 deletions(-)
> >
> >--=20
> >2.17.1
>=20
> --=20
> Wei Yang
> Help you, Help me
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


