Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4510A16F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 16:48:05 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZd4O-0002GX-2N
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 10:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iZd31-0001mu-0M
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 10:46:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iZd2x-0000vI-M3
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 10:46:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30479
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iZd2q-0000rg-DG
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 10:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574783185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpHmGkX9VQ1KF3NBe7t5CvHt64m6L6maErEHSc6Avew=;
 b=WW9KOHKhKdB5mppT6ExHNGirbUjE8vcW+mIRVy/vWpHzh4fA7ep22w94nCFsgEMJaR2mqI
 wLTipUT+dpnz3IGIFaheVppg/0kEoyeLS0dHkI3V+0RiPn0MXPJFNDVMIl1HcFLiHEcEQZ
 bSSeMfub8ntTFWrSAfDC0CLkKHrS7nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-OovUGFy7OKKVqX8ALB4O-w-1; Tue, 26 Nov 2019 10:46:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8EB58BE9E4;
 Tue, 26 Nov 2019 15:46:19 +0000 (UTC)
Received: from localhost (ovpn-116-101.gru2.redhat.com [10.97.116.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3B35C21A;
 Tue, 26 Nov 2019 15:46:18 +0000 (UTC)
Date: Tue, 26 Nov 2019 12:46:16 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v17 03/14] util/cutils: refactor do_strtosz() to support
 suffixes list
Message-ID: <20191126154616.GV4438@habkost.net>
References: <20191122074826.1373-1-tao3.xu@intel.com>
 <20191122074826.1373-4-tao3.xu@intel.com>
 <87pnhgjubs.fsf@dusky.pond.sub.org>
 <20191125121531.GD4438@habkost.net>
 <87y2w37y2u.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2w37y2u.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: OovUGFy7OKKVqX8ALB4O-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, sw@weilnetz.de,
 Tao Xu <tao3.xu@intel.com>, fan.du@intel.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, imammedo@redhat.com,
 jingqi.liu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 26, 2019 at 11:04:41AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
>=20
> > On Mon, Nov 25, 2019 at 08:20:23AM +0100, Markus Armbruster wrote:
> >> Tao Xu <tao3.xu@intel.com> writes:
> >>=20
> >> > Add do_strtomul() to convert string according to different suffixes.
> >> >
> >> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> >> > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> >>=20
> >> What's the actual change here?  "Refactor" suggests the interfaces sta=
y
> >> the same, only their implementation changes.  "Support suffixes list"
> >> suggests some interface supports something new.
> >
> > 1) Parameters added to suffix_mul() (suffix table);
> > 2) do_strtomul() is being extracted from do_strtosz().
> >
> > do_strtomul() interface and behavior stays the same.
>=20
> Alright, it's two related changes squashed together (which tends to
> complicate writing good commit messages).  2) is really a refactoring.
> 1) is not: it makes suffix_mul() more flexible.  Summarizing 1) and 2)
> as "refactor do_strtosz() to support suffixes list" is confusing,
> because it's about 1), while the interesting part is actually 2).

I agree the interesting part is 2.  I still consider 1 being
refactoring, as it doesn't change any external behavior.

>=20
> Moreover, the commit message should state why these two changes are
> useful.  It tries, but "to support suffixes list" merely kicks the can
> down the road, because the reader is left to wonder why supporting
> suffix lists is useful.  It's actually for use by the next patch.  So
> say that.

Agreed.

>=20
> I'll review the actual patch now.

Thanks!

--=20
Eduardo


