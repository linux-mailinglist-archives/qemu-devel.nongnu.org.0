Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3B154619
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 15:27:01 +0100 (CET)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izi7Q-0004tX-Sl
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 09:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1izi6b-0004Fw-Jn
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 09:26:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1izi6Z-0003IB-QX
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 09:26:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34012
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1izi6Z-0003CC-K3
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 09:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580999167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7bGp6CfkI25EMAXXKBjxR4WkUwynk6Btbi4PodTI3A=;
 b=HHA5yVZW9e3kaBvt5OytDJr/O+SUmufo5BXWJqlJYsXWLYyx41zRXDJuI0PAIaGj0BWzG9
 STfVJg6Q7CbzraUWJnYEjBPk4Ez5h6kbj9hK5dXKAimrQo63MEjsD93HCiZTQR9ofCIhVY
 3fLypaubONl8g9Vxm/Zs4Cp38GHHjuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-G6HByh80N7GjVGYShf6Hnw-1; Thu, 06 Feb 2020 09:26:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4423B192B9C6;
 Thu,  6 Feb 2020 14:26:04 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-204.ams2.redhat.com [10.36.116.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B3448;
 Thu,  6 Feb 2020 14:26:00 +0000 (UTC)
Date: Thu, 6 Feb 2020 15:25:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 02/13] qcrypto-luks: implement encryption key management
Message-ID: <20200206142558.GB4926@linux.fritz.box>
References: <20200130125319.GD1891831@redhat.com>
 <87zhe5ovbv.fsf@dusky.pond.sub.org>
 <20200130150108.GM1891831@redhat.com>
 <877e18oq76.fsf@dusky.pond.sub.org>
 <87mu9xxwzv.fsf@dusky.pond.sub.org>
 <20200205093011.GA5768@dhcp-200-226.str.redhat.com>
 <20200205102303.GB2221087@redhat.com>
 <87a75xgl6w.fsf@dusky.pond.sub.org>
 <87h803ua2c.fsf@dusky.pond.sub.org>
 <20200206133658.GL2391707@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200206133658.GL2391707@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: G6HByh80N7GjVGYShf6Hnw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.02.2020 um 14:36 hat Daniel P. Berrang=E9 geschrieben:
> On Thu, Feb 06, 2020 at 02:20:11PM +0100, Markus Armbruster wrote:
> > One more question regarding the array in
> >=20
> >     { 'struct': 'QCryptoBlockAmendOptionsLUKS',
> >       'data' : {
> >                 'keys': ['LUKSKeyslotUpdate'],
> >                  '*unlock-secret' : 'str' } }
> >=20
> > Why an array?  Do we really need multiple keyslot updates in one amend
> > operation?
>=20
> I think it it is unlikely we'd use this in libvirt. In the case of wantin=
g
> to *change* a key, it is safer to do a sequence of "add key" and then
> "remove key". If you combine them into the same operation, and you get
> an error back, it is hard to know /where/ it failed ? was the new key
> added or not ?

I think the array came in because of the "describe the new state"
approach. The state has eight keyslots, so in order to fully describe
the new state, you would have to be able to pass multiple slots at once.

Kevin


