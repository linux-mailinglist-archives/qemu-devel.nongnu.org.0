Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB76154511
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:38:11 +0100 (CET)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izhMA-0001mf-AO
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1izhLJ-0000zR-Pd
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1izhLI-0002Oo-LN
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:37:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38689
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1izhLI-0002JL-Gf
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580996235;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMaPERG/mfCmSNsZmV4ZNCSbujSA6BEqyPghhq7ASy8=;
 b=FxwJlHiRcMJVUP0fB98snwDslqJlkKJUgD6uyFvHcKsL+p1qIqmifSZbIIXVRMTtTwXLMu
 9h9CFB1/jMyB5Fh00T2SdjQwNgqToKpEAY300uPZy7A4n04JJFQS/8ypIEgfJpmdlNOg15
 8+UBBuyTDD113KZSpGPCRRQA+lkLqSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357--Sn7L46DOyq605E2EslnlQ-1; Thu, 06 Feb 2020 08:37:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D040DB90;
 Thu,  6 Feb 2020 13:37:07 +0000 (UTC)
Received: from redhat.com (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBC726E4B;
 Thu,  6 Feb 2020 13:37:02 +0000 (UTC)
Date: Thu, 6 Feb 2020 13:36:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/13] qcrypto-luks: implement encryption key management
Message-ID: <20200206133658.GL2391707@redhat.com>
References: <20200130123847.GE6438@linux.fritz.box>
 <20200130125319.GD1891831@redhat.com>
 <87zhe5ovbv.fsf@dusky.pond.sub.org>
 <20200130150108.GM1891831@redhat.com>
 <877e18oq76.fsf@dusky.pond.sub.org>
 <87mu9xxwzv.fsf@dusky.pond.sub.org>
 <20200205093011.GA5768@dhcp-200-226.str.redhat.com>
 <20200205102303.GB2221087@redhat.com>
 <87a75xgl6w.fsf@dusky.pond.sub.org>
 <87h803ua2c.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h803ua2c.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -Sn7L46DOyq605E2EslnlQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 06, 2020 at 02:20:11PM +0100, Markus Armbruster wrote:
> One more question regarding the array in
>=20
>     { 'struct': 'QCryptoBlockAmendOptionsLUKS',
>       'data' : {
>                 'keys': ['LUKSKeyslotUpdate'],
>                  '*unlock-secret' : 'str' } }
>=20
> Why an array?  Do we really need multiple keyslot updates in one amend
> operation?

I think it it is unlikely we'd use this in libvirt. In the case of wanting
to *change* a key, it is safer to do a sequence of "add key" and then
"remove key". If you combine them into the same operation, and you get
an error back, it is hard to know /where/ it failed ? was the new key
added or not ?

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


