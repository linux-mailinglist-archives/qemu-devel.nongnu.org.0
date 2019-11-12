Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987BAF9A07
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 20:50:07 +0100 (CET)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUcAw-0002YA-5x
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 14:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iUc9x-0001pi-Oh
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 14:49:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iUc9v-0004xb-6v
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 14:49:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31046
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iUc9u-0004vi-Iu
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 14:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573588141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dl+hvpJZHKjWteF/Xa7/7IHq5yrW1V7QZ7i4fqf4ft4=;
 b=ZlUGvazO/q9pFJ/8miMpH5jOAyrkhat1ROuUx1MBk4ptF0f+ZYvseG8lThs9XKengsBy4G
 SZXVuZzAjlTZ8CA5K/cG1Cev9pvm46Q9Q/RHkWbo27gV5K3rQYY1RrN77cC802BHTqZ8HJ
 LiStDaCKo6xuHs0CnKXhy/LEBNoThvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-16fVtdPePhCmpb-Jzxgk7g-1; Tue, 12 Nov 2019 14:47:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE121800D7A;
 Tue, 12 Nov 2019 19:47:41 +0000 (UTC)
Received: from localhost (ovpn-116-59.gru2.redhat.com [10.97.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5E62CE1A;
 Tue, 12 Nov 2019 19:47:40 +0000 (UTC)
Date: Tue, 12 Nov 2019 16:47:38 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: Re: [PATCH] WHPX: refactor load library
Message-ID: <20191112194738.GF3812@habkost.net>
References: <MW2PR2101MB1116386CFE4628B6767D6CDBC07B0@MW2PR2101MB1116.namprd21.prod.outlook.com>
 <MW2PR2101MB1116C3DF422DB5E301B74AEEC0770@MW2PR2101MB1116.namprd21.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MW2PR2101MB1116C3DF422DB5E301B74AEEC0770@MW2PR2101MB1116.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 16fVtdPePhCmpb-Jzxgk7g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Justin Terry \(VM\)" <juterry@microsoft.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 12, 2019 at 06:42:00PM +0000, Sunil Muthuswamy wrote:
>=20
>=20
> > -----Original Message-----
> > From: Sunil Muthuswamy
> > Sent: Friday, November 8, 2019 12:32 PM
> > To: 'Paolo Bonzini' <pbonzini@redhat.com>; 'Richard Henderson' <rth@twi=
ddle.net>; 'Eduardo Habkost' <ehabkost@redhat.com>; 'Stefan
> > Weil' <sw@weilnetz.de>
> > Cc: 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>; Justin Terry (VM) =
<juterry@microsoft.com>
> > Subject: [PATCH] WHPX: refactor load library
> >=20
> > This refactors the load library of WHV libraries to make it more
> > modular. It makes a helper routine that can be called on demand.
> > This allows future expansion of load library/functions to support
> > functionality that is depenedent on some feature being available.
> >=20
> > Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>
> > ---
>=20
> Can I possibly get some eyes on this?

I'd be glad to queue the patch if we get a Reviewed-by line from
somebody who understands Windows and WHPX.  Maybe Justin?

Sunil, Justin, would you like to be listed as maintainers or
designated reviewers for the WHPX code in QEMU?

--=20
Eduardo


