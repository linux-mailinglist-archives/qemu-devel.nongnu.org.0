Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCD817C613
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 20:13:11 +0100 (CET)
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAIPG-0001y3-5T
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 14:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jAION-0001Wp-ET
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 14:12:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jAIOM-0007Us-GS
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 14:12:15 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49757
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jAIOM-0007U5-Cz
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 14:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583521933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXz0f6Ye/xpTmktsShgIg2b2J7C/8cosTNEYtu7YmLg=;
 b=J8gl1+7TtnRnJmnk1tR5IsfW5yYpX/ANqlZDL2b4T88WDEUHIdewsoeYfhT8rsKZPWGCpX
 QS1rexqPs80J9PZTKiVQwZzKIScTCBfqS16+MNg0t/P6lGJ2XDOXe/6/6DT4/GCnD2Hu3w
 ivHTkxzeoNrnswHdoAbDrtnmBcNuNn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-0Hm_n6f_NzCD_LkR6L4TLA-1; Fri, 06 Mar 2020 14:12:10 -0500
X-MC-Unique: 0Hm_n6f_NzCD_LkR6L4TLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3491190D340;
 Fri,  6 Mar 2020 19:12:08 +0000 (UTC)
Received: from work-vm (ovpn-116-247.ams2.redhat.com [10.36.116.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E635D1001B07;
 Fri,  6 Mar 2020 19:12:02 +0000 (UTC)
Date: Fri, 6 Mar 2020 19:11:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 09/13] migration/ram: Consolidate variable reset after
 placement in ram_load_postcopy()
Message-ID: <20200306191159.GM3033@work-vm>
References: <20200226155304.60219-1-david@redhat.com>
 <20200226155304.60219-10-david@redhat.com>
 <20200306163033.GF3033@work-vm>
 <d16a5a04-18f9-976f-6c9b-8931fbefb1de@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d16a5a04-18f9-976f-6c9b-8931fbefb1de@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> On 06.03.20 17:30, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> >> Let's consolidate resetting the variables.
> >>
> >> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >> Cc: Juan Quintela <quintela@redhat.com>
> >> Cc: Peter Xu <peterx@redhat.com>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >=20
> > Thanks, I think that's actually fixing a case where huge zero pages
> > weren't placed as zero pages?
>=20
> I don't see it :) Can you point out in which receive sequence it would
> go wrong?
>=20
> We used to set "all_zero =3D true" when processing the first sub-page.
> Now, we set "all_zero =3D true" before we start to process the first sub-=
page.

No, you're right - no change.

Dave

> Thanks!
>=20
> --=20
> Thanks,
>=20
> David / dhildenb
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


