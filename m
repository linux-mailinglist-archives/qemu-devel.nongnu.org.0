Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21000109C7B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 11:45:24 +0100 (CET)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZYLT-0006LB-6u
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 05:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iZY9z-0002cF-MF
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iZY9y-0006Z4-FV
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:33:31 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42621
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iZY9y-0006Yp-Bf
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574764409;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMtldCQF+/DWvmVFJaoAJaA8kyRUU0JjRn94HiUbGg0=;
 b=QPmWuEa7lAIdbNYJWWgHziuCfymdrT27/9gJQNenXxVvqwrALnCauWHhlC/DlAdWDkTLr0
 gZzDPVqU1mmOPbR/DE9esBYGqiJUIvehWBhR5C927jDCj/HbO5pQdaz6UY4uWsqWjjti4D
 LvsqhWP2fAUECKyljamhKE992J3osoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-xBnNiCKXPsuqgET1Oo9wHg-1; Tue, 26 Nov 2019 05:33:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB0FF800D4E;
 Tue, 26 Nov 2019 10:33:24 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C26267E42;
 Tue, 26 Nov 2019 10:33:18 +0000 (UTC)
Date: Tue, 26 Nov 2019 10:33:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v17 03/14] util/cutils: refactor do_strtosz() to support
 suffixes list
Message-ID: <20191126103315.GI556568@redhat.com>
References: <20191122074826.1373-1-tao3.xu@intel.com>
 <20191122074826.1373-4-tao3.xu@intel.com>
 <87pnhgjubs.fsf@dusky.pond.sub.org>
 <20191125121531.GD4438@habkost.net>
 <87y2w37y2u.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2w37y2u.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: xBnNiCKXPsuqgET1Oo9wHg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, sw@weilnetz.de, Tao Xu <tao3.xu@intel.com>, fan.du@intel.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 imammedo@redhat.com, jingqi.liu@intel.com
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
>=20
> Moreover, the commit message should state why these two changes are
> useful.  It tries, but "to support suffixes list" merely kicks the can
> down the road, because the reader is left to wonder why supporting
> suffix lists is useful.  It's actually for use by the next patch.  So
> say that.

Test case additions to test-cutils.c would go a long way to illustrating
what is added & that its working correctly.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


